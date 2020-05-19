class Transfer
  
  attr_accessor :sender, :receiver, :status 
  attr_reader :amount
  
  def initialize(sender, receiver, amount) 
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true 
      return true
    end
    
  end 
  
  def execute_transaction
    
    if valid? && @sender.balance > @amount && @status =="pending"
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else 
      
      @status = "rejected" 
      "Transaction rejected. Please check your account balance."
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

