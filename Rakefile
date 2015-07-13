require 'middleman-gh-pages'
require 'rake/clean'

CLOBBER.include('build')


SSH_USER = 'deployer'
SSH_HOST = 'blog-public-sites'
SSH_DIR = '/srv/faria_dev_center_new'

desc "Build the website from source"
task(:build) {
  puts "## Building website"
  status = system('bundle exec middleman build --clean')
  puts status ? "OK" : "FAILED"
}

desc "Run the preview server at http://localhost:4567"
task(:preview) {
  system('bundle exec middleman server')
}

desc "Deploy website via rsync"
task(:deploy) {
  puts "## Deploying website via rsync to #{SSH_HOST}"
  status = system("rsync -avze 'ssh' --delete build/ #{SSH_USER}@#{SSH_HOST}:#{SSH_DIR}")
  puts status ? "OK" : "FAILED"
}

task ship: %i(build deploy)
task default: %i(build)
