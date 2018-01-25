require 'rake'
task default: %w[deploy]

task deploy: %w[build sync]

task image: 'Dockerfile' do
  puts 'Building docker image for slate'
  system('docker build -t kudos-slate .')
end

task build: :image do
  puts 'Running middleman build in docker image'
  system('docker run --rm -v $PWD:/slate/source -w /slate/source kudos-slate bundle exec middleman build --clean')
end

task :sync do
  puts 'Syncing files to kudos web'
  system('rsync -av ./build/ ../kudos/public/api-docs/')
end