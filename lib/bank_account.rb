# #initialize
#    can initialize a Bank Account
#    initializes with a name
#    always initializes with balance of 1000
#    always initializes with a status of 'open'


class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  # #deposit
  #   can deposit money into its account

  def deposit(money)
    self.balance += money
  end

  # #display_balance
  #  can display its balance

  def display_balance
    "Your balance is $#{self.balance}."
  end

  # #valid?
  #  is valid with an open status and a balance greater than 0

  def valid?
    status == "open" && balance > 0
  end


  # #close_account
  #   can close its account

  def close_account
    self.status = "closed"
  end




end
