Pod::Spec.new do |s|
  s.name                  = 'IDPush'
  s.version               = '1.0.1'
  s.summary               = 'IDPush - InfinityDesign OneSignal helper framework for iOS.'
  s.description           = <<-DESC
                            Written in Swift.
                            IDPush - InfinityDesign OneSignal helper Framework.
                            DESC
  s.homepage              = 'https://github.com/omidgolparvar/IDPush'
  s.license               = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author                = { 'Omid Golparvar' => 'iGolparvar@gmail.com' }
  s.source                = { :git => "https://github.com/omidgolparvar/IDPush.git", :tag => s.version.to_s }
  s.swift_version         = '4.0'
  s.platform              = :ios, '10.0'
  s.requires_arc          = true
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '4.0' }

  s.source_files = [
    'IDPush/*.{h,swift}',
    'IDPush/**/*.swift',
  ]
  
  s.public_header_files = 'IDPush/*.h'

  s.libraries  = "z"

  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'UIDeviceComplete'

end
