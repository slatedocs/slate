## Authentication

```http
POST /api/public/login/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
Content-Length: 67

{
    "email": "fake.user@example.com",
    "password": "password"
}
```

```http
HTTP/1.1 204 No Content
Set-Cookie: token=dac20c82c79a514d572b4f5d7e11cb53; Domain=.crunch.io; Max-Age=31536000; Path=/
Vary: Cookie, Accept-Encoding

```

```r
library(crunch)
login("fake.user@example.com", "password")
# See ?login for options, including how to store your credentials 
# in your .Rprofile
```

```python
import pycrunch
```

```shell
curl -c cookie-jar 
    -X POST 
    -d '{"email": "fake.user@example.com", "password": "password"}' 
    -H "Content-type: application/json"
    https://beta.crunch.io/api/public/login/

# The above command will perform a login and save the login cookie to a file called 'cookie-jar'.
# After this, you can access the endpoint via `curl' commands (POST, GET, PATCH), as long as the '-b cookie-jar' flag is present.  Note, -b not -c.  -c saves cookies, -b submits cookies from the existing file. It is good practice to delete this file when you are done.
```

> Replace "fake.user@example.com" and "password" with your email and password, respectively.

Nearly all interactions with the Crunch API need to be authenticated. The standard password authentication method involves POSTing credentials and receiving a cookie back, which should be included in subsequent requests.

The client should then store the Cookie and pass it along with each subsequent request.

Failure will return 401 Unauthorized.

<aside class="notice">
Replace "fake.user@example.com" and "password" with your email and password, respectively.
</aside>

Crunch also supports OAuth 2.0/OpenID Connect. See [the public endpoint reference](#public) for more on how to authenticate with OAuth. 

If you'd like to add your auth provider to the set of supported providers, contact [support@crunch.io](mailto:support@crunch.io)
