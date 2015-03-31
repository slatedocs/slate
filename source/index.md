---
title: API Reference

language_tabs:
  - ruby

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

```ruby
	
sign_in_api = VestorlyApi::SignIn.new('my@user.com', 'password')

begin
  authentication_token = sign_in_api.sign_in # vestorly-auth
rescue VestorlyApi::Exceptions::InvalidSignInCredentials
  # Do rescue stuff...
end

```


# Create a new Advisor 


# Using the advisor API object

> Once logged in with a valid sign_in object, it can be passed to the `VestorlyApi::Advisor` to request on the advisor API part:

> Obtain the list of prospective clients for the logged in advisor

```ruby
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


# Signout of Vestorly API


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
