module Multilang
  def block_code(code, full_lang_name)
    # Tweeked to allow a nil full_lang_name, which I believe is the default for code blocks.
    if full_lang_name.nil?
      full_lang_name = ""
    end
    parts = full_lang_name.split('--')
    rouge_lang_name = parts[0] || ""
    super(code, rouge_lang_name).sub("highlight #{rouge_lang_name}") do |match|
      match + " tab-" + full_lang_name
    end
  rescue
    raise
  end
end

require 'middleman-core/renderers/redcarpet'
Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, Multilang
