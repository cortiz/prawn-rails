require 'ostruct'

module PrawnRails
extend self

  @config = OpenStruct.new

  def config
    begin
      block_given? ? yield(@config) : @config
    rescue => e
      puts e
      puts e.backtrace
    end

  end

end


