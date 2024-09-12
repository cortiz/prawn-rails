require 'test_helper'

class ConfigTest < ActiveSupport::TestCase

  def setup
    @original_config = PrawnRails.config.clone
  end

  def teardown
    PrawnRails.config do |config|
      config.keys.each do |key|
        config.delete(key)
      end

      @original_config.each do |k,v|
        config[k] = v
      end
    end
  end

  test "has a default config" do
    assert_equal PrawnRails.config.symbolize_keys, {page_layout: :portrait, page_size: "A4", skip_page_creation: false}
  end

  test "config can be set with block syntax" do
    PrawnRails.config do |config|
      config.page_layout = :landscape
      config.page_size = "A8"
    end

    assert_equal PrawnRails.config.symbolize_keys, {page_layout: :landscape, page_size: "A8", skip_page_creation: false}
  end

  test "allows reading any hash value via method syntax" do
    assert_equal PrawnRails.config.foo, nil
  end

  test "allows writing any hash value via method syntax" do
    PrawnRails.config.foo = "bar"
    assert_equal PrawnRails.config.foo, "bar"
  end

  test "does not allow unknown methods with arguments" do
    assert_raises NoMethodError do
      PrawnRails.config.foo("bar")
    end

    assert_raises NoMethodError do
      PrawnRails.config.send("foo=", "bar", "baz")
    end
  end

end
