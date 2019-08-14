lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lolcommits/protonet/version'

Gem::Specification.new do |spec|
  spec.name     = "lolcommits-protonet"
  spec.version  = Lolcommits::Protonet::VERSION
  spec.authors  = ["Matthew Hutchinson"]
  spec.email    = ["matt@hiddenloop.com"]
  spec.summary  = %q{Posts lolcommits to a Protonet box}
  spec.homepage = "https://github.com/lolcommits/lolcommits-protonet"
  spec.license  = "LGPL-3.0"

  spec.description = <<-DESC
  Automatically post lolcommit images (with a message) to your Protonet
  box.
  DESC

  spec.metadata = {
    "homepage_uri"      => "https://github.com/lolcommits/lolcommits-protonet",
    "changelog_uri"     => "https://github.com/lolcommits/lolcommits-protonet/blob/master/CHANGELOG.md",
    "source_code_uri"   => "https://github.com/lolcommits/lolcommits-protonet",
    "bug_tracker_uri"   => "https://github.com/lolcommits/lolcommits-protonet/issues",
    "allowed_push_host" => "https://rubygems.org"
  }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(assets|test|features)/}) }
  spec.test_files    = `git ls-files -- {test,features}/*`.split("\n")
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3"

  spec.add_runtime_dependency "rest-client", '1.6.10'
  spec.add_runtime_dependency "lolcommits", ">= 0.14.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "simplecov"
end
