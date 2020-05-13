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
  if self.valid? && self.status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = "complete"
  else 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
  end
 end
 
 def reverse_transfer
   if self.valid? && self.status == "complete" && receiver.balance > amount
     receiver.balance -= amount
     sender.deposit(amount)
     self.status = "reversed"
    end
  end


 
end
