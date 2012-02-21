class PdfController < ApplicationController
  
  def render_pdf
    @items=[{:name=> "Hello"},{:name=> "World"}]
   render "render_pdf.pdf.prawn"
  end

 

end
