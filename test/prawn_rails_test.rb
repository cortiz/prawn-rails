### FOR GENERIC NON-RAILS TESTS

require 'test_helper'
require 'minitest/mock'
require 'pdf/reader'

class PrawnRailsTest < ActiveSupport::TestCase
  include PrawnRails::RailsHelper

  test "text can take non strings" do
    output = prawn_document do |pdf|
      pdf.text "Number:"
      pdf.text 10
    end

    reader = PDF::Reader.new(StringIO.new(output))
    assert_not_nil(reader)

    page = reader.page(1).to_s
    assert page.include?("Number:\n10")
  end

  test "with no controller, we use the default options" do
    assert_equal get_prawn_options, default_prawn_options
    assert_equal default_filename, "download.pdf"
  end

  test "matches .PDF extension regardless of case" do
    ["pDf", "pdf", "PDF"].each do |ext|
      stub :default_filename, "file.#{ext}" do
        assert_equal get_metadata[:info][:Title], "file"
      end
    end
  end
end
