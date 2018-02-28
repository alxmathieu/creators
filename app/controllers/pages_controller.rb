class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    # for upvote creation
    @upvote = Upvote.new
    # for showcasing div
    @showcased_creator = Creator.where("is_showcased = true").first
    # for rankings
    current_batch = Batch.where("status = 'active'").first
    last_batch = Batch.where("number = #{current_batch.number - 1}").first
    creators_in_current_batch = Creator.where("batch_id = #{current_batch.id}")
    creators_in_last_batch = Creator.where("batch_id = #{last_batch.id}")
    @ordered_creators_current_batch = sort_creators(creators_in_current_batch)
    @ordered_creators_last_batch = sort_creators(creators_in_last_batch)
  end

  private

  def sort_creators(array)
    asc = array.sort_by {|creator| creator.upvotes.length }
    asc.reverse
  end

end
