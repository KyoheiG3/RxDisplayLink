Pod::Spec.new do |s|
  s.name         = "RxDisplayLink"
  s.version      = "3.0.0"
  s.summary      = "RxDisplayLink reactive wrapper for CADisplayLink"
  s.homepage     = "https://github.com/KyoheiG3/RxDisplayLink"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Kyohei Ito" => "je.suis.kyohei@gmail.com" }
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/KyoheiG3/RxDisplayLink.git", :tag => s.version.to_s }
  s.source_files = "RxDisplayLink/**/*.{h,swift}"
  s.requires_arc = true
  s.frameworks   = "Foundation"
  s.dependency "RxSwift", "~> 6.5"
end
