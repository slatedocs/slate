## Teams

The teams API allows you to create and manage your Teams, their members and access to Datasets.

Creating teams

To start with the Teams API you will need to create a new Team by POSTing your new team entity to the /teams/ endpoint:

POST /teams/
{
  element: "shoji:entity",
  body: {
    name: "My new team with ytpo"
  }
}

The returning header will provide you with the URL of your new team, it will also be available under the /teams/ catalog. Naturally, since you created the team, you will be the team's owner:

GET /teams/

{
  element: "shoji:catalog",
  index: {
    http://host/teams/:teamId/: {
      name: "My new team with ytpo",
      owner: http://host/users/:ownerId/
    }
  }
}

To see all the information of your team, you can GET that team's detail URL
GET /teams/:teamId/

{
  element: "shoji:entity",
  body: {
    name: "My new team with ytpo",
    owner: http://host/users/:ownerId/
  },
  catalogs: {
    datasets: http://host/members/:teamId/datasets/, 
    members: http://host/members/:teamId/members/,
  }
}

To fix the team's name you need to PATCH the correct value to the team's detail endpoint.

PATCH /teams/:teamId/

{
  element: "shoji:entity",
  body: {
    name: "My new team without typo",
    owner: http://host/users/:ownerId/
  }
}

Managing teams' members

To add or remove users from a team, you will need to have the `manage_members` team's permissions. As a team owner you have this by default. To add users on the API you will first navigate to the member's detail page and follow the `members` catalog, you will find yourself as the only current member:

GET /teams/:teamId/members/
{
  element: "shoji:catalog",
  index: {
      http://host/users/:ownerId/: {
        display_name: "Owner's name",
        permissions: {
          manage_members: true,
        }
      }
  }
}

Adding members

Then proceed to add the users by PATCHing them with the permissions you want. They have to be existing users on the application, but they can be from any account:

PATCH /teams/:teamId/members/
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
GET /teams/:teamId/members/
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
Change members' permissions
To change a team member's pemissions, you can patch in the same way than adding users, just specifying the new permissions:
PATCH /teams/:teamId/members/
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
GET /teams/:teamId/members/
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
Removing members
To remove members, same as with other Shoji catalogs, it is needed to PATCH the catalog with the tuple set to `null`:
PATCH /teams/:teamId/members/
{
  element: "shoji:catalog",
  index: {
      http://host/users/:userId2/: null
  }
}
And userId2 will not be a member of the team anymore
GET /teams/:teamId/members/
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
Managing teams' datasets
The way of linking teams and datasets is by sharing the dataset with the team you want. The mechanics are exactly the same as to share a dataset with users, but with the difference that you will be sending in a team's URL instead of a user's url.
Another difference is that teams cannot have `edit` permissions assigned.
Add a dataset to a team
PATCH to the dataset's permissions catalog with the needed permissions.
PATCH /dataset/:datasetId/permissions/
{
  element: "shoji:catalog",
  index: {
    "http://host/teams/:teamId/": {
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
    "http://host/teams/:teamId/": null
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
Sharing notifications
Same as when sharing datasets with users, when a dataset is shared with a team all their members will receive a notification email indicating under which team the dataset has been shared with.
In the case that a user gets access to a dataset through many teams, they will only receive one email for one of the teams.
Versioning
Teams aren't versioned, so teams and membership are not restored when going back to in history. Dataset sharing is versioned though, so going back in history on a dataset will revert its access back in time as well, which means that if a team was not shared with the dataset at such point, it will not be accessible, just like the rest of permissions.
Endpoints
/teams/
GET: Returns the catalog of all the teams the logged user is a member of.
The tuples have the following shape:
{
  name: <str>,
  owner: <url>
}
POST: Allows to create new teams making the logged user their owner. All users have the capacity to create infinite teams. By default all created teams will have the creator as their initial member and will have the `manage_members` permission.
Expected payload:
{
  element: "shoji:entity",
  body: {
    name: <required str>
  }
}

/teams/id/
GET: Returns the details of a given team. You can only see the teams where you are a member of. The payload has the following shape:
{
  element: "shoji:entity",
  body: {
    name: <str>,
    owner: <url>
  },
  catalogs: {
    datasets: <url>,
    members: <url>,
  }
}
PATCH: Used to change the attributes of a team. Currently the only attribute that can be changed is the team's name. Expects the following payload:
{
  element: "shoji:entity",
  body: {
    name: <str>
  }
}
/teams/id/members/
GET: Returns the catalog of all team members, the payload has the following shape:
{
  element: "shoji:catalog",
  index: {
    <user url> {
      display_name: <str>,
      permissions: {
        manage_members: <bool>
      }
    }
  }
}
PATCH: Supports adding and deleting members from the team, expects the following payload:
{
  element: "shoji:catalog",
  index: {
    <user url> {  // Or null for removing users from team
      permissions: {   // optional, if blank or empty assumes all permissions False
        manage_members: <bool>
      }
    }
  }
}
/teams/id/datasets/
GET: Returns the list of datasets that have been shared with this team.
To add/remove datasets from here you have to PATCH each dataset's permissions endpoint to share them with the team,
