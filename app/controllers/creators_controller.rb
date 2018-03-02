# require_relative '../services/yt_api'

class CreatorsController < ApplicationController
  before_action :find_creator, only: [ :show, :edit, :update ]


  def index
    @creators = Creator.all
  end

  def show
    authorize @creator
  end

  def new
    channel_url = params[:creator][:channel_url]
    @youtube_data = ApiScrapper.new(channel_url).scrape
    @creator = Creator.new(@youtube_data.slice(:channel_url, :youtube_name, :avatar_photo, :nb_followers))
    authorize @creator
  end

  def create
    @creator = Creator.new(creators_params)
    @creator.user = current_user
    @creator.batch = Batch.next_batch
    authorize @creator
    raise
    if @creator.save
      redirect_to new_creator_path
    else
      render 'creators/new'
    end
  end

  def edit
  end

  def update
    authorize @creator
    if @creator.update(creator_params)
      redirect_to creator_path
    else
      render :edit
    end
  end

  private

  def find_creator
    @creator = Creator.find(params[:id])
  end

  def creator_params
    params.require(:creator).permit(:user_id, :batch_id, :youtube_name, :description, :channel_url, :video_url, :nb_followers, :is_showcased, :country, :language)
  end
end


