require 'prawn'
require 'prawn/table'

module PrawnRails
  class Document < Prawn::Document
    def initialize(options = {})
      options = PrawnRails.config.except(:additional_fonts, :default_font_name).merge(options)

      super(options)
    end

    def text(value, options = {})
      # Typically text expects a string. But Rails views have this interesting concept that they implicitly call `to_s` on all the variables before rendering. So, passing an integer to text fails:
      # pdf.text 10       #=> fails because 10 is not a string
      # pdf.text 10.to_s  #=> works
      # To circumvent this situation, we call to_s on value, and delegate action to actual Prawn::Document
      super(value.to_s, options)
    end

    def start_new_page(options = {})
      return_val = super

      if state.page_count == 1
        if PrawnRails.config.additional_fonts
          font_families.update(PrawnRails.config.additional_fonts)
        end

        if PrawnRails.config.default_font_name
          font(PrawnRails.config.default_font_name)
        end
      end

      return_val
    end
  end
end
