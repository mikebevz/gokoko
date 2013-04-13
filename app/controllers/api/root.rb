module Api
  class Root < Grape::API
    mount Api::V1
  end
end    
