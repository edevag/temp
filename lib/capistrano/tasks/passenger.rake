namespace :passenger do
 
  desc 'start'
  task :start do
    on roles(:app) do
      execute "cd #{release_path} && bundle exec passenger start --address 127.0.0.1 --port 4000 --daemonize --environment production"
    end
  end
 
  desc 'stop'
  task :stop do
    on roles(:app) do
      execute "cd #{release_path} && bundle exec passenger stop --pid-file tmp/pids/passenger.4000.pid"
    end
  end
 
  desc 'restart'
  task :restart do
    on roles(:app) do
      begin
      invoke "passenger:stop"
      rescue
      end
      invoke "passenger:start"
    end
  end
 
  desc 'status'
  task :status do
    on roles(:app) do
      execute "cd #{release_path} && bundle exec passenger status --pid-file tmp/pids/passenger.4000.pid"
    end
  end
end
