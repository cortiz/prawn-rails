# Prawn-Rails [![Gem Version](https://badge.fury.io/rb/prawn-rails.svg)](http://badge.fury.io/rb/prawn-rails)

## Dependencies
 
* prawn > 0.0.12
* prawn-table
* Rails 3.0x
* Ruby > 1.8.7

## Install
1.Add to the Rails Gemfile

	gem 'prawn-rails'
		
to the Rails Gemfile  
`prawn` and `prawn-table` is a dependency so no need to mention it in the projects Gemfile  
but can mention a specific version if your Gemfile, if you want   

## Usage
Create a view with `pdf` as format and `prawn` as handler 
so filename should look like `example.pdf.prawn`

we provide a helper called `prawn_document` 
it builds a PrawnRails::Document with default options. Can override with `page_size` and `page_layout` 
example contents of `example.pdf.prawn` 

    prawn_document(:page_layout => :landscape) do |pdf|
      pdf.text "Hello World"
    end

No need to call `pdf.render`, it is called by `prawn_document` 

Your available to use all prawn document methods like `pdf.text` `pdf.font_size` and also
block like `pdf.font(FONT_NAME,opts) do
pdf.XXXX
end`

For more documentation go to [the manual](http://prawnpdf.org/manual.pdf)

### Build in helpers
* *html_strip(html)*
Removes the html tags from a string	 

### Default configuration

Add a `prawn-rails.rb` config to your Rails app under `config/initializers` like this

    PrawnRails.config do |config|
      config.page_layout = :portrait
      config.page_size   = "A4"
      config.skip_page_creation = false
    end

by default `page_layout` is portrait and `page_size` is "A4" 
also `skip_page_creation` is set to false by default, if it is set to true 
then have to create the first page yourself for eg. 

    pdf.start_new_page size: "A4", page_layout: :landscape

## Examples
 
1. **Hello World**
 
	**hello.pdf.prawn**
	
		pdf.text hello world
  
2. ** Using Active Record **

	**myproducts.pdf.prawn**

		pdf.text "Current Products are"
		pdf.move_down 20
		pdf.table(@products.collect{ |p| [p.name,p.price]})


## ToDos

1. Add per-render Configuration
2. Simple Html to PDF ?
3. Any Other requested

## thx to 
@rwilliams 
@sigmike
@smber1
@iffyuva

## Dev Notes
Gem works with any rails 3.0 version and ruby but for development It should be atlest Rails 3.1 (for the testing env)
I'll try to fix that 
