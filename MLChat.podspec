Pod::Spec.new do |s|
  s.name = 'MLChat'
  s.version = '1.0.2'
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'A simple chat conversation'
  s.homepage = 'https://micheltlutz.me'
  s.social_media_url = 'https://twitter.com/michel_lutz'
  s.authors = { "Michel Anderson Lutz Teixeira" => "michel_lutz@icloud.com" }
  s.source = { :git => "https://github.com/micheltlutz/MLChat.git", :tag  => "v"+s.version.to_s }
  s.platforms = { :ios => "11.0", :tvos => "11.0" }
  s.requires_arc = true
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.4.0'

  s.default_subspec = "Core"
  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/**/*.swift"
    ss.framework  = "Foundation"
    ss.framework  = "UIKit"
 end
end
