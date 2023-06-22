Pod::Spec.new do |s|
  s.name             = 'PocketAnalytics'
  s.version          = '1.2.13'
  s.summary          = 'The Pocket Ninja Analytics lib'
  s.homepage         = 'https://github.com/pocket-ninja/pocket-analytics'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sroik' => 'vasili.kazhanouski@gmail.com' }
  s.source           = { :git => 'git@github.com:pocket-ninja/pocket-analytics.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.watchos.deployment_target = '6.2'
  s.swift_version = '5.5'
  s.static_framework = true
  s.source_files = 'Analytics/Core/**/*.{h,m,swift}'
end
