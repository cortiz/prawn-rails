ENV["RAILS_ENV"] = "test"

require 'warning'

Warning.ignore(
  %r{mail/parsers/address_lists_parser}, ### Hide mail gem warnings
)

Warning.ignore(
  %r{pdf/reader/font.* assigned but unused variable}, ### Hide pdf/reader gem warnings
)

if RUBY_VERSION.to_f >= 3.1
  require "matrix"
end

require File.expand_path("../dummy_app/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

require 'pry'
require 'pdf/reader'
