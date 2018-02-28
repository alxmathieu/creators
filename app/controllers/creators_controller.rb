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


  private

  def creators_params
    params.require(:creator).permit(:user_id, :youtube_name, :description, :channel_url, :video_url, :nb_followers, :language, :batch_id, :tag_list)
  end

end
