$:.push File.expand_path("../lib", __FILE__)

require "prawn-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "prawn-rails"
  s.version     = PrawnRails::VERSION
  s.authors     = ["Carlos Ortiz"]
  s.email       = ["chrono.dark@gmail.com"]
  s.homepage    = "https://github.com/cortiz/prawn-rails"
  s.summary     = "Prawn Handler for Rails"
  s.description = "Prawn Handler for Rails. Handles and registers pdf formats."

  s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]

  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency "prawn"
  s.add_dependency "prawn-table"
  s.add_dependency "rails", ">= 3.1.0"

  s.add_development_dependency "pdf-reader"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'sqlite3'
end
