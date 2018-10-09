//
//  Source.swift
//  IDPush
//
//  Created by Omid Golparvar on 9/24/18.
//  Copyright © 2018 Omid Golparvar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
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
			let error = IDPushActionError.isNotConfigured
			print(error.description)
			callback(error, nil)
			return
		}
		
		do {
			try action.validateBeforePerform()
		} catch {
			let e = error as! IDPushActionError
			print(e.description)
			callback(e, nil)
			return
		}
		
		let url = action.getURL()
		let parameters = action.getParameters()
		
		Alamofire
			.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil)
			.responseJSON { response in
				
				switch response.result {
				case .success(let data):
					let jsonObject = JSON(data)
					
					if	let httpStatusCode = response.response?.statusCode, httpStatusCode == 200,
						let statusValue = jsonObject["status"].int, statusValue == 1 {
						
						switch action {
						case .addDevice(_):
							if let playerID = jsonObject["player_id"].string {
								IDPush.StorePlayerID(playerID)
								callback(nil, data)
							} else {
								callback(.invalidResponse, data)
							}
						default:
							callback(nil, data)
						}
					} else {
						callback(.invalidResponse, data)
					}
					
				case .failure(let error):
					print("🆔 ⚠️ - Alamofire request failed: ")
					print(error.localizedDescription)
					print()
					
					callback(.custom(message: error.localizedDescription), nil)
				}
		}
		
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
		let standardUserDefaults = UserDefaults.standard
		standardUserDefaults.set(playerID, forKey: kUserDefaults_PreviousPlayerID)
		standardUserDefaults.synchronize()
	}
	
	private enum IDPushConfigureError: Error, CustomStringConvertible {
		case missingProjectID
		
		var description: String {
			let _0 = "🆔 ⚠️ - Configuration Error: "
			switch self {
			case .missingProjectID		: return _0 + "ProjectID is missing." + "\n"
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
				parameter["player_id"]			= IDPush.PlayerID!
				parameter["notification_types"]	= 1
			case .unsubscribe:
				parameter["player_id"]			= IDPush.PlayerID!
				parameter["notification_types"]	= -2
			case .setTags(let tags):
				parameter["player_id"]			= IDPush.PlayerID!
				parameter["notification_types"]	= 1
				parameter["tags"]				= JSON(tags).rawString(.utf8, options: []) ?? ""
			case .editDevice(let parameters):
				parameter["player_id"]			= IDPush.PlayerID!
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
			let _0 = "🆔 ⚠️ - Action Error: "
			switch self {
			case .missingDeviceToken	: return _0 + "APNs token is empty." + "\n"
			case .missingPlayerID		: return _0 + "PlayerID is missing." + "\n"
			case .isNotConfigured		: return _0 + "Framework is NOT configured. Call IDPush.Setup(...)." + "\n"
			case .invalidResponse		: return _0 + "Server response is NOT valid." + "\n"
			case .custom(let message)	: return _0 + "Custom error message: \(message)." + "\n"
			}
		}
	}
}

extension String {
	
	fileprivate var isTrimmedAndEmpty: Bool { return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
	
}

