require "prawn"

require "prawn-rails/version"
require "prawn-rails/config"

require 'active_support/lazy_load_hooks'

module PrawnRails
end

ActiveSupport.on_load(:action_view) do
  unless Mime::Type.lookup_by_extension(:pdf)
    Mime::Type.register_alias("application/pdf", :pdf)
  end

  require "prawn-rails/rails_helper"
  require "prawn-rails/renderer"

  ActionView::Base.send(:include, PrawnRails::RailsHelper)
  ActionView::Template.register_template_handler(:prawn, PrawnRails::Renderer)
end
