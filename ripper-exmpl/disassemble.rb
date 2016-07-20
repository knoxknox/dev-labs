require 'pp'
require 'ripper'

# 1.Tokens
# Tokenizing is the first step to break program into chunks
Ripper.tokenize("x > 100 ? 1 : 0")

# 2.Lexing
# String is still broken into tokens, additional data is added
Ripper.lex("x > 100 ? 1 : 0")

# 3.Parsing
# Transforms text into something called an AST
# AST is a representation of your program in memory
Ripper.sexp("x > 100 ? 1 : 0")

# 4.Execution
# < 1.9 traverse AST
# > 1.9 compiling AST to bytecode
# This bytecode is then run by RubyVM (YARV)
RubyVM::InstructionSequence.compile("x > 100 ? 1 : 0").disassemble
