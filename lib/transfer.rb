class Transfer

  # attr_reader :status
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def valid?
    (@sender.valid? && @receiver.valid? && @amount <= @sender.balance)
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
      return
    end
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
