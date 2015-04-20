require_relative 'md_generator'

module Quandl
  class RequestFormat < MdGenerator
    attr_accessor :http_method
    attr_accessor :path
    attr_accessor :response
    attr_accessor :format
    attr_accessor :query_parameters
    attr_accessor :response_body

    # data['requests'] is passed in
    def initialize(data)
      @data = data
      @orig_curl = @data['curl']
      @path = @data['request_path']
      @http_method = @data['request_method']
      @all_headers = @data['request_headers']
      @response_body = @data['response_body']
      allowed_headers = []
      allowed_headers << 'Accept'
      @request_headers = {}
      allowed_headers.each { |x| @request_headers[x] = @all_headers[x] }
      @response = parse_response if response_body
      super
    end

    def request_headers
      @request_headers
    end

    def api_token
      @data['X-Api-Token']
    end

    def request_url
      format_url("#{base_url}/#{path}")
    end

    def request_url_with_token
      uri = URI.parse(request_url)
      if api_token
        new_query_ar = URI.decode_www_form(uri.query) << ["api_token", api_token]
        uri.query = URI.encode_www_form(new_query_ar)
      end
      uri.to_s
    end

    def generate_curl
      doc = []
      doc << "curl \"#{request_url_with_token}\" -X #{http_method} "
      request_headers.each do |k, v|
        doc << "\\\n\t-H \"#{k}: #{v}\" "
      end
      doc.join
    end

    def parse_response
      raise NotImplementedError
    end

    def prefix_div_hack
      "<div class=\"tabs tab-#{format}\" style=\"display:none\"></div>\n"
    end

    def add_prefix_div_hack(doc)
      doc.map { |x| "#{prefix_div_hack}#{x}" }
    end
  end

  class JsonRequest < RequestFormat
    def initialize(data)
      @format = :json
      super(data)
      puts "WARNING: #{path} does not have a valid json formatted response!".yellow unless response_is_json?
    end

    def response_is_json?
      @response_is_json ||= response_body && response_body.json?
    end

    def parse_response
      response_is_json? ? JSON.parse(response_body) : response_body
    end

    def prettify_response
      response_is_json? ? JSON.pretty_generate(response) : response
    end

    def to_markdown
      doc = []
      doc << %(```shell\n#{@orig_curl}\n```)
      doc << '> The above command returns JSON structured like this:'
      doc << %(```json\n#{response ? prettify_response : ''}\n```)
      add_prefix_div_hack(doc).join("\n\n")
    end
  end

  class XmlRequest < RequestFormat
    def initialize(data)
      @format = :xml
      super(data)
    end

    def parse_response
      response_body
    end

    def to_markdown
      doc = []
      doc << %(```shell\n#{generate_curl}\n```)
      doc << '> The above command returns XML structured like this:'
      doc << %(```xml\n#{response ? response : ''}\n```)
      add_prefix_div_hack(doc).join("\n\n")
    end
  end

  class CsvRequest < RequestFormat
    def initialize(data)
      @format = :csv
      super(data)
    end

    def parse_response
      response_body
    end

    def to_markdown
      doc = []
      doc << %(```shell\n#{generate_curl}\n```)
      doc << '> The above command returns CSV structured like this:'
      doc << %(```plaintext\n#{response ? response : ''}\n```)
      add_prefix_div_hack(doc).join("\n\n")
    end
  end
end
