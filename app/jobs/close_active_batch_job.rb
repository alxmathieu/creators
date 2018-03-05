class CloseActiveBatchJob < ApplicationJob
  queue_as :default

  def perform
    # find the current batch
    current_batch = Batch.current_batch
    # close the current batch
    current_batch.status = "closed"
    # get all creators in the batch and sort them
    creators_in_batch = current_batch.creators
    winners = creators_in_batch.sort_by {|creator| creator.upvotes.length }
    # set winners in the closed batch
    current_batch.first_creator_id = winners[-1].id
    current_batch.second_creator_id = winners[-2].id
    current_batch.third_creator_id = winners[-3].id

    creators_in_batch.each do |creator|
      creator.batch_score = creator.upvotes.length
      creator.save
    end
    # save the batch which is now closed
    current_batch.save
  end
end
