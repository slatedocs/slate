# Roles

[## Create a new role]: #
[]: #
[<aside class="warning">]: #
[BATCH]: #
[</aside>]: #
[]: #
[## Delete a role]: #
[]: #
[<aside class="warning">]: #
[BATCH]: #
[</aside>]: #
[]: #
## Get a person's roles

> Example Request

```curl
curl https://webapp.kotive.com/api/group/<group_id>/personRoles?personId=<person_id>  \
	-H 'Authorization: Basic <login details>'
```

> Example Response

```json
{
  "personRoles": [{
    "id": 319,
    "userId": 130,
    "roleId": 22,
    "groupId": 26
  }]
}
```

* Endpoint: `GET /group/<group_id>/personRoles?personID=<person_id>`

Not sure what your boss actually does all day? Here's a quick and easy way to find out using our API:

Again, you'll first need the `group_id` of the group, otherwise we won't know where to look. This is easy to get, as it is in the `groupsIndex` part of the [login response](#login) from earlier!

In order to know who to query (apparently it is unethical to know everything about everybody and use it against them), we also need the Person ID of the person we want to query. This is obtained from the `id` attribute of the [Get a list of people](#get-a-list-of-people) response. You simply look through that for the person that you're curious about (a.k.a. your boss), and BAM, their Person ID is in the `id` attribute.

Now that you have these values, you simply insert them in the URL of a `GET` request to `/group/<group_id>/personRoles?personID=<person_id>`, and we'll return a JSON string with a list of all of the roles that that person has!


## Assign a role to a person

> Example Request

```curl
curl https://webapp.kotive.com/api/personRoles  \
	-X POST                                     \
	-H 'Authorization: Basic <login details>'   \
	-H "Content-Type: application/json"         \
	-d '{"personRole":{"userId": <user_id>, "roleId": <role_id>, "groupId": <group_id>}}'
```

> Example Response

```json
{
  "personRole": {
    "id": 34,
    "userId": 10,
    "roleId": 2,
    "groupId": 24
  }
}
```

* Endpoint: `POST /personRoles`

Did you leave somebody off the system again in your last minute panic? Well, before you have a complete emotional breakdown (it's almost Friday!), here's how to remedy the situation:

As per usual, you'll need the `group_id` of the group to edit the person's roles in, as well as the actual `id` of the person to update. The Group ID is fetched from the `groupsIndex` section of the response from your initial login request, and the Person ID can be found in the [Get a list of people](#get-a-list-of-people) response - just choose the one that you need.

Once you have these values, simply submit a `POST` request to `/personRoles` with the information of the role you want to add in the following format as the payload:

`{"personRole":{"userId": <user_id>,"roleId": <role_id>, "groupId": <group_id>}}`

Replace the `<user_id>` attribute with the Person ID of the person to update, and do the same for `<group_id>`, but for groups. The `<role_id>` attribute is the role ID you want to give to the person, and must correlate to the ID of an existing role

<aside class="notice">
You'll need to perform this request separately for every role that you assign to a person
</aside>

## Revoke a role from a person

> Example Request

```curl
curl 'https://webapp.kotive.com/api/personRoles/<id>'  \
	-X DELETE                                          \
	-H 'Authorization: Basic <login details>'
	
```

> Example Response

```json
{

}
```

* Endpoint: `DELETE /personRoles/<role link id>`

Did someone (*gasp*) complain about their work load? We know you don't want to, but if HR is forcing you to relieve their stress by giving them less roles, here's how to do it:

For this API call, all you'll need is the unique role link ID of the role.

To get the unique role link ID, you will need to look at the response from [Get a person's roles](#get-a-person-39-s-roles). Find the `roleId` value that corresponds to the role that you want to revoke, and use the `id` attribute to send a `DELETE` request to `/personRoles/<id>`.
