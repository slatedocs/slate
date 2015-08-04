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

#### PATCH

Authorization is required: team members who do not have the "manage_members" permission and who attempt to PATCH the member catalog will receive a 403 response. As with the team entity, non-members will receive 404 on attempted PATCH.

##### Add new members

{
  element: "shoji:catalog",
  index: {
      http://host/users/:userId1/: {
        permissions: {
          manage_members: true,
        }
      },
      http://host/users/:userId2/: {}
  }
}

On the above example, userId1 has `manage_members` permissions granted, as of userId2 is a regular member. Looking the at the catalog again:
GET /teams/{team_id}/members/
{
  element: "shoji:catalog",
  index: {
      http://host/users/:ownerId/: {
        display_name: "Owner's name",
        permissions: {
          manage_members: true,
        }
      },
      http://host/users/:userId1/: {
        display_name: "User one",
        permissions: {
          manage_members: true
        }
      },
      http://host/users/:userId2/: {
        display_name: "User two",
        permissions: {
          manage_members: false
        }
      }
  }
}
Notice how it is possible for many members of the team to have the `manage_members` permission enabled simultaneously.

##### Modify existing members' permissions

To change a team member's permissions, you can patch in the same way than adding users, just specifying the new permissions:
PATCH /teams/{team_id}/members/
{
  element: "shoji:catalog",
  index: {
      http://host/users/:userId1/: {
        permissions: {
          manage_members: false,
        }
      }
  }
}
Then verify the changes
GET /teams/{team_id}/members/
{
  element: "shoji:catalog",
  index: {
      http://host/users/:ownerId/: {
        display_name: "Owner's name",
        permissions: {
          manage_members: true,
        }
      },
      http://host/users/:userId1/: {
        display_name: "User one",
        permissions: {
          manage_members: false
        }
      },
      http://host/users/:userId2/: {
        display_name: "User two",
        permissions: {
          manage_members: false
        }
      }
  }
}

##### Removing members

To remove members, same as with other Shoji catalogs, it is needed to PATCH the catalog with the tuple set to `null`:
PATCH /teams/{team_id}/members/
{
  element: "shoji:catalog",
  index: {
      http://host/users/:userId2/: null
  }
}
And userId2 will not be a member of the team anymore
GET /teams/{team_id}/members/
{
  element: "shoji:catalog",
  index: {
      http://host/users/:ownerId/: {
        display_name: "Owner's name",
        permissions: {
          manage_members: true,
        }
      },
      http://host/users/:userId1/: {
        display_name: "User one",
        permissions: {
          manage_members: false
        }
      }
  }
}

### Team datasets catalog

`/teams/{team_id}/datasets/`

#### GET

Managing teams' datasets
The way of linking teams and datasets is by sharing the dataset with the team you want. The mechanics are exactly the same as to share a dataset with users, but with the difference that you will be sending in a team's URL instead of a user's url.
Another difference is that teams cannot have `edit` permissions assigned.
Add a dataset to a team
PATCH to the dataset's permissions catalog with the needed permissions.
PATCH /dataset/:datasetId/permissions/
{
  element: "shoji:catalog",
  index: {
    "http://host/teams/{team_id}/": {
      "dataset_permissions": {
        view: true,
      }
    }
  }
}
Remove a dataset from a team
Similarly, to remove a dataset from a team, the steps are the same as to unshare the team from the dataset. A PATCH is required with `null` as the tuple's value
PATCH /dataset/:datasetId/permissions/
{
  element: "shoji:catalog",
  index: {
    "http://host/teams/{team_id}/": null
  }
}
Coalesced access
When a team is granted access to a dataset, all the users in that team have the specified access on such dataset. If a user has access to a dataset from different sources, be it by multiple teams or by direct sharing, the final permissions will be the max of all the permissions granted.
The access you have on the dataset will be using those coalesced permissions.
Your final permissions for each dataset will be available on the dataset catalog under the `permission` key, it will always contain the values for all permissions.
GET /datasets/
{
  element: "shoji:catalog",
  index: {
    "http://host/datasets/:dsId/": {
      name: "my dataset",
      description:  <str>,
      id: <uuid>, 
      archived: <bool>,
      owner_id: <url>,
      owner_display_name: <str>,
      permissions: {
        view: <bool>,
        add_users: <bool>,
        change_permissions: <bool>,
        edit: <bool>,
        change_weight: <bool>,
      },
    }
  }
}
