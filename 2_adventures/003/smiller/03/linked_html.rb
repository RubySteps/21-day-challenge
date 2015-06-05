require 'cucumber/formatter/html'

# Usage:
# cucumber --format Cucumber::Formatter::LinkedHtml --out report.html
# (add --require features if that isn't already in std_opts, else
# it won't be able to find the custom formatter, assuming it's somewhere
# like features/support/linked_html.rb)
#
# or, add a profile to config/cucumber.yml:
# html: --require features --format pretty --format Cucumber::Formatter::LinkedHtml --out report.html
# (the second formatter means you still get console output
# while it's building the html file)
# and then run as
# cucumber -p html
module Cucumber
  module Formatter
    class LinkedHtml < Html
      def insert_links(line)
        line.gsub!(/(http[^ ]*)/, "<a href='\\1' target='_blank'>\\1</a>")
        line.gsub!(/([A-Z]{2}-\d{4})/, "<a href='https://optoro.atlassian.net/browse/\\1' target='_blank'>\\1</a>")
        line
      end

      # as in 2.0.0, except that:
      # @builder.text!(line.strip) becomes:
      # @builder << insert_links(line.strip)
      # ... calls insert_links,
      # and uses << instead of text! to avoid escaping html
      def feature_name(keyword, name)
        lines = name.split(/\r?\n/)
        return if lines.empty?
        @builder.h2 do |h2|
          @builder.span(keyword + ': ' + lines[0], :class => 'val')
        end
        @builder.p(:class => 'narrative') do
          lines[1..-1].each do |line|
            @builder << insert_links(line.strip)
            @builder.br
          end
        end
      end
    end
  end
end
