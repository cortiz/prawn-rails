class ReportsMailer < ActionMailer::Base
  def send_report
    @items = [
      {name: "Hello"},
      {name: "World"},
    ]

    attachments["report.pdf"] = {
      mime_type: "application/pdf",
      content: render_to_string("reports/sample", formats: [:pdf]),
    }

    mail({
      to: "user@example.com",
      subject: "Reports",
    })
  end
end
