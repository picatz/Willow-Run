# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'willow_run/version'

Gem::Specification.new do |spec|
  spec.name          = "willow_run"
  spec.version       = WillowRun::VERSION
  spec.authors       = ["Kent Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{Willow Run is a Ruby API to the macOS/OSX airport command providing various wireless utilities.}
  spec.description   = %q{Willow Run is a Ruby API to the macOS/OSX airport command providing various wireless utilities. The airport command manages 802.11 interfaces, can perform wireless broadcast scans ( with xml/plist output support ), set arbitrary channels on the interface, and even generate PSKs from specified pass phrases and SSIDs -- all from the command-line, which I really love. }
  spec.homepage      = "https://github.com/picatz/Willow-Run"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
