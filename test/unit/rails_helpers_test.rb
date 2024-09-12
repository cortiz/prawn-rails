require 'test_helper'

require "prawn-rails/rails_helper"

class RailsHelperTest < ActiveSupport::TestCase
  include PrawnRails::RailsHelper

  test "matches .PDF extension regardless of case" do
    ["pDf", "pdf", "PDF"].each do |ext|
      @filename = "test.#{ext}"

      output = prawn_document do |pdf|
        pdf.text "foo"
      end

      reader = PDF::Reader.new(StringIO.new(output))
      assert_equal reader.info[:Title], "test"
    end
  end

end
