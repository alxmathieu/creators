class CreateNewBatchJob < ApplicationJob
  queue_as :default

  def perform
    # Create a new batch
    pending_batch = Batch.new
    # Set it as pending
    pending_batch.status = "pending"
    # set the number
    pending_batch.number = Batch.next_batch.number + 1
    pending_batch.save
  end
end
