require 'russian'

module RedcarpetHeaderFix
  def header(text, level)
    clean_id = Russian.translit(text).downcase.gsub(/( +|\.+)/, '-').gsub(/[^a-zA-Z0-9\-_]/, '')
    "<h#{level} id='#{clean_id}'>#{text}</h#{level}>"
  end
end

require 'middleman-core/renderers/redcarpet'
# fix for https://github.com/tripit/slate/issues/111
#Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, RedcarpetHeaderFix
