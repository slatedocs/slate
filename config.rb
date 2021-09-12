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
# set :css_dir, 'assets/api-v2/stylesheets'
# set :js_dir, 'assets/api-v2/javascripts'
# set :images_dir, 'assets/api-v2/images'
# set :fonts_dir, 'assets/api-v2/fonts'


# Activate the syntax highlighter
activate :syntax

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
  set :css_dir, '//pt-public.practitest.com/api/slate-apiv2/stylesheets'
  set :js_dir, '//pt-public.practitest.com/api/slate-apiv2/assets'
  set :images_dir, '//pt-public.practitest.com/api/slate-apiv2/assets'

  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end

# Deploy Configuration
# not in use !!
# credentials_file_name = File.expand_path('~/.pt-api-sftp-credentials.yml')
# if File.exists?(credentials_file_name)
#   sftp_credentials = YAML::load_file(credentials_file_name)
#
#   activate :deploy do |deploy|
#     deploy.deploy_method   = :sftp
#     deploy.host            = sftp_credentials["host"]
#     deploy.port            = sftp_credentials["port"]
#     deploy.path            = sftp_credentials["path"]
#     # Optional Settings
#     deploy.user     = sftp_credentials["user"]
#     deploy.password = sftp_credentials["password"]
#   end
# end

# If you want Middleman to listen on a different port, you can set that below
set :port, 4567
