prawn_document do |pdf|
  pdf.text "Hello There :D"
  pdf.text "now it is here: #{pdf.cursor}"
  pdf.text "ITems are #{@items.inspect}"
  pdf.font("Courier") do
    pdf.text "Written in Courier because we are inside the block."
  end

  pdf.text "with html<bold></bold>"
  pdf.text pdf.html_strip("without html <bold>LD</bold>")
  pdf.text "Let's see which is the current font_size: #{pdf.font_size.inspect}"
  pdf.move_down 10
  pdf.font_size 16
  pdf.text "Yeah, something bigger!"
  pdf.move_down 10
  pdf.font_size(25) { pdf.text "Even bigger!" }
  pdf.move_down 10
  pdf.text "Back to 16 again."
  pdf.move_down 10
  pdf.text "Single line on 20 using the :size option.", :size => 20
  pdf.move_down 10
  pdf.text "Back to 16 once more."
  pdf.move_down 10
  pdf.font("Courier", :size => 10) do
    pdf.text "Yeah, using Courier 10 courtesy of the font method."
  end
  pdf.font("Helvetica", :size => 12) # back to normal

  pdf.text "Default color is black"
  pdf.move_down 25
  pdf.text "Changed to red", :color => "FF0000"
  pdf.move_down 25
  pdf.text "CMYK color", :color => [22, 55, 79, 30]
  pdf.move_down 25
  pdf.text "Also works with <color rgb='ff0000'>inline</color> formatting", :color => "0000FF", :inline_format => true
end
