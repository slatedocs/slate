source 'http://rubygems.org'

gem "middleman", "~>3.3.0"                # for compiling the site
gem 'middleman-gh-pages'                  # for generating Github pages
gem "middleman-livereload", "~> 3.3.0"    # for live-reloading 
gem "middleman-syntax"                    # for syntax highlighting
gem "rouge", "1.7.2"                      # for syntax highlighting
gem 'kramdown', '~> 1.6.0'                # for advanced markdown
gem 'json', '~> 1.8.2'                    # for parsing JSON
gem "rake", "~> 10.4.0"                   # for build and deployment tasks
gem 'wdm', :platforms => [:mswin, :mingw] # for faster file watcher updates on Windows
gem 'therubyracer', :platforms => :ruby   # for manipulating Javascript from Ruby

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end