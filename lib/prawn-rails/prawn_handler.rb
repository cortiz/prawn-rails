module PrawnRails
  class PrawnHandler 
    
    def self.call(template)
      require 'prawn-rails/prawn_rails_helper'
      ::Prawn::Document.extensions<<PrawnRailsHelper
      self.new.call(template)
    end
    
    def call(template)
      "pdf = ::Prawn::Document.new(:skip_page_creation => true);" +
      template.source +
      ";self.output_buffer=pdf.render;"
    end
    
  end
end
