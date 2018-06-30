require 'prawn'
require 'prawn/table'

module PrawnRails

  # This derives from Prawn::Document in order to override defaults. 
  # Note that the Prawn::Document behaviour itself shouldn't be changed.
  class Document < Prawn::Document
    def self.extensions
      Prawn::Document.extensions
    end

    def initialize(options = {})
      if PrawnRails.config.respond_to?(:to_h)
        options.reverse_merge!(PrawnRails.config.to_h)
      else
        options.reverse_merge!(PrawnRails.config.marshal_dump)
      end

      super(options)
    end

    # Typically text expects a string. But Rails views have this interesting concept that they implicitly call `to_s` on all the variables before rendering. So, passing an integer to text fails:
    #
    # pdf.text 10       #=> fails because 10 is not a string
    # pdf.text 10.to_s  #=> works
    #
    # To circumvent this situation, we call to_s on value, and delegate action to actual Prawn::Document.
    def text(value, options = {})
      super(value.to_s, options)
    end
  end

end
