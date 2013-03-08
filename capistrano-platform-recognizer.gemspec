# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano-platform-recognizer/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-platform-recognizer"
  gem.version       = Capistrano::Platform::Recognizer::VERSION
  gem.authors       = ["Takeshi KOMIYA"]
  gem.email         = ["i.tkomiya@gmail.com"]
  gem.description   = %q{Capistrano task to recognize platform of target hosts}
  gem.summary       = %q{Capistrano task to recognize platform of target hosts}
  gem.homepage      = "https://github.com/tk0miya/capistrano-platform-recognizer"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
