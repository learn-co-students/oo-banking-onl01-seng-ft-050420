class BankAccount
attr_accessor :balance, :status
attr_reader :name
@@all = []

    def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    save
    end

    def save
    @@all << self
    end

    def deposit(num)
    @balance += num
    end
def self.all
@all
end

    def display_balance
    "Your balance is $#{self.balance}."
    end
def valid?
 self.balance > 0 && self.status == "open" 
end

def close_account
self.status = "closed"
self.balance = 0
end

end
