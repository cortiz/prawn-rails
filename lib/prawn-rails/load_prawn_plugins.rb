Gem.loaded_specs.keys.select{|spec_name| spec_name.starts_with?('prawn-')}.each do |gem_name|
  next if gem_name == 'prawn-rails' # Prevent circular loading

  file = gem_name.gsub('-', '/')

  begin
    require file
  rescue LoadError => _
    STDERR.puts "#{__FILE__}:#{__LINE__}: warning: prawn-rails could not require plugin `#{gem_name}`"
  end
end
