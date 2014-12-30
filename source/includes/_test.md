# Template

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](http://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace `meowmeowmeow` with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Isis",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/3"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Isis",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">If you're not using an administrator API key, note that some kittens will return 403 Forbidden if they are hidden for admins only.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the cat to retrieve


# Errors

<aside class="notice">This error section is stored in a separate file in `includes/_errors.md`. Slate allows you to optionally separate out your docs into many files...just save them to the `includes` folder and add them to the top of your `index.md`'s frontmatter. Files are included in the order listed.</aside>

The Kittn API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The kitten requested is hidden for administrators only
404 | Not Found -- The specified kitten could not be found
405 | Method Not Allowed -- You tried to access a kitten with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
410 | Gone -- The kitten requested has been removed from our servers
418 | I'm a teapot
429 | Too Many Requests -- You're requesting too many kittens! Slown down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.

# Appendix A: Result Keys and Codes

## Result Key Names

### Payment Transaction

	<table>
		<tr>
			<th>Name</th>
			<td>Transaction ID</td>
		</tr>
		<tr>
			<th>Key</th>
			<td>tid</td>
		</tr>
		<tr>
			<th>Example</th>
			<td>4223</td>
		</tr>
		<tr>
			<th>Description</th>
			<td>The transaction to which this response pertains. If a tid was supplied on the request, then this will be that value. Otherwise, it will be an IdentityMind generated identifier.</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>Transaction Status</td>
		</tr>
		<tr>
			<th>Key</th>
			<td>transaction_status</td>
		</tr>
		<tr>
			<th>Example</th>
			<td>complete</td>
		</tr>
		<tr>
			<th>Description</th>
			<td>The current state of processing the transaction:
				<ul type="disc">
					<li>complete</li>
					<li>error</li>
				</ul></td>
		</tr>
	</table>
	

	<table>
		</tr>
		<tr>
			<td>Result</td>
			<td>res</td>
			<td>accept</td>
			<td>The result of the transaction by IdentityMind:
				<ul type="disc">
					<li>ERROR</li>
					<li>ACCEPT</li>
					<li>DENY</li>
					<li>MANUAL_REVIEW</li>
				</ul></td>
		</tr>
		<tr>
			<td>Result Codes</td>
			<td>rcd</td>
			<td>1000,100,110,120,150,523</td>
			<td>A comma-separated list of result codes representing a more detailed explanation of the result. The actual result codes are defined in the next subsection.</td>
		</tr>
		<tr>
			<td>Error Message</td>
			<td>error_message</td>
			<td>Bad data format:Failed to parse the date string provided in the data. Please use ISO8601 format.</td>
			<td>A textual description of an error that occured while processing the transaction.</td>
		</tr>
		<tr>
			<td>Fraud Rule Name</td>
			<td>frn</td>
			<td>Fallthrough</td>
			<td>The short name of the fraud rule that triggered for this transaction.
			<br><br>
			<b>Note</b>: A fraud rule will be triggered for all transactions, including those that have result ACCEPT</td>
		</tr>
		<tr>
			<td>Fraud Rule Description</td>
			<td>frd</td>
			<td>User is trusted and no fraud rules were triggered.</td>
			<td>A longer description of the fraud rule that triggered.</td>
		</tr>
		<tr>
			<td>Domestic Card</td>
			<td>rfb</td>
			<td>true</td>
			<td>True if the credit card used in the transaction is domestic.
				<ul type="disc">
					<li>True</li>
					<li>False<li>
				</ul></td>
		</tr>
		<tr>
			<td>Card Issuer Country</td>
			<td>ric</td>
			<td>US</td>
			<td>The issuer country of the card used in the transaction. The country code is the two letter abbreviation as defined in ISO-3166-1</td>
		</tr>
		<tr>
			<td>User Description</td>
			<td>erd</td>
			<td>Existing Trusted User</td>
			<td>A textual description of the reputation of the user associated with the transaction.</td>
		</tr>
		<tr>
			<td>Alert Severity</td>
			<td>ras</td>
			<td>HIGH</td>
			<td>If an alert was generated, the severity of the alert.
				<ul type="disc">
					<li>CRITICAL</li>
					<li>HIGH</li>
					<li>MEDIUM</li>
					<li>WARNING</li>
					<li>INFO</li></td>
		</tr>
		<tr>
			<td>Alert Message</td>
			<td>ram</td>
			<td>Card is issued by a foreign bank.</td>
			<td>If an alert was generated, the message associated with the alert.</td>
		</tr>
		<tr>
			<td>Automated Review Policy Rule ID</td>
			<td>arpid</td>
			<td>20005</td>
			<td>The Automated Review Policy rule, if any, that accepted the transaction.</td>
		</tr>
		<tr>
			<td>Automated Review Policy Rule Description</td>
			<td>arpd</td>
			<td>Parameters of the transaction are associated with a history of good transactions</td>
			<td>A textual description of the Automated Review Policy rule, if any, that accepted the transaction.</td>
		</tr>
	</table>