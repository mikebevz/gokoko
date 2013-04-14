class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_location
  
  def get_location
    @locations = Location.all
    
    if !session[:current_location].blank?
      @current_location = Location.find(session[:current_location])
    else
      @current_location = @locations.first
    end  
    
    if !params[:loc].blank?
      @current_location = Location.find(params[:loc])
    end
    
    session[:current_location] = @current_location.id
  end
  
end
