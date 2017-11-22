require 'webrick'

module Dirtree
  # Start a server that serve a template
  # and an endpoint to pull data periodically
  class Server < WEBrick::HTTPServer
    def self.start(template)
      server = new(template)
      [
        Thread.new { server.start },
        Thread.new { server.load_data }
      ].map(&:join)
    end

    def load_data
      while file = STDIN.gets do
        puts file
        template.add_file(file)
      end
    end

    private

    attr_accessor :template

    PORT = 8080

    def initialize(template)
      super Port: PORT
      @template = template
      @template.add_postprocessor(script_postprocessor)

      mount_proc '/' do |req, res|
        res.body = router(req.path)
      end
    end

    def router(path)
      case path
      when '/'
        template.output
      when '/tree.json'
        template.tree.to_json
      when '/server.js'
        server_script_content
      else
        "Route #{path} not found."
      end
    end

    def script_postprocessor
      @script_postprocessor ||= PostProcessors::ServerScript.new(PORT)
    end

    def server_script_content
      File.read(File.expand_path('js/server.js'))
    end
  end
end
