# "word1"=>#<Set: {"doc1", "doc2", "doc3"}>
# "word2"=>#<Set: {"doc4", "doc5"}>
# "word3"=>#<Set: {"doc1", "doc4", "doc5"}>
# "word4"=>#<Set: {"doc2", "doc3"}>
# "word5"=>#<Set: {"doc1", "doc2", "doc3"}>
# "word6"=>#<Set: {"doc2", "doc4", "doc5"}>
# "word7"=>#<Set: {"doc1", "doc3", "doc4", "doc5"}>

index = Index.new
index.interpolate([
  ['doc1', 'word1', 'word3', 'word5', 'word7'],
  ['doc2', 'word1', 'word4', 'word5', 'word6'],
  ['doc3', 'word1', 'word4', 'word5', 'word7'],
  ['doc4', 'word2', 'word3', 'word6', 'word7'],
  ['doc5', 'word2', 'word3', 'word6', 'word7']
])
