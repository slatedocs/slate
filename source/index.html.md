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


# REST API

<table>
<colgroup>
<col width="28%" />
<col width="33%" />
<col width="37%" />
</colgroup>
<thead>
<tr class="header">
<th>Endpoint</th>
<th>URL</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Tables</td>
<td><code>/tables/</code></td>
<td><a href="#tables">Create/Delete/Manage Tables</a></td></td>
</tr>
<td>Columns</td>
<td><code>/tables/TABLE_ID/columns/</code></td>
<td><a href="#columns">Add/Delete Columns</a></td></td>
</tr>
<td>Table Data</td>
<td><code>/data/TABLE_ID/rows/</code></td>
<td><a href="#data-rows">Fetch and create table data</a></td></td>
</tr>
<td>Branches</td>
<td><code>/data/TABLE_ID/branches/</code></td>
<td><a href="#data-branches">Create data branches</a></td></td>
</tr>
<td>Commits</td>
<td><code>/data/TABLE_ID/branches/</code></td>
<td><a href="#data-commits">Commit data and schema changes</a></td></td>
</tr>
<tr class="even">
<td>Files</td>
<td><code>/files/</code></td>
<td><a href="#files">Upload/Import files</a></td>
</tr>
<tr class="odd">
<td>User Profiles</td>
<td><code>/profiles/</code></td>
<td><a href="#profiles">Update user profile information</a></td>
</tr>
<tr class="even">
<td>Sharing</td>
<td><code>/share/</code></td>
<td><a href="#share">Share Tables</a></td>
</tr>
<tr class="odd">
<td>Quilts</td>
<td><code>/quilts/</code></td>
<td><a href="#quilts">Connect tables in a Quilt</a></td>
</tr>
<tr class="even">
<td>Gene Math</td>
<td><code>/genemath</code></td>
<td><a href="#genemath">Intersect and Subtract sets of genomic regions</a></td>
</tr>

</tbody>
</table>

 [See below]: #delete-table
  [1]: #update-table-meta-data
  [2]: #add-column-to-table
  [3]: #append-row
  [4]: #get-rows
  [5]: #get-row
  [6]: #intersect-or-subtract

Notes

-   For all REST calls, the content-type is `application/JSON`.
-   Description fields automatically linkify URLs and support `<a>, <i>, <em>, <strong>, <b>` tags

Tables
======

### Create

`POST /tables/`

#### Data format

``` sourceCode
{
  'name': string,
  'description': text `<a>, <i>, <em>, <strong>, <b>` tags supported; automatic linkification of URLs
  'columns': [
    {
      'name': string,
      'sqlname': optional string,
      'description': optional text,
      'type' : one of 'String', 'Number', 'Image', 'Text'
    },
    ...
  ]
}
```

#### Returns

- user only needs to enter one of table= or table_id=


# Endpoints



Table data as JSON object, includes `id` field with the table’s
identifier.

### Retrieve

`GET /tables/TABLE_ID`

#### Returns

Table data as JSON object, includes `id` field with the table’s
identifier.


### Update

`PATCH /tables/TABLE_ID`

#### Data format

``` sourceCode
{
  'name': string,
  'description': text `<a>, <i>, <em>, <strong>, <b>` tags supported; automatic linkification of URLs
  'columns': [
    {
      'name': string,
      'sqlname': optional string,
      'description': optional text,
      'type' : one of 'String', 'Number', 'Image', 'Text'
    },
    ...
  ]
}
```

#### Returns

Table data as JSON object, includes `id` field with the table’s
identifier.

### Delete

`DELETE /tables/TABLE_ID`

#### Returns
status code


Columns
=======

### Add Column

`POST /tables/TABLE_ID/columns/`

#### Data format
``` sourceCode
    {
       'name': string,
       'sqlname': optional field name string,
       'description': text,
       'type': one of 'String', 'Number', 'Date', 'DateTime', 'Image', or 'Text'
    }
```

#### Returns

Column data as JSON object, includes `id` field with the column’s
identifier.

### Update

`PATCH /tables/TABLE_ID/columns/COLUMN_ID`

#### Data format

``` sourceCode
    {
       'name': string,
       'sqlname': optional field name string,
       'description': text,
       'type': one of 'String', 'Number', 'Date', 'DateTime', 'Image', or 'Text'
    }
```

#### Returns

Table data as JSON object, includes `id` field with the table’s
identifier.

### Delete

`DELETE /tables/TABLE_ID/columns/COLUMN_ID`

#### Returns
status code


Data
====

### Create

`POST /data/TABLE_ID/rows/`
-   Use column `sqlname` as keys in input data
``` sourceCode
    [
      {columnSqlname0: value0, columnSqlname1 : value1, ... },
      ...
    ]
```

### Retrieve (single row)

`GET /data/TABLE_ID/rows/ROW_ID`

#### Returns
``` sourceCode
      {columnSqlname0: value0, columnSqlname1 : value1, ... }
```

### List/Search (multiple rows)
`GET /data/TABLE_ID/rows/`
- query params: [order_by, search]

#### Returns
``` sourceCode
    [
      {columnSqlname0: value0, columnSqlname1 : value1, ... },
      ...
    ]
```

Branch Data
===========

### Create

`POST /data/TABLE_ID/branches/BRANCH_NAME/rows/`
-   Use column `sqlname` as keys in input data
``` sourceCode
    [
      {columnSqlname0: value0, columnSqlname1 : value1, ... },
      ...
    ]
```

### Retrieve (single row)

`GET /data/TABLE_ID/branches/BRANCH_NAME/rows/ROW_ID`

#### Returns
``` sourceCode
      {columnSqlname0: value0, columnSqlname1 : value1, ... }
```

### List/Search (multiple rows)
`GET /data/TABLE_ID/branches/BRANCH_NAME/rows/`
- query params: [order_by, search]

#### Returns
``` sourceCode
    [
      {columnSqlname0: value0, columnSqlname1 : value1, ... },
      ...
    ]
```

Quilts
======

### Create

`POST /quilts/` \#\#\#\# Data format

    {
      'left_table_id': int,
      'right_table_id': int,
      'left_column_id': int,
      'right_column_id': int,
      'jointype': one of 'inner', 'leftOuter', 'firstMatch'
    }

#### Returns

Quilt info as JSON object, includes `sqlname` field with the quilt’s
identifier.

### Delete

`DELETE /quilts/QUILT_SQLNAME`

Genome Math
===========

-   Performs a gene math operation on two tables
-   Creates a new table with the result.
-   Columns are specified by `column.id`.

### Intersect or subtract

`POST /genemath/`

#### Data Format
``` sourceCode

    {
      'operator': one of 'Intersect' or 'Subtract',
      'left_chr': integer (column id),
      'left_start': integer (column id),
      'left_end':  integer (column id),
      'right_chr':  integer (column id),
      'right_start': integer (column id),
      'right_end':  integer (column id)
    }
```

#### Returns

JSON object representing the result table.
 

