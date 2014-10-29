require "prawn"
require "prawn-rails/rails_helper"
require "prawn-rails/renderer"

module PrawnRails
  class Engine < Rails::Engine
    ActionView::Base.send(:include, PrawnRails::RailsHelper)
    ActionView::Template.register_template_handler(:prawn, PrawnRails::Renderer)

    if !Mime::Type.lookup_by_extension(:pdf)
      Mime::Type.register_alias("application/pdf", :pdf)
    end
  end
end
