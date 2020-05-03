# Transfer
#   initialize
#     can initialize a Transfer (FAILED - 1)
#     initializes with a sender (FAILED - 2)
#     initializes with a receiver (FAILED - 3)
#     always initializes with a status of 'pending' (FAILED - 4)
#     initializes with a transfer amount (FAILED - 5)

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  # #valid?
  # can check that both accounts are valid
  # calls on the sender and receiver's #valid? methods

  def valid?
    sender.valid? && receiver.valid?
  end


    # #execute_transaction
    #  can execute a successful transaction between two accounts
    #  each transfer can only happen once (FAILED - 1)  !!!
    #  rejects a transfer if the sender does not have enough funds (does not have a valid account) (FAILED - 2)  !!!

  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @sender.balance < 950
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  # #reverse_transfer
  #    can reverse a transfer between two accounts
  #    it can only reverse executed transfers

  def reverse_transfer
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status =  'reversed'
    end
  end
end
