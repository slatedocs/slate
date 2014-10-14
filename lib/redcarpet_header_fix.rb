module RedcarpetHeaderFix
  def header(text, level)
    clean_id = text.downcase.gsub(/( +|\.+)/, '-').gsub(/[^a-zA-Z0-9\-_]/, '')
    "<h#{level} id='#{clean_id}'>#{text}</h#{level}>"
  end
end

require 'middleman-core/renderers/redcarpet'
Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, RedcarpetHeaderFix
