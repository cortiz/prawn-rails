require "prawn-rails/prawn_handler"
module PrawnRails
  class Engine < Rails::Engine
    ActionView::Template.register_template_handler(:prawn,PrawnRails::PrawnHandler)
    Mime::Type.register_alias("application/pdf", :pdf) unless Mime::Type.lookup_by_extension(:pdf)
  end
end
