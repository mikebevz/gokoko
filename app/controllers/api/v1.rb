module Api
  class V1 < Grape::API
    
    version 'v1', :using => :header, :vendor => 'gokoko'
    format :json
    rescue_from :all
    
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
      get do 
        puts params
        [
          {
            "id" => "sdfsdfsd",
            "title" => "China and US make North Korea pledge", 
            "image" => "http://ichef.bbci.co.uk/wwhomepage-3.5/ic/news/304-171/66990000/jpg/_66990987_66990986.jpg",
            "url" => "http://www.bbc.co.uk/news/world-asia-22131316",
            "tags" => ["chine", "international"],
            "created_at" => DateTime.now,
            "updated_at" => DateTime.now,
            "user" => {
              "name" => "Mykhailo Bevz",
              "id" => "dsfasdfasdf"
            }
          },
            
            {
              "id" => "sdfsdfsd",
              "title" => "China and US make North Korea pledge", 
              "image" => "http://ichef.bbci.co.uk/wwhomepage-3.5/ic/news/304-171/66990000/jpg/_66990987_66990986.jpg",
              "url" => "http://www.bbc.co.uk/news/world-asia-22131316",
              "tags" => ["chine", "international"],
              "created_at" => DateTime.now,
              "updated_at" => DateTime.now,
              "user" => {
                "name" => "Mykhailo Bevz",
                "id" => "dsfasdfasdf"
              }
            },
              {
                "id" => "sdfsdfsd",
                "title" => "China and US make North Korea pledge", 
                "image" => "http://ichef.bbci.co.uk/wwhomepage-3.5/ic/news/304-171/66990000/jpg/_66990987_66990986.jpg",
                "url" => "http://www.bbc.co.uk/news/world-asia-22131316",
                "tags" => ["chine", "international"],
                "created_at" => DateTime.now,
                "updated_at" => DateTime.now,
                "user" => {
                  "name" => "Mykhailo Bevz",
                  "id" => "dsfasdfasdf"
                }
            }  
          ]
      end  
      
    end  
    
  end
end    
