require 'test_helper'

class ConfigTest < ActiveSupport::TestCase

  def setup
    @original_config = PrawnRails.config.to_h
  end

  def teardown
    PrawnRails.config do |config|
      config.to_h.keys.each do |key|
        config.delete_field(key)
      end

      @original_config.to_h.each do |k,v|
        config[k] = v
      end
    end
  end

  test "has a default config" do
    assert_equal PrawnRails.config.to_h, {page_layout: :portrait, page_size: "A4", skip_page_creation: false}
  end

  test "config can be set with block syntax" do
    PrawnRails.config do |config|
      config.page_layout = :landscape
      config.page_size = "A8"
    end

    assert_equal PrawnRails.config.to_h, {page_layout: :landscape, page_size: "A8", skip_page_creation: false}
  end

end
