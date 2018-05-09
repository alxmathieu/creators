class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    authorize @user
    @user.update_level
    @categories = ActsAsTaggableOn::Tag.order(:name)
  end

  def update
    @user = User.friendly.find(params[:id])
    unless @user.tag_list.empty?
      @user.tag_list = []
    end
    authorize @user
    @user.update(user_params)
    unless params[:tags].nil?
      params[:tags].each do |tag_id|
        @user.tag_list.add(ActsAsTaggableOn::Tag.find(tag_id))
      end
    end
    @user.save
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio, :avatar, :location, :tag_list, :private)
  end
end
