Pod::Spec.new do |s|
  s.name = 'LolayKat'
  s.version = '4.3.0'
  s.license = {:type => 'Apache License, Version 2.0', :file => 'LICENSE'}
  s.summary = 'Lolay UIKit Founation'
  s.homepage = 'https://github.com/lolay/kat-swift'
  s.authors = { 'Lolay, Inc.' => 'info@lolay.com' }
  s.source = { :git => 'https://github.com/lolay/kat-swift.git', :tag => s.version }
  s.swift_version = "4.2"
  s.module_name = "LolayKat"
  s.ios.deployment_target = '12.2'
  s.source_files = 'LolayKat/*.swift'
end
