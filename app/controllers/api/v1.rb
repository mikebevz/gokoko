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

      #kasl
      def get_image_url (url)
        require 'pismo'
        require 'fastimage'

        img_url = ""
        doc = Pismo::Document.new(url)
        images = doc.images(10)

        if images.empty?
          return ""
        end

        w = 0
        h = 0
        images.each do |image|
          size = FastImage.size(image)

          if size[0]>w && size[1]>h
            img_url = image
            w = size[0]
            h = size[1]
          end

        end
        img_url
      end
      #kasl
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
        #kasl
        @image_url = params[:new_article_image_url]
        if @image_url.blank?
          @image_url = get_image_url params[:new_article_url]
        end
        #kasl
        @post = Post.new(:title => params[:new_article_title], :url => params[:new_article_url],
          :image => @image_url, :text => params[:new_article_text],
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
