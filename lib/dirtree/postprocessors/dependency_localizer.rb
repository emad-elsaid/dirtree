require 'open-uri'

module Dirtree
  module PostProcessors
    # Pull any script tag with src attribute and inline the file content
    class DependencyLocalizer
      def call(result)
        result.gsub %r{(<script src="(.+)"><\/script>)} do
          '<script>' + file_content($2) + '</script>'
        end
      end

      private

      def file_content(url)
        open(url).read
      end
    end
  end
end
