class UpvotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_creator, only: [:create, :destroy]

  def create
    #if Upvote.create(user_id: current_user.id, creator_id = upvote_params[:creator_id])
    @upvote = Upvote.new(user: current_user, creator: @creator)
    authorize @upvote
    if @upvote.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
      # redirect_to request.referrer
    else
      respond_to do |format|
        format.html { render 'root' }
        format.js  # <-- idem
      end
      # redirect_to request.referrer
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    authorize @upvote
    if @upvote.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
      # redirect_to request.referrer
    else
      respond_to do |format|
        format.html { render 'root' }
        format.js  # <-- idem
      end
      # redirect_to request.referrer
    end

  end

  private

  def set_creator
    @creator = Creator.find(params[:creator_id])
  end

  # def upvotes_params
  #   params.require(:upvote).permit(:user_id, :creator_id, :video_attributes)
  # end

end
