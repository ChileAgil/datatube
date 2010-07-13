# Configuración de Capistrano
# http://www.capify.org/index.php/Capistrano


set :application, "datatube"

set :scm, :git
set :repository,  "git@github.com:firenxis/datatube.git"
default_run_options[:pty] = true
set :deploy_via, :remote_cache

set :sudo, false

role :web, "osiris.firenxis.com"                          # Your HTTP server, Apache/etc
role :app, "osiris.firenxis.com"                          # This may be the same as your `Web` server
role :db,  "osiris.firenxis.com", :primary => true # This is where Rails migrations will run
set :user, 'datatube'
set :port, 3666
ssh_options[:forward_agent] = true
