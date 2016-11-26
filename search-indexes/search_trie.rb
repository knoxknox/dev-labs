class Node
  attr_accessor :char
  attr_accessor :is_leaf
  attr_accessor :children

  def initialize(char)
    @char = char
    @children = {}
  end
end

class Trie
  attr_reader :root

  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    children = root.children

    0.upto(word.size) do |i|
      node = nil
      char = word[i]
      if children.key?(char)
        node = children[char]
      else
        node = Node.new(char)
        children[char] = node
      end

      children = node.children
      node.is_leaf = true if i == word.size - 1
    end
  end

  def lookup(word)
    children = root.children

    node = nil
    0.upto(word.size - 1) do |i|
      char = word[i]
      if children.key?(char)
        node = children[char]
        children = node.children
      else
        return nil
      end
    end

    node != nil && node.is_leaf ? node : nil
  end
end
