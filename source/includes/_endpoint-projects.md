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

##### GET

##### PATCH

#### Datasets

Will list all the datasets that have this project as their owner.

##### GET

##### PATCH
