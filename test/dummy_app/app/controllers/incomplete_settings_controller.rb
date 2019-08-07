class IncompleteSettingsController < ApplicationController
  def sample
  end

  def prawn_options
    {
      filename: "very-specific.pdf"
    }
  end
end
