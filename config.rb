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
ignore 'api-blueprint/*'

configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  activate :asset_hash
  activate :gzip
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket                = 'dev.frontapp.com'
  s3_sync.region                = 'us-west-1'
  s3_sync.path_style            = true

  default_caching_policy max_age:(60 * 60 * 24 * 365)
  caching_policy 'text/html', max_age: 10, must_revalidate: true
end
