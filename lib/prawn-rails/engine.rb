require "prawn-rails/prawn_handler"
module PrawnRails
  class Engine < Rails::Engine
    ActionView::Template.register_template_handler(:prawn,PrawnRails::PrawnHandler)
    Mime::Type.register "application/pdf", :pdf
  end
end
