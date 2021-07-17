require 'set'

class Node
  attr_reader :name
  attr_reader :edges

  def initialize(name)
    @name = name
    @edges = Set.new
  end

  def add_edge(edge)
    @edges.add(edge)
  end
end
