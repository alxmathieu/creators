class CreateNewBatchJob < ApplicationJob
  queue_as :default

  def perform

    OpenPendingBatchJob.new.perform
  end

  def step_1
    # Create a new batch
    pending_batch = Batch.new
    # Set it as pending
    pending_batch.status = "pending"
    # set the number
    pending_batch.number = Batch.next_batch.number + 1
    pending_batch.save
  end

  def step_2

  end
end
