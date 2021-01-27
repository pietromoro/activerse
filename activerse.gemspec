$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "activerse/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "activerse"
  spec.version     = Activerse::VERSION
  spec.authors     = ["Pietro Moro"]
  spec.email       = ["pietromoro@programmer.net"]
  spec.homepage    = "https://github.com/pietromoro/activerse"
  spec.summary     = "Generate initial settings and configurations within your terminal."
  spec.description = "Rails gem that allows a project to be distributed over multiple companies, without having to set specific credentials in a file, allowing to distribute only it's structure, fillable whitin the terminal with a single command."
  spec.license     = "MIT"


  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.1"

  spec.add_development_dependency "sqlite3", "~> 1.4.1"
end
