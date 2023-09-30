require 'json'
require 'digest'

class Block
  attr_reader :nonce # Integer
  attr_reader :timestamp # Float
  attr_reader :parent_hash # String
  attr_reader :current_hash # String
  attr_reader :transactions # Array[Transaction]

  def initialize(nonce, parent_hash, transactions)
    @nonce = nonce
    @timestamp = Time.now.to_f
    @parent_hash = parent_hash
    @transactions = transactions
    @current_hash = Digest::SHA256.hexdigest(attributes.to_json)
  end

  def attributes
    { nonce: nonce, timestamp: timestamp, parent_hash: parent_hash, transactions: transactions }
  end
end
