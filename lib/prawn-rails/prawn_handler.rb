module PrawnRails
  class PrawnHandler 
    def self.call(template)
      "pdf = ::Prawn::Document.new();" +
      template.source +
      ";self.output_buffer=pdf.render;"
    end
  end
end
