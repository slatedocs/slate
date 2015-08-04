## Permissions

Authorization to view, edit, and manage a dataset is controlled by the dataset's permissions catalog:

`/datasets/{id}/permissions/`

The permissions catalog is a Shoji Catalog that collects (not contains) Users. There are no permission "entities" to retrieve, create, or delete: all action is achieved directly on the permissions catalog.

### GET Catalog

```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/1/permissions/",
    "description": "Lists all the users that have access to this dataset",
    "index": {
        "https://beta.crunch.io/api/users/42/": {
            "dataset_permissions": {
                "edit": true,
                "change_permissions": true,
                "add_users": true,
                "view": true
            },
            "is_owner": true,
            "name": "Lauren Ipsum",
            "email": "lipsum@crunch.io"
        }
    }
}
```

If authorized to view the dataset, a successful GET returns a Shoji Catalog indicating the users who have access to this dataset and their respective permissions. This includes the current, authorized user making the request. Index tuples are keyed by User URL. 

Tuple values include:

Name | Type | Description
---- | ---- | -----------
name | string | Display name of the user
email | string | Email address of the user
is_owner | boolean | Whether this user is the dataset's "owner"
dataset_permissions | object | Attributes governing the user's authorization. See below.

Supported `dataset_permissions`, all boolean, are:

* **view**: Whether the user can view the dataset. Note that "viewing" is not limited to just GET requests, for dataset viewers may create filters, private variables, and saved analyses, for example.
* **edit**: Whether the user can edit the dataset. When editing, users with this permission may modify the common data of a dataset, including things like public filters available to all viewers of the dataset.
* **add_users**: Whether the user may share this dataset with others. Specifically, they may PATCH the catalog with references to users not already included in the catalog.
* **change_permissions**: Whether the user may alter other users' authorization on this dataset, i.e., PATCH tuples for users that already exist on the catalog.

### PATCH Catalog

The PATCH verb is used to make all modifications to dataset authorization: modifying existing permissions, revoking permissions for users with access, and granting access to users. 

#### Modify existing

To change the permissions a user has, PATCH new dataset_permissions, like:

```json
{
    "https://beta.crunch.io/api/users/42/": {
        "dataset_permissions": {
            "edit": bool,
            "view": bool,
            ...
        }
    },
    ...,
    "send_notification": bool
 }
```

Only the "dataset_permissions" key in the tuple can be modified by PATCHing this catalog. Other keys, such as "name", are included only for facilitating human-readable display of the catalog. If sent, these other keys will be ignored. To modify users' names, see users.

If a subset of dataset_permissions are included in the payload, only the specified permissions will have their values updated. Omitted permissions will remain unchanged.

Multiple users' permissions can be modified in a single request by including multiple tuples keyed by User URL. 

The "send_notification" key in the payload is optional; if included and True, the server will send an email invitation to all newly added users (see below), as well as to users who are granted "edit" privileges. 

#### Add new user from within account

To add a user (i.e. share with them), there are two cases. First, if the user to be added is a member of the current user's account, PATCH similar to above, using this user's URL as key:

```json
{
    "/users/id/": {
        "dataset_permissions": {
            "edit": bool,
            "view": bool,
            ...
        },
        "profile": {
            "weight":, 
            "applied_filters": [],
            ...
        }
    },
    ...
}
```
This payload may include a "profile" member, which are initial values with which to populate the sharee's user-dataset-profile. 

Valid "profile" members include:

* **weight**: a URL to one of the dataset's weight variables; if omitted, the sharer's current weight variable will be used
* **applied_filters**: an array of filter URLs which are shared with all dataset viewers. If any of the specified filters are private, the PATCH request will return 400 status. Default value for "applied_filters" is [].

If the "profile" member is not included, the newly shared users will be created with their user dataset preferences matching the sharer's current weight.

#### Revoking access

To revoke users' access to this dataset (aka "unshare" with them), PATCH a null tuple for their user URLs:

```json
{
    "/users/id/": null,
    ...
}
```

Note that all of these PATCHes for add/edit/remove access to the dataset can be done in a single request that combines them all. 

#### Validation

The server will insist, and clients should also validate, that

* There is one and only one user with edit: true privileges for a dataset; if not, the PATCH request will return 400.
* The users who are receiving new authorization via PATCH must have corresponding dataset_permissions on their account authorization. For example, the user who is updated to have edit: true has a dataset_permission of edit: true on their account authorization. If not, the PATCH request will return 400.
* The user that is PATCHing this catalog must have share: true for this dataset; if not, the PATCH request will return 403.

#### Inviting new users

It is possible to share a dataset with people that are not users of Crunch yet. To do so, it is necessary to send in an email address instead of a user URL as a sharing key.

```json
{
    "somebody@email.com": {
        "dataset_permissions": {
            "edit": bool,
            "view": bool,
            ...
        },
        /*
        "profile": {
            "weight":, 
            "applied_filters": [],
            ...
        }
        */
    },
    ...
}
```

A new user with such email address will be created and added to the account of the user that is making the request. The new user will receive an invitation email to Crunch.io with an activation link. In case the user exists on other or the same account, no changes to the user will be made.

If "send_notification" was also sent in the request, the user will receive a notification email informing her about the new shared dataset if requested so.

In order to render the proper email activation link for the new users it will be necessary that the client includes an extra key on the index named `base_url` which should contain a URL mask for the server to replace a password change token. It should be of the shape:

`url_base: "http://app.domain.io/password/change/${token}/"`

Where `${token}` will be replaced by the server with the appropriate value.