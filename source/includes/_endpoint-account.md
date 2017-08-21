## Accounts

Accounts provide an organization-level scope for Crunch.io customers. All Users
belong to one and only one Account. Account managers can administer their
various users and entities and have visibility on them.

### Permissions

A user is an "account manager" if their `account_permissions` have
`alter_users` set to `True`.

### Account entity

The account entity is available on the API root following the Shoji
`views.account` path, which will point to the authenticated user's account.

If the account has a name, it will be available here, as well as the path to the
account's users.

If the authenticated user is an account manager, the response will include
paths to these additional catalogs:
 * Account projects
 * Account teams
 * Account datasets

#### GET

```http
GET /account/
```

```json
{
  "element": "shoji:entity",
  "body": {
    "name": "Account's name",
    "id": "abcd",
    "oauth_providers": [{
      "id": "provider",
      "name": "Service auth"
    }, {
      "id": "provider",
      "name": "Service auth"
    }]
  },
  "catalogs": {
    "teams": "http://app.crunch.io/api/account/teams/",
    "projects": "http://app.crunch.io/api/account/projects/",
    "users": "http://app.crunch.io/api/account/users/",
    "datasets": "http://app.crunch.io/api/account/datasets/",
    "applications": "http://app.crunch.io/api/account/applications/"
  }
}
```

#### Applications

```http
GET /account/applications/
```

GET returns a Shoji Catalog with the list of all the configured subdomains an account has.

```json
{
    "element":"shoji:catalog",
    "index": {
        "./mycompany/": {}
    }
}
```

POST a Shoji Entity here to make a new application. The `subdomain`:

 * must be unique system-wide, case insensitive
 * can only contain letters, numbers, and `-` (dash)
 * must be between 3 and 32 characters in length
 * cannot start with `-` or a number
 
If the requested subdomain is unavailable or invalid, the server will return a 400 response.

```json
{
    "element": "shoji:entity",
    "body": {
      "name": "my company",
      "subdomain": "mycompany",
      "palette": {
          "brand": {
                "primary": "#FFAABB", // Color of links, interactable things
                "secondary": "#G4EEBB", // Titles and such
                "message": "#BAA5E7"
            }
      },
      "manifest": {}
    }
}
```

Attributes `name` and `subdomain` are required; `palette` and `manifest` are optional. Note that you cannot specify logos in the POST request. Use the created entity's `logo/` resource to upload the image files to the
app (see below).


##### Application entity

```http
GET /account/applications/app_id/
```

GET this endpoint for a Shoji Entity containing all details about
the configured application.

```json
{
    "element":"shoji:entity",
    "body": {
        "name": "Application name",
        "subdomain": "mycompany",
        "logos": {
            "small": "<URL>",
            "large": "<URL>",
            "favicon": "<URL>"
        },
        "palette": {
            "brand": {
                "primary": "#FFAABB", // Color of links, interactable things
                "secondary": "#G4EEBB", // Titles and such
                "message": "#BAA5E7"
            }
        },
        "manifest": {}
    },
    "views": {
        "logo": "https://app.crunch.io/api/account/applications/mycompany/logo/"
    }
}
```

PATCH this endpoint to change the name, palette, or manifest. Logos are controlled by the logo subresource.


Attribute | Type | Description
----------|------|----------------
name      | string| Name of the configured application on the given subdomain
logo      | object| Contains two attributes, `large`, `small` and `favicon`, with different resolution company logos
palette   | object| Contains three colors, `primary`, `secondary` and `message`, under the `brand` attribute to theme the web app
manifest  | object| Optional, contains further client configurations



##### Change application logo

```http
POST /account/applications/app_id/logo/
```

To set/change an application's logo the client needs to make a `multipart/form-data`
request containing either or both `large` and `small` fields containing the desired
image files to use. Only account admins are authorized to change this resource.


```http
POST /account/applications/app_id/logo/ HTTP/1.1
Content-Type: multipart/form-data; boundary=----------123456789
Content-Length: 500326

----------123456789
Content-Disposition: form-data; name="large"; filename="newlogo.jpg"
Content-Type: image/jpeg

xxxxxxxxxx
----------123456789
Content-Disposition: form-data; name="small"; filename="newlogo_small.jpg"
Content-Type: image/jpeg

xxxxxxxxxx
----------123456789--
```

```http
HTTP/1.1 204
```

The server will update the images accordingly. The only valid file extensions 
are GIF, JPEG and PNG image files.

### Account users

Provides a catalog of all the users that belong to this account. Any account
member can GET, but only account managers can POST/PATCH on it.

#### GET

```http
GET /account/users/
```

```json
{
  "element": "shoji:catalog",
  "index": {
    "http://app.crunch.io/api/users/123/": {
      "id_method": "pwhash",
      "id_provider": null,
      "email": "email@example.com",
      "name": "Steve Austin",
      "dataset_permissions": {
        "view": true,
        "edit": false
      },
      "account_permissions": {
        "alter_users": false,
        "create_datasets": false
      }
    },
    "http://app.crunch.io/api/users/234/": {
      "id_method": "pwhash",
      "id_provider": null,
      "email": "email1@example.com",
      "name": "Shawn Michaels",
      "dataset_permissions": {
        "view": true,
        "edit": true
      },
      "account_permissions": {
        "alter_users": true,
        "create_datasets": true
      }
    },
    "http://app.crunch.io/api/users/345/": {
      "id_method": "oauth",
      "id_provider": "google",
      "email": "email2@example.com",
      "name": "Rocky Maivia",
      "dataset_permissions": {
        "view": true,
        "edit": true
      },
      "account_permissions": {
        "alter_users": false,
        "create_datasets": true
      }
    }
  }
}
```

#### POST

