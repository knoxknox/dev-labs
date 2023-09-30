class Mining
  MINING_DIFFICULTY = 3
  MINING_SENDER_ADDRESS = 'blockchain'.freeze

  def initialize(blockchain)
    @blockchain = blockchain
  end

  def mine_block(address)
    nonce = proof_of_work
    @blockchain.create_transaction(1, MINING_SENDER_ADDRESS, address)
    @blockchain.create_block(nonce, @blockchain.chain.last.current_hash)
  end

  private

  def proof_of_work
    nonce = 0
    transactions = @blockchain.transactions.dup
    previous_hash = @blockchain.chain.last.current_hash
    nonce += 1 while !valid_proof?(nonce, previous_hash, transactions)

    nonce
  end

  def valid_proof?(nonce, previous_hash, transactions)
    block = Block.new(nonce, previous_hash, transactions)
    block.current_hash[0...MINING_DIFFICULTY] == '0' * MINING_DIFFICULTY
  end
end
