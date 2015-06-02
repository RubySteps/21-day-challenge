require 'cucumber/formatter/html'

module Cucumber
  module Formatter
    # In a .feature file, comment lines which start
    # #+IMAGE or
    # #+LINK
    # are processed so you can insert images or links
    # into the html report.
    #
    # Further formatting:
    # #+IMAGE|label of image|src for image
    # #+LINK|text of link|href for link
    class HtmlPlus < Html

      def comment_line(comment_line)
        if comment_line =~ /\A#\+(IMAGE|LINK)/
          tag, label, content = comment_line.split('|')
          case tag
          when '#+IMAGE'
            @builder << "#{label}:<br/><img src='#{content}'><br/>"
          when '#+LINK'
            @builder << "<a href='#{content}'>#{label}</a><br/>"
          end
        else
          @builder.text!(comment_line)
        end
      end
    end
  end
end
