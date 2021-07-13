class Transfer
  # your code here
end

class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self 
  end

end

avi = BankAccount.new("avi")
