require "prawn-rails/document"

module PrawnRails
  class Renderer
    def self.call(template)
      new.call(template)
    end

    def call(template)
      "pdf = PrawnRails::Document.new;" +
      template.source +
      ";self.output_buffer=pdf.render;"
    end
  end
end
