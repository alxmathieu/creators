class ChangeBatchJob < ApplicationJob
  queue_as :default

  def perform
    # create_new_batch
    # open_pending_batch
    # close_active_batch
  end

  def create_new_batch
    # Create a new batch
    pending_batch = Batch.new
    # Set it as pending
    pending_batch.status = "pending"
    # set the number
    pending_batch.number = Batch.next_batch.number + 1
    pending_batch.save
  end

  def open_pending_batch
    # Find the upcoming batch
    upcoming_batch =  Batch.next_batch
    # Open the upcoming batch
    upcoming_batch.status = "active"
    upcoming_batch.save
  end

  def close_active_batch
    # find the current batch
    current_batch = Batch.current_batch
    # close the current batch
    current_batch.status = "closed"
    # get all creators in the batch and sort them
    creators_in_batch = current_batch.creators
    winners = creators_in_batch.sort_by {|creator| creator.upvotes.length }
    # set winners in the closed batch
    if winners.length >= 3
      current_batch.first_creator_id = winners[-1].id
      current_batch.second_creator_id = winners[-2].id
      current_batch.third_creator_id = winners[-3].id
    elsif winners.length == 2
      current_batch.first_creator_id = winners[-1].id
      current_batch.second_creator_id = winners[-2].id
    elsif winners.length == 1
      current_batch.first_creator_id = winners[-1].id
    end
    creators_in_batch.each do |creator|
      creator.batch_score = creator.upvotes.length
      creator.save
    end
    # save the batch which is now closed
    current_batch.save
  end

end
