require_relative "lib/activerse/version"

Gem::Specification.new do |spec|
  spec.name        = "activerse"
  spec.version     = Activerse::VERSION
  spec.authors     = ["Pietro Moro"]
  spec.email       = ["pietromoro@programmer.net"]
  spec.homepage    = "github.com/pietromoro/activerse"
  spec.summary     = "Spin up time settings for rails"
  spec.description = "One time settings for rails"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "github.com/pietromoro/activerse"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.6", ">= 6.1.6.1"
end
