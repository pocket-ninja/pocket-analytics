Pod::Spec.new do |s|
  s.name             = 'PocketAnalyticsDrain'
  s.version          = '1.2.9'
  s.summary          = 'The Pocket Ninja Analytics lib'

  s.homepage         = 'https://github.com/pocket-ninja/pocket-analytics'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sroik' => 'vasili.kazhanouski@gmail.com' }
  s.source           = { :git => 'git@github.com:pocket-ninja/pocket-analytics.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.3'

  s.static_framework = true
  s.default_subspec = 'Core'

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'Core' do |c|
    c.dependency 'PocketAnalytics'
  end

  s.subspec 'Facebook' do |f|
    f.source_files = 'Analytics/Facebook/**/*.{h,m,swift}'
    f.dependency 'PocketAnalytics'
    f.dependency 'FBSDKCoreKit'
  end

  s.subspec 'AppsFlyer' do |ss|
    ss.source_files = 'Analytics/AppsFlyer/**/*.{h,m,swift}'
    ss.dependency 'PocketAnalytics'
    ss.dependency 'AppsFlyerFramework'
  end

  s.subspec 'Firebase' do |ss|
    ss.source_files = 'Analytics/Firebase/**/*.{h,m,swift}'
    ss.dependency 'PocketAnalytics'
    ss.dependency 'Firebase/Core'
    ss.dependency 'Firebase/Crashlytics'
  end

  s.subspec 'Tenjin' do |ss|
    ss.source_files = 'Analytics/Tenjin/**/*.{h,m,swift}'
    ss.dependency 'PocketAnalytics'
    ss.dependency 'TenjinSDK'
  end
  
  s.subspec 'Yandex' do |ss|
    ss.source_files = 'Analytics/Yandex/**/*.{h,m,swift}'
    ss.dependency 'PocketAnalytics'
    ss.dependency 'YandexMobileMetrica/Dynamic'
  end
end
