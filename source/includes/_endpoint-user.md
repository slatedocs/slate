## Users

### Catalog

`/users/{?email,id}`

A successful GET on this resource returns a Shoji Catalog whose "index" URL's refer to User objects. If the "email" or "id" parameters are provided, the result is narrowed to Users matching those parameters.

This method only supports GET requests. To add users they need to be added from each account users' catalog. This endpoint ensures that the new users belong to an account and get an invitation accordingly.

### Entity

`/users/{id}/{?reason_url}`

A Shoji Entity with the following body members:
first_name
last_name
id
email
id_method (optional)
id_provider (optional, and only if id_method == 'oauth')

If the current user has the "alter_users" account permission, or is the viewed user, a hefty set of associated URL's is included. Otherwise, the current user must have the "view" permission for the viewed user, or receives 403 Forbidden.
 
The id_method member can be one of {'oauth', 'pwhash'}. If not present, 'pwhash' is assumed.

Any user can PUT new attributes via a JSON-like request body. A 200 indicates success.

`/users/{id}/invite/`

A POST to this resource sends an invitation from the current user to the identified User. A 204 indicates success. The current user must have "can_alter_users" account permission or 403 is returned instead.

If a "url_base" parameter is included in the request body, it will be used to form links inside the invitation.

`/users/{id}/password/`

A POST on this resource must consist of a JSON object with the members "old_pw" and "new_pw". A 204 indicates success.

`/users/{id}/password_reset/`

A GET on this resource always returns 204. A POST will send a reset password notification to the identified user. A 204 indicates success.

If a "url_base" parameter is included in the request body, it will be used to form links inside the notification.