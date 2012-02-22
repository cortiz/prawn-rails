require 'test_helper'
require "prawn-rails/prawn_rails_helper"

class PrawnRailsTest < ActiveSupport::TestCase
  include  PrawnRailsHelper
  test "html_strip" do
    
    assert_nil(html_strip(nil)) 
    assert_not_nil(html_strip(""))
  end
end
