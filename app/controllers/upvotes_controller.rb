class UpvotesController < ApplicationController

  def new
    @upvote = Upvote.new
  end

  def create
    @upvote = upvote.new(upvote_params)
    if @upvote.save
      redirect_to creator_path
    else
      render :new
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy
    redirect_to creator_path
  end

  private

  def upvote_params
    params.require(:upvote).permit( :user_id, :creator_id)
  end
end
