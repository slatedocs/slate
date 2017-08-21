## Users

### Catalog

`/users/{?email,id}`

A successful GET on this resource returns a Shoji Catalog whose "index" URL's 
refer to User objects. If the "email" or "id" parameters are provided, the 
result is narrowed to Users matching those parameters.

This method only supports GET requests. To add users they need to be added from 
each account users' catalog. This endpoint ensures that the new users belong to 
an account and get an invitation accordingly.

### Entity

`/users/{id}/{?reason_url}`

A Shoji Entity with the following body members:

- name
- id
- email
- id_method (optional)
- id_provider (optional, and only if id_method == 'oauth')

The id_method member can be one of {'oauth', 'pwhash'}. If not present, 'pwhash' is assumed.


The authenticated user can only access another user's entity endpoint IF any
of the following are true:

 * Both belong to the same account
 * They are both members of a common team
 * Authenticated user is account admin and viewed user is collaborator on such account

A user themselves or with "alter_users" account permission can PUT new 
attributes via a JSON-like request body. A 200 indicates success.

#### Send invitation email

`/users/{id}/invite/`

A POST to this resource sends an invitation from the current user to the 
identified User. A 204 indicates success. The current user must have 
"can_alter_users" account permission or 403 is returned instead.

If a "url_base" parameter is included in the request body, it will be used to 
form links inside the invitation.

#### Change password

`/users/{id}/password/`

A POST on this resource must consist of a JSON object with the members 
"old_pw" and "new_pw". A 204 indicates success, a 400 indicates failure.

<aside class="notice">
    Please refer to the [password policy](#Password-policy) for information on
    what the requirements are for a password.
</aside>

#### Reset user's password

`/users/{id}/password_reset/`

A GET on this resource always returns 204. A POST will send a reset password 
notification to the identified user. A 204 indicates success.

If a "url_base" parameter is included in the request body, it will be used to 
form links inside the notification.

#### Change user's email

`/users/{id}/change_email/`

A POST on this resource must consist of a JSON object with the members "pw" and 
"email". A 204 indicates potential success to change the users email address to 
the newly provided email. The user should check their email and verify they own 
the email address in question.

If the password does not match the users current password they will receive an
error message (400 Bad Request). If the user is an oauth account, then the email
 address may not be changed (409 Conflict).

If the user ID does not match the current signed in user, an 403 Forbidden will be sent back.


##### Expropriate a user

An account admin can expropriate a user from the same account. This will change
ownership of all of the affected user's teams, projects and datasets to a new
owner.

The new owner must also be part of the same account and should have 
`create_datasets` permissions set to `true`.

`POST /users/{id}/expropriate/`

````json
{
  "element": "shoji:entity",
  "body": {
    "owner": "http://app.crunch.io/api/users/123abc/"
  }
}
````

The new owner provided can be a user URL or a user email.
##### User Datasets

`/account/users/{id}/datasets/`

This URL is only accessible and available to account admins. 

This Shoji catalog lists all the datasets that are owned by this user.


##### User Visible datasets

`/users/{id}/visible_datasets/`

This endpoint is only available and accessible to account admins.

Returns a Shoji catalog listing all the datasets (archived or not) that a any
user has access to, either via direct share, via team access or project membership.

```json
{
    "https://app.crunch.io/api/datasets/wsx345/": {
        "name": "survey data",
        "last_access_time": "2017-02-25",
        "access_type": {
            "teams": ["https://app.crunch.io/api/teams/abx/"],
            "project": "https://app.crunch.io/api/projects/qwe/",
            "direct": true
        },
        "permissions": {
          "edit": true,
          "view": true,
          "change_permissions": true
        }
    },
    "https://app.crunch.io/api/datasets/a2c4b2/": {
        "name": "responses dataset",
        "last_access_time": "2016-11-09",
        "access_type": {
            "teams": [],
            "project": null,
            "direct": true
        },
        "permissions": {
          "edit": false,
          "view": true,
          "change_permissions": false
        }
    }
}
```

The tuples contain information of the type of access the user has to each 
dataset via the `access_type` attribute. It includes:
 
 * The list of teams that provide access to this dataset
 * The project that provides access to this dataset or null
 * If the user has a direct share to this dataset
 
The `permissions` attribute indicates the final coalesced permissions this 
user enjoys on the given dataset.