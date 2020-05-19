class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid? #check the status. If it is "open" && balance > 0. Need if/else statement
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  def close_account #change status from "open" to "close"
    @status = "closed"
  end

end
