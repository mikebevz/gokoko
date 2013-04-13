set :default_stage, "staging"
set :stages, %w(production staging)

require 'capistrano/ext/multistage'
require 'rvm/capistrano'

#set :rvm_ruby_string, 'ruby-1.9.3-p194@global'
set :rvm_install_type, :stable

require "bundler/capistrano"

# Sidekiq
# require 'sidekiq/capistrano'

set :application, "GoKoko"
set :repository,  "git@github.com:mikebevz/gokoko.git"

set :user, "myb"

set :use_sudo, false
set :keep_releases, 3
set :scm, :git

set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :stack, :passenger_nginx

ssh_options[:forward_agent] = true
default_run_options[:pty] = true
default_run_options[:shell] = 'bash'
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "bsk.monster.appfellas.co"                          # Your HTTP server, Apache/etc
#role :app, "bsk.monster.appfellas.co"                          # This may be the same as your `Web` server

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

  desc "Update the crontab file"
  task :update_crontab do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end

end

# namespace :rvm do
#   task :trust_rvmrc do
#     run "rvm rvmrc trust #{release_path}"
#   end
# end

#after "deploy", "rvm:trust_rvmrc"

namespace :assets do
  
  desc "Create symlink for shared static resources, fx user avatars, etc."
  task :symlink, :roles => :app do
    assets.create_dirs
    run <<-CMD
      ln -nfs #{shared_path}/static #{release_path}/public/static
    CMD
  end

  desc "Copy application.yml from shared directory"
  task :application_yml, :roles => :app do
    run <<-CMD
      ln -s #{shared_path}/config/application.example.yml #{release_path}/config/application.yml
    CMD
  end
  
  desc "Create dirs"
  task :create_dirs, :roles => :app do
    %w(static).each do |name|
      run "mkdir -p #{shared_path}/#{name}"
    end
    
    #subdirs 
    %w(uploads).each do |name|
      run "mkdir -p #{shared_path}/static/#{name}"
    end
    
  end
end

after "deploy:update_code", "assets:symlink", "assets:application_yml"