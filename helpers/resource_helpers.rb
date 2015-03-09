require 'json'

module ResourceHelpers
  def json(key, text = 'The above command returns JSON structured like this:')
    hash = get_resource(key)
    hash = yield hash if block_given?

    write_json(hash, text)
  end

  def write_json(resource, text)
    "> #{text}\n\n" << "~~~ json\n#{JSON.pretty_generate(resource)}\n~~~"
  end

  def get_resource(key)
    hash = case key
      when Hash
        h = {}
        key.each { |k, v| h[k.to_s] = v }
        h
      when Array
        key
      else ResourceHelpers.const_get(key.to_s.upcase)
    end
  end

  CLIENT_CREDENTIALS_TOKEN ||= {
    "access_token" => "pYXQiOjE0MjI1MzY0NjEsInNjb3BlIjo",
    "token_type" => "bearer",
    "expires_in" => 86400,
    "scope" => ""
  }

  VALIDATION_ERROR ||= {
    "code" => "validation_failed",
    "message" => nil,
    "errors" => {
      "address.postal_code" => [
        "Zip Code is invalid"
      ]
    }
  }

  USER_AGENT_ERROR ||= {
    "code" => "user_agent_required",
    "message" => "All requests must include a valid User-Agent header"
  }

  ROOT ||= {
    "_links" => {
      "self" => {
        "href" => "https://api.viagogo.net/v2/",
        "title" => nil,
        "templated" => false
      },
      "viagogo:user" => {
        "href" => "https://api.viagogo.net/v2/user",
        "title" => "Account Settings",
        "templated" => false
      },
      "viagogo:search" => {
        "href" => "https://api.viagogo.net/v2/search",
        "title" => "Search",
        "templated" => false
      },
      "viagogo:genres" => {
        "href" => "https://api.viagogo.net/v2/categories/0/children",
        "title" => "Browse",
        "templated" => false
      },
      "viagogo:countries" => {
        "href" => "https://api.viagogo.net/v2/countries",
        "title" => "Country",
        "templated" => false
      },
      "viagogo:currencies" => {
        "href" => "https://api.viagogo.net/v2/currencies",
        "title" => "Currency",
        "templated" => false
      },
      "viagogo:languages" => {
        "href" => "https://api.viagogo.net/v2/languages",
        "title" => "Language",
        "templated" => false
      },
      "viagogo:venues" => {
        "href" => "https://api.viagogo.net/v2/venues",
        "title" => "Venue",
        "templated" => false
      },
      "viagogo:metroareas" => {
        "href" => "https://api.viagogo.net/v2/metroareas",
        "title" => "Metro Area",
        "templated" => false
      }
    }
  }
end