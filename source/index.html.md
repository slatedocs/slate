---
title: Engineering Reference

language_tabs:
  - shell
  - python
  - javascript
  - SQL

toc_footers:
  - <a href='https://github.com/tripit/slate'>Docs powered by Slate</a>

includes:
  - errors

search: true
---

# Overview
Quilt internal docs. We have documentation debt.
Starting good habits from 9/6/2016. Probably.

## Architecture
- RDS Instance (Postgres; can use Redshift; working on Snowflake)
- Django on Heroku
- Firebase (reactive cache layer)
- React and react-bootstrap

## Backend
- @kevin write something here

## Frontend
- npm and gulp
- `npm test` to run unit tests (for redux)
- Mixture of redux (Quilt dialog) and barebones React (everything else)
- `gulp deploy` - builds production bundle
- `firebase deploy` - deploys to CDN


## Tools
### init_firebase
refresh firebase cache from database source

### shell_plus
serialize objects

```shell
from tables.serializers import *
DashboardSerializer(dashboard_obj).data
```

## Environments
- [Stage](https://quilt-heroku.herokuapp.com/)
    - Database
    - [Firebase (sometimes stage and prod swap)](https://console.firebase.google.com/project/firebase-quiltdata/database/data)
    - [CDN](https://console.firebase.google.com/project/firebase-quilttest/hosting/main)
- [Production](https://quiltdata.com/)
    - Database
    - [Firebase (sometimes stage and prod swap)](https://console.firebase.google.com/project/firebase-quilttest/database/data)
    - [CDN](https://console.firebase.google.com/project/firebase-quiltdata/hosting/main)

# Deployments

## JavaScript

TODO: Synchronize with backend deploys to avoid race conditions (see Heroku email chain)

* `gulp deploy` - builds production optimized JS app bundle; requires `firebase deploy`
to actually hit the internets

* firebase environments (alias = full_name)
    * stage = quilttest
    * production = quilitdata
* `firebase list` to see environments
* `firebase use --add` to set aliases
* `firebase use ALIAS_OR_ENVIRONMENT` to set active environment
* `firebase deploy` - currently deploys CDN (hosting) files only for active environment

Full [Firebase CLI reference](https://firebase.google.com/docs/cli/).

# Dashboards
User dashboard that points to a periscope dashboard. Partial feature.

How to create and publish:

- get periscope dashboard id
- associate dashboard with table that user can see
- `init_firebase` for affected table id

> Creating dashboard records in database:

```shell
# local cli
heroku run python manage.py shell_plus --app ENVIRONMENT

# inside shell_plus
newdash = Dashboard.objects.create(
  id=PERISCOPE_ID,
  table=TABLE,
  table_id=TABLE_ID,
  name=NAME,
  description=DESC,
  image_url=IMAGE_URL,
  image=OPTIONAL_FILE_OBJECT
)

# to inspect
Dashboard.objects.all()
Dashboard.objects.filter(id=,name=, …):

```
- user only needs to enter one of table= or table_id=


# Endpoints

## Pose as specific user

```shell
>>> kaleb = User.objects.get(username='Kaleb')
>>> request = factory.get('/tables/?dashboard=1')
>>> force_authenticate(request, kaleb)
>>> from tables.views import *
>>> response = TableViewSet.as_view({'get' : 'list'})(request, {'dashboard' : True})
>>> response.render()
<rest_framework.response.Response object at 0x7f4b9b08ee90>
>>> response.content
'[{"id":2515,"name":"NDB Placeholder","sqlname":"ndb_placeholder_b7ab4953","description":"Empty data set for dashboard delivery","owner":"akarve","is_public":false,"csvfile":null,"viewonly":false,"dashboards":[{"id":71134,"table":2515,"name":"Geo Vis Sampler for NDB","image":null,"description":"9/6/2016"}]}]'
```

# Authentication (sample)


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

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>


# Kittens (sample)

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

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
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
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

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
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve
