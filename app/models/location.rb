class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :lat, type: Float
  field :lon, type: Float
  
  has_and_belongs_to_many :posts
  
end
