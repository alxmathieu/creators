class UpvotesController < ApplicationController

  def create
    #if Upvote.create(user_id: current_user.id, creator_id = upvote_params[:creator_id])
    @upvote = Upvote.new(upvotes_params)
    @upvote.user = current_user
    authorize @upvote
    if @upvote.save
      redirect_to root_path
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path)
    end
  end

  private

  def upvotes_params
    params.permit(:user_id, :creator_id)
  end

end
