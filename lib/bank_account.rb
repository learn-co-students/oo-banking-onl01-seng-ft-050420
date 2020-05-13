class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  @@accounts = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@accounts << self
  end
  
  def self.all 
    @@accounts
  end

  def deposit(amount)
    self.balance = amount + self.balance
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == 'open'
  end
  
  def close_account
    self.status = 'closed'
  end
  
end
