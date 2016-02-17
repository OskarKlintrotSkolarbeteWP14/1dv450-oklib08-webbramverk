$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "apikey_dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "apikey_dashboard"
  s.version     = ApikeyDashboard::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ApikeyDashboard."
  s.description = "TODO: Description of ApikeyDashboard."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"
  s.add_dependency "bcrypt", '~> 3.1.10'
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
