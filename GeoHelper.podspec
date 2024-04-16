Pod::Spec.new do |s|
  s.name             = 'GeoHelper'
  s.version          = '1.0.2'
  s.summary          = "Implementation of the library for the GeoHelper service for Apple platforms (iOS / MacOS)"
  s.homepage         = 'https://github.com/simla-tech/GeoHelperSwift'
  s.social_media_url = 'https://www.simla.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ilya Kharlamov' => 'kharlamov@retailcrm.ru' }
  s.source           = { :git => 'https://github.com/simla-tech/GeoHelperSwift.git', :tag => s.version.to_s }

  s.swift_version = '5.7'
  s.ios.deployment_target = '14.0'

  s.source_files = [
      "Sources/**/*.swift",
  ]

  s.dependency 'Alamofire', '~> 5.0'

end
