# Roles

## Create a new role

<aside class="warning">
This section is still under construction. For some reason this isn't working in Firefox, but it is still better than Chrome
</aside>

## Delete a role

<aside class="warning">
BATCH
</aside>

## Query somebody's roles

> Example Request

```
curl https://webapp.kotive.com/api/group/<group_id>/personRoles?personId=<person_id>
	-H 'Authorization: Basic <token>'
```

> Example Response

```
{
  "personRoles": [{
    "id": 359,
    "userId": 130,
    "roleId": 26,
    "groupId": 246
  }]
}
```

* Endpoint: `/group/<group_id>/personRoles?personID=<person_id>`
* Request: `GET`

Not sure what your boss actually does all day? Here's a quick and easy way to find out using our API:

Again, you'll first need the `group_id` of the list, otherwise we won't know where to look. This is easy to get, as it is in the `groupsIndex` part of the login response from earlier!

In order to know who to query (apparently it is unethical to know everything about everybody and use it against them), we also need the Person ID of the person we want to query. This is obtained from the `id` field of the get a list of users response. You simply look through that for the user that you're curious about (a.k.a. your boss), and BAM, their Person ID is in the `id` field.

Now that you have these values, you plonk them in the URL of a `GET` request to `/group/<group_id>/personRoles?personID=<person_id>`, and we'll return a JSON string with a list of all of the roles that that user has!

## Add a role to a user

> Example Request

```
curl https://webapp.kotive.com/api/personRoles
	-H 'Authorization: Basic <token>'
	-H "Content-Type: application/json"
	-X POST
	-d '{"personRole":{"userId": <user_id>, "roleId": <role_id>, "groupId": <group_id>}}'
```

> Remember to insert your own values into <user_id>, <role_id> and <group_id>

> Example Response

```
{
  "personRole": {
    "id": 364,
    "userId": 130,
    "roleId": 2,
    "groupId": 246
  }
}
```

* Endpoint: `/personRoles`
* Request: `POST`

Did your secretary leave out somebody's roles because she was too busy admiring her nails again? Well, apart from sacking her, here's how to remedy the situation:

As per usual, you'll need the `group_id` of the group to edit the person's roles in, as well as the actual `id` of the user to update. The Group ID is fetched from the `groupsIndex` section of the response from your initial login request, and the Person ID can be found in the List of Users reponse - just choose the one that you need.

Once you have these values, simply submit a `POST` request to `/personRoles` with the information of the role you want to add in the following format as the payload:

`{"personRole":{"userId": <user_id>,"roleId": <role_id>, "groupId": <group_id>}}`

Replace the `<user_id>` field with the User ID of the person to update, and do the same for `<group_id>`, but for groups. The `<role_id>` field is the role ID you want to give to the user, and must correlate to the ID of an existing role

<aside class="notice">
You'll need to perform this request separately for every role that you add to a user
</aside>

## Remove a role from a user

* Endpoint: `/personRoles/<a number>`
* Request: `DELETE`

Did someone (*gasp*) complain about their work load? We know you don't want to, but if HR is forcing you to relieve their stress by giving them less roles, here's how to do it:

<aside class="warning">
This section is incomplete and is still under construction
</aside>
