require 'prawn'
require 'prawn/table'

module PrawnRails
  class Document < Prawn::Document
    def initialize(options = {})
      options = PrawnRails.config.marshal_dump.merge(options) ### For Ruby 1.9.3 support, use `marshal_dump` instead of `to_h`

      super(options)
    end

    def text(value, options = {})
      # Typically text expects a string. But Rails views have this interesting concept that they implicitly call `to_s` on all the variables before rendering. So, passing an integer to text fails:
      # pdf.text 10       #=> fails because 10 is not a string
      # pdf.text 10.to_s  #=> works
      # To circumvent this situation, we call to_s on value, and delegate action to actual Prawn::Document
      super(value.to_s, options)
    end
  end
end
