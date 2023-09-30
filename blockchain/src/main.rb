require_relative 'mining'
require_relative 'blockchain'

blockchain = Blockchain.new
blockchain.create_transaction(10, 'user-1', 'user-2')
blockchain.create_transaction(15, 'user-1', 'user-2')
blockchain.create_transaction(20, 'user-2', 'user-1')
Mining.new(blockchain).mine_block('user-3')
blockchain.create_transaction(30, 'user-4', 'user-5')
Mining.new(blockchain).mine_block('user-6')
blockchain.create_transaction(30, 'user-7', 'user-8')

puts blockchain.chain.inspect
