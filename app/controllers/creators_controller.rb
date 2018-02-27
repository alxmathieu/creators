class CreatorsController < ApplicationController

  def index
    @creators = Creator.all
  end

  def new
    @creator = Creator.new
    authorize @creator
  end

  def create
    @creator = Creator.new(creators_params)
    @creator.user = current_user
    authorize @creator
    if @creator.save
      redirect_to new_creator_path
    else
      render 'creators/new'
    end
  end

  # def create
  #   @performance = Performance.new(performances_params)
  #   @performance.artist = current_user
  #   authorize @performance
  #   @performance.save
  #   current_user.is_artist = true
  #   current_user.save
  #   redirect_to edit_user_path(current_user)
  # end

  private

  def creators_params
    params.require(:creator).permit(:user_id, :youtube_name, :description, :channel_url, :video_url, :nb_followers, :language, :batch_id)
  end

end
