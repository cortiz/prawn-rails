require "prawn-rails/document"

module PrawnRails
  class Renderer

    ### WARNING: BE VERY CAREFUL IF EDITING THIS METHOD
    def self.call(template, source = nil)
      %{
        set_prawn_headers

        #{(source || template.source).strip}
      }
    end

  end
end
