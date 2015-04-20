require_relative 'md_generator'

module Quandl
  class SubResource < MdGenerator
    attr_accessor :description
    attr_accessor :explanation

    def initialize(data)
      @description = data['description']
      @explanation = data['explanation']
      super
    end

    def to_markdown
      doc = []
      doc << "## #{description}"
      doc << explanation
      doc << @children.values.map(&:to_markdown)
      doc.join("\n\n")
    end
  end
end
