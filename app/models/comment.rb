class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :text, type: String
  field :username, type: String
  field :user_id, type: String
  
  belongs_to :post
  belongs_to :user
end
