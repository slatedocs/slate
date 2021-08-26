require 'nokogiri'

def toc_data(page_content)
  html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

  # get a flat list of headers
  headers = []
  html_doc.css('h1, h2, h3').each do |header|
    if header.attribute('type').to_s == 'beta'
      idxTrim = header.children.to_s.index("<span")
      content = header.children.to_s[0,idxTrim] + "<span class='tags beta'>BETA</span>" 
      headers.push({
        id: header.attribute('id').to_s,
        content: content,
        title: header.children.to_s.gsub(/<[^>]*>/, ''),
        level: header.name[1].to_i,
        releases: true,
        children: []
      })
    else
      headers.push({
        id: header.attribute('id').to_s,
        content: header.children,
        title: header.children.to_s.gsub(/<[^>]*>/, ''),
        level: header.name[1].to_i,
        releases: false,
        children: []
      })
    end
  end

  [3,2].each do |header_level|
    header_to_nest = nil
    headers = headers.reject do |header|
      if header[:level] == header_level
        header_to_nest[:children].push header if header_to_nest
        true
      else
        header_to_nest = header if header[:level] < header_level
        false
      end
    end
  end
  headers
end
