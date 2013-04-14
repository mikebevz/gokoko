module Api
  class V1 < Grape::API
    
    version 'v1', :using => :header, :vendor => 'gokoko'
    format :json
    rescue_from :all
    formatter :json, Grape::Formatter::Rabl
    
    helpers do
      def authenticated
        if warden.authenticated?
          return true
        else
          error!('401 Unauthorized', 401)
        end
      end
      
      def current_user
        warden.user
      end
      
      def warden
        env['warden']
      end
      
      def session
        env['rack.session']
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
      
      post '/', :rabl => "post" do 
        authenticated
        

        @current_location = Location.find(session[:current_location])
        
        @post = Post.new(:title => params[:new_article_title], :url => params[:new_article_url], 
          :image => params[:new_article_image_url], :text => params[:new_article_text], 
          :user => current_user, :locations => [@current_location])
        
        @post.save
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
