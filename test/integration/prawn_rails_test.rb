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

  test "Uses default prawn_options when none are available" do
    get '/reports/sample.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("inline")
    assert disposition_header.include?("sample.pdf")
  end

  test "Sets headers based on controller's prawn_options" do
    get '/custom_reports/sample.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("attachment")
    assert disposition_header.include?("custom.pdf")
  end

  test "Prefers the '@filename' variable when set" do
    get '/reports/custom_filename_sample.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("my-cool-filename.pdf")
  end

  test "Does not override an existing 'Content-Disposition' header" do
    get '/custom_reports/custom_headers_sample.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("inline")
    assert disposition_header.include?("manually-set.pdf")
    assert_not disposition_header.include?("attachment")
    assert_not disposition_header.include?("custom.pdf")
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
