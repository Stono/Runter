lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'runter/version'
Gem::Specification.new do |s|
  s.name          = "runter"
  s.version       = Runter::VERSION
  s.licenses	  = ['MIT']
  s.summary       = "Runter Task Runner"
  s.date          = "2014-04-27"
  s.description   = "Runter is a ruby task runner based on file modifications"
  s.authors       = ["Karl Stoney"]
  s.email         = ["karlstoney@googlemail.com"]
  s.homepage      = "http://www.jambr.co.uk/"
  s.files         = `git ls-files -z`.split("\x0")
  s.add_runtime_dependency "filewatcher"
  s.executables   = %w(runter)
  s.require_paths = ["lib"]
end
