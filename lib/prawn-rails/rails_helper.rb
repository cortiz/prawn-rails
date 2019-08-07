require 'prawn-rails/document'

module PrawnRails
  module RailsHelper

    def prawn_document(options={})
      options.reverse_merge!(get_metadata)

      pdf = PrawnRails::Document.new(options)

      yield pdf if block_given?

      pdf.render
    end

    def set_prawn_headers
      # Ignore headers when we're not rendering from an ActionController context.
      return unless defined?(controller) && controller.respond_to?(:response) && !controller.response.nil?

      options = get_prawn_options

      # Don't override the 'Content-Disposition' if we've chosen to set it elsewhere.
      controller.response.headers['Content-Disposition'] ||= "#{options[:disposition]}; filename=\"#{options[:filename]}\""
    end

    def get_prawn_options
      if defined?(controller) && controller.respond_to?(:prawn_options)
        controller.send(:prawn_options).reverse_merge(default_prawn_options)
      else
        default_prawn_options
      end
    end

    def get_metadata
      {
        info: {
          Title: get_prawn_options[:filename].sub(/\.pdf$/i, '')
        }
      }
    end

    def default_prawn_options
      {
        filename: default_filename,
        disposition: "inline"
      }
    end

    def default_filename
      if defined?(controller)
        @filename ||= "#{controller.action_name}.pdf"
      else
        "download.pdf"
      end
    end

  end
end
