# API Reference

## What is a RESTful API?

In the **Internet of People**, we navigate the web through web browsers and a screen; in the **Internet of Things**, devices are limited in terms of battery, visual interfaces or processing power, so they need a special way to interact with the web.

This “web interface for devices” is what we call an API, which stands for “Aplication Programming Interface”. As the name suggests, an API is an interface to interact with a web service in a programatic way. This **API Reference** specifies the structure of the data that will be exchanged between your devices and the Ubidots Cloud, and maybe even with external web or mobile applications.

On the other hand, a RESTful API means, among other things, that this API talks HTTP (the same protocol browsers use to communicate with web pages), a very standard way to communicate in the World Wide Web. The Ubidots API supports four HTTP methods:

* **GET** - Used to retrieve information from the cloud
* **POST** - Used to create a new element inside the cloud
* **PUT** - Used to edit existing elements 
* **DELETE** - Used to delete existing elements

## Base URL

Our API supports both HTTP and HTTPS. All API calls should be made to either one of these URLs:

`http://things.ubidots.com/api/v1.6/`

`https://things.ubidots.com/api/v1.6/`

## Authentication

> Http Request

```shell
POST /api/v1.6/auth/token HTTP/1.1
Host: things.ubidots.com
X-Ubidots-ApiKey: YOUR-API-KEY

```

> Example request

```shell
# Request

curl -X POST "http://things.ubidots.com/api/v1.6/auth/token" -H "X-Ubidots-ApiKey: ab2ee82d3a50cb8f1d2567eb8bd3a10528494426"

# Response
```

```json
{
    "token": "f6j9QGZqzsobNHZMFZ8UNWpPXOa0v8LCtu3UuZyS32KbUwJyA"
}
```

Your Ubidots account has two types of keys:

* **API Key**: This is your "Master Key"; a unique and inmmutable key per account. Only used to generate **tokens**.
* **Tokens**: Temporary and revocable keys created using your API Key. All API calls in this documentation require a **TOKEN**.

