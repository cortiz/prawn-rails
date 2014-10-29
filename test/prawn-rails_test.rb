require 'test_helper'
require "prawn-rails/extension"

class PrawnRailsTest < ActiveSupport::TestCase
  include PrawnRails::Extension
  test "html_strip" do
    
    assert_nil(html_strip(nil)) 
    assert_not_nil(html_strip(""))
  end
end
