## Accounts

Accounts provide an organization-level scope for Crunch.io customers. All Users belong to one and only one Account. Account managers can administer their various users and entities and have visibility on them. 

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
GET /accounts/1234/
```

```json
{
  "element": "shoji:entity",
  "body": {
    "name": "Account's name",
    "oauth_providers": [{
      "id": "provider",
      "name": "Service auth"
    }, {
      "id": "provider",
      "name": "Service auth"
    }]
  },
  "catalogs": {
    "teams": "http://app.crunch.io/api/accounts/abcd/teams/",
    "projects": "http://app.crunch.io/api/accounts/abcd/projects/",
    "users": "http://app.crunch.io/api/accounts/abcd/users/",
    "datasets": "http://app.crunch.io/api/accounts/abcd/datasets/"
  }
}
```

### Account users

Provides a catalog of all the users that belong to this account. Any account
member can GET, but only account managers can POST/PATCH on it.

#### GET

```http
GET /accounts/1234/users/
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
POST /accounts/1234/users/
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
      "id_method": "pwhash/oauth",
      "id_provider": "",
      "send_invite": true,
      "url_base": "http://app.crunch.io/"
  }
}
```


#### PATCH
PATCH to the users' catalog allows account admins to edit users' permissions
in batch. It is only possible to change the `account_permissions` attribute.
Additionally, it is possible to delete users from the account by sending `null`
as their tuple.

```http
PATCH /accounts/1234/users/
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
    "http://app.crunch.io/api/users/234/": null,
  }
}
```


### Account datasets

Only account managers have access to this catalog. It is a read only shoji 
catalog containing all the datasets that users of this account have 
created (potentially very large catalog).

Account managers have implicit editor access to all the account datasets.

```http
GET /accounts/1234/datasets/
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
GET /accounts/1234/projects/
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
GET /accounts/1234/teams/
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
