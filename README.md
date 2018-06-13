# Prawn-Rails [![Gem Version](https://badge.fury.io/rb/prawn-rails.svg)](http://badge.fury.io/rb/prawn-rails)
<a href='http://ko-fi.com/A552JBK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 

# Install
```ruby
gem 'prawn-rails'
```

Note: `prawn` and `prawn-table` are dependencies of `prawn-rails` so there is no need to mention it in the projects Gemfile unless you want to use a specific version of either of those libraries.

# Usage
Create a view with `pdf` as format and `prawn` as handler so filename should look like `example.pdf.prawn`

It provides a helper called `prawn_document` which builds a PrawnRails::Document with default options. You can override any options as you please. Example:

```ruby
prawn_document do |pdf|
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

# Default configuration

Add a `prawn-rails.rb` config to your Rails app under `config/initializers` like this

```ruby
PrawnRails.config do |config|
  config.page_layout = :portrait
  config.page_size   = "A4"
  config.skip_page_creation = false
end
```

Please note that these are the defaults. 

For a list of all available options: [http://www.rubydoc.info/gems/prawn/Prawn%2FDocument:initialize](http://www.rubydoc.info/gems/prawn/Prawn%2FDocument:initialize). 

For a list of all metadata the the `:info` option supports, please see [https://github.com/prawnpdf/prawn/blob/master/manual/document_and_page_options/metadata.rb](https://github.com/prawnpdf/prawn/blob/master/manual/document_and_page_options/metadata.rb) 

If `skip_page_creation` is set to true then you have to create the first page yourself. Example:

```ruby
pdf.start_new_page
# OR
pdf.start_new_page size: "A4", page_layout: :portrait
```

# Examples

#### Hello World

```ruby	
# hello.pdf.prawn

prawn_document do |pdf|
  pdf.text 'Hello World!'
end
```

#### Using Active Record

```ruby
# myproducts.pdf.prawn

prawn_document do |pdf|
  pdf.text 'Current Products are:'
  pdf.move_down 20
  pdf.table @products.collect{|p| [p.name,p.price]}
end
```
#### Using Custom options

```ruby
# landscape.pdf.prawn

prawn_document(page_layout: :landscape) do |pdf|
  pdf.text 'Landscape Page!'
end
```

# Credits

Maintained by Weston Ganger - @westonganger

Created by Carlos Ortiz - @cortiz

<a href='http://ko-fi.com/A552JBK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 
