class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid? #check if both sender && receiver have valid account
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction #sender needs to have enough money to transder to the receiver
    if @sender.balance > @amount && @status == "pending" && @sender.status != "closed" && @receiver.status != "closed"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
   if @status == "complete"
     @sender.balance += @amount
     @receiver.balance -= @amount
     @status = "reversed"
   end
 end

end
