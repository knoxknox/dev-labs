class Node:
  def __init__(self, value):
    self.map = {}
    self.fail = None
    self.value = value
    self.output = set()

  def get_fail(self):
    return self.fail

  def set_fail(self, fail):
    self.fail = fail

  def get_output(self):
    return self.output

  def add_output(self, word):
    self.output.add(word)

  def get_children(self):
    return self.map.iteritems()

  def get_child(self, char):
    return self.map.get(char, None)

  def add_child(self, char):
    if self.map.has_key(char):
      return self.map[char]
    else:
      node = Node(char)
      self.map[char] = node
    return node

  def get_or_add_child(self, char):
    child = self.get_child(char)
    if not child:
      child = self.add_child(char)
    return child

  def __str__(self):
    return 'value: {}, map: {}'.format(self.value, str(self.map))

class AC:
  def __init__(self):
    self.root = Node('_')

  def build(self, words):
    for word in words:
      self.add_word(word)
    self.build_fail_links()

  def traverse(self, text):
    i = 0
    result = []
    node = self.root
    while i < len(text):
      char = text[i]
      child = node.get_child(char)
      while not child:
        node = node.get_fail()
        child = node.get_child(char)
        if node == self.root and not child:
          i += 1
          break
      if child:
        i += 1
        node = child
        result.extend(node.get_output())
    return result

  # @private
  def add_word(self, word):
    node = self.root
    for i in range(len(word)):
      char = word[i]
      node = node.get_or_add_child(char)
      if i == len(word) - 1: node.add_output(word)

  # @private
  def build_fail_links(self):
    queue = []
    self.root.set_fail(self.root)
    children = self.root.get_children()

    for k, v in children:
      v.set_fail(self.root)
      queue.append(v)

    while queue:
      node = queue.pop()
      for k, v in node.get_children():
        queue.append(v)
        fail = node.get_fail()
        child = fail.get_child(k)
        while not child and fail != self.root:
          fail = fail.get_fail()
          child = fail.get_child(k)
        if child:
          v.set_fail(child)
        else:
          v.set_fail(self.root)

# Main
ac = AC()
ac.build(['java', 'ruby', 'python'])
print ac.traverse('skills: go, ruby, python')
