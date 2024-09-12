require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  def confirm_pdf_format(source)
    reader = PDF::Reader.new(StringIO.new(source))
    assert_not_nil(reader)
    assert_equal(1, reader.page_count)
    page_str = reader.pages[0].to_s
    assert page_str.include?('Hello World!')
    assert_not page_str.include?("<h1>Hello World!</h1>")
  end

  test "registers :pdf mime type" do
    get "/reports/sample" # trigger action view load

    assert Mime::Type.lookup_by_extension(:pdf)
  end

  test "registers :prawn template handler" do
    get "/reports/sample" # trigger action view load

    assert ActionView::Template::Handlers.extensions.include?(:prawn)
  end

  test "renders html action" do
    get '/reports/sample'
    assert_response :success
    assert_match("<h1>Hello World!</h1>", @response.body)
  end

  test "renders pdf to string" do
    pdf_str = ApplicationController.render(template: "reports/sample", formats: [:pdf], assigns: {:items => []})

    confirm_pdf_format(pdf_str)
  end

  test "renders sample pdf action" do
    get '/reports/sample', params: {format: :pdf}
    assert_response :success

    confirm_pdf_format(@response.body)
  end

  test "renders table pdf action using auto-required plugin prawn-table" do
    get '/reports/table', params: {format: :pdf}
    assert_response :success

    reader = PDF::Reader.new(StringIO.new(@response.body))
    assert_not_nil(reader)

    assert_equal(1, reader.page_count)

    page_str = reader.pages[0].to_s

    assert_equal(page_str, "1 2 3\n\n4 5 6\n\n7 8 9")
  end

  test "sets file name from '@filename' when present" do
    get '/reports/ivar_filename.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("attachment")
    assert disposition_header.include?("ivar-filename.pdf")
  end

  test "maintains existing 'Content-Disposition' header" do
    get '/reports/custom_headers.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("attachment")
    assert disposition_header.include?("custom-headers.pdf")
  end

  test "respects the 'filename' option alone" do
    get '/reports/custom_filename.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("inline")
    assert disposition_header.include?("from-options.pdf")
  end

  test "Respects the 'disposition' option alone" do
    get '/reports/custom_disposition.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("attachment")
    assert_not disposition_header.include?("filename")
  end

  test "respects both options on 'prawn-document' together" do
    get '/reports/custom.pdf'

    disposition_header = @response.headers["Content-Disposition"]
    assert disposition_header.include?("attachment")
    assert disposition_header.include?("from-options.pdf")
  end

  test "render_to_string in mailer" do
    mail = ReportsMailer.send_report
    assert_equal(1, mail.attachments.size)

    confirm_pdf_format(mail.attachments["report.pdf"].body.raw_source)
  end
end
