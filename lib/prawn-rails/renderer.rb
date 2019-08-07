require "prawn-rails/document"

module PrawnRails
  class Renderer

    def self.call(template, source = nil)
      (source || template.source).strip
    end

  end
end
