# People

## Get a list of people

> Example Request

```
curl https://webapp.kotive.com/api/group/<group_id>/people
	-H 'Authorization: Basic <token>'
```

> Remember to replace `<group_id>` with the actual Group ID, and `<token>` with the Base64 token described in the Authentication section.

> Example Response

```
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

* Endpoint: `/group/<group_id>/people`
* Request: `GET`

Ever feel like you need a list of everybody that's associated with your account? No? Well here's how to do it anyway:

First of all you'll need the `group_id` of the list, so that you can find out who is in that group. Getting this value should be pretty easy, as it will be nested inside of the `groupsIndex` part of the login response you got earlier!

Once you've got that value, all you have to do it submit a `GET` request to `/group/<group_id>/people` and your response will contain all the information you needed!

<aside class="notice">
Don't forget to replace <code>&lt;group_&gt;</code> with your actual Group ID, otherwise it won't work. Yes, some people actually make that mistake.
</aside>

## Add a person

> Example Request

```
curl https://webapp.kotive.com/api/people
	-H "Content-Type: application/json"
	-H 'Authorization: Basic <token>' 
	-X POST 
	-d '{"person"{"email": "<email>", "username": "<username>", "firstname": "<firstname>", "lastname": "<lastname>", "mobile": "<mobile>", "password": "<password>", "groupId" :<groupId>}}'
```

> Example Response

```
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

* Endpoint: `/people`
* Request: `POST`

Has a new special someone come into your life? ;) Or is it just that time of year when your company has hired a whole load of newbies and wants you to add them to the system? Either way, here's how to do it quickly and still get time to procrastinate!

To create a new person (not really), you must make a `POST` request to `/people` with all of the information about the new person:

Field Name | Description | Required | Type
-----------|-------------|----------|-----
email | The email address of the new person to add | Yes | Email
username | The username is also the email address | Yes | Email
firstname | The new person's first name | Yes | Text
lastname | The surname of the new person | Yes | Text
mobile | The mobile phone number of the new person | No | Text
password | The new person's password | No | Text
groupId | The ID of the group to add the new person to | Yes | Number

<aside class="notice">
In order to assign roles to the new person, you will have to follow the 'Add a role to a user' section below
</aside>
