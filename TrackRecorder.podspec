#
# Be sure to run `pod lib lint TrackRecorder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TrackRecorder'
  s.version          = '0.1.0'
  s.summary          = '无侵入埋点'


  s.description      = '无侵入埋点'

  s.homepage         = 'https://github.com/abclz'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'eason' => '18210437675@163.com' }
  s.source           = { :git => 'https://github.com/abclz/TrackRecorder.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'TrackRecorder/Classes/**/*'

  s.frameworks = 'UIKit'
end
