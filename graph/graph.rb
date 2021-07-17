class Graph
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def [](name)
    @nodes[name]
  end

  def add_node(node)
    @nodes[node.name] = node
  end

  def add_edge(node_name, edge_name)
    @nodes[node_name].add_edge(@nodes[edge_name])
  end
end
