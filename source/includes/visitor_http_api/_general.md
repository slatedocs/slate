Using the visitor API
=====================

<aside class="warning">
This documentation is a <strong>draft</strong>!
</aside>

<aside class="success">
<strong>This is the new, recommended version of giosg API, preferred over the <a href="https://docs.giosg.com/doku.php?id=public:technical-documentation:backend-api">old deprecated API</a>!</strong>
</aside>

## Authentication

You need to provide a valid JWT token on your Authorization HTTP header for all your API requests.

`Authorization: JWT 1bdf7b99ea0a495f960e70f378b8b975ab15f1b2cf954387a3b9825c81939d89`

<aside class="notice">
The string in the end of the header should be replaced with your API key.
</aside>

## Accept Header

You also need to define that you accept JSON-formatted responses by providing the Accept HTTP header:

`Accept: application/json`

Alternatively, if you are unable to customize headers, you may add `format=json` GET parameter.
