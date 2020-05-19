class Transfer
  attr_accessor :amount, :status, :bank_account
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver=receiver
    @amount= amount
    @status= "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if status == "complete"
      nil
    elsif valid? && @sender.balance >= @amount
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status= "complete"
    else
      @status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
