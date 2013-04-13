ActiveAdmin.register Location do     
  index do                            
    column :title                     
    column :lat
    column :lon           
    default_actions                   
  end                                 

  form do |f|                         
    f.inputs "Location Details" do       
      f.input :title                  
      f.input :lat
      f.input :lon, :as => :number
    end                       
    f.actions                         
  end                                 
end                                   
