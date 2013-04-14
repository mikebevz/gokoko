class HomeController < ApplicationController
  def index
    @locations = Location.all
    @posts = @current_location.posts.order_by(:created_at.desc)
  end
end
