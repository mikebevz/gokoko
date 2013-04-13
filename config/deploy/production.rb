load "deploy/assets"

set :rails_env, "production"
role :web, "gokoko.appfellas.co"
role :app, "gokoko.appfellas.co"
set :deploy_to, "/home/myb/gokoko/prod/"
set :branch, "master"
ssh_options[:port] = 2022
set :rvm_type, :system