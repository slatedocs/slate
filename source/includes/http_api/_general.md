Using the API
=============

<aside class="warning">
This documentation is a <strong>draft</strong>!
</aside>

<aside class="success">
<strong>This is the new, recommended version of giosg API, preferred over the <a href="https://docs.giosg.com/doku.php?id=public:technical-documentation:backend-api">old deprecated API</a>!</strong>
</aside>

## Authentication

You need to provide a valid API key in order access the API. You can create an API key from ["API keys" section in your company settings](https://service.giosg.com/en/settings/#/live/company/tokens):

*Log in to Console → Settings Menu → Company → API keys*

Once you have obtained your API key, define the Authorization HTTP header for all your API requests:

`Authorization: Token 12d5da2085267caa5e41594a47b47e08fcef2530`

<aside class="notice">
The string in the end of the header should be replaced with your API key.
</aside>

Alternatively, if you are unable to customize headers, you may add the token as a GET parameter: `token=12d5da2085267caa5e41594a47b47e08fcef2530`. However, we strongly recommend using HTTP headers.
