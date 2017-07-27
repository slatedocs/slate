# Groups

Groups help you organize better the users in sunlight. They allow you to monitor what the members are learning as well as know what they are spending their sunlight on.

## Group Model

> Example Group Object

```json
 {
    "id": "806b946cf5",
    "name": "Sunlight",
    "address": "Planet Earth",
    "bio": "Test",
    "about-url": "https://sunlight.is",
    "manager-approval": false,
    "privacy-setting": "admin-invite",
    "avatar-url": "https://sunlight-production-beanstalk.s3.amazonaws.com/avatar.jpeg",
    "cover-url": "https://sunlight-production-beanstalk.s3.amazonaws.com/cover.jpeg",
    "number-of-members": 1
    "created-at": "2017-07-20T15:19:04.416Z",
    "updated-at": "2017-07-20T15:19:04.416Z",
  }
```

*A group object contains the following fields*

Attribute | Type | Description
--------- | ------- | -----------
id | **string** | The sunlight defined id representing the group
name | **string** | The name of the group
address | **string** | The address of the group
bio | **string** | A short description of the group
abour-url | **strin g** | Url for the group's website.
manager-approval | **boolean** | If the orders requires manager approval
privacy-setting | **string** | Group privacy type
avatar-url | **string** | Avatar url of the group
cover-url | **string** | Cover url of the group
number-of-members | **integer** | The number of users in the group
created-at | **timestamp** | The datetime the group was added to Sunlight
updated-at | **timestamp** | The datetime the group was updated to Sunlight

### privacy-settings:

You can choose to allow people join your group at anytime, have them request invites or only allow them to join by an admin’s invitation.

- `admin-invite`: People can only join by an invitation from a group admin ***(Available)***
- `public_access`: People can join your group at anytime ***(Not available)***
- `request_invite`: People request invite to join a group ***(Not available)***

### manager-approval

- `true`: if you’d like every order that uses funds from this group to require approval from a group admin.
- `false`: if you wouldn't like every order that uses funds from this group to require approval from a group admin.


## Create group

> Create Group Example

```shell
$ curl -X POST \
  https://app.sunlight.is/api/groups \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
  -d '{
  "data": {
    "attributes": {
      "name": "Sunlight",
      "address": "Planet Earth",
      "about-url": "https://sunlight.is",
      "bio": "Give Sunlight to employees, friends and family for them to spend on education."
      "privacy-setting": "admin-invite",
      "manager-approval": true
    }
  }
}'
```

> The encoded json response looks like:

```json
HTTP/1.1 201 CREATED

{
  "data": {
    "type": "groups",
    "id": "806b946cf5",
    "attributes": {
      "id": "806b946cf5",
      "name": "Sunlight",
      "address": "Planet Earth",
      "bio": "Give Sunlight to employees, friends and family for them to spend on education.",
      "avatar-url": null,
      "cover-url": null,
      "about-url": "https://sunlight.is",
      "privacy-setting": "admin-invite",
      "manager-approval": true,
      "created-at": "2017-07-20T15:19:04.416Z",
      "slack-config-url": null,
      "slack-url": null,
      "slack-token": null,
      "number-of-members": 1
    },
    "links": {
      "self": "/groups/806b946cf5"
    },
    "relationships": {}
  },
  "included": []
}
```

Groups can be created via a `POST` to `https://app.sunlight.is/api/groups`, which accepts a JSON object describing the group.

<aside class="notice">
  Note that a group will always have at least one user associated. At the time of creating a group, that user will automatically be a member and administrator.
</aside>

### Query Parameters

The table below shows the fields you can create for a group

Parameter | Required | Description
--------- | ------- | -----------
name | yes | The name of the group
address | no | The address of the group
bio | no | A short description of the group
abour-url | no | Url for the group's website.
manager-approval | no | If the orders require manager approval
privacy-setting | yes | Group privacy type
avatar-url | no | Avatar url of the group
cover-url | no | Cover url of the group

## Invite a user to a group

> Invite unregistered user to Group - Example

```shell
$ curl -X POST \
  https://app.sunlight.is/api/v2/group-invitations \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
  -d '{
  "data": {
    "attributes": {
      "email": "jose@sunlight.is"
    },
    "relationships": {
      "group": {
        "data": {
          "id": "9030927d27"
        }
      }
    }
  }
}'
```

> The encoded json response looks like:

```json
HTTP/1.1 201 CREATED

{
  "data": {
    "type": "group-users",
    "id": "a910564e67",
    "attributes": {
      "id": "a910564e67",
      "administrator": false
    },
    "links": {
      "self": "/group-users/a910564e67"
    },
    "relationships": { }
  },
  "included": []
}
```

> Invite registered user to Group - Example

```shell
$ curl -X POST \
  https://app.sunlight.is/api/v2/group-users \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
  -d '{
  "data": {
    "attributes": {
      administrator: false
    },
    "relationships": {
      "user": {
        "data": {
          "id": "54a4759f2c"
        }  
      },
      "group": {
        "data": {
          "id": "9030927d27"
        }
      }
    }
  }
}'
```

> The encoded json response looks like:

```json
HTTP/1.1 201 CREATED

{
  "data": {
    "type": "group-users",
    "id": "832a222ad8",
    "attributes": {
      "id": "832a222ad8",
      "administrator": false
    },
    "links": {
      "self": "/group-users/832a222ad8"
    },
    "relationships": { }
  }
}
```

The groups allow you to invite registered and unregistered users in sunlight, to each case there are different params and different endpoints.

<aside class="notice">
  You can only invite users to groups where you are an admin.
</aside>

### To unregistered users

via a `POST` to `https://app.sunlight.is/api/group-invitations`, which accepts a JSON object.

Parameter | Required | Description
--------- | ------- | -----------
email | yes | The email of the user you want to invite
relationships[group][id] | yes | Group id which the user will be joining to.

### To registered users

via a `POST` to `https://app.sunlight.is/api/group-users`, which accepts a JSON object.

Parameter | Required | Description
--------- | ------- | -----------
administrator | yes | true if you want the user to be group admin
relationships[user][id] | yes | User's id of the user you want to invite
relationships[group][id] | yes | Group's id which the user will be joining


## Edit budget of an individual user

> Edit budget of an individual user - Example

```shell
$ curl -X POST \
  https://sunlight.is/api/credits \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
  -d '{
  "data": {
    "attributes": {
      "amount": "100"
    },
    "relationships": {
      "group-user": {
        "data": {
          "id": "e70099a393"
        }
      }
    }
  }
}'
```

> The encoded json response looks like:

```json
{
  "data": {
    "type": "transactions",
    "id": "ec28e8f7c2",
    "attributes": {
      "id": "ec28e8f7c2",
      "amount": 100,
      "created-at": "2017-07-26T14:30:54.649Z",
      "source": "credit"
    },
    "links": {
      "self": "/transactions/ec28e8f7c2"
    },
    "relationships": { }
  }
}
```

Budget is one way that users in a group get sunlight, it allows groups to budget a certain amount of money they use to invest in their education.

Can edit the budget for each member of a group individually via `POST` to` https://app.sunlight.is/api/credit`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
amount | yes | Amount of money expressed in cents.
relationships[group-user][id] | yes | `group-user` id
