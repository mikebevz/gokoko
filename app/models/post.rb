class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :text, type: String
  field :image, type: String
  field :url, type: String
  
  belongs_to :user
  has_and_belongs_to_many :locations
  
end
