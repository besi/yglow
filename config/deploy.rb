set :application, 'IdeaHub'
set :repo_url, 'git@github.com:besi/ideahub'

set :log_level, :error
set :bundle_binstubs, nil
set :linked_dirs, %w{node_modules log tmp/pids tmp/cache tmp/sockets tmp/webpacker shared/bundle public/system public/uploads storage}
set :linked_files, %w{config/database.yml .env.production puma.rb}

set :rbenv_prefix, '/usr/bin/rbenv exec'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute "#{fetch(:rbenv_prefix)} pumactl -P ~/rails/current/tmp/pids/puma.pid phased-restart"
    end
  end
end

after 'deploy:publishing', 'deploy:restart'