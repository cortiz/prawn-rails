require "active_support/hash_with_indifferent_access"

module PrawnRails
  class Config < HashWithIndifferentAccess
    def method_missing(method_name, *args)
      # to replace behaviour of previous openstruct-based configuration object

      if method_name.to_s.end_with?("=")
        if args.size >= 2
          super # raise normal exception
        end

        key = method_name.to_s.sub(/=$/, "")
        self[key] = args.first
      else
        if args.any?
          super # raise normal exception
        else
          self[method_name]
        end
      end
    end
  end

  @config = Config.new.merge(
    page_layout: :portrait,
    page_size: "A4",
    skip_page_creation: false,
    additional_fonts: nil,
    default_font_name: nil,
  )

  def config(&block)
    block_given? ? yield(@config) : @config
  end
  module_function :config
end
