require 'bundler/setup'

# Override for heroku deploy
namespace :assets do
  task :precompile do
    # Build Slate/Middleman documentation
    sh 'bundle exec middleman build'
  end
end
