require_relative 'md_generator'

module Quandl
  class Header < MdGenerator
    attr_accessor :formats
    def to_markdown
      docs = []
      docs << "---\n"
      docs << 'language_tabs:'
      docs << '- json'
      docs << '- xml'
      docs << '- csv'
      docs << "---\n"
      docs.join("\n")
    end
  end
end