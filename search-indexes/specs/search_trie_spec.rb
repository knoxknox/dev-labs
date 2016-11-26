#
#      x (root)
#      |
#      w
#      |
#      o
#     / \
#   w     r
#        / \
#      d     m
#

trie = Trie.new
trie.insert('wow')
trie.insert('word')
trie.insert('worm')

puts trie.lookup('wor')  # nil
puts trie.lookup('word') # #<Node:0x007f646ffdcbd8>
