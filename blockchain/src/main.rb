require_relative 'mining'
require_relative 'blockchain'
require_relative 'crypto/wallet'

user_1 = Crypto::Wallet.new
user_2 = Crypto::Wallet.new
user_3 = Crypto::Wallet.new
user_4 = Crypto::Wallet.new
user_5 = Crypto::Wallet.new

blockchain = Blockchain.new
blockchain.create_transaction(10, user_1.address, user_2.address)
blockchain.create_transaction(15, user_1.address, user_2.address)
blockchain.create_transaction(20, user_2.address, user_1.address)
Mining.new(blockchain).mine_block(user_1.address)
blockchain.create_transaction(30, user_3.address, user_4.address)
Mining.new(blockchain).mine_block(user_5.address)
blockchain.create_transaction(30, user_3.address, user_4.address)

puts blockchain.chain.inspect
