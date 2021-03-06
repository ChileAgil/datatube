# Configuración de Capistrano
# http://www.capify.org/index.php/Capistrano


set :application, "datatube"
set :deploy_to, '/var/www/datatube_r1'

set :scm, :git
set :repository,  "git@github.com:firenxis/datatube.git"
set :branch, "release_1"
default_run_options[:pty] = true
set :deploy_via, :remote_cache

set :sudo, false

role :web, "datatube.firenxis.com"                          # Your HTTP server, Apache/etc
role :app, "datatube.firenxis.com"                          # This may be the same as your `Web` server
role :db,  "datatube.firenxis.com", :primary => true # This is where Rails migrations will run
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
