class ReportsController < ApplicationController

  def sample
    @items = [
      {name: "Hello"},
      {name: "World"},
    ]
  end

  def table
    @items = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
    ]
  end

  def custom_filename
  end

  def custom_disposition
  end

  def custom
  end

  def ivar_filename
    @filename = "ivar-filename.pdf"
    render :custom
  end

  def custom_headers
    headers['Content-Disposition'] = "attachment;filename=\"custom-headers.pdf\""
    render :custom
  end

end
