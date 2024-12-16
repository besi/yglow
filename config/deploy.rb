set :application, 'yglow'
set :repo_url, 'git@github.com:besi/yglow'

set :log_level, :error
set :bundle_binstubs, nil
set :linked_dirs, %w{node_modules log tmp/pids tmp/cache tmp/sockets tmp/webpacker shared/bundle public/system public/uploads storage}
set :linked_files, %w{config/database.yml .env.production puma.rb}

set :rbenv_prefix, '/usr/bin/rbenv exec'

namespace :deploy do

  # start the server via root
  # systemctl start puma_yglow_production

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      within release_path do
        execute :pumactl, '-F', '~/rails/shared/puma.rb', 'phased-restart'
      end
    end
  end
end

after 'deploy:publishing', 'deploy:restart'
