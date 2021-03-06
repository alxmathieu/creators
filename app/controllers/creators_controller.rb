class CreatorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :find_creator, only: [ :show, :edit, :update ]


  def index
    @categories = ActsAsTaggableOn::Tag.order(:name)
    @batches = Batch.where(status: ["active", "closed"]).order(created_at: :asc)
    @languages = Creator.all.map(&:language).uniq
    @creators = policy_scope(Creator)
    if params[:name].present?
      sql_query = "description ILIKE :query OR youtube_name ILIKE :query"
      @creators = @creators.where(sql_query, query: "%#{params[:name]}%")
    end

    if params[:categories].present?
      @creators = @creators.joins(taggings: :tag).where(tags: { id: params[:categories] })
    end

    if params[:batch].present?
      @creators = @creators.where(batch_id: params[:batch])
    end

    if params[:languages].present?
      @creators = @creators.where(language: params[:languages])
    end

    if params[:already_showcased].present?
      @creators = @creators.where(already_showcased: true)
    end

  end

  def show
    authorize @creator
  end

  def new
    channel_url = params[:creator][:channel_url]
    @creator = Creator.new(channel_url: channel_url)
    @creator.valid?
    authorize @creator
    unless @creator.errors[:channel_url].empty?
      return render 'creators/new_error'
    end
    @youtube_data = ApiScrapper.new(channel_url).scrape
    @categories = ActsAsTaggableOn::Tag.order(:name)
    if @youtube_data.nil?
      @creator = Creator.new
    else
      @creator = Creator.new(@youtube_data.slice(:channel_url, :youtube_name,
        :remote_avatar_photo_url, :nb_followers, :channel_id, :nb_videos))
    end
  end

  def create
    @creator = Creator.new(creator_params)
    @categories = ActsAsTaggableOn::Tag.order(:name)
    @creator.user = current_user
    @creator.batch = Batch.next_batch
    unless params[:language].nil?
      @creator.language = params[:language][0]
    end
    unless params[:tags].nil?
      params[:tags].each do |tag_id|
        @creator.tag_list.add(ActsAsTaggableOn::Tag.find(tag_id))
      end
    end
    authorize @creator
    if @creator.save
      SlackNotifier.creator_notifier(current_user.id, @creator.id, "add a new Creator") unless Rails.env.development?
      redirect_to creator_path(@creator)
    else
      @youtube_data = ApiScrapper.new(params[:creator][:channel_url]).scrape
      return render 'creators/new'
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
    @creator = Creator.friendly.find(params[:id])
  end

  def creator_params
    params.require(:creator).permit(:user_id, :batch_id, :youtube_name,
      :description, :channel_url, :channel_id, :video_url, :nb_followers,
      :is_showcased, :country, :language, :remote_avatar_photo_url, :nb_videos)
  end
end


