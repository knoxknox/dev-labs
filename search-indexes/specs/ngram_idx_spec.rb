# 2-gram
# ["Consistent programming", "programming style", "style often", "often helps", "helps readability"]
Ngram.new('Consistent programming style often helps readability').tokenize(2).inspect

# 3-gram
# ["Consistent programming style", "programming style often", "style often helps", "often helps readability"]
Ngram.new('Consistent programming style often helps readability').tokenize(3).inspect

# 4-gram
# ["Consistent programming style often", "programming style often helps", "style often helps readability"]
Ngram.new('Consistent programming style often helps readability').tokenize(4).inspect
