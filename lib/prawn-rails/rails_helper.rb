require 'prawn-rails/document'

module PrawnRails
  module RailsHelper

    def prawn_document(options={})
      options.reverse_merge!({
        page_layout: PrawnRails.config.page_layout,
        page_size: PrawnRails.config.page_size,
        info: {
          Title: @filename.sub(/\.(p|P)(d|D)(f|F)$/, '')
        }
      })

      if PrawnRails.config.skip_page_creation
        options.reverse_merge!(skip_page_creation: true) 
      end

      pdf = PrawnRails::Document.new(options)

      yield pdf if block_given?

      pdf.render
    end

  end
end
