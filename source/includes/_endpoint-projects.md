## Projects

Projects are ....

They live under /projects/ and will list the projects that the logged user
is a member or owner of.

### Catalog

The projects catalog will list all the projects the logged user is a member of.
Here you can create new projects via POST

#### GET

```http
GET /projects/ HTTP/1.1
```

```json
{
  "element": "shoji:catalog",
  "self": "http:\/\/local.crunch.io:8080\/api\/projects\/",
  "index": {
    "http:\/\/local.crunch.io:8080\/api\/projects\/4643\/": {
      "name": "Project 1",
      "id": "4643"
    },
    "http:\/\/local.crunch.io:8080\/api\/projects\/6c01\/": {
      "name": "Project 2",
      "id": "6c01"
    }
  }
}
```

#### POST

New projects need a name (no uniqueness enforced) and will belong to the logged
user, making it its initial member.

```http
POST /projects/ HTTP/1.1
```

Payload example:

```json
{
    "body": {
        "name": "My new project"
    }
}
```

### Entity

#### GET

```http
GET /projects/abcd/ HTTP/1.1
```

```json
{
  "element": "shoji:entity",
  "self": "http:\/\/local.crunch.io:8080\/api\/projects\/6c01\/",
  "catalogs": {
    "datasets": "http:\/\/local.crunch.io:8080\/api\/projects\/6c01\/datasets\/",
    "members": "http:\/\/local.crunch.io:8080\/api\/projects\/6c01\/members\/"
  },
  "body": {
    "name": "Project 2"
  }
}
```

#### DELETE

Deleting a project will *NOT* delete its datasets. It will change their 
ownership to the logged user.

```http
DELETE /projects/abcd/ HTTP/1.1
```

#### Members

Use this endpoint to manage the users that have access to this project.

##### GET

Returns a catalog with all users that have access to this project in the 
following format:

```http
GET /projects/abcd/members/ HTTP/1.1
```

```json
{
  "element": "shoji:catalog",
  "self": "http:\/\/local.crunch.io:8080\/api\/projects\/6c01\/members\/",
  "index": {
    "http:\/\/local.crunch.io:8080\/api\/users\/00002\/": {
      "name": "Jean-Luc Picard",
      "email": "captain@crunch.io"
    },
    "http:\/\/local.crunch.io:8080\/api\/users\/00005\/": {
      "name": "William Riker",
      "email": "firstofficer@crunch.io"
    }
  }
}
```


##### PATCH

Use this method to add or remove members from the project. Only the project owner
has this capabilities, else you will get a 403 response.

To add a new user, PATCH a catalog keyed by the new user URL and an empty
object for its value.

To remove users, PATCH a catalog keyed by the user you want to remove and `null`
for its value.

Note that you cannot remove the project owner from the project, you will
get a 409 response.

It is possible to perform many additions/removals in one request, the 
following example adds users `/users/001/` and deletes users `/users/002/`


```http
PATCH /projects/abcd/members/ HTTP/1.1
```

```json
{
  "element": "shoji:catalog",
  "self": "http:\/\/local.crunch.io:8080\/api\/projects\/6c01\/members\/",
  "index": {
    "http:\/\/local.crunch.io:8080\/api\/users\/001\/": {},
    "http:\/\/local.crunch.io:8080\/api\/users\/002\/": null
  }
}
```


#### Datasets

Will list all the datasets that have this project as their owner.

##### GET

##### PATCH
