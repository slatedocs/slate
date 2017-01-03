## Users

### Catalog

`/users/{?email,id}`

A successful GET on this resource returns a Shoji Catalog whose "index" URL's refer to User objects. If the "email" or "id" parameters are provided, the result is narrowed to Users matching those parameters.

This method only supports GET requests. To add users they need to be added from each account users' catalog. This endpoint ensures that the new users belong to an account and get an invitation accordingly.

### Entity

`/users/{id}/{?reason_url}`

A Shoji Entity with the following body members:

- name
- id
- email
- id_method (optional)
- id_provider (optional, and only if id_method == 'oauth')

If the current user has the "alter_users" account permission, or is the viewed user, a hefty set of associated URL's is included. Otherwise, the current user must have the "view" permission for the viewed user, or receives 403 Forbidden.

The id_method member can be one of {'oauth', 'pwhash'}. If not present, 'pwhash' is assumed.

A user themselves or with "alter_users" account permission can PUT new attributes via a JSON-like request body. A 200 indicates success.

`/users/{id}/invite/`

A POST to this resource sends an invitation from the current user to the identified User. A 204 indicates success. The current user must have "can_alter_users" account permission or 403 is returned instead.

If a "url_base" parameter is included in the request body, it will be used to form links inside the invitation.

`/users/{id}/password/`

A POST on this resource must consist of a JSON object with the members "old_pw" and "new_pw". A 204 indicates success, a 400 indicates failure.

<aside class="notice">
    Please refer to the [password policy](#Password-policy) for information on
    what the requirements are for a password.
</aside>

`/users/{id}/password_reset/`

A GET on this resource always returns 204. A POST will send a reset password notification to the identified user. A 204 indicates success.

If a "url_base" parameter is included in the request body, it will be used to form links inside the notification.

`/users/{id}/change_email/`

A POST on this resource must consist of a JSON object with the members "pw" and "email". A 204 indicates potential success to change the users email address to the newly provided email. The user should check their email and verify they own the email address in question.

If the password does not match the users current password they will receive an error message (400 Bad Request). If the user is an oauth account, then the email address may not be changed (409 Conflict).

If the user ID does not match the current signed in user, an 403 Forbidden will be sent back.
