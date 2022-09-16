require 'test_helper'

class DocumentTest < ActiveSupport::TestCase

  def read_pdf_str(str)
    PDF::Reader.new(StringIO.new(str))
  end

  test "text can take non strings" do
    doc = PrawnRails::Document.new

    doc.text 10

    reader = read_pdf_str(doc.render)
    page = reader.page(1).to_s

    assert page.include?("10")
  end

  class ConfigTest < DocumentTest
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

    test "is applied when no options are provided" do
      PrawnRails.config do |config|
        config.page_layout = :landscape
      end

      reader = read_pdf_str(PrawnRails::Document.new.render)

      assert_equal reader.page(1).orientation, "landscape"
    end

    test "is merged with any provided config" do
      assert_equal PrawnRails.config.page_layout, :portrait

      reader = read_pdf_str(PrawnRails::Document.new(page_layout: :landscape).render)

      assert_equal reader.page(1).orientation, "landscape"
    end
  end

end
