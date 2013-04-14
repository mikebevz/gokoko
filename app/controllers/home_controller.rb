class HomeController < ApplicationController
  def index
    @users = User.all
    @locations = Location.all
    
    if params[:loc].blank?
      @current_location = @locations.first
    else
      @current_location = Location.find(params[:loc])
    end
    
    @posts = @current_location.posts
  end
end
