lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ninjap/version"

Gem::Specification.new do |spec|
  spec.name          = "ninjap"
  spec.version       = Ninjap::VERSION
  spec.authors       = ["Gojko"]
  spec.email         = ["gojko1980@gmail.com"]

  spec.summary       = %q{Promote someone to Ninja.}
  spec.description   = %q{Promote someone to Ninja, and send a certificate via email.}
  spec.homepage      = "https://smokyusmaximus.com/"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gojkogit2/ninjap"
  spec.metadata["changelog_uri"] = "https://github.com/gojkogit2/ninjap/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/gojkogit2/ninjap/issues"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/}) ||
        f.match(%r{\Aninja_cert_for_.*\.png\z})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1"
  spec.add_dependency "mini_magick", "~> 4.12"
  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
