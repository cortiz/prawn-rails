require 'prawn-rails/document'

module PrawnRails
  module RailsHelper

    def prawn_document(options={})
      @filename ||= options[:filename]

      metadata = {}

      if @filename
        metadata[:info] = { Title: @filename.sub(/\.pdf$/i, '') }
      end

      options.reverse_merge!(metadata)

      pdf = PrawnRails::Document.new(options)

      # Ignore headers when we're not rendering from an ActionController context.
      if defined?(controller) && controller.respond_to?(:response) && !controller.response.nil?
        disposition = options[:disposition] || "inline"
        disposition += "; filename=\"#{@filename}\"" if @filename

        # Don't override 'Content-Disposition' if we've chosen to set it elsewhere.
        controller.response.headers['Content-Disposition'] ||= disposition
      end

      yield pdf if block_given?

      return pdf.render
    end

  end
end
