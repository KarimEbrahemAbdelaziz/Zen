#
# Be sure to run `pod lib lint Zen.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Zen'
  s.version          = '0.1.7'
  s.summary          = 'Zero Effort Networking Library in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Zero Effort Networking Library built with Swift on top of Alamofire.
                       DESC

  s.homepage         = 'https://github.com/KarimEbrahemAbdelaziz/Zen'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KarimEbrahemAbdelaziz' => 'karimabdelazizmansour@gmail.com' }
  s.source           = { :git => 'https://github.com/KarimEbrahemAbdelaziz/Zen.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/k_ebrahem_'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/**/*.swift'
  
  s.frameworks = 'Foundation'
  s.dependency 'Alamofire', '5.1.0'
end
