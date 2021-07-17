```ruby
##
#     A
#    / \
#   B   C
#  / \   \
# D   E---F
#

graph = Graph.new
nodes = [:a, :b, :c, :d, :e, :f]
nodes.each { |name| graph.add_node(Node.new(name)) }

# connect nodes
graph.add_edge(:a, :b)
graph.add_edge(:a, :c)
graph.add_edge(:b, :d)
graph.add_edge(:b, :e)
graph.add_edge(:c, :f)
graph.add_edge(:f, :e)

# print connected nodes
Printer.new(graph).show_info

root = graph.nodes[:a]
puts "BFS: #{Traversal.bfs(root)}"
puts "DFS: #{Traversal.dfs(root)}"
puts "DFS (R): #{Traversal.dfs_recursive(root)}"
```
