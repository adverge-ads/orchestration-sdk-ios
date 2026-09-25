Pod::Spec.new do |s|
  s.name = 'AdvergeAdsSdk'
  s.version = '1.7.1'
  s.summary = 'Adverge Ads SDK for iOS.'
  s.description = 'Adverge white-label advertising SDK, distributed as an XCFramework.'
  # Environment overrides are available for alternate distribution repositories.
  s.homepage = ENV.fetch('ADVERGE_SDK_HOMEPAGE', 'https://github.com/adverge-ads/orchestration-sdk-ios')
  s.authors = 'Adverge'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.source = { :git => ENV.fetch('ADVERGE_SDK_REPOSITORY', 'https://github.com/adverge-ads/orchestration-sdk-ios.git'), :tag => s.version.to_s }
  s.platform = :ios, '15.0'
  s.swift_version = '5.0'
  s.vendored_frameworks = 'Frameworks/AdvergeAdsSdk.xcframework'
  s.frameworks = 'AdSupport', 'AppTrackingTransparency', 'WebKit'
  s.dependency 'Google-Mobile-Ads-SDK', '~> 13.2'
end
