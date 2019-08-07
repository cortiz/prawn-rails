class CustomReportsController < ApplicationController

  def sample
  end

  def custom_headers_sample
    headers['Content-Disposition'] = "inline;filename=\"manually-set.pdf\""
    render :sample
  end

  def prawn_options
    {
      filename: "custom.pdf",
      disposition: "attachment"
    }
  end

end
