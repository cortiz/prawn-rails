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

  test "Renders html action" do
    get '/reports/sample'
    assert_response :success
    #assert @response.body.include?("<h1>Hello World!</h1>")
    assert_match("<h1>Hello World!</h1>", @response.body)
  end

  test "Renders pdf to string" do
    pdf_str = ApplicationController.new.render_to_string("reports/sample.pdf", locals: {:@items => []})

    reader = PDF::Reader.new(StringIO.new(pdf_str))
    assert_not_nil(reader)

    page_str = reader.pages[0].to_s
    assert page_str.include?('Hello World!')
    assert_not page_str.include?("<h1>Hello World!</h1>")
  end

  test "Renders sample pdf action" do
    get '/reports/sample', params: {format: :pdf}
    assert_response :success
    assert_not @response.body.include?("<h1>Hello World!</h1>")

    reader = PDF::Reader.new(StringIO.new(@response.body))
    assert_not_nil(reader)

    assert_equal(1, reader.page_count)

    page_str = reader.pages[0].to_s

    assert page_str.include?('Hello World!')
    assert_not page_str.include?("<h1>Hello World!</h1>")
  end

  test "Renders table pdf action using auto-required plugin Prawn-Table" do
    get '/reports/table', params: {format: :pdf}
    assert_response :success

    reader = PDF::Reader.new(StringIO.new(@response.body))
    assert_not_nil(reader)

    assert_equal(1, reader.page_count)

    page_str = reader.pages[0].to_s

    assert_equal(page_str, "1 2 3\n\n4 5 6\n\n7 8 9")
  end

  test "render_to_string in mailer" do
    mail = ReportsMailer.send_report
    assert_equal(1, mail.attachments.size)

    reader = PDF::Reader.new(StringIO.new(mail.attachments["report.pdf"].body.raw_source))
    assert_not_nil(reader)
    assert_equal(1, reader.page_count)

    page_str = reader.pages[0].to_s

    assert page_str.include?('Hello World!')
    assert_not page_str.include?("<h1>Hello World!</h1>")
  end
end
