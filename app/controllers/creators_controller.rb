class CreatorsController < ApplicationController
  before_action :find_creator, only: [ :show, :edit, :update ]

  def index
    @creators = Creator.all
  end

  def show

  end

  def new
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params)
    if @creator.save
      redirect_to creators_path
    else
      render :new
    end
  end

  def edit
  end

  def update
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
    params.require(:creator).permit( :user_id, :batch_id, :youtube_name, :description, :video_url, :nb_followers, :is_showcased, :country, :language)
  end
end


