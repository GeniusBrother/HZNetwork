Pod::Spec.new do |s|

  s.name         = "HZNetwork" 
  s.version      = "0.6.0"    
  s.summary      = "A useful networking framework based on AFNetworking for iOS, OS X, watchOS, and tvOS."
  s.homepage     = "https://github.com/GeniusBrother/HZNetwork.git"
  s.license      = "MIT"
  s.author             = { "GeniusBrother" => "zuohong_xie@163.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/GeniusBrother/HZNetwork.git", :tag => s.version }    
  s.frameworks = "Foundation"

  s.public_header_files = 'HZNetwork/Classes/**/*.h'
  s.source_files = 'HZNetwork/Classes/**/*.{h,m}'

  s.dependency 'HZFoundation'
  s.dependency 'AFNetworking','~>3.1.0'
  
end
