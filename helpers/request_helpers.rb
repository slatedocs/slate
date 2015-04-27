#!/usr/bin/env ruby
# encoding: utf-8

module RequestHelpers
  def curl(method, url)
    code = %(curl -X #{method} "#{url}"\n) <<
           %(  -H "User-Agent: MyAwesomeApp"\n) <<
           %(  -H "Authorization: Bearer #{ResourceHelpers::CLIENT_CREDENTIALS_TOKEN["access_token"]}")
    write_language(code, "shell")
  end

  def write_language(code, language)
    markdown = "~~~ #{language}\n#{code}\n~~~"
  end
end
