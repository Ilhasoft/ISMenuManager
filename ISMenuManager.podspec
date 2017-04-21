Pod::Spec.new do |s|
  s.name         = "ISMenuManager"
  s.version      = "1.0.0"
  s.summary      = "Menu Library that support menu creation in iOS projects"
  s.description  = <<-DESC
		   Menu Library that support menu creation in iOS projects.
                   DESC

  s.homepage     = "http://www.ilhasoft.com.br"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  s.author             = { "Daniel Amaral" => "daniel@ilhasoft.com.br" }
  s.social_media_url   = "http://twitter.com/danielamarall"
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/Ilhasoft/ISMenuManager.git", :tag => s.version }
  s.source_files  = "Classes", "ISMenuManager/Classes/**/*"
  #s.exclude_files = "Classes/Exclude"
  #s.public_header_files = 'Pod/Classes/**/*.h'

end
