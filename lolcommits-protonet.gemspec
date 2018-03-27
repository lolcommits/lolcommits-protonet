# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lolcommits/protonet/version'

Gem::Specification.new do |spec|
  spec.name          = "lolcommits-protonet"
  spec.version       = Lolcommits::Protonet::VERSION
  spec.authors       = ["Matthew Hutchinson"]
  spec.email         = ["matt@hiddenloop.com"]
  spec.summary       = %q{Posts lolcommits to a Protonet box}

  spec.description = <<-EOF
  Automatically post lolcommit images (with a message) to your Protonet box.
  EOF

  spec.homepage      = "https://github.com/lolcommits/lolcommits-protonet"
  spec.license       = "LGPL-3"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(assets|test|features)/}) }
  spec.test_files    = `git ls-files -- {test,features}/*`.split("\n")
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1"

  spec.add_runtime_dependency "rest-client"

  spec.add_development_dependency "lolcommits", ">= 0.12.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "simplecov"
end
