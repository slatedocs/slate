---
title: API Reference

language_tabs:
  - ruby
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://developers.vestorly.com'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

The Vestorly API is organized around REST. Our API is designed to have predictable, resource-oriented URLs and to use HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which can be understood by off-the-shelf HTTP clients, and we support cross-origin resource sharing to allow you to interact securely with our API from a client-side web application (though you should remember that you should never expose your secret API key in any public website's client-side code). JSON will be returned in all responses from the API, including errors (though if you're using API bindings, we will convert the response to the appropriate language-specific object).

# SignIn to Vestorly API

After Vestorly has provided a username and password, you can login to the API using hte following commands

```ruby
	
sign_in_api = VestorlyApi::SignIn.new('my@user.com', 'password')

begin
  authentication_token = sign_in_api.sign_in # vestorly-auth
rescue VestorlyApi::Exceptions::InvalidSignInCredentials
  # Do rescue stuff...
end

```

```shell
curl -X POST https://www.vestorly.com/api/v2/sessions
  -d "username=USERNAME"
  -d "password=PASSWORD"
```

# Create a new Advisor 

```shell
curl -X POST "/api/v1/advisors.json"
  -H "Accept: application/json"
  -d "vestorly-auth=<TOKEN>"
  -d "username=<USERNAME>" 
  -d "password=<PASSWORD>"
  -d "company=<PASSWORD>"
  -d "name=<USERNAME>" 
  -d "website=<PASSWORD>"
  -d "phone=<PASSWORD>"
  -d "active=<PASSWORD>"
  -d "launch_date=<PASSWORD>"
```
>The example response:

```json
{"current_user":{"_id":"551ad2edc98f134364000044","company":"Goldman Saches",

...

"vestorly-auth":"XXXXXXXXXXXXXXXXXXXXX","new_user":false}
```


# Using the advisor API object

Once logged in with a valid sign_in object, it can be passed to the `VestorlyApi::Advisor` to request on the advisor API part:





```ruby

# Obtain the list of prospective clients for the logged in advisor

sign_in_api = VestorlyApi::SignIn.new('my@user.com', 'password')
sign_in_api.sign_in

advisor_api = VestorlyApi::Advisor.new(sign_in_api)
advisor_user_entries = advisor_api.advisor_user_entries

# with query params
query_params_hash = { 'filter_by' => 'prospects' }
advisor_user_entries = advisor_api.advisor_user_entries( query_params_hash )

```

> Return a list of active advisor accounts:


```ruby
sign_in_api = VestorlyApi::SignIn.new('my@user.com', 'password')
sign_in_api.sign_in

advisor_api = VestorlyApi::Advisor.new(sign_in_api)
advisor_posts = advisor_api.advisor_posts

# with query params
query_params_hash = { 'filter_by' => 'prospects' }
advisor_posts = advisor_api.advisor_posts(query_params_hash)
```

```shell
curl -X GET "/api/v1/advisors.json"
  -H "Accept: application/json"
  -d "vestorly-auth=<TOKEN>"
```



# Signout of Vestorly API

```shell
curl -H "x-vestorly-auth:$auth_token"  \
-X DELETE https://www.vestorly.com/api/v2/sessions/m
```

>The example response:

```json
{"message":"Successfully logged out."}
```


```ruby

# Creating an object and calling sign_out method
response = VestorlyApi::SignOut.new(authentication_token).sign_out

# Calling sig_out method on the class
response = VestorlyApi::SignOut.sign_out(authentication_token)

# response is a hash containing code and message keys
p response # { code: 202, message: "Successfully logged out." }

# with invalid authentication token
p response # { code: 404, message: "Not signed in. }
```


# Create sharelinks to Vestorly Pages for Social Media


# Show how to use Vestorly Embed

# Vestorly RSS feed URLs

# Show recommended and trending content

# Show content library content

# Publish content / create your own post

# Signin for your readers

# Export a email and email template

# Show recomended posts 

# Schedule Newsletter

# Schedule Social Post

# Change Copy On Email

# Search Articles

To search articles, you can execute the following GET command, changing your text query:

```bash
curl -H "x-vestorly-auth:$auth_token"  \
	-X GET 'https://staging.vestorly.com/api/v2/articles?text_query=<QUERY>&limit=30'
```

Example response:

```json
{"articles":[{"_id":"551e3d90fce52d38260003c2","body":"The agreement reached on Thursday between Iran and a number of world powers on Iran's nuclear program\u00a0has the potential to be a game-changer. President Obama himself has said it is a \"good deal\" that meets the international community's\u00a0\"core objectives.\" If the agreement pans out, however, no one will feel it more than ordinary Iranians. That's [&#8230;]","created_at":"2015-04-03T07:13:20Z","external_url":"http://feeds.washingtonpost.com/c/34656/f/636535/s/451020df/sc/7/l/0L0Swashingtonpost0N0Cblogs0Cworldviews0Cwp0C20A150C0A40C0A20Cvideos0Eshow0Eiranians0Epartying0Ein0Ethe0Estreets0Eafter0Eiran0Edeal0C/story01.htm","external_url_source":"http://feeds.washingtonpost.com/rss/rss_blogpost","external_url_type":"basic","image_path":"post_images/551e3d96fce52d38260003c6/orginal.png","image_url":"//d2dnvwecfdx5as.cloudfront.net/post_images/551e3d96fce52d38260003c6/large.jpg","image_height":541.0,"image_width":539.0,"logo_url":"//d6k9y5isbbnuf.cloudfront.net/logos/the_washington_post_logo.png","square_logo_url":"//d6k9y5isbbnuf.cloudfront.net/small+logos/thewashingtonopst_logo.png","summary":"The agreement reached on Thursday between Iran and a number of world powers on Iran's nuclear program\u00a0has the potential to be a game-changer. President Obama himself has said it is a \"good deal\" that meets the international community's\u00a0\"core objectives.\" If the agreement pans out, however, no one will feel it more than ordinary Iranians. That's [&#8230;]","title":"Videos show Iranians partying in the streets after Iran agreement","is_responsive":true,"is_proxy_needed":false,"is_mobile_proxy_needed":false,"needs_sanitize":true,"proxy_url":"http://prxme-staging.herokuapp.com","topic":"World","suitability_score":0.0}]}-
```


