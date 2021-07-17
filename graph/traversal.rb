module Traversal
  def self.bfs(root)
    queue = Queue.new

    visited = {}
    queue.push(root)
    while !queue.empty? do
      node = queue.pop
      if !visited[node.name]
        puts node.name
        visited[node.name] = true
        node.edges.each { |x| queue.push(x) }
      end
    end
  end

  def self.dfs(root)
    stack = []

    visited = {}
    stack.push(root)
    while !stack.empty? do
      node = stack.pop
      if !visited[node.name]
        puts node.name
        visited[node.name] = true
        node.edges.reverse_each { |x| stack.push(x) }
      end
    end
  end

  def self.dfs_recursive(node, visited = {})
    puts node.name
    visited[node.name] = true
    node.edges.each do |current|
      dfs_recursive(current, visited) if !visited[current.name]
    end
  end
end
