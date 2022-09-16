require 'ostruct'

module PrawnRails
  extend self

  @config = OpenStruct.new(page_layout: :portrait, page_size: "A4", skip_page_creation: false)

  def config(&block)
    block_given? ? yield(@config) : @config
  end

end
