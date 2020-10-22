require 'middleman-core/renderers/redcarpet'
require 'digest'

class AsanaHighlight < Rouge::CSSTheme
  name 'asana'

  style Comment::Multiline,               :fg => '#9CA6AF', :italic => true
  style Comment::Preproc,                 :fg => '#9CA6AF', :bold => true
  style Comment::Single,                  :fg => '#9CA6AF', :italic => true
  style Comment::Special,                 :fg => '#9CA6AF', :italic => true, :bold => true
  style Comment,                          :fg => '#9CA6AF', :italic => true
  style Error,                            :fg => '#000000'
  style Generic::Deleted,                 :fg => '#000000', :bg => '#ffdddd'
  style Generic::Emph,                    :fg => '#000000', :italic => true
  style Generic::Error,                   :fg => '#6F7782'
  style Generic::Heading,                 :fg => '#b7bfc6'
  style Generic::Inserted,                :fg => '#000000', :bg => '#ddffdd'
  style Generic::Output,                  :fg => '#9ca6af'
  style Generic::Prompt,                  :fg => '#555555'
  style Generic::Strong,                  :bold => true
  style Generic::Subheading,              :fg => '#aaaaaa'
  style Generic::Traceback,               :fg => '#aa0000'
  style Keyword::Constant,                :fg => '#6F7782', :bold => true
  style Keyword::Declaration,             :fg => '#6F7782', :bold => true
  style Keyword::Namespace,               :fg => '#6F7782', :bold => true
  style Keyword::Pseudo,                  :fg => '#6F7782', :bold => true
  style Keyword::Reserved,                :fg => '#6F7782', :bold => true
  style Keyword::Type,                    :fg => '#6F7782', :bold => true
  style Keyword,                          :fg => '#6F7782', :bold => true
  style Literal::Number::Float,           :fg => '#00bf9c'
  style Literal::Number::Hex,             :fg => '#00bf9c'
  style Literal::Number::Integer::Long,   :fg => '#00bf9c'
  style Literal::Number::Integer,         :fg => '#00bf9c'
  style Literal::Number::Oct,             :fg => '#00bf9c'
  style Literal::Number,                  :fg => '#00bf9c'
  style Literal::String::Backtick,        :fg => '#FF5263'
  style Literal::String::Char,            :fg => '#FF5263'
  style Literal::String::Doc,             :fg => '#FF5263'
  style Literal::String::Double,          :fg => '#FF5263'
  style Literal::String::Escape,          :fg => '#FF5263'
  style Literal::String::Heredoc,         :fg => '#FF5263'
  style Literal::String::Interpol,        :fg => '#FF5263'
  style Literal::String::Other,           :fg => '#FF5263'
  style Literal::String::Regex,           :fg => '#FF5263'
  style Literal::String::Single,          :fg => '#FF5263'
  style Literal::String::Symbol,          :fg => '#FF5263'
  style Literal::String,                  :fg => '#FF5263'
  style Name::Attribute,                  :fg => '#008ce3'
  style Name::Builtin::Pseudo,            :fg => '#b7bfc6'
  style Name::Builtin,                    :fg => '#0086B3'
  style Name::Class,                      :fg => '#445588', :bold => true
  style Name::Constant,                   :fg => '#008ce3'
  style Name::Decorator,                  :fg => '#3c5d5d', :bold => true
  style Name::Entity,                     :fg => '#800080'
  style Name::Exception,                  :fg => '#ff5263', :bold => true
  style Name::Function,                   :fg => '#ff5263', :bold => true
  style Name::Label,                      :fg => '#ff5263', :bold => true
  style Name::Namespace,                  :fg => '#555555'
  style Name::Tag,                        :fg => '#000080'
  style Name::Variable::Class,            :fg => '#008ce3'
  style Name::Variable::Global,           :fg => '#008ce3'
  style Name::Variable::Instance,         :fg => '#008ce3'
  style Name::Variable,                   :fg => '#008ce3'
  style Operator::Word,                   :fg => '#000000', :bold => true
  style Operator,                         :fg => '#000000', :bold => true
  style Text::Whitespace,                 :fg => '#d5dce0'
  style Text,                             :bg => '#f6f8f9'
end

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
