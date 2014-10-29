require 'test_helper'
require 'pdf/reader'

class PdfControllerTest < ActionController::TestCase
  test "should get a pdf" do
    get :render_pdf
    assert_response :success
    reader = PDF::Reader.new(StringIO.new(@response.body))
    assert_not_nil(reader)
    #do some basic assertions
    assert_equal(1, reader.page_count)
    assert_match(/Hello There :D/, reader.pages[0].to_s)
    assert_no_match(/This should not be any where/, reader.pages[0].to_s)
    assert_no_match(/ITEMS ARE nil/, reader.pages[0].to_s)
    assert_match(/with html<bold><\/bold>/,reader.pages[0].to_s)
    assert_match(/without html LD/,reader.pages[0].to_s)
  end
  
  

end
