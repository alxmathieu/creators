class CreatorsController < ApplicationController
  before_action :find_creator, only: [ :show, :edit, :update ]


  def index
    @creators = Creator.all
  end

  def show
    authorize @creator
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
  
   def find_creator
    @creator = Creator.find(params[:id])

  def creator_params
    params.require(:creator).permit( :user_id, :batch_id, :youtube_name, :description, :video_url, :nb_followers, :is_showcased, :country, :language)
  end
end


