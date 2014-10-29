require "prawn-rails/document"

module PrawnRails
  class Renderer
    def self.call(template)
      template.source.strip
    end
  end
end
