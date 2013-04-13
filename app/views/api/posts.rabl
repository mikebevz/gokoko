collection @posts


attributes :id, :title, :image, :url, :created_at, :updated_at
child :user => :user do 
  attributes :id, :name 
end
child :locations do
  attributes :id, :title, :lat, :lon
end
child :comments do
  attributes :id, :text
  child :user do
    attributes :id, :name
  end
end