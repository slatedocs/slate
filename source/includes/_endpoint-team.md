## Teams

Teams contain references to users and datasets. By sharing a dataset with a team, you can grant access to a set of users at once, and by adding a user to a team, you can grant them access to a set of datasets.

### Catalog

`/teams/`

#### GET

```http
GET /teams/ HTTP/1.1
Host: beta.crunch.io
--------
200 OK
Content-Type: application/json
```

```json
// Example team catalog:
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/teams/",
    "description": "List of all the teams where the current user is member",
    "index": {
        "https://beta.crunch.io/api/teams/d07edb/": {
            "owner": "https://beta.crunch.io/api/users/41c69d/",
            "name": "The A-Team"
        },
        "https://beta.crunch.io/api/teams/67fe89/": {
            "owner": "https://beta.crunch.io/api/users/41c69d/",
            "name": "Palo Alto Data Science"
        }
    }
}
```

```r
teams <- getTeams()
names(teams)
## [1] "The A-Team" "Palo Alto Data Science"
```

#### POST

To create a new team, POST a Shoji Entity with a team "name" in the body. No other attributes are required, and you will be automatically assigned as the "owner". 

```http
POST /teams/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
...
{
    "element": "shoji:entity",
    "body": {
        "name": "My new team with ytpo"
    }
}
--------
201 Created
Location: /teams/03df2a/
```

```r
# Create a new team by assigning into the teams catalog
teams[["My new team with ytpo"]] <- list()
names(teams) # Let's see that it was created
## [1] "The A-Team" "Palo Alto Data Science"
## [3] "My new team with ytpo"

# You can also assign members to the team when you create it,
# even though the POST /teams/ API does not support it.
teams[["New team with members"]] <- list(members="fake.user@example.com")
```

### Entity

`/teams/{team_id}/`

#### GET 

```http
GET /teams/d07edb/ HTTP/1.1
Host: beta.crunch.io
--------
200 OK
Content-Type: application/json
```

```json
// Example team entity
{
    "element": "shoji:entity",
    "self": "https://beta.crunch.io/api/teams/d07edb/",
    "description": "Details for a specific team",
    "body": {
        "owner": "https://beta.crunch.io/api/users/41c69d/",
        "name": "The A-Team"
    },
    "catalogs": {
        "datasets": "https://beta.crunch.io/api/teams/d07edb/datasets/",
        "members": "https://beta.crunch.io/api/teams/d07edb/members/"
    }
}
```

```r
# Access a team by name using $ or [[ from the team catalog
a.team <- teams[["The A-Team"]]
name(a.team)
## [1] "The A-Team"
self(a.team)
## [1] "https://beta.crunch.io/api/teams/d07edb/"
```

A GET request on a team entity URL returns the same "name" and "owner" attributes as shown in the team catalog, as well as references to the "datasets" and "members" catalogs corresponding to the team. Authorization is required: if the requesting user is not a member of the team, a 404 response will result.

#### PATCH
Team names are editable by PATCHing the team entity. Authorization is required: only the team owner may edit the team's name; other team members will receive a 403 response on PATCH.

```http
PATCH /teams/03df2a/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
{
    "element": "shoji:entity",
    "body": {
        "name": "My new team without typo"
    }
}
--------
204 No Content
```

```r
name(teams[["My new team with ytpo"]]) <- "My new team without typo"
names(teams) # Check that it was updated
## [1] "The A-Team" "Palo Alto Data Science"
## [3] "My new team without typo"
```


### Team members catalog

`/teams/{team_id}/members/`

