object @post

attributes :id, :title, :text, :image, :url, :created_at
child :user do
  attributes :id, :name
end

child :locations do 
  attributes :id, :title
end