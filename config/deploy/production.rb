set :stage, :production
set :deploy_to, '/home/yglow/rails'

#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'develop'

server 'dev.b-labs.ch', user: 'yglow', roles: %w{web app db}


# Used by logs.rake
# TODO: Change and check logs.rake
set :server_default_log, '/var/log/unicorn/unicorn.log'

set :default_env, {
    'DOMAIN_NAME' => 'glow.b-labs.ch'
}

task :launch do
  run_locally do
    within '.' do
      execute :open, 'http://glow.b-labs.ch'
      execute :say, "'WHY GLOW deployment done'"
    end
  end
end

after :deploy, 'launch'
set :nginx_server_name, 'glow.b-labs.ch'
