$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "prawn-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "prawn-rails"
  s.version     = PrawnRails::VERSION
  s.authors     = ["Carlos Ortiz"]
  s.email       = ["chrono.dark@gmail.com"]
  s.homepage    = "https://github.com/cortiz/prawn-rails"
  s.summary     = "Prawn Handler for RoR 3.x/4.x projects"
  s.description = "Prawn Handler for RoR 3.x/4.x projects handles and registers pdf formats"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "prawn"
  s.add_dependency "prawn-table"
  s.add_dependency "rails", ">= 3.1.0"
  s.add_development_dependency "sqlite3"
end
