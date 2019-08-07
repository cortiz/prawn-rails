### FOR GENERIC NON-RAILS TESTS

require 'test_helper'
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

  test "matches .PDF extension regardless of case" do
    ["pDf", "pdf", "PDF"].each do |ext|
      @filename = "test.#{ext}"
      assert_equal get_metadata[:info][:Title], "test"
    end
  end
end
