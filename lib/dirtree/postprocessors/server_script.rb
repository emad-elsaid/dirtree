module Dirtree
  module PostProcessors
    # inject the server.js tag to the template before body close
    class ServerScript
      def initialize(port)
        @port = port
      end

      def call(result)
        result.gsub %r{(<\/body>)} do
          "<script src='http://localhost:#{port}/server.js'></script>"
        end
      end

      private

      attr_reader :port
    end
  end
end
