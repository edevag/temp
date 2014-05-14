set :stage, :production
set :application, 'temp'
server '192.168.117.211' , user: 'clean', roles: %w{web app db}
set :deploy_to, '/home/clean/temp' # /home/USERNAME/APPNAME
set :branch, 'master'
