require 'prawn'
require 'prawn/table'
require "prawn-rails/extension"

module PrawnRails
  # This derives from Prawn::Document in order to override defaults. Note
  # that the Prawn::Document behaviour itself shouldn't be changed.
  class Document < Prawn::Document
    def initialize(opts = {})
      default = PrawnRails.config.to_h.merge(opts)
      super(default)
    end

    # Typicall text expects a string. But rails views have this interesting
    # concept that they implicitly call `to_s` on all the variables before
    # rendering. So, passing an integer to text fails:
    #
    # pdf.text 10       #=> fails because 10 is not a string
    # pdf.text 10.to_s  #=> works
    #
    # To circumvent this situation, we call to_s on value, and delegate
    # action to actual Prawn::Document.
    def text(value, options = {})
      super(value.to_s, options)
    end
  end

  Document.extensions << Extension
end
