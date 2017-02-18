# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Site Settings

# If set, the logo in the navbar will also be a link to this URL
# set :navbar_url, 'https://www.acmeinc.com'

# SEO Settings
=begin Uncomment this section to enable SEO (search engine optimization) meta data

set :host, 'https://www.acmeinc.com' # the base hostname & protocol for your homepage
set :base_path, '/docs' # Base/Root Path of Slate (For example if you proxy Slate at www.example.com/docs, then set to /docs)
set :locale, 'en'

# http://json-ld.org/spec/
set :seo, {
  :legal_name => "Acme, Inc",
  :email => "support@acmeinc.com",
  :contact_point => { # if contact_point is set, all subfields required
    :email => "support@acmeinc.com",
    :telephone => "+1-234-567-8901"
  },
  :address => { # if address is set, all subfields required
    :street_address => "1 Dr Carlton B Goodlett Pl",
    :address_locality => "San Francisco",
    :address_region => "California",
    :post_office_box_number => 94102
  }
}

# Controls images like Facebook's OG Image'
set :social_image, 'images/logo.png'

# No special characters in usernames (i.e. no @)
set :twitter_username, 'MyTwitterAccount'
set :facebook_username, 'MyFbUserName'
set :facebook_app_id, 'MyFbAppId'
set :github_username, 'MyGithubUserName'
=end

# When set, enables Google Analytics tracking script
# set :google_analytics_id, 'UA-XXX-X'

# Activate the syntax highlighter
activate :syntax
ready do
  require './lib/multilang.rb'
end

activate :sprockets

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Build Configuration
configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567
