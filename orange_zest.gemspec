# frozen_string_literal: true

require_relative "lib/orange_zest/version"

Gem::Specification.new do |spec|
  spec.name          = "orange_zest"
  spec.version       = OrangeZest::VERSION
  spec.authors       = ["Aaron Christiansen"]
  spec.email         = ["aaronc20000@gmail.com"]

  spec.summary       = "A light wrapper for Gosu"
  spec.homepage      = "http://github.com/AaronC81/orange_zest"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gosu"
end