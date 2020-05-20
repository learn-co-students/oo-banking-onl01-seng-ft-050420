require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.balance > amount && status == 'pending' && self.valid?
       sender.balance -= amount
       receiver.balance += amount
       @status = 'complete'
    elsif
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
     end
  end
  #reverse transfers that have already been executed
  def reverse_transfer
    if status == 'complete'
      receiver.balance -= amount
      sender.balance += amount
      @status = 'reversed'
    end
  end

 end
