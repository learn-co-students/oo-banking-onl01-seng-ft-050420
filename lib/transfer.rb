require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
 def valid?
  sender.valid? && receiver.valid?
 end
 
 def execute_transaction
  if self.valid? && self.status = "pending"
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = "complete"
  else 
      return "Transaction rejected. Please check your account balance."
      self.status = "rejected"
  end
 end
 
 def reverse_transfer
   if execute_transaction && self.status = "complete"
     receiver.balance -= amount
     sender.deposit(amount)
     self.status = "reversed"
    end
  end

 
 
 
end
