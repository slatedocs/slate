require 'middleman-core/renderers/redcarpet'
require 'digest'
class AsanaRenderer < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
    @head_count = {}
  end

  def header(text, header_level)
    friendly_text = text.gsub(/<[^>]*>/,"").parameterize
    extra_friendly_text = friendly_text.gsub(/[0-9]*/,"")
    extra_friendly_text = extra_friendly_text.gsub(/--/,"")
    extra_friendly_text = extra_friendly_text.gsub(/-s-/,"s-")
    extra_friendly_text = extra_friendly_text.gsub(/-amp-/,"")
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

    classes = ''
    on_click = ''
    if friendly_text.match(/^enumerated-values/)
      classes = 'class="enumerated-values has-children"'
      on_click = 'onclick="$(this).next().toggleClass(\'show-row\'); $(this).toggleClass(\'expanded\');"'
      text = text + "<svg class='chevron' viewBox='0 0 40 40'><path d='M23.2,16c0,0.3-0.1,0.7-0.3,0.9l-9,11c-0.5,0.6-1.5,0.7-2.1,0.2s-0.7-1.5-0.2-2.1l8.2-10L11.6,6c-0.5-0.6-0.4-1.6,0.2-2.1s1.6-0.4,2.1,0.2l9,11C23.1,15.3,23.2,15.7,23.2,16z'></path></svg>"
    end

    extra_friendly_id = ""
    result = ""
    if header_level < 4
      extra_friendly_id = "id='#{extra_friendly_text}' "
      if extra_friendly_text != friendly_text
        result = "<a id='#{friendly_text}'></a>"
      end
    end
    result + "<h#{header_level} " + extra_friendly_id + "#{classes} #{on_click}>#{text}</h#{header_level}>"
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

      result_rows[i] = "<tr class=''><td><svg class='chevron' viewBox='0 0 40 40'><path d='M23.2,16c0,0.3-0.1,0.7-0.3,0.9l-9,11c-0.5,0.6-1.5,0.7-2.1,0.2s-0.7-1.5-0.2-2.1l8.2-10L11.6,6c-0.5-0.6-0.4-1.6,0.2-2.1s1.6-0.4,2.1,0.2l9,11C23.1,15.3,23.2,15.7,23.2,16z'></path></svg></td>" + content + "</tr>"

      if previous_depth < chevrons && i > 0
        result_classes[i-1] += " has-children"
      end

      if chevrons == 0
        if content.index("?opt_pretty") == 4 || content.index("?opt_fields") == 4 || content.index("?opt_expand") == 4 || content.index("?limit") == 4 || content.index("?offset") == 4
          result_classes[i] += " hidden-row common-item"
          has_common_params = true
        elsif content.index("400") == 4 || content.index("401") == 4 || content.index("402") == 4 || content.index("403") == 4 || content.index("404") == 4 || content.index("424") == 4 || content.index("500") == 4 || content.index("501") == 4 || content.index("503") == 4 || content.index("504") == 4 || content.index("default<") == 4
          result_classes[i] += " hidden-row common-item"
          num_common_responses += 1
        end
      end

      previous_depth = chevrons
      i += 1
    end

    path_rows = Array.new
    param_rows = Array.new
    body_rows = Array.new
    common_rows = Array.new

    # Add classes and sort
    i = 0
    while i < result_rows.length do
      result_rows[i].insert(11, result_classes[i])
      content = result_rows[i].split('<td>')[2]

      if content.index("/") == 0
        path_rows[path_rows.length] = result_rows[i]
      elsif content.index("?") == 0
        if content.index("?opt_pretty") == 0 || content.index("?opt_fields") == 0 || content.index("?opt_expand") == 0 || content.index("?limit") == 0 || content.index("?offset") == 0
          common_rows[common_rows.length] = result_rows[i]
        else
          param_rows[param_rows.length] = result_rows[i]
        end
      else
        body_rows[body_rows.length] = result_rows[i]
      end
      i += 1
    end

    result_rows = path_rows.concat(param_rows).concat(body_rows).concat(common_rows)

    header.insert(4, "<td></td>")

    common_expander = ""
    if has_common_params
      common_expander = "<tr class='common-items-toggle'><td class='show-common-items' colspan=6>&darr; Show Common Parameters &darr;</td><td class='hide-common-items' colspan=6>&uarr; Hide Common Parameters &uarr;</td></tr>"
    elsif num_common_responses > 1
      common_expander = "<tr class='common-items-toggle'><td class='show-common-items' colspan=6>&darr; Show Common Responses &darr;</td><td class='hide-common-items' colspan=6>&uarr; Hide Common Responses &uarr;</td></tr>"
    end
    return "<div class='table-holder'><table class='asana-table'><thead>"+header+"</thead><tbody>"+result_rows.join('')+common_expander+"</tbody></table></div>"
  end

  def table_cell(content, alignment)
    return "<td>#{content}</td>"
  end
end
