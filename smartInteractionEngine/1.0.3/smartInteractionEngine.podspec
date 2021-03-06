#
# Be sure to run `pod lib lint smartInteractionEngine.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'smartInteractionEngine'
  s.version          = '1.0.3'
  s.summary          = 'Framework to help iot'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This framework is developed by VMware. This will help iot projects'

  s.homepage         = 'https://github.com/paritoshp/smartInteractionEngine'
  
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'paritoshp' => 'paritosh.pawar@mindstix.com' }
  s.source           = { :git => 'https://github.com/paritoshp/smartInteractionEngine.git', :tag => s.version.to_s }
  #s.swift_version = '>= 3.2'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  

#s.source_files = 'smartInteractionEngine/Classes/**/*'
s.source_files = '*.{swift}'
  
  # s.resource_bundles = {
  #   'smartInteractionEngine' => ['smartInteractionEngine/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Alamofire'
end
