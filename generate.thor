require 'active_support/inflector'
require 'active_support/core_ext/hash'
require 'gecko'
require 'pry'
class Generate < Thor
  include Thor::Actions

  desc "model MODEL_NAME", "generates a new model"
  def model(model_name)
    @model_name = model_name
    @file_name  = model_name.underscore
    @plural     = ask "What is the api endpoint for #{@model_name}? (#{@file_name}s):"
    @plural     = @plural.to_s.length > 0 ? @plural : @file_name + "s"
    template = model_template.to_s.gsub(/"(\w*)\b\":/, '\1:')
    create_file "locales/#{@file_name}.en.yml", template
    insert_into_file("source/index.md", "  - #{@file_name}\n", before: "\nsearch: true")
  end

private

  def default_plural?
    @plural == @file_name + "s"
  end

  def model_template
%{---
en:
  #{@model_name.underscore}:
    resource_article: "a"
    resource_klass: "#{@model_name.classify}"
    resource_name: "#{@model_name.underscore}"
    resource_plural: "#{@plural}"
    json: #{JSON.pretty_generate(json)}

    gecko:
      create: {
      }
      update: {
      }

    attributes: #{JSON.pretty_generate(attributes)}
}
  end

  def access_token
    @access_token ||= OAuth2::AccessToken.new(oauth_client, ENV["OAUTH_TOKEN"])
  end

  def oauth_client
    @client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: site_path)
  end

  def site_path
    ENV["TRADEGECKO_API_URL"] || "https://api.tradegecko.com"
  end

  def json
    @json ||= JSON.parse(access_token.request(:get, @plural).body).first.last.map(&:symbolize_keys).first(3)
  rescue
  end

  def attributes
    keys = json.first.keys - [:id, :created_at, :updated_at]
    hash = {}
    keys.each do |key|
      hash[key] = {
        name: key,
        type: "String",
        description: "",
        filterable: "",
        updatable: true,
        creatable: true,
        required: false,
        readonly: false,
        beta: false,
        deprecated: false,
        private: false
      }
    end
    default_attributes.merge(hash)
  end

  def default_attributes
    {
      id: {
        name: "id",
        type: "Integer",
        description: "A unique identifier for the resource.",
        readonly: true,
      },
      created_at: {
        name: "created_at",
        type: "String",
        description: "",
        readonly: true
      },
      updated_at: {
        name: "updated_at",
        type: "String",
        description: "",
        readonly: true
      }
    }
  end
end

