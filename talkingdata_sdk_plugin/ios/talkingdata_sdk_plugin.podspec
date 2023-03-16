#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint talkingdata_sdk_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'talkingdata_sdk_plugin'
  s.version          = '0.0.1'
  s.summary          = 'TalkingData SDK Flutter plugin.'
  s.description      = <<-DESC
TalkingData SDK Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.vendored_libraries = 'Assets/*.a'
  s.libraries = 'c++', 'z'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
