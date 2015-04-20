require_relative 'md_generator'

module Quandl
  class RequestParams < MdGenerator
    attr_accessor :params
    def initialize(data)
      @params = data['parameters']
    end

    def to_markdown
      doc = []
      doc << '### Query Parameters'
      doc << 'Parameter | Required | Description'
      doc << '--------- | ------- | -----------'
      params.each do |param|
        doc << "#{param['name']} | #{required?(param)} | #{param['description']}"
      end
      doc << "\n"
      doc.join("\n")
    end

    def required?(param)
      !param['required'].nil? && param['required']
    end
  end
end
