module Api
  class V1 < Grape::API
    
    version 'v1', :using => :header, :vendor => 'gokoko'
    format :json
    rescue_from :all
    formatter :json, Grape::Formatter::Rabl
    
    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end
    
    resource :posts do
      desc "List of posts for a given location"
      params do
        requires :location, :type => String, :desc => "Location identifier."
      end
      get '/', :rabl => "posts" do 
        
        @location = Location.find(params[:location])
        @posts = @location.posts
       
      end 
      
      post '/' do 
        
        puts params
        
        {:status => :ok}
        
      end 
      
    end  
    
    resource :locations do
      
      desc "List of all locations"
      get '/', :rabl => "locations" do
        @locations = Location.all
      end
      
    end
    
  end
end    
