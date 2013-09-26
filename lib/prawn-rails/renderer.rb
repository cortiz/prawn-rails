require "prawn-rails/document"
require "prawn-rails/prawn_rails_helper"

module PrawnRails
  class Renderer
    def self.call(template)
      ::Prawn::Document.extensions << PrawnRailsHelper
      new.call(template)
    end

    def call(template)
      "pdf = PrawnRails::Document.new;" +
      template.source +
      ";self.output_buffer=pdf.render;"
    end
  end
end
