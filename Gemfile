source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem "rake", "~> 10.4.0"

# Component requirements
gem 'slim'

# Test requirements

# Padrino Stable Gem
gem 'padrino', '0.12.5'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.5'
# end

# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
#### SLATE ####
gem "rouge", "1.7.2"

gem "middleman", "~>3.3.0"

# For syntax highlighting
gem "middleman-syntax"

# Plugin for middleman to generate Github pages
gem 'middleman-gh-pages'

# Live-reloading plugin
gem "middleman-livereload", "~> 3.3.0"

gem 'redcarpet', '~> 3.2.1'

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end

gem 'therubyracer', :platforms => :ruby