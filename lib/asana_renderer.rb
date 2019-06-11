require 'middleman-core/renderers/redcarpet'
require 'digest'
class AsanaRenderer < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
    @head_count = {}
  end
  def header(text, header_level)
    friendly_text = text.gsub(/<[^>]*>/,"").parameterize
    if friendly_text.strip.length == 0
      # Looks like parameterize removed the whole thing! It removes many unicode
      # characters like Chinese and Russian. To get a unique URL, let's just
      # URI escape the whole header
      friendly_text = Digest::SHA1.hexdigest(text)[0,10]
    end
    @head_count[friendly_text] ||= 0
    @head_count[friendly_text] += 1
    if @head_count[friendly_text] > 1
      friendly_text += "-#{@head_count[friendly_text]}"
    end
    return "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
  end

  def table(header, body)
    rows = body.split('<tr>')
    rows.shift
    i = 0
    previous_depth = 0

    result_classes = Array.new(rows.length)
    result_rows  = Array.new(rows.length)

    while i < rows.length do
      content = rows[i][0..rows[i].length].strip

      chevrons = 0
      while content[4 + chevrons] == '»' do
        content[4 + chevrons] = ' '
        chevrons += 1
      end
      classes = "c" + chevrons.to_s
      classes += " hidden-row".to_s if chevrons > 0

      result_classes[i] = classes
      result_rows[i] = "<tr class=''><td><div class='chevron'>&rarr;</div></td>" + content + "</tr>"

      if previous_depth < chevrons && i > 0
        result_classes[i-1] += " has-children"
      end

      previous_depth = chevrons
      i += 1
    end

    i = 0
    while i < result_rows.length do
      result_rows[i].insert(11, result_classes[i])
      i += 1
    end

    header.insert(4, "<td></td>")

    return "<table class='asana-table'><thead>"+header+"</thead><tbody>"+result_rows.join('')+"</tbody></table>"
  end

  def table_cell(content, alignment)
    return "<td>#{content}</td>"
  end
end
