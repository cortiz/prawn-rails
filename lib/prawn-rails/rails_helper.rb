require 'prawn-rails/document'

module PrawnRails
  module RailsHelper

    def prawn_document(options={})
      options.reverse_merge!({
        info: {
          Title: @filename.sub(/\.(p|P)(d|D)(f|F)$/, '')
        }
      })

      pdf = PrawnRails::Document.new(options)

      yield pdf if block_given?

      pdf.render
    end

  end
end
