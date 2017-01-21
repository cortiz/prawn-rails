# Prawn-Rails [![Gem Version](https://badge.fury.io/rb/prawn-rails.svg)](http://badge.fury.io/rb/prawn-rails)

## Install
```ruby
gem 'prawn-rails'
```

Note: `prawn` and `prawn-table` are dependencies of `prawn-rails` so there is no need to mention it in the projects Gemfile unless you want to use a specific version of either of those libraries.

## Usage
Create a view with `pdf` as format and `prawn` as handler so filename should look like `example.pdf.prawn`

It provides a helper called `prawn_document` which builds a PrawnRails::Document with default options. You can override any options as you please. Example:

```ruby
prawn_document(page_layout: :landscape) do |pdf|
  pdf.text "Hello World"
end
```

No need to call `pdf.render`, it is called by `prawn_document`

If you want to customize the name of the file should a user try to save it, you can specify the filename in your action:

```ruby
def show
  @filename = 'my_report.pdf'
end
```

### Built-in Helpers
* *html_strip(html)*:
Removes the html tags from a string

### Default configuration

Add a `prawn-rails.rb` config to your Rails app under `config/initializers` like this

```ruby
PrawnRails.config do |config|
  config.page_layout = :portrait
  config.page_size   = "A4"
  config.skip_page_creation = false
end
```

Please note that these are the defaults. 

For a list of all available options see [http://www.rubydoc.info/gems/prawn/Prawn%2FDocument:initialize](http://www.rubydoc.info/gems/prawn/Prawn%2FDocument:initialize). 

For a list of all available metadata for the `:info` see [https://github.com/prawnpdf/prawn/blob/master/manual/document_and_page_options/metadata.rb](https://github.com/prawnpdf/prawn/blob/master/manual/document_and_page_options/metadata.rb) 

If `skip_page_creation` is set to true then have to create the first page yourself for eg.

```ruby
pdf.start_new_page size: "A4", page_layout: :landscape
```

## Examples

1. **Hello World**

```ruby	
# hello.pdf.prawn

prawn_document(page_layout: :landscape) do
  pdf.text 'Hello World!'
end
```

2. ** Using Active Record **

```ruby
# myproducts.pdf.prawn

prawn_document do
  pdf.text 'Current Products are:'
  pdf.move_down 20
  pdf.table @products.collect{|p| [p.name,p.price]}
end
```

## Credits

Created by Carlos Ortiz - @cortiz
Maintained by Weston Ganger - @westonganger

Thanks to @rwilliams, @sigmike, @smber1, @iffyuva
