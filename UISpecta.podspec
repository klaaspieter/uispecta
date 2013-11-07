Pod::Spec.new do |s|
  s.name         = "UISpecta"
  s.version      = "0.0.1"
  s.summary      = "UIKit matchers for Specta"
  s.homepage     = "https://github.com/klaaspieter/uispecta"
  s.license      = "MIT"
  s.author       = { "Klaas Pieter Annema" => "klaaspieter@annema.me" }
  s.platform     = :ios
  s.source       = { git: "https://github.com/klaaspieter/uispecta", tag: "0.0.1" }
  s.source_files = 'src/**/*.{h,m}'
  s.requires_arc = true

  s.frameworks = "UIKit"
  s.dependency "Expecta"

end
