require_relative 'md_generator'

module Quandl
  class Resource < MdGenerator
    attr_accessor :name

    def initialize(data)
      @name = data['resource']
      super
    end

    def to_markdown
      doc = []
      doc << "# #{name}"
      doc << children.values.map(&:to_markdown)
      doc.join("\n\n")
    end
  end
end
