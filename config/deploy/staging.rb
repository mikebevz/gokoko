load "deploy/assets"

set :rails_env, "staging"
role :web, "bsk.monster.appfellas.co"
role :app, "bsk.monster.appfellas.co"
set :deploy_to, "/home/myb/gokoko/staging/"
set :branch, "develop"
ssh_options[:port] = 2022
set :rvm_type, :system