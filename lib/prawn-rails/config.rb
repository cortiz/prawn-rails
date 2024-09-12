require "active_support/hash_with_indifferent_access"

module PrawnRails
  class Config < HashWithIndifferentAccess
    def method_missing(method_name, *args)
      # to replace behaviour of previous openstruct-based configuration object

      method_name = method_name.to_s

      if method_name.end_with?("=")
        key = method_name.sub(/=$/, "")
        self[key] = args.first
      else
        self[method_name]
      end
    end
  end

  @config = Config.new.merge(
    page_layout: :portrait,
    page_size: "A4",
    skip_page_creation: false,
  )

  def config(&block)
    block_given? ? yield(@config) : @config
  end
  module_function :config
end
