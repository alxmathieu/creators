class CreatorsController < ApplicationController

  def index
    @creators = Creator.all
  end

  def new
    @creator = Creator.new
    authorize @creator
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
    params.require(:creators).permit(:price, :description)
  end

end
