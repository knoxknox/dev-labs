class Blockchain
  attr_reader :chain # Array[Block]
  attr_reader :transactions # Array[Transaction]

  def initialize
    @chain = []
    @transactions = []
    @chain << Block.new(0, nil, []))
  end

  def create_block(nonce, parent_hash)
    block = Block.new(nonce, parent_hash, transactions)

    @chain.push(block)
    @transactions = []
    block.attributes.slice(:nonce, :timestamp, :parent_hash, :transactions)
  end

  def create_transaction(value, sender, recipient)
    transaction = Transaction.new(value, sender, recipient)

    @transactions.push(transaction)
    transaction.attributes.slice(:value, :sender, :recipient).merge(timestamp: Time.now.to_f)
  end
end
