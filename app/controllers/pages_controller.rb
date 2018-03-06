class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    # for upvote creation
    @upvote = Upvote.new
    # for showcasing div
    @showcased_creator = Creator.where("is_showcased = true").first
    # for rankings
    if Batch.where("status = 'active'").empty?
      current_batch = nil
    else
      current_batch = Batch.current_batch
      last_batch = Batch.last_batch
      creators_in_current_batch = current_batch.creators
      creators_in_last_batch = last_batch.creators
      @ordered_creators_current_batch = sort_creators_current_batch(creators_in_current_batch)
      @ordered_creators_last_batch = sort_creators_last_batch(creators_in_last_batch)
    end
    @creator = Creator.new

    if last_batch.nil? || last_batch.first_creator_id.nil? || last_batch.second_creator_id.nil? || last_batch.third_creator_id.nil?
      @winners_last_batch = []
    elsif Batch.last_batch.creators.size >= 3
      @winners_last_batch = [Creator.find(last_batch.first_creator_id), Creator.find(last_batch.second_creator_id), Creator.find(last_batch.third_creator_id)]
    elsif Batch.last_batch.creators.size == 2
      @winners_last_batch = [Creator.find(last_batch.first_creator_id), Creator.find(last_batch.second_creator_id)]
    elsif Batch.last_batch.creators.size == 1
      @winners_last_batch = [Creator.find(last_batch.first_creator_id)]
    else

      @winners_last_batch = []
    end

    if user_signed_in?
      current_user.update_level
    end

  end

  private

  def sort_creators_current_batch(array)
    all_upvotes = 0
    Batch.current_batch.creators.each do |creator|
      all_upvotes += creator.upvotes.length
    end
    if all_upvotes > 0
      asc = array.sort_by {|creator| creator.upvotes.length }
      asc.reverse
    else
      asc = array.sort_by {|creator| creator.user.level }
      asc.reverse
    end
  end

def sort_creators_last_batch(array)
  asc = array.sort_by {|creator| creator.upvotes.length }
  asc.reverse
end

end
