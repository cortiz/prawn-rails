class ReportsController < ApplicationController
  before_action :set_items, only: [:sample, :custom_filename_sample]

  def sample
  end

  def custom_filename_sample
    @filename = "my-cool-filename.pdf"
    render :sample
  end

  def table
    @items = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
    ]
  end

  def set_items
    @items = [
      {name: "Hello"},
      {name: "World"},
    ]
  end

end
