Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == "staging"
    provider :facebook, '466733643404965', '703e467b1603330cc17ff9fc386828eb',
            :scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access', :display => 'popup'
  else # Development          
    provider :facebook, '497222877005002', 'e610d06c5b20819207bb159f0ba4f122',
            :scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access', :display => 'popup'
  end
            
end