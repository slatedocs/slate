module MarkdownErb
    def markdown(md_text)
      md_renderer.render(md_text)
    end
  
    def md_renderer
      Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  
    def dictionary_description(field)
      desc = data.dictionary.descriptions[field]
      link = data.dictionary.links[field]
      if link
        markdown("#{desc} See #{link} for further information.")
      else
        desc
      end
    end
  end