The easiest way to get a **TOKEN** is in your [account profile](https://app.ubidots.com/userdata/api/).

If you are going to production, it is wiser to have your device create tokens when needed, using the API. To create a token through the API, make a POST request to: 

`http://things.ubidots.com/api/v1.6/auth/token`

* Tokens created through the **/auth/token** endpoint will expire after 6 hours if not used. This is a standard security measure.
* Tokens created in your account profile will never expire

<aside class="warning">
All API calls below will only accept your TOKEN. Don't try to use your API Key since it won't work!
</aside>

## Making a request

> Http Request with token in URL

```shell
POST /api/v1.6/variables?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG HTTP/1.1
Host: things.ubidots.com

```

> Http Request with token in headers

```shell
POST /api/v1.6/variables HTTP/1.1
Host: things.ubidots.com
X-Auth-Token: MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

```

> Both requests are equivalent

There are two ways to use your **TOKEN**:

* Send the token inside the URL using the **?token=** paramenter. This is the easiest one to implement.
* Send the token as a header using the **X-Auth-Token** header


## Pagination

> Http Request

```shell
GET /api/v1.6/variables?page_size=5&page=2 HTTP/1.1
Host: things.ubidots.com
X-Auth-Token: MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

```

> Example request

```shell
# Will list variables from #6 to #10 (page size = 5, page number = 2)

curl "http://things.ubidots.com/api/v1.6/variables?page_size=5&page=2" -H "X-Auth-Token: MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG"

```

API calls listing multiple items will return 30 items by default. You can change this number using the pagination parameters inside the URL of the request:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**page_size**  | Specifies the amount of elements to list per page (30 by default). Example: <br>`?page_size=100` will return the first hundred items.
**page**       | Specifies the page number to retrieve. Example: <br>`?page_size=100&page=2` will return a hundred items, from #101 to #200. 

In the response, the **count** field will tell you the total number of items available.


## Data Sources

### Create a Data Source

> Http Request

```shell
POST /api/v1.6/datasources/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
Content-Type: application/json
Content-Length: 21

{"name":"Water Tank"}

```
> Example request

```shell
# Request

curl -X POST -H "Content-Type: application/json" -d '{"name": "Water Tank"}' http://things.ubidots.com/api/v1.6/datasources/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
{
  "id": "5684415076254267da0414cf", 
  "owner": "http://things.ubidots.com/api/v1.6/users/7061", 
  "parent": null, 
  "name": "Water Tank", 
  "url": "http://things.ubidots.com/api/v1.6/datasources/5684415076254267da0414cf", 
  "context": {}, 
  "tags": [], 
  "created_at": "2015-12-30T20:40:48.676", 
  "variables_url": "http://things.ubidots.com/api/v1.6/datasources/5684415076254267da0414cf/variables", 
  "number_of_variables": 0, 
  "last_activity": null, 
  "description": null
}

```

To create a data source, make a POST request to:

`http://things.ubidots.com/api/v1.6/datasources/`

Indicating at least the name of the Data Source in a JSON object in the Http body:

`{"name":"Water Tank"}`

Accepted fields are:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**name**<br>*required*| String with the name of the Data Source.<br>Example: `"name":"Water Tank"`
**description**| String describing the Data Source.<br>Example: `"description":"This is a water tank"`
**context**    | An object with optional meta data as "key":"value" pairs.<br>Example: `"context": {"customer": "ABC Systems"}`
**tags**       | A list of tags separated by commas.<br>Example: `"tags":["factory", "Main tank"]`

<aside class="notice">
Remember to replace {TOKEN} with a valid token from your account.
</aside>

### Get a Data Source

> Http Request

```shell
GET /api/v1.6/datasources/{DS_ID}/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request

curl http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
{
  "id": "5683fae97625424a4d8e17b4", 
  "owner": "http://things.ubidots.com/api/v1.6/users/7061", 
  "parent": null, 
  "name": "My Datasource #2", 
  "url": "http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4", 
  "context": {
    "_last_activity": 1451513333000, 
    "_icon": "generic-ds"
  }, 
  "tags": [], 
  "created_at": "2015-12-30T15:40:25.180", 
  "variables_url": "http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4/variables", 
  "number_of_variables": 8, 
  "last_activity": 1451513333000, 
  "description": ""
}

```

To get the details of a data source, make a GET request to:

`http://things.ubidots.com/api/v1.6/datasources/{DS_ID}/`


<aside class="notice">
Remember to replace {DS_ID} with the ID of the Data Source you wish to retrieve and {TOKEN} with a valid token from your account.
</aside>

### List Data Sources

> Http Request

```shell
GET /api/v1.6/datasources/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request (retrieve 20 data sources with parameter "page_size=20" and "tag=car")

curl "http://things.ubidots.com/api/v1.6/datasource/?page_size=20&tag=car&token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG"

# (Sample response omitted - too long to print here!)
```


To list a set of data sources in your account make a GET request to:

`http://things.ubidots.com/api/v1.6/datasources/`

This endpoint accepts the pagination parameters, plus a "tag" parameter for filtering purposes:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**page_size**  | Specifies the amount of elements to list per page (30 by default). Example: <br>`?page_size=100` will return the first hundred items.
**page**       | Specifies the page number to retrieve. Example: <br>`?page_size=100&page=2` will return a hundred items, from #101 to #200. 
**tag**        | Filter results to items containing the specified tags (you can use one or more filters). Example: <br> `?tag=car&tag=DFT361` will return items containing the tags "car" AND "DFT361".


<aside class="notice">
Remember to replace {TOKEN} with a valid token from your account.
</aside>

### List Variables of a Data Source

> Http Request

```shell
GET /api/v1.6/datasources/{DS_ID}/variables/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request

curl http://things.ubidots.com/api/v1.6/datasources/5683f80476254244b1ad2b01/variables/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# (Sample response omitted - too long to print here!)
```
> Example request filtered by tags

```shell
# Request

curl "http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4/variables/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG&tag=weather"

# (Sample response omitted - too long to print here!)
```

To list the variables of a data source make a GET request to:

`http://things.ubidots.com/api/v1.6/datasources/{DS_ID}/variables/`

This endpoint accepts the pagination parameters, plus a "tag" parameter for filtering purposes:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**page_size**  | Specifies the amount of elements to list per page (30 by default). Example: <br>`?page_size=100` will return the first hundred variables.
**page**       | Specifies the page number to retrieve. Example: <br>`?page_size=100&page=2` will return a hundred variables, from #101 to #200. 
**tag**        | Filter results to variables containing the specified tags (you can use one or more filters). Example: <br> `?tag=weather&tag=sky` will return variables containing the tags "weather" AND "sky".


<aside class="notice">
Remember to change {DS_ID} with the ID of the data source and {TOKEN} with a valid token from your account.
</aside>


### Delete a Data Source

> Http Request

```shell
DELETE /api/v1.6/datasources/{DS_ID}/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request

curl -X DELETE http://things.ubidots.com/api/v1.6/datasources/5684415076254267da0414cf/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
# * The response does not contain a BODY, only a response code is returned meaning the item was successfully deleted:

204 NO CONTENT
```

To delete a data source, make a DELETE request to:

`http://things.ubidots.com/api/v1.6/datasources/{DS_ID}/`

<aside class="notice">
Remember to replace {TOKEN} with a valid token from your account.
</aside>


## Sensor Variables

### Create a Variable

> Http Request

```shell
POST /api/v1.6/datasources/{DS_ID}/variables/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
Content-Type: application/json
Content-Length: 35

{"name":"Temperature", "unit":"ºC"}

```
> Example request

```shell
# Request

curl -X POST -H "Content-Type: application/json" -d '{"name": "Temperature", "unit":"ºC"}' http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4/variables/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
{
  "id": "568405d376254261ef114f35", 
  "name": "Temperature", 
  "icon": "", 
  "unit": "\u00baC", 
  "datasource": 
    {
      "id": "5683fae97625424a4d8e17b4", 
      "name": "My Datasource #2", 
      "url": "http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4"
    }, 
  "url": "http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35", 
  "description": null, 
  "properties": {}, 
  "tags": [], 
  "values_url": "http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values", 
  "created_at": "2015-12-30T16:26:59.684", 
  "last_value": {}, 
  "last_activity": null, 
  "type": 0, 
  "derived_expr": ""
}

```

To create a variable, make a POST request to:

`http://things.ubidots.com/api/v1.6/datasources/{ds_id}/variables`

Indicating at least the name of the Variable in a JSON object in the Http body:

`{"name":"Temperature"}`

Accepted fields are:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**name**<br>*required*| String with the name of the variable.<br>Example: `"name":"Temperature"`
**unit**       | String with the unit of the variable.<br>Example: `"unit":"ºC"`
**description**| String describing the variable.<br>Example: `"description":"This is a DS18B20 sensor"`
**properties** | An object with optional meta data as "key":"value" pairs.<br>Example: `"properties": {"place": "House"}`
**tags**       | A list of tags separated by commas.<br>Example: `"tags":["factory", "Main tank"]`

<aside class="notice">
Remember to change {DS_ID} with the ID of the data source where you want to create the variable, and {TOKEN} with a valid token from your account.
</aside>

### Get a Variable

> Http Request

```shell
GET /api/v1.6/variables/{VAR_ID}/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request

curl http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
{
  "id": "568405d376254261ef114f35", 
  "name": "Temperature", 
  "icon": "", 
  "unit": "\u00baC", 
  "datasource": 
  {
    "id": "5683fae97625424a4d8e17b4", 
    "name": "My Datasource #2", 
    "url": "http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4"
  }, 
  "url": "http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35", 
  "description": null, 
  "properties": 
  {
   "_last_value": 
   {
    "timestamp": 1383497090001, 
     "value": 23.0, 
     "context": {}
   }, 
   "_last_activity": 1451513333000
  }, 
  "tags": [], 
  "values_url": "http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values", 
  "created_at": "2015-12-30T16:26:59.684", 
  "last_value": 
  {
    "timestamp": 1383497090001, 
    "value": 23.0, 
    "context": {}
  }, 
  "last_activity": 1451513333000, 
  "type": 0, 
  "derived_expr": ""
}

```

To get the details of a variable, make a GET request to:

`http://things.ubidots.com/api/v1.6/variables/{VAR_ID}/`


<aside class="notice">
Remember to replace {VAR_ID} with the ID of the Variable you wish to retrieve and {TOKEN} with a valid token from your account.
</aside>

### List Variables

> Http Request

```shell
GET /api/v1.6/variables/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request (retrieve 2 variables with parameter "page_size=2")

curl "http://things.ubidots.com/api/v1.6/variables/?page_size=2&token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG"

# (Sample response omitted - too long to print here!)
```
> Example request filtered by tags

```shell
# Request

curl "http://things.ubidots.com/api/v1.6/variables/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG&tag=weather&tag=sky"

# Response
```

```json
{
  "count": 1, 
  "next": null, 
  "previous": null, 
  "results": 
  [{
    "id": "5683faf576254248ffd9e46f", 
    "name": "Var B", 
    "icon": "", 
    "unit": "", 
    "datasource": 
    {
      "id": "5683fae97625424a4d8e17b4", 
      "name": "My Datasource #2", 
      "url": "http://things.ubidots.com/api/v1.6/datasources/5683fae97625424a4d8e17b4"
    }, 
  "url": "http://things.ubidots.com/api/v1.6/variables/5683faf576254248ffd9e46f", 
  "description": "", 
  "properties": {}, 
  "tags": ["sky", "weather"], 
  "values_url": "http://things.ubidots.com/api/v1.6/variables/5683faf576254248ffd9e46f/values", 
  "created_at": "2015-12-30T15:40:37.617", 
  "last_value": {}, 
  "last_activity": null, 
  "type": 0, 
  "derived_expr": ""
  }]
}

```

To list a set of variables in your account make a GET request to:

`http://things.ubidots.com/api/v1.6/variables/`

This endpoint accepts the pagination parameters, plus a "tag" parameter for filtering purposes:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**page_size**  | Specifies the amount of elements to list per page (30 by default). Example: <br>`?page_size=100` will return the first hundred variables.
**page**       | Specifies the page number to retrieve. Example: <br>`?page_size=100&page=2` will return a hundred variables, from #101 to #200. 
**tag**        | Filter results to variables containing the specified tags (you can use one or more filters). Example: <br> `?tag=weather&tag=sky` will return variables containing the tags "weather" AND "sky".


<aside class="notice">
Remember to replace {TOKEN} with a valid token from your account.
</aside>

### Delete a Variable

> Http Request

```shell
DELETE /api/v1.6/variables/{VAR_ID}/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request

curl -X DELETE http://things.ubidots.com/api/v1.6/variables/5683faf17625424c0bc280ed/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
# * The response does not contain a BODY, only a response code is returned meaning the item was successfully deleted:

204 NO CONTENT
```

To delete a variable, make a DELETE request to:

`http://things.ubidots.com/api/v1.6/variables/{VAR_ID}/`

<aside class="notice">
Remember to replace {TOKEN} with a valid token from your account.
</aside>

## Values

### Create a new value

> Http Request

```shell
POST /api/v1.6/variables/{VAR_ID}/values/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
Content-Type: application/json
Content-Length: 17

{"value": "35.8"}

```
> Example request

```shell
# Request

curl -X POST -H "Content-Type: application/json" -d '{"value": "35.8"}' http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
{
  "url": "http://things.ubidots.com/api/v1.6/values/568442e77625426cd410eec0", 
  "value": 35.8, 
  "timestamp": 1451508455551, 
  "context": {}, 
  "created_at": "2015-12-30T20:47:35.551"
}
```
> Example request adding "context" with GPS location

```shell
curl -X POST -H "Content-Type: application/json" -d '{"value": "35.8", "context": {"lat": 6.1, "lng": -35.1, "status": "driving"}}' http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

```
> Example request specifying a "timestamp"

```shell
curl -X POST -H "Content-Type: application/json" -d '{"value": "52.1", "timestamp": 1376056359000}' http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

```

To send a sensor value to a variable, make a POST request to:

`http://things.ubidots.com/api/v1.6/variables/{VAR_ID}/values`

Indicating at least the value in a JSON object in the Http body:

`{"value": 35.8}`

or

`{"value": "35.8"}`

Accepted fields are:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**value**<br>*required*| Numeric value in decimal format.<br>Example: `"value": "35.8"` or `"value": 35.8`
**context**    | An object with optional meta data as "key":"value" pairs.<br>Example: `"context": {"lat": 6.1, "lng": -35.1, "status": "driving"}`
**timestamp**  | Optional timestamp **in milliseconds**, according to the POSIX standard.<br>Example: `"timestamp":1376056359000`

* **PROTIP**: A useful tool to convert between Human readable dates and POSIX timestamps is: [www.epochconverter.com/](http://www.epochconverter.com/).

<aside class="success">
When sending the keys "lat" and "lng" in the "context" field of a value, the Ubidots dashboard will recognize it as a GeoPoint so it can be plotted in a map.
</aside>

<aside class="notice">
Remember to replace {VAR_ID} with the ID of the variables to which you want to send data and {TOKEN} with a valid token from your account.
</aside>

### Send values to several Variables

> Http Request

```shell
POST /api/v1.6/collections/values/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
Content-Type: application/json
Content-Length: 112

[{"variable": "{VAR-ID-1}"}, "value":41.2}, {"variable": "{VAR-ID-1}", "value":88.3}]

```
> Example request

```shell
# Request

curl -X POST -H "Content-Type: application/json" -d '[{"variable": "568405d376254261ef114f35", "value":41.2}, {"variable": "56843ac776254258956b9c05", "value":88.3}]' http://things.ubidots.com/api/v1.6/collections/values/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
[{"status_code": 201}, {"status_code": 201}]
```
> Example request adding the "?force=true" parameter

```shell
# Request

curl -X POST -H "Content-Type: application/json" -d '[{"variable": "568405d376254261ef114f35", "value":41.2}, {"variable": "56843ac776254258956b9c05", "value": "xxx"}]' "http://things.ubidots.com/api/v1.6/collections/values/?force=true&token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG"

# Response
```
```json
[{"status_code": 201}, {"status_code": 400, "errors": {"value": ["'xxx' value must be a float."]}}]
```

To update several variables at the same time make a POST request to:

`http://things.ubidots.com/api/v1.6/collections/values`

Indicating the IDs of the variables to update and their values:

`[{"variable": "{VAR_ID_1}"}, "value":41.2}, {"variable": "{VAR_ID_1}", "value":88.3}]`

Accepted fields:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**variable id**<br>*required*| ID of the variables to update.<br>Example: `"variable": "568405d376254261ef114f35"`

Every field after the **variable_id** can be the same fields as when [sending a single value to a variable](#create-a-new-value) (**"value"**, **"timestamp"** and **"context"**).

Accepted parameters in the URL:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**force**      | When **false** (default), the system will reject all values if there's one of them with an error. <br><br>When **true**, the system will create the valid values and reject only the ones with errors.


<aside class="notice">
Remember to replace {VAR_ID_1}, {VAR_ID_2}, and so on, with the IDs of the variables you want to update and {TOKEN} with a valid token from your account.
</aside>

### Send several Values to a single Variable

> Http Request



```shell
POST /api/v1.6/variables/{VAR_ID}/values/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
Content-Type: application/json
Content-Length: 82

[{"value":22, "timestamp":1383497090000}, {"value":23, "timestamp":1383497090001}]

```
> Example request

```shell
# Request

curl -X POST -H "Content-Type: application/json" -d '[{"value":22, "timestamp":1383497090000}, {"value":23, "timestamp":1383497090001}]' http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
[{"status_code": 201}, {"status_code": 201}]
```
> Example request adding the "?force=true" parameter

```shell
# Request

curl -X POST -H "Content-Type: application/json" -d '[{"value":"xxx", "timestamp":1383497090000}, {"value":23, "timestamp":1383497090001}]' http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?force=true&token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
[{"status_code": 400, "errors": {"value": ["'xxx' value must be a float."]}}, {"status_code": 201}]
```

To send several values to a single variable make a POST request to:

`http://things.ubidots.com/api/v1.6/variables/{VAR_ID}/values/`

with an object containing a list of values to send:

`[{"value":22, "timestamp":1383497090000}, {"value":23, "timestamp":1383497090001}]`

Accepted fields:

* Every item of the list accepts the same fields as when [sending a single value to a variable](#create-a-new-value) (**"value"**, **"timestamp"** and **"context"**).

Accepted parameters in the URL:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**force**      | When **false** (default), the system will reject all values if there's one of them with an error. <br><br>When **true**, the system will create the valid values and reject only the ones with errors.

<aside class="notice">
Remember to replace {VAR_ID} with the ID of the variable you want to update and {TOKEN} with a valid token from your account.
</aside>


### List Values of a Variable

> Http Request

```shell
GET /api/v1.6/variables/{VAR_ID}/values?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request: Retrieve the last 10 values of the variables with ID = "568405d376254261ef114f35"

curl "http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?page_size=10&token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG"

# (Sample response omitted - too long to print here!)
```

> Example request #2: Export the values as CSV

```shell
# Request: Retrieve the last 10 values of the variables with ID = "568405d376254261ef114f35"

curl "http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?page_size=10&token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG&format=csv"

# Response
```
```csv
context.lat,context.lng,context.status,created_at,timestamp,value
,,,2015-12-30 21:39:55.036000,1451511595036,41.2
,,,2015-12-30 21:33:41.524000,1451511221524,41.2
,,,2015-12-30 21:31:00.197000,1451511060197,41.2
,,,2015-12-30 21:16:02.630000,1451510162630,41.2
,,,2015-12-30 21:15:01.612000,1451510101612,41.2
,,,2015-12-30 21:14:03.723000,1451510043723,41.2
,,,2015-12-30 21:13:55.147000,1451510035147,41.2
,,,2015-12-30 21:13:41.187000,1451510021187,41.2
,,,2015-12-30 21:09:10.527000,1451509750527,41.2
```

> Example request #3: Send the values to an Email

```shell
# Request

curl "http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/values/?page_size=10&token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG&action=send_by_email&email=info@ubidots.com"

# Response
```
```json
{
    "status": "sent_via_email"
}
```

To list a set of variables in your account make a GET request to:

`http://things.ubidots.com/api/v1.6/variables/{VAR_ID}/values`

It is possible to retrieve a subset of values given their time range. Use the **start** and **end** parameters to do this:

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**start**      | Returns values after this timestamp, inclusive with this timestamp. May be used in conjunction with the end parameter. Example: <br>`?start=1451170441000`
**end**        | Returns values before this timestamp, inclusive with this timestamp. May be used in conjunction with the start parameter. Example: <br>`?end=1451570441000`
**format**     | Specifies the format of the returned values:<br>`?format=csv`: Returns a CSV file.<br>`?format=json`: Returns a JSON formated text.
**action** &<br>**email** | Queues the request to be sent per Email to the specified Email address as a CSV file - useful when requesting a large subset of values. Both parameters are to be used together. Example: <br>`?action=send_by_email&email=johndoe@email.com`
**page_size**  | Specifies the amount of elements to list per page (30 by default). Example: <br>`?page_size=100` will return a hundred values.
**page**       | Specifies the page number to retrieve. Example: <br>`?page_size=100&page=2` will return a hundred values, from #101 to #200. 

* **PROTIP**: A useful tool to convert between Human readable dates and POSIX timestamps is: [www.epochconverter.com/](http://www.epochconverter.com/).

<aside class="notice">
Remember to replace {VAR_ID} with the ID of the Variable you wish to retrieve and {TOKEN} with a valid token from your account.
</aside>

### Delete Values from a Variable

> Http Request

```shell
DELETE /api/v1.6/variables/{VAR_ID}/values/{START}/{END}/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request

```shell
# Request: Delete all values between timestamps 1447136223927 and 1449419580541:

curl -X GET "http://things.ubidots.com/api/v1.6/variables/561ecb647625425fd0dfec9c/values/1447136223927/1449419580541/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG"

# Response
```
```json
{
    "count": 7200
}
```

To delete a set of values in your account make a DELETE request to:

`http://things.ubidots.com/api/v1.6/variables/{VAR_ID}/values/{START}/{END}/`

Values between the `{START}` timestamp and the `{END}` timestamp will be deleted.

* **PROTIP**: A useful tool to convert between Human readable dates and POSIX timestamps is: [www.epochconverter.com/](http://www.epochconverter.com/).

<aside class="notice">
Remember to replace {VAR_ID} with the ID of the Variable you wish to retrieve and {TOKEN} with a valid token from your account.
</aside>

## Statistics

### Compute statistics over a subset of Values

> Http Request

```shell
GET /api/v1.6/variables/{VAR_ID}/statistics/{FIG}/{START}/{END}/?token={TOKEN} HTTP/1.1
Host: things.ubidots.com
```
> Example request: Obtaining the main of all values

```shell
# Request

NOW=$(date +%s)000
curl -X GET http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/statistics/mean/0/$NOW/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
{
  "mean": 39.01176470588236
}
```

> Example request: Computing multiple figures in a single request

```shell
# Request

NOW=$(date +%s)000
curl -X GET http://things.ubidots.com/api/v1.6/variables/568405d376254261ef114f35/statistics/mean,variance,min,max,count,sum/0/$NOW/?token=MtRbM7ipKUsjRh6RwJE0ofIQo0KqoG

# Response
```
```json
{
  "count": 17, 
  "min": 22.0, 
  "max": 52.1, 
  "sum": 663.2, 
  "variance": 57.21986159169533, 
  "mean": 39.01176470588236
}
```

To compute a statistic over a subset of values, make a GET request to:

`http://things.ubidots.com/api/v1.6/variables/{VAR_ID}/statistics/{FIG}/{START}/{END}/`

The figure is given by `{FIG}` and the subset is given by the values between `{START}` and `{END}`.

               |                                                                                                          |
-------------- | -------------------------------------------------------------------------------------------------------- |
**figure**     | A comma seperated value list of statistical figures to be computed. Supported operations are:<br>- mean<br>- variance<br>- min<br>- max<br>- count<br>- sum
**start**      | The starting timestamp in milliseconds. The range is inclusive with this value. 
**end**        | The ending timestamp in milliseconds. The range is inclusive with this value. 

* **PROTIP**: A useful tool to convert between Human readable dates and POSIX timestamps is: [www.epochconverter.com/](http://www.epochconverter.com/).

<aside class="notice">
Remember to replace {VAR_ID} with the ID of the Variable you wish to retrieve and {TOKEN} with a valid token from your account.
</aside>


### Get a series of Values after computing a rolling figure

The rolling window endpoint allows you to compute an operation (mean, max, min, sum or count) over a rolling time window: every 5 minutes, 1 hour, 1 week, etc. It can either return a set of values, or create a new variable in your account with the new re-sampled values, so it can be used in dashboards, events or future API calls.

This endpoint's documentation is not public yet. If you'd like more details, drop us an email at [support@ubidots.com](mailto:support@ubidots.com).

## Response Codes

The Ubidots API uses the following response codes:

Code| Meaning
----| -------
200 | Ok -- Successful request.
201 | Created -- Successful request + an item was created.
400 | Bad Request -- Error due to an invalid body in your request. Please verify it's a valid JSON string and that the fields are the ones expected by the endpoint (string, object or float).
403 | Forbidden -- This token is not valid. Please verify your token.
404 | Not Found -- We couldn't find the variable or data source you are trying to access. Verify your token and item's ID.
405 | Method Not Allowed -- This API endpoint does not accept the method used. Check our API docs to see the allowed methods.
50* | Internal Error -- We're having issues with our servers. Please check our [status page](http://status.ubidots.com).
