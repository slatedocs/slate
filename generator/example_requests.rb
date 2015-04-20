require_relative 'md_generator'

module Quandl
  class ExampleRequests < MdGenerator
    def initialize(data, format)
      @requests = (data['requests'] || []).map { |r| create_request_resource(r, format) }
    end

    def create_request_resource(request, format)
      case format
      when :json
        JsonRequest.new(request)
      when :xml
        XmlRequest.new(request)
      when :csv
        CsvRequest.new(request)
      else
        raise NotImplementedError
      end
    end

    def to_markdown
      doc = []
      doc << @requests.map(&:to_markdown)
      doc.join("\n\n")
    end
  end
end
