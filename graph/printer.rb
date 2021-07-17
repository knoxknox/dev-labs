class Printer
  def initialize(graph)
    @graph = graph
  end

  def show_info
    @graph.nodes.each do |name, node|
      names = node.edges.map(&:name)
      puts "node #{name}: #{names.join(',')}"
    end
  end
end
