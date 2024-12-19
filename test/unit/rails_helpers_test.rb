require 'test_helper'

require "prawn-rails/rails_helper"

class RailsHelperTest < ActiveSupport::TestCase
  include PrawnRails::RailsHelper

  def teardown
    restore_default_config
  end

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

  test "config.default_font_name" do
    font_name = "Arial"

    PrawnRails.config.default_font_name = "Arial"

    font_path = Rails.root.join("app/assets/stylesheets/fonts/Arial.ttf")

    PrawnRails.config.additional_fonts = {
      "Arial" => {
        normal: font_path,
        italic: font_path,
        bold: font_path,
        bold_italic: font_path,
      },
    }

    prawn_document do |pdf|
      assert_equal pdf.font.family, "Arial"

      pdf.text "foo"
    end

    prawn_document(skip_page_creation: true) do |pdf|
      assert_raises(Prawn::Errors::NotOnPage) do
        pdf.font
      end

      pdf.start_new_page

      assert_equal pdf.font.family, "Arial"

      pdf.text "foo"
    end
  end

end
