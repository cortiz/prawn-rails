# Prawn-Rails

## Dependencies
 
* prawn > 0.0.12
* Rails 3.0x
* Ruby > 1.8.7

## Install
1.Add to the Rails Gemfile

	gem 'prawn'
	
	gem 'prawn-rails'
		
to the Rails Gemfile


## Usage
Create a view with `pdf` as format and `prawn` as handler 
should look like `example.pdf.prawn`
  
Your available to use all prawn document methods like `pdf.text` `pdf.font_size` and also
block like `pdf.font(FONT_NAME,opts) do
pdf.XXXX
end`

For more documentation go to [the manual](http://prawn.majesticseacreature.com/manual.pdf)

### Build in helpers
* *html_strip(html)*
Removes the html tags from a string	 

## Examples
 
1. **Hello World**
 
	**hello.pdf.prawn**
	
		pdf.start_new_page :size => "A4"
		pdf.text hello world
  
2. ** Using Active Record **

	**myproducts.pdf.prawn**

		pdf.text "Current Products are"
		pdf.move_down 20
		pdf.table(@products.collect{ |p| [p.name,p.price]})


## ToDos

1. Add Default Configuration
2. Add per-render Configuration
3. Simple Html to PDF ?
4. Any Other requested


## Dev Notes
Gem works with any rails 3.0 version and ruby but for development It should be atlest Rails 3.1 (for the testing env)
I'll try to fix that 