The team members catalog is a Shoji Catalog similar in nature to the [dataset permissions catalog](#permissions). It collects references to users and defines the authorizations they have with respect to the team. All information about the member relationships is contained in the catalog--there are no "member entities"--and all changes to team membership, whether adding, modifying, or removing users, is done via PATCH.

#### GET 

```http
GET /teams/d07edb/members/ HTTP/1.1
Host: beta.crunch.io
--------
200 OK
Content-Type: application/json
```
```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/teams/d07edb/members/",
    "description": "Catalog of users that belong to this team",
    "index": {
        "https://beta.crunch.io/api/users/47193a/": {
            "name": "B. A. Baracus",
            "permissions": {
                "manage_members": false
            }
        },
        "https://beta.crunch.io/api/users/41c69d/": {
            "name": "Hannibal",
            "permissions": {
                "manage_members": true
            }
        }
    }
}
```

```r
members(team)
```

Tuple values include:

Name | Type | Description
---- | ---- | -----------
name | string | Display name of the user
permissions | object | Attributes governing the user's authorization on the team.

Supported `permissions`, all boolean, include:

* **manage_members**: Whether the user may add or remove users from the team, as well as modify the permissions of users on the team; i.e., PATCH the member catalog. 

#### PATCH

Authorization is required: team members who do not have the "manage_members" permission and who attempt to PATCH the member catalog will receive a 403 response. As with the team entity, non-members will receive 404 on attempted PATCH.

PATCH a partial Shoji Catalog to add users to the team, to modify permissions of members already on the team, and to remove team members. The examples below illustrate each of those actions separately, but all can be done together in a single PATCH request, in fact. 

In the "index" attribute of the catalog, object keys must be either (a) URLs of User entities or (b) email addresses. They can be mixed in a single PATCH request. Using email address allows you to invite a user to Crunch while adding them to the team if they do not yet have a Crunch account, but it is also valid as a reference to Users that already exist. 

##### Add new members

```http
PATCH /teams/d07edb/members/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
{
    "element": "shoji:catalog",
    "index": {
        "https://beta.crunch.io/api/users/47193a/": {
            "permissions": {
                "manage_members": true
            }
        },
        "https://beta.crunch.io/api/users/e3211a/": {},
        "templeton.peck@army.gov": {
            "permissions": {
                "manage_members": true
            }
        }
    },
    "send_notification": true,
    "url_base": ""
}
--------
204 No Content
```

If the index object keys do not correspond to users already found in the member catalog, the indicated users will be added to the team. 

(discuss)

```http
GET /teams/d07edb/members/ HTTP/1.1
Host: beta.crunch.io
--------
200 OK
Content-Type: application/json
```
```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/teams/d07edb/members/",
    "description": "Catalog of users that belong to this team",
    "index": {
        "https://beta.crunch.io/api/users/47193a/": {
            "name": "B. A. Baracus",
            "permissions": {
                "manage_members": true
            }
        },
        "https://beta.crunch.io/api/users/41c69d/": {
            "name": "Hannibal",
            "permissions": {
                "manage_members": true
            }
        },
        "https://beta.crunch.io/api/users/e3211a/": {
            "name": "Howling Mad Murdock",
            "permissions": {
                "manage_members": false
            }
        },
        "https://beta.crunch.io/api/users/89eb3a/": {
            "name": "templeton.peck@army.gov",
            "permissions": {
                "manage_members": true
            }
        }
    }
}
```

##### Modify existing members' permissions

To change a team member's permissions, you can patch in the same way than adding users, just specifying the new permissions:

```http
PATCH /teams/d07edb/members/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
{
    "element": "shoji:catalog",
    "index": {
        "https://beta.crunch.io/api/users/89eb3a/": {
            "permissions": {
                "manage_members": false
            }
        }
    }
}
--------
204 No Content
```

```http
GET /teams/d07edb/members/ HTTP/1.1
Host: beta.crunch.io
--------
200 OK
Content-Type: application/json
```
```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/teams/d07edb/members/",
    "description": "Catalog of users that belong to this team",
    "index": {
        "https://beta.crunch.io/api/users/47193a/": {
            "name": "B. A. Baracus",
            "permissions": {
                "manage_members": true
            }
        },
        "https://beta.crunch.io/api/users/41c69d/": {
            "name": "Hannibal",
            "permissions": {
                "manage_members": true
            }
        },
        "https://beta.crunch.io/api/users/e3211a/": {
            "name": "Howling Mad Murdock",
            "permissions": {
                "manage_members": false
            }
        },
        "https://beta.crunch.io/api/users/89eb3a/": {
            "name": "templeton.peck@army.gov",
            "permissions": {
                "manage_members": false
            }
        }
    }
}
```

##### Removing members

To remove members, same as with other Shoji catalogs, it is needed to PATCH the catalog with the tuple set to `null`:


```http
PATCH /teams/d07edb/members/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
```json
{
    "element": "shoji:catalog",
    "index": {
        "https://beta.crunch.io/api/users/e3211a/": null
    }
}
--------
204 No Content
```


```http
GET /teams/d07edb/members/ HTTP/1.1
Host: beta.crunch.io
--------
200 OK
Content-Type: application/json
```
```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/teams/d07edb/members/",
    "description": "Catalog of users that belong to this team",
    "index": {
        "https://beta.crunch.io/api/users/47193a/": {
            "name": "B. A. Baracus",
            "permissions": {
                "manage_members": true
            }
        },
        "https://beta.crunch.io/api/users/41c69d/": {
            "name": "Hannibal",
            "permissions": {
                "manage_members": true
            }
        },
        "https://beta.crunch.io/api/users/89eb3a/": {
            "name": "templeton.peck@army.gov",
            "permissions": {
                "manage_members": false
            }
        }
    }
}
```

### Team datasets catalog

`/teams/{team_id}/datasets/`

The team datasets catalog only supports the GET verb. To add a dataset to a team, you must PATCH its [permissions catalog](#permissions). 

#### GET

GET returns a Shoji Catalog of datasets that have been shared with this team. This is a subset of the datasets in `/datasets/`. See [datasets](#datasets) for details.
