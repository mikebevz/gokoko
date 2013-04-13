Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '466733643404965', '703e467b1603330cc17ff9fc386828eb',
            :scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access', :display => 'popup'
end