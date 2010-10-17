require 'bundler/capistrano'

set :application, "socialsofa"
set :repository,  "git@github.com:railsrumble/rr10-team-262.git"

set :scm, :git
set :scm_username, "hecticjeff"
set :branch, :master
set :deploy_via, :remote_cache

set :deploy_to, "/var/www"
set :use_sudo, true

role :app, "socialsofa.r10.railsrumble.com"
role :web, "socialsofa.r10.railsrumble.com"
role :db, "socialsofa.r10.railsrumble.com"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
