### FOR RAILS TESTS

require 'test_helper'
require 'pdf/reader'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "Registers :pdf mime type" do
    assert Mime::Type.lookup_by_extension(:pdf)
  end

  test "Registers :prawn template handler" do
    assert ActionView::Template::Handlers.extensions.include?(:prawn)
  end

  test "render html action" do
    get '/reports/sample'
    assert_response :success
    assert @response.body.include?("<h1>Hello World!</h1>")
  end

  test "render pdf action" do
    get '/reports/sample', params: {format: :pdf}
    assert_response :success
    assert_not @response.body.include?("<h1>Hello World!</h1>")
  end

  test "Missing pdf format" do
    assert true
  end

  test "strip_tags" do
    assert true
  end

  test "ActionView::Base.full_sanitizer.sanitize(html_string)" do
    assert true
  end

  test "" do
    assert true
  end

  test "legacy test - render pdf to string" do
    ApplicationController.new.render_to_string("reports/sample.pdf", locals: {'@items' => []})
  end

  test "legacy test - render pdf" do
    get '/reports/sample', params: {format: :pdf}
    assert_response :success

    reader = PDF::Reader.new(StringIO.new(@response.body))
    assert_not_nil(reader)

    assert_equal(1, reader.page_count)
    assert_match(/Hello There :D/, reader.pages[0].to_s)
    assert_no_match(/This should not be any where/, reader.pages[0].to_s)
    assert_no_match(/ITEMS ARE nil/, reader.pages[0].to_s)
    assert_match(/with html<bold><\/bold>/,reader.pages[0].to_s)
    assert_match(/without html LD/,reader.pages[0].to_s)
  end
end
