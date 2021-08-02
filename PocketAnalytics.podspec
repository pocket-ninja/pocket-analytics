Pod::Spec.new do |s|
  s.name             = 'PocketAnalytics'
  s.version          = '1.2.2'
  s.summary          = 'The Pocket Ninja Analytics lib'
  s.homepage         = 'https://github.com/pocket-ninja/analytics'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sroik' => 'vasili.kazhanouski@gmail.com' }
  s.source           = { :git => 'git@github.com:pocket-ninja/analytics.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.watchos.deployment_target = '6.2'
  s.swift_version = '5.3'
  s.static_framework = true
  s.source_files = 'Analytics/Core/**/*.{h,m,swift}'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
