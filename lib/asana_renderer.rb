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

    has_common_params = false
    num_common_responses = 0

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

      if chevrons == 0
        if content.index("opt_pretty") == 4 || content.index("opt_fields") == 4 || content.index("opt_expand") == 4 || content.index("limit") == 4 || content.index("offset") == 4
          result_classes[i] += " hidden-row common-item"
          has_common_params = true
        elsif content.index("400") == 4 || content.index("401") == 4 || content.index("403") == 4 || content.index("404") == 4 || content.index("5XX") == 4 || content.index("default") == 4
          result_classes[i] += " hidden-row common-item"
          num_common_responses += 1
        end
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

    common_expander = ""
    if has_common_params
      common_expander = "<tr class='common-items-toggle'><td class='show-common-items' colspan=6>&darr; Show Common Parameters &darr;</td><td class='hide-common-items' colspan=6>&uarr; Hide Common Parameters &uarr;</td></tr>"
    elsif num_common_responses > 1
      common_expander = "<tr class='common-items-toggle'><td class='show-common-items' colspan=6>&darr; Show Common Responses &darr;</td><td class='hide-common-items' colspan=6>&uarr; Hide Common Responses &uarr;</td></tr>"
    end
    return "<table class='asana-table'><thead>"+header+"</thead><tbody>"+result_rows.join('')+common_expander+"</tbody></table>"
  end

  def table_cell(content, alignment)
    return "<td>#{content}</td>"
  end
end
