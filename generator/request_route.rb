require_relative 'md_generator'

module Quandl
  class RequestRoute < MdGenerator
    attr_accessor :http_method
    attr_accessor :route

    def initialize(data)
      @http_method = data['http_method']
      @route = data['route']
      super
    end

    def formatted_url
      format_url("#{base_url}/#{route}")
    end

    def to_markdown
      doc = []
      doc << '### HTTP Request'
      doc << "`#{http_method} #{formatted_url}`"
      doc << "\n"
      doc.join("\n")
    end
  end
end
