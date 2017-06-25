module Dirtree
  # tree node, it has a name and children of the same type
  class Node
    attr_reader :name, :children

    def initialize(name)
      @name = name
      @children = []
    end

    # insert a node by its path, path is an array of names (Strings)
    def insert(path)
      return if path.empty?

      child_name = path.first
      grandchildren = path[1..-1]

      child = @children.find { |current| current.name == child_name }
      unless child
        child = Node.new(child_name)
        @children << child
      end

      child.insert(grandchildren)
    end

    def as_json
      {
        name: name,
        children: children.map(&:as_json)
      }
    end
  end
end
