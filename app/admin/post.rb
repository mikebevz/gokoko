ActiveAdmin.register Post do     
  index do                            
    column :title                     
    column :image
    column :url
    column :user
    default_actions                   
  end                                 

  #filter :location                       

  form do |f|                         
    f.inputs "Post Details" do       
      f.input :user, :as => :select, :collection => User.all.map {|m| [m.name, m.id]}
      f.input :title    
      f.input :image
      f.input :url
      f.input :text, :as => :text
      f.input :locations
      f.has_many :comments do |fu|
        fu.input :text
        fu.input :user, :as => :select, :collection => User.all.map {|u| [u.name, u.id]}
      end
    end                               
    f.actions                         
  end                                 
end                                   
