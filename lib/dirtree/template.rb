require 'json'
require 'erb'

module Dirtree
  # generate template HTML from template files and files paths list,
  # you can optionly provide array or post processors
  class Template
    def initialize(template_file, postprocessors = [])
      @template_file = template_file
      @root = Node.new('/')
      @postprocessors = postprocessors
    end

    def add_file(file)
      root.insert(file.strip.split('/'))
    end

    def add_postprocessor(processor)
      @postprocessors << processor
    end

    def tree
      root.as_json
    end

    def output
      result = ERB.new(template_content).result binding
      postprocess(result)
    end

    private

    attr_reader :template_file, :root, :postprocessors

    def postprocess(result)
      processed_results = result
      postprocessors.each do |processor|
        processed_results = processor.call(processed_results)
      end
      processed_results
    end

    def template_content
      File.read(File.expand_path(template_file))
    end
  end
end
