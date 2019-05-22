require "prawn-rails/document"

module PrawnRails
  class Renderer

    ### WARNING: BE VERY CAREFUL IF EDITING THIS METHOD
    def self.call(template, source = nil)
      %{
        @filename ||= "\#{controller.action_name}.pdf"

        if controller.respond_to?(:response) && !controller.response.nil?
          controller.response.headers['Content-Disposition'] = "inline; filename=\\\"\#{@filename}\\\""
        end

        #{(source || template.source).strip}
      }
    end

  end
end
