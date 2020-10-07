Pod::Spec.new do |s|
  s.name             = 'PocketAnalytics'
  s.version          = '1.0.5'
  s.summary          = 'The Pocket Ninja Analytics lib'

  s.homepage         = 'https://github.com/pocket-ninja/analytics'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sroik' => 'vasili.kazhanouski@gmail.com' }
  s.source           = { :git => 'git@github.com:pocket-ninja/analytics.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.3'

  s.static_framework = true
  s.default_subspec = 'Core'

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'Core' do |core|
    core.source_files = 'Analytics/Core/**/*.{h,m,swift}'
  end

  s.subspec 'Facebook' do |f|
    f.source_files = 'Analytics/Facebook/**/*.{h,m,swift}'
    f.dependency 'PocketAnalytics/Core'
    f.dependency 'FBSDKCoreKit'
  end

  s.subspec 'AppsFlyer' do |f|
    f.source_files = 'Analytics/AppsFlyer/**/*.{h,m,swift}'
    f.dependency 'PocketAnalytics/Core'
    f.dependency 'AppsFlyerFramework'
  end

  s.subspec 'Firebase' do |f|
    f.source_files = 'Analytics/Firebase/**/*.{h,m,swift}'
    f.dependency 'PocketAnalytics/Core'
    f.dependency 'Firebase/Core'
    f.dependency 'Firebase/Crashlytics'
  end

  s.subspec 'Tenjin' do |f|
    f.source_files = 'Analytics/Tenjin/**/*.{h,m,swift}'
    f.dependency 'PocketAnalytics/Core'
    f.dependency 'TenjinSDK'
  end
end
