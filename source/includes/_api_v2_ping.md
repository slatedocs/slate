##Ping/Healthcheck

### Check Status

Simple endpoint to provide a health check endpoint to make sure we are alive and kickin'.

```shell
curl -X "GET" "http://api.webconnex.com/v2/public/ping" \
	-H "apiKey: a4149b01006842c8951720d64e1ec096"
```

```go

package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func sendRequest() {
	// Request (GET http://api.webconnex.com/v2/public/ping)

	// Create client
	client := &http.Client{}

	// Create request
	req, err := http.NewRequest("GET", "http://api.webconnex.com/v2/public/ping", nil)

	// Headers
	req.Header.Add("apiKey", "a4149b01006842c8951720d64e1ec096")

	// Fetch Request
	resp, err := client.Do(req)

	if err != nil {
		fmt.Println("Failure : ", err)
	}

	// Read Response Body
	respBody, _ := ioutil.ReadAll(resp.Body)

	// Display Results
	fmt.Println("response Status : ", resp.Status)
	fmt.Println("response Headers : ", resp.Header)
	fmt.Println("response Body : ", string(respBody))
}

```

```javascript
// request Request
(function(callback) {
    'use strict';

    const httpTransport = require('http');
    const responseEncoding = 'utf8';
    const httpOptions = {
        hostname: 'api.webconnex.com',
        port: '80',
        path: '/v2/public/ping',
        method: 'GET',
        headers: {"apiKey":"a4149b01006842c8951720d64e1ec096"}
    };
    httpOptions.headers['User-Agent'] = 'node ' + process.version;

    // Paw Store Cookies option is not supported

    const request = httpTransport.request(httpOptions, (res) => {
        let responseBufs = [];
        let responseStr = '';

        res.on('data', (chunk) => {
            if (Buffer.isBuffer(chunk)) {
                responseBufs.push(chunk);
            }
            else {
                responseStr = responseStr + chunk;            
            }
        }).on('end', () => {
            responseStr = responseBufs.length > 0 ?
                Buffer.concat(responseBufs).toString(responseEncoding) : responseStr;

            callback(null, res.statusCode, res.headers, responseStr);
        });

    })
    .setTimeout(0)
    .on('error', (error) => {
        callback(error);
    });
    request.write("")
    request.end();


})((error, statusCode, headers, body) => {
    console.log('ERROR:', error);
    console.log('STATUS:', statusCode);
    console.log('HEADERS:', JSON.stringify(headers));
    console.log('BODY:', body);
});

```

```swift
class MyRequestController {
    func sendRequest() {
        /* Configure session, choose between:
           * defaultSessionConfiguration
           * ephemeralSessionConfiguration
           * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()

        /* Create session, and optionally set a NSURLSessionDelegate. */
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        /* Create the Request:
           Request (GET http://api.webconnex.com/v2/public/ping)
         */

        guard var URL = NSURL(string: "http://api.webconnex.com/v2/public/ping") else {return}
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = "GET"

        // Headers

        request.addValue("a4149b01006842c8951720d64e1ec096", forHTTPHeaderField: "apiKey")

        /* Start a new Task */
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}

```

```python
# Install the Python Requests library:
# `pip install requests`

import requests


def send_request():
    # Request
    # GET http://api.webconnex.com/v2/public/ping

    try:
        response = requests.get(
            url="http://api.webconnex.com/v2/public/ping",
            headers={
                "apiKey": "a4149b01006842c8951720d64e1ec096",
            },
        )
        print('Response HTTP Status Code: {status_code}'.format(
            status_code=response.status_code))
        print('Response HTTP Response Body: {content}'.format(
            content=response.content))
    except requests.exceptions.RequestException:
        print('HTTP Request failed')



```

Attribute			|	Description
--------------|----------------------------------------------------------------------
**responseCode**<br>*Integer* 				| Response code of the request
**data**<br>*string*					| Random string to use as data payload


#### HTTP Request
`GET /v2/public/ping`

```json
{
  "responseCode": 200,
  "data": "Some nights I always win, I always win..."
}
```
