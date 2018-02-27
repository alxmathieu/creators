class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  CURRENT_BATCH = Batch.where("status = 'active'")[0]
  LAST_BATCH = Batch.where("number = #{CURRENT_BATCH.number - 1}")

  def home
    @showcased_creator = Creator.where("is_showcased = true")[0]
    current_batch = Batch.where("status = 'active'")[0]
    last_batch = Batch.where("number = #{current_batch.number - 1}")
    # sql active records : @my_bookings = Booking.joins(:performance).where(performances: { user_id: current_user.id }).order(status: :DESC)
    @creators_in_current_batch = Creator.where("batch_id = #{current_batch.id}")


  end



end
