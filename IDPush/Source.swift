//

import Foundation
import UIDeviceComplete

public class IDPush {
	
	public typealias RoutesType		= (
		addDevice	: String,
		editDevice	: String
	)
	
	private static let kUserDefaults_PreviousPlayerID	= "IDPush_PreviousPlayerID"
	
	private static let BaseURL		: String		= "https://idpush.top/api/v1/"
	private static let Routes		: RoutesType	= ("device/add", "device/edit/")
	
	private static var ProjectID	: String		= ""
	private static var IsConfigured	: Bool			= false
	private static var PlayerID		: String?		= nil
	
	public static func Setup(projectID: String) {
		let _projectID = projectID.trimmingCharacters(in: .whitespacesAndNewlines)
		guard !_projectID.isEmpty else {
			print(IDPushConfigureError.missingProjectID.description)
			return
		}
		
		ProjectID		= _projectID
		IsConfigured	= true
	}
	
	public static func Perform(action: IDPushAction, then callback: @escaping (IDPushActionError?, Any?) -> Void) {
		guard IsConfigured else {
			let actionError = IDPushActionError.isNotConfigured
			PrintError(actionError, title: "Configuration")
			callback(actionError, nil)
			return
		}
		
		do {
			try action.validateBeforePerform()
		} catch {
			let actionError = error as! IDPushActionError
			PrintError(actionError, title: "Validation Error")
			callback(actionError, nil)
			return
		}
		
		let url = action.getURL()
		let parameters = action.getParameters()
		
		var request = URLRequest(url: url)
		request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		request.httpBody = parameters.percentEscaped().data(using: .utf8)
		
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			
			guard error == nil else {
				let actionError = IDPushActionError.custom(message: error!.localizedDescription)
				PrintError(actionError, title: "Request Failed")
				callback(actionError, nil)
				return
			}
			
			guard let data = data, let response = response as? HTTPURLResponse else {
				let actionError = IDPushActionError.custom(message: "Data or Response as NOT available")
				PrintError(actionError, title: "Data or Response")
				callback(actionError, nil)
				return
			}
			
			guard (200 ... 299) ~= response.statusCode else {
				let actionError = IDPushActionError.invalidResponse
				PrintError(actionError, title: "Invalid Response", extraMessage: "StatusCode = \(response.statusCode)")
				callback(actionError, nil)
				return
			}
			
			do {
				let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
				//print("JSON Object: \(String(describing: jsonObject))")
				
				guard let jsonDictionary = jsonObject as? [String: Any] else {
					let actionError = IDPushActionError.invalidResponse
					PrintError(actionError, title: "Invalid Response", extraMessage: "Casting JSON to Dictionary: Failed")
					callback(actionError, nil)
					return
				}
				//print("JSON Dictionary: \(String(describing: jsonDictionary))")
				
				guard let status = jsonDictionary["status"] as? Int, status == 1 else {
					let actionError = IDPushActionError.invalidResponse
					PrintError(actionError, title: "Invalid Response")
					callback(actionError, nil)
					return
				}
				
				switch action {
				case .addDevice:
					if let playerID = jsonDictionary["player_id"] as? String {
						IDPush.StorePlayerID(playerID)
						callback(nil, data)
					} else {
						let actionError = IDPushActionError.invalidResponse
						PrintError(actionError, title: "Invalid Response")
						callback(actionError, nil)
					}
				default:
					callback(nil, data)
				}
				
			} catch let error {
				let actionError = IDPushActionError.custom(message: error.localizedDescription)
				PrintError(actionError, title: "Invalid Response", extraMessage: "JSON Serialization: Failed")
				callback(actionError, nil)
				print(error.localizedDescription)
			}
			
		}
		
