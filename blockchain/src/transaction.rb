class Transaction
  attr_reader :value # Float
  attr_reader :sender # String
  attr_reader :recipient # String

  def initialize(value, sender, recipient)
    @value = value
    @sender = sender
    @recipient = recipient
  end

  def attributes
    { value: value, sender: sender, recipient: recipient }
  end
end
