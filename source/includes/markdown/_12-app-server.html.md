<hr class="platform-ui-alpha">
<section class="platform-ui-alpha">

# App Server

> Sample Server Code (don't use in production)

```shell
An app server cannot be handled via curl.
```

```javascript--nodejs
// https://expressjs.com/en/starter/hello-world.html
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
```

```python
# https://flask.palletsprojects.com/en/1.1.x/quickstart/
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

```ruby
# https://www.rubyguides.com/2016/08/build-your-own-web-server/
require 'socket'
server  = TCPServer.new('localhost', 80)
loop {
  client  = server.accept
  request = client.readpartial(2048)
  puts request
}
```

```java
// https://www.codejava.net/java-se/networking/java-socket-server-examples-tcp-ip
ServerSocket serverSocket = new ServerSocket(6868);
Socket socket = serverSocket.accept();

OutputStream output = socket.getOutputStream();
PrintWriter writer = new PrintWriter(output, true);
writer.println("Hello World");

socket.close();
```

```php
// https://www.php.net/manual/en/tutorial.firstpage.php
<?php
echo 'Hello World';
?>
```

An App Server is required for working with [Webhooks](/docs/webhooks)
and [UI Components](/docs/ui-components). When we say "App Server", we
are referring to the server Asana directly sends requests to. This is different
from the service it may be connecting to in the end (like Slack or Jira).

For some features, Asana needs to send requests to an App. In order for an App to
use these features, they will need to implement an App Server. App Servers are simply servers 
that an app controls. The server needs to be accessible via http requests, return successful 
response codes, and sometimes return valid json bodies to requests from Asana. Some requests 
will be sent from an Asana user's browser, while other requests will be sent from Asana's 
servers. 

App Servers define their own paths. Apps will need to declare the endpoints for Asana. For Webhooks, 
this happens when you create a new webhook. For UI Components, some are declared on App Creation while others are 
dynamically declared in responses to requests from Asana.

You should test/debug your App Server with a tool like [Postman](https://www.postman.com/) or 
[Insomnia](https://insomnia.rest/).

In short:

 * App Servers need to accept `http` requests and be accessible via `url`.
 * Request payloads will be `json` and App Servers should respond with `json` (if a response 
 is needed).
 * Successful requests should respond with either a `200` or `204` status code. Some UI Components 
 have additional error handling for codes like `400`.
 * If an app server is down or throws a `500`, we will likely retry the request.

## Error Handling and Retry
If we attempt to send a request to an App Server and we receive an error status code, or the 
request times out, we will retry delivery with exponential backoff. 

The tolerance threshold for retries vary between Webhooks and UI Components. Refer to the 
documentation for each for a deeper understanding.

</section>
