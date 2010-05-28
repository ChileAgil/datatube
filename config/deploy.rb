default_run_options[:pty] = true

set :application, "datatube"
set :repository,  "git@github.com:firenxis/datatube.git"

set :deploy_to, '/var/www/datatube'

set :scm, :git
set :branch, "master"
set :sudo, false

set :deploy_via, :remote_cache

role :web, "osiris.firenxis.com"                          # Your HTTP server, Apache/etc
role :app, "osiris.firenxis.com"                          # This may be the same as your `Web` server
role :db,  "osiris.firenxis.com", :primary => true # This is where Rails migrations will run
set :user, 'datatube'
set :port, 3666

ssh_options[:forward_agent] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
