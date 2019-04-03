## Basic Concepts

The Asana API is a <a href="http://en.wikipedia.org/wiki/Representational_State_Transfer" target="_blank" rel="noopener noreferrer">REST</a>ful
interface, providing programmatic access to much of the data in the system. It provides predictable URLs for accessing
resources, and uses built-in HTTP features to receive commands and return responses. This makes it easy to communicate
with from a wide variety of environments, from command-line utilities to gadgets to the browser URL bar itself.

The API accepts <a href="http://json.org/" target="_blank" rel="noopener noreferrer">JSON</a> or form-encoded content in requests and returns
JSON content in all of its responses, including errors. Only the UTF-8 character encoding is supported for both
requests and responses.

**Notes on Pagination**

<a href="/developers/documentation/getting-started/pagination">Pagination</a> is an important concept when working
with queries for multiple objects. Requests with large result sets may timeout or be truncated; therefore,
pagination is strongly encouraged to ensure both you and your users have the best experience when using the Asana API.

Happy coding!
