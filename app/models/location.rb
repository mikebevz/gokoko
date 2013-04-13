class Location
  include Mongoid::Document
  field :title, type: String
  field :lat, type: Double
  field :lon, type: Double
end
