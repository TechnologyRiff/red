class WelcomeController < ApplicationController
  def index
    @topics = Topic.visible_to(current_user).search(params[:search]).paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def about
  end
end
