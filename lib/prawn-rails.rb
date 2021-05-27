require "prawn"

require "prawn-rails/version"
require "prawn-rails/config"

require "prawn-rails/rails_helper"
require "prawn-rails/renderer"

ActionView::Base.send(:include, PrawnRails::RailsHelper)
ActionView::Template.register_template_handler(:prawn, PrawnRails::Renderer)

unless Mime::Type.lookup_by_extension(:pdf)
  Mime::Type.register_alias("application/pdf", :pdf)
end

module PrawnRails
end
