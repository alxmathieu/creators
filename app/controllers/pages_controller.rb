class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @showcased_creator = Creator.where("is_showcased = true")

  end
end
