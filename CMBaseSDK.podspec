Pod::Spec.new do |s|
  s.name             = 'CMBaseSDK'
  s.version          = '0.2.0'
  s.summary          = 'iOS Development Base Source'
  s.description      = <<-DESC
  This is an MVVM Easy Pattern and Base Collection 
  With Rx, CoreData... Etc minium xcode project
                       DESC

  s.homepage         = 'https://cmjunghoon.github.io'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'coolmint.swift@gmail.com' => 'coolmint.swift@gmail.com' }
  s.source           = { :git => 'https://github.com/CMJunghoon/CMBaseSDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.3'
  s.source_files = 'Source/**/*'
  
  s.dependency 'RxSwift'
  s.dependency 'SnapKit'
  s.dependency 'RxCocoa'
  s.dependency 'SwiftyStoreKit'
  s.dependency 'SwiftDate'
  s.dependency 'Zip'
  s.dependency 'Gedatsu'
  s.dependency 'Alamofire'
  s.dependency 'Codextended'
  s.dependency 'Kingfisher'
end