Account members can POST to the account's users catalog to create new users.
If the a user with the provided email address already exists in the application
(on another account), the server will return a 400 response.

```http
POST /account/users/
```

```json
{
  "element": "shoji:entity",
  "body": {
      "email": "new_email@example.com",
      "name": "Initial name",
      "account_permissions": {
        "alter_users": false,
        "create_datasets": true
      },
      "teams": ["<list of team urls>"],
      "projects": ["<list of project urls>"],
      "id_method": "pwhash/oauth",
      "id_provider": "",
      "send_invite": true,
      "url_base": "http://app.crunch.io/"
  }
}
```

It is possible to create a user to belong to different teams or projects by 
including those teams or projects' urls in the payload, for example:


```json
{
  "element": "shoji:entity",
  "body": {
      "email": "new_email@example.com",
      "name": "Initial name",
      "account_permissions": {
        "alter_users": false,
        "create_datasets": true
      },
      "teams": ["https://app.crunch.io/api/teams/abc/", "https://app.crunch.io/api/teams/123/"],
      "projects": ["https://app.crunch.io/api/projects/def/"],
      "id_method": "pwhash"
  }
}
```

The `teams` and `projects` attributes are optional and can be omited or empty
lists. 



#### PATCH
PATCH to the users' catalog allows account admins to edit users' permissions
in batch. It is only possible to change the `account_permissions` attribute.
Additionally, it is possible to delete users from the account by sending `null`
as their tuple.

```http
PATCH /account/users/
```

```json
{
  "element": "shoji:catalog",
  "index": {
    "http://app.crunch.io/api/users/123/": {
      "account_permissions": {
        "alter_users": false,
        "create_datasets": false
      }
    },
    "http://app.crunch.io/api/users/234/": null
  }
}
```


### Account datasets

Only account managers have access to this catalog. It is a read only shoji
catalog containing all the datasets that users of this account have
created (potentially very large catalog).

Account managers have implicit editor access to all the account datasets.

```http
GET /account/datasets/
```

```json
{
  "element": "shoji:catalog",
  "index": {
        "https://app.crunch.io/api/datasets/cc9161/": {
            "owner_name": "James T. Kirk",
            "name": "The Voyage Home",
            "description": "Stardate 8390",
            "archived": false,
            "size": {
                "rows": 1234,
                "columns": 67
            },
            "is_published": true,
            "id": "cc9161",
            "owner_id": "https://app.crunch.io/api/users/685722/",
            "start_date": "2286",
            "end_date": null,
            "streaming": "no",
            "creation_time": "1986-11-26T12:05:00",
            "modification_time": "1986-11-26T12:05:00",
            "current_editor": "https://app.crunch.io/api/users/ff9443/",
            "current_editor_name": "Leonard Nimoy"
        },
        "https://app.crunch.io/api/datasets/a598c7/": {
            "owner_name": "Spock",
            "name": "The Wrath of Khan",
            "description": "",
            "archived": false,
            "size": {
                "rows": null,
                "columns": null
            },
            "is_published": true,
            "id": "a598c7",
            "owner_id": "https://app.crunch.io/api/users/af432c/",
            "start_date": "2285-10-03",
            "end_date": "2285-10-20",
            "streaming": "no",
            "creation_time": "1982-06-04T09:16:23.231045",
            "modification_time": "1982-06-04T09:16:23.231045",
            "current_editor": null,
            "current_editor_name": null
        }
  }
}
```

### Account projects

This catalog is available for account managers and lists all the projects
that the users have created. Account managers have implicit edit access on all
projects.

```http
GET /account/projects/
```

```json
{
  "element": "shoji:catalog",
  "index": {
        "https://app.crunch.io/api/projects/cc9161/": {
          "name": "Project 1",
          "id": "cc9161",
          "owner": "http://app.crunch.io/api/users/abcdef/"
        },
        "https://app.crunch.io/api/projects/a598c7/": {
          "name": "Project 2",
          "id": "a598c7",
          "owner": "http://app.crunch.io/api/users/123456/"
        }
  }
}
```


### Account teams

This catalog is available for account managers and lists all the teams
that the users have created. Account managers have implicit edit access on all
teams.

```http
GET /account/teams/
```

```json
{
  "element": "shoji:catalog",
  "index": {
        "https://app.crunch.io/api/teams/cc9161/": {
          "name": "Team 1",
          "id": "cc9161",
          "owner": "http://app.crunch.io/api/users/123456/"
        },
        "https://app.crunch.io/api/teams/a598c7/": {
          "name": "Team 2",
          "id": "a598c7",
          "owner": "http://app.crunch.io/api/users/123456/"
        }
  }
}
```

### Account Collaborators

An account collaborator is a Crunch.io user that is not a member of your account
and has access to some/any of your account's datasets.

Account admins can visit the account's collaborators catalog to view the list
of all collaborators for all datasets of the account.

```http
GET /account/collaborators/
```

This catalog lists all the users that are not members of the account that have
access to any of the account's datasets, projects or teams.

Each element in the catalog tuple links to the user's entity endpoint and 
has the name and email attribute.

```json
{
  "element": "shoji:catalog",
  "index": {
        "https://app.crunch.io/api/users/cc9161/": {
          "name": "John doe",
          "email": "user1@example.com",
          "active": true,
        },
        "https://app.crunch.io/api/users/a598c7/": {
          "name": "John notdoe",
          "email": "user2@example.com",
          "active": true,
        }
  }
}
```

#### Collaborators order

```http
GET /account/collaborators/order/
```

It is possible to group collaborators using a Shoji order.

It is possible to PATCH the `graph` attribute with a standard shoji order payload
indicating the groups and collaborators (user URLs) for each group.

#### Collaborators datasets

The full list of datasets a collaborator has access to is available through
its user's entity endpoint by following the `visible_datasets` catalog.