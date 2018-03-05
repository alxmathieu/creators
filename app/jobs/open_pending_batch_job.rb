class OpenPendingBatchJob < ApplicationJob
  queue_as :default

  def perform
    # Find the upcoming batch
    upcoming_batch =  Batch.next_batch
    # Open the upcoming batch
    upcoming_batch.status = "active"
    upcoming_batch.save
  end
end
