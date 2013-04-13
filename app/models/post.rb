class Post
  include Mongoid::Document
  field :title, type: String
  field :text, type: String
  field :image, type: String
  field :url, type: String
  
  belongs_to :user
end
