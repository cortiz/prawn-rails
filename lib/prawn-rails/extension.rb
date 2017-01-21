module PrawnRails
  module Extension
    ##
    # Removes all html tags from the string
    # @param html[String] string to remove the tags
    # @return [String] the string with out the tags
    ##
    def html_strip html
      return html if html.nil?

      text = html
              .gsub(/(&nbsp;|\n|\s)+/im, ' ')
              .squeeze(' ')
              .strip
              .gsub(/<([^\s]+)[^>]*(src|href)=\s*(.?)([^>\s]*)\3[^>]*>\4<\/\1>/i, '\4')

      links = []
      linkregex = /<[^>]*(src|href)=\s*(.?)([^>\s]*)\2[^>]*>\s*/i

      while linkregex.match(text)
        links << $~[3]
        text.sub!(linkregex, "[#{links.size}]")
      end
                              
      text = text
              .gsub(/<(script|style)[^>]*>.*<\/\1>/im, '')
              .gsub(/<!--.*-->/m, '')
              .gsub(/<hr(| [^>]*)>/i, "___\n")
              .gsub(/<li(| [^>]*)>/i, "\n* ")
              .gsub(/<blockquote(| [^>]*)>/i, '> ')
              .gsub(/<(br)(| [^>]*)>/i, "\n")
              .gsub(/<(\/h[\d]+|p)(| [^>]*)>/i, "\n\n")
              .gsub(/<[^>]*>/, '')

      text = CGI.unescapeHTML(text).lstrip.gsub(/\n[ ]+/, "\n") + "\n"

      links.each_with_index do |link, i|
        unless links[i].nil?
          text = text + "\n  [#{i+1}] <#{CGI.unescapeHTML(link)}>"
        end
      end

      links = nil

      return text
    end
  end
end