		task.resume()
		
	}
	
	public static func GetPlayerID() -> String? {
		if let playerID = PlayerID {
			return playerID
		} else if let playerID = UserDefaults.standard.string(forKey: kUserDefaults_PreviousPlayerID) {
			PlayerID = playerID
			return playerID
		}
		return nil
	}
	
	private static func StorePlayerID(_ playerID: String) {
		PlayerID = playerID
		UserDefaults.standard.set(playerID, forKey: kUserDefaults_PreviousPlayerID)
	}
	
	private enum IDPushConfigureError: Error, CustomStringConvertible {
		case missingProjectID
		
		var description: String {
			let errorPrefix = "🆔 ⚠️ - Configuration Error: "
			switch self {
			case .missingProjectID		: return errorPrefix + "ProjectID is missing." + "\n"
			}
		}
		
	}
	
	public enum IDPushAction {
		case addDevice(token: String)
		case subscribe
		case unsubscribe
		case setTags(tags: [String: Any])
		case editDevice(parameters: [String: Any])
		
		fileprivate func getParameters() -> [String: Any] {
			var parameter: [String: Any] = [:]
			parameter["project_id"]		= IDPush.ProjectID
			parameter["device_type"]	= 0
			parameter["game_version"]	= Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
			parameter["device_model"]	= UIDevice.current.dc.deviceModel
			parameter["device_os"]		= UIDevice.current.systemVersion
			
			switch self {
			case .addDevice(let token):
				parameter["identifier"]			= token
				parameter["notification_types"]	= 1
				
				var isForTest: Bool = true
				#if DEBUG
				isForTest = true
				#else
				isForTest = false
				#endif
				
				parameter["test_type"]			= isForTest ? 1 : 2
			case .subscribe:
				guard let playerID = IDPush.PlayerID else {
					IDPush.PrintError(.missingPlayerID, title: "Action Parameters")
					return [:]
				}
				parameter["player_id"]			= playerID
				parameter["notification_types"]	= 1
			case .unsubscribe:
				guard let playerID = IDPush.PlayerID else {
					IDPush.PrintError(.missingPlayerID, title: "Action Parameters")
					return [:]
				}
				parameter["player_id"]			= playerID
				parameter["notification_types"]	= -2
			case .setTags(let tags):
				guard let playerID = IDPush.PlayerID else {
					IDPush.PrintError(.missingPlayerID, title: "Action Parameters")
					return [:]
				}
				parameter["player_id"]			= playerID
				parameter["notification_types"]	= 1
				parameter["tags"]				= tags.asJSONString
			case .editDevice(let parameters):
				guard let playerID = IDPush.PlayerID else {
					IDPush.PrintError(.missingPlayerID, title: "Action Parameters")
					return [:]
				}
				parameter["player_id"]			= playerID
				parameters.forEach({ parameter[$0.key] = $0.value })
			}
			
			return parameter
		}
		
		fileprivate func getURL() -> URL {
			switch self {
			case .addDevice(_)	: return URL(string: IDPush.BaseURL + IDPush.Routes.addDevice)!
			case .subscribe,
				 .unsubscribe,
				 .setTags(_),
				 .editDevice(_)	: return URL(string: IDPush.BaseURL + IDPush.Routes.editDevice + IDPush.PlayerID!)!
			}
		}
		
		fileprivate func validateBeforePerform() throws {
			switch self {
			case .addDevice(let token)	: guard !token.isTrimmedAndEmpty else { throw IDPushActionError.missingDeviceToken }
			case .subscribe,
				 .unsubscribe,
				 .setTags(_),
				 .editDevice(_)			: guard IDPush.PlayerID != nil else { throw IDPushActionError.missingPlayerID }
			}
		}
	}
	
	public enum IDPushActionError: Error, CustomStringConvertible {
		case missingDeviceToken
		case missingPlayerID
		case isNotConfigured
		case invalidResponse
		case custom(message: String)
		
		public var description: String {
			switch self {
			case .missingDeviceToken	: return "APNs token is empty."
			case .missingPlayerID		: return "PlayerID is missing."
			case .isNotConfigured		: return "Framework is NOT configured. Call IDPush.Setup(...)."
			case .invalidResponse		: return "Server response is NOT valid."
			case .custom(let message)	: return "Custom error message: \(message)."
			}
		}
	}
}

extension IDPush {
	
	private static func PrintError(_ error: IDPushActionError, title: String, extraMessage: String? = nil) {
		let extraMessage = extraMessage == nil ? "" : " (\(extraMessage!))"
		print("🆔 ⚠️ - \(title): ")
		print(error.description + extraMessage)
		print()
	}
	
}

extension String {
	fileprivate var isTrimmedAndEmpty: Bool { return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}

extension Dictionary {
	fileprivate func percentEscaped() -> String {
		return map { (key, value) in
			let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
			let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
			return escapedKey + "=" + escapedValue
			}
			.joined(separator: "&")
	}
}

extension Dictionary where Key == String , Value == Any {
	fileprivate var asJSONString: String {
		let jsonData = try! JSONSerialization.data(withJSONObject: self, options: [])
		let jsonString = String(data: jsonData, encoding: .utf8)!
		return jsonString
	}
}

extension CharacterSet {
	fileprivate static let urlQueryValueAllowed: CharacterSet = {
		let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
		let subDelimitersToEncode = "!$&'()*+,;="
		
		var allowed = CharacterSet.urlQueryAllowed
		allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
		return allowed
	}()
}

