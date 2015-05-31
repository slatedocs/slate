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

# Github pages require relative links
activate :relative_assets
set :relative_links, true

require 'nokogiri'

helpers do
  def body_for(resource)
    resource.render(layout: nil)
  end

  def doc_for(resource)
    html = body_for(resource)
    Nokogiri::HTML::DocumentFragment.parse(html)
  end

  def create_level_html(heading_id, toc_level, toc_section, tocText, tocInner)
    link = '<a href="#%1">%2</a>%3'
      .gsub('%1', heading_id.to_s)
      .gsub('%2', tocText)
      .gsub('%3', tocInner ? tocInner : '');
    '<li data-heading="%4" class="tocify-item%1%5">%3</li>'
      .gsub('%1', toc_level == 1 ? ' tocify-header' : '')
      .gsub('%2', toc_section.to_s)
      .gsub('%3', link)
      .gsub('%4', heading_id.to_s)
      .gsub('%5', tocInner.length > 0 ? ' has-subheader' : '')
  end

  def table_of_contents(resource)
    toc_html = ''
    toc_level = 1
    toc_section = 1
    level_html = ''

    doc_for(resource).css('h1').each do |h1|
      ct  = h1.xpath('count(following-sibling::h1)')
      h2s = h1.xpath("following-sibling::h2[count(following-sibling::h1)=#{ct}]")

      level_html = '';
      inner_section = 0;

      h2s.map.each do |h2|
        inner_section += 1;

        level_html += create_level_html(h2.attribute('id'),
          toc_level + 1,
          toc_section + inner_section,
          h2.text,
          '')
      end
      if level_html.length > 0
        level_html = '<ul class="tocify-subheader">' + level_html + '</ul>';
      end

      toc_html += create_level_html(id = h1.attribute('id'),
        toc_level,
        toc_section,
        h1.text,
        level_html);

      toc_section += 1 + inner_section;
    end

    if toc_html.length > 0
        toc_html = '<ul>' + toc_html + '</ul>';
    end

    return toc_html
  end
end

# Build Configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end
