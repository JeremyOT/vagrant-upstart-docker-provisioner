# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-upstart-docker-provider"
  spec.version       = VagrantPlugins::UpstartDockerProvisioner::VERSION
  spec.authors       = ["JeremyOT"]
  spec.email         = ["jeremy@upstart.io"]
  spec.description   = %q{Support better autorester}
  spec.summary       = %q{Support better autorester}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
