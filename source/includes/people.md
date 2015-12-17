# People

## Get a list of people

> Example Request

```curl
curl https://webapp.kotive.com/api/group/<group_id>/people  \
	-H 'Authorization: Basic <login details>'
```

> Example Response

```json
{
  "people": [{
    "email": "example@example.com",
    "username": "example@example.com",
    "firstname": "John",
    "lastname": "Doe",
    "id": 130,
    "mobile": "",
    "password": "****"
  }]
}
```

* Endpoint: `GET /group/<group_id>/people`

Ever feel like you need a list of everybody that's associated with your account? No? Well here's how to do it anyway:

First of all you'll need the `group_id` of the group, so that you can find out who is in that group. Getting this value should be pretty easy, as it will be nested inside of the `groupsIndex` part of the login response you got earlier!

Once you've got that value, all you have to do it submit a `GET` request to `/group/<group_id>/people`, and the reponse will contain the list of people you're looking for.

<aside class="notice">
Don't forget to replace <code>&lt;group_id&gt;</code> with your actual Group ID, otherwise it won't work.
</aside>

## Create a new person

> Example Request

```curl
curl https://webapp.kotive.com/api/people      \
	-X POST                                    \
	-H "Content-Type: application/json"        \
	-H 'Authorization: Basic <login details>'  \
	-d '{"person"{"email": "<email>", "username": "<username>", "firstname": "<firstname>", "lastname": "<lastname>", "mobile": "<mobile>", "password": "<password>", "groupId" :<groupId>}}'
```

> Example Response

```json
{
  "person": {
    "email": "johanna@example.com",
    "username": "johanna@example.com",
    "firstname": "Johanna",
    "lastname": "Doe",
    "id": 133,
    "mobile": "",
    "password": "****"
  }
}
```

* Endpoint: `POST /people`

Has a new special someone come into your life? ;) Or is it just that time of year when your company has hired a whole load of newbies and wants you to add them to the system? Either way, here's how to do it quickly and still get time to procrastinate!

To create a new person (not really), you must make a `POST` request to `/people` with all of the information about the new person:

Attribute | Description | Required
-----------|-------------|---------
email | The email address of the person to add | Yes
username | The username is the same as the email address | Yes
firstname | The person's first name | Yes
lastname | The person's last name | Yes
mobile | The person's mobile number | No
password | The person's password | No
groupId | The ID of the group to add the new person to | Yes

<aside class="notice">
In order to assign roles to the new person, you will have to follow the <a href="#assign-a-role-to-a-person">Assign a role to a person</a> section below
</aside>

If you wish to send an invitation email to the person after you have added them, simply follow the instructions on [Password reset](#password-reset), as resetting the password of a user that doesn't yet exist will sent them an invitation email.

## Update a person

Currently, the only change you can make to somebody's details is changing which roles have been assigned to them. Details on how to do this can be found in the ['Assign a role to a person'](#assign-a-role-to-a-person) and ['Revoke a role from a person'](#revoke-a-role-from-a-person) sections.

## Delete a person

<aside class="warning">
Unknown
</aside>
