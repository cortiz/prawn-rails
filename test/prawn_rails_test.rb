### FOR GENERIC NON-RAILS TESTS

require 'test_helper'

class PrawnRailsTest < ActiveSupport::TestCase

  # TODO remove this test
  include PrawnRails::Extension
  test "html_strip" do
    assert_nil html_strip(nil)
    assert_not_nil html_strip("")
  end

  test "config" do
    assert true
  end
end
