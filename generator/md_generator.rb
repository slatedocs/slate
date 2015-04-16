require 'json'
require 'uri'
require 'colorize'

module Quandl
  class MdGenerator
    attr_accessor :children
    attr_reader :base_url
    def initialize(data = nil)
      @children = {}
      @base_url = 'https://www.quandl.com'
      @data = data
    end

    def to_markdown
      @data
    end

    def format_url(url_string)
      url = URI.parse(url_string)
      url.path.gsub! %r{/+}, '/'
      url.to_s
    end
  end
end

class String
  def json?
    begin
      !!JSON.parse(self)
    rescue
      false
    end
  end
end
