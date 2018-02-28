class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    #if Upvote.create(user_id: current_user.id, creator_id = upvote_params[:creator_id])
    @creator = Creator.find(params[:creator_id])
    @upvote = Upvote.new(user: current_user, creator: @creator)
    authorize @upvote
    if @upvote.save
      redirect_to root_path
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    authorize @upvote
    @upvote.destroy
    redirect_to root_path
  end

  private

  # def upvotes_params
  #   params.require(:upvote).permit(:user_id, :creator_id, :video_attributes)
  # end

end
