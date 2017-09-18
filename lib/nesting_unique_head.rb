# Unique header generation
require 'middleman-core/renderers/redcarpet'

$head_count = {}

class NestingUniqueHeadCounter < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
  end

  def header(text, header_level)
    friendly_text = text.parameterize
    $head_count[friendly_text] = header_level

    last_saw_level = header_level

    if header_level > 1
      $head_count.reverse_each { |text, current_level|
        if last_saw_level >= 1
          friendly_text.prepend("#{text}-") if current_level < header_level && current_level < last_saw_level
          last_saw_level = current_level if current_level < last_saw_level
        end
      }
    end

    return "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
  end
end