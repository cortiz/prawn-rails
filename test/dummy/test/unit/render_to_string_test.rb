require 'test_helper'
require 'pdf/reader'

class RenderToStringTest < ActiveSupport::TestCase

  test "should render_to_string" do
    ApplicationController.new.render_to_string("pdf/render_pdf.pdf", locals: {'@items' => []})
  end

end
