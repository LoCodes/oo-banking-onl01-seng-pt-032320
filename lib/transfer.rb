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

  def reverse_transfer
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status =  'reversed'
    end
  end
end
