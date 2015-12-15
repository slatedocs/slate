# Authentication

## Log in

> To authorise:

```cURL
curl -u username:password 'https://webapp.kotive.com/api/login'
```

> Or alternatively

```cURL
curl 'https://webapp.kotive.com/api/login'     \
	-H 'Authorization: Basic <login details>'
```

* Endpoint: `GET /login`

The Kotive API uses BASIC Auth to authenticate, and when you log in initially, it will provide you with an `authToken` that must be used with other requests. This `authToken` is sent instead of your password, and will expire when your session ends.

To get an `authToken`, you can sent a `GET` request to `/login` with your username and password specified in the `-u` tag, e.g.,

`-u username:password`

Or you could send a `GET` request to `/login` with the following header:

`-H 'Authorization: Basic <login details>'`

<aside class="notice">
You must replace <code>&lt;login details&gt;</code> with your Base64 encoded username and password.
</aside>






> Example Response:

```cURL
{
  "authToken": "3e2d130a58c243a887e72c17b9bb1bf7",
  "systemRoles": [{
    "id": 1,
    "label": "Account Owner"
  }, {
    "id": 2,
    "label": "User Administrator"
  }, {
    "id": 3,
    "label": "Maker"
  }],
  "userRoles": [{
    "userId": 128,
    "role": {
      "id": 1,
      "label": "Account Owner"
    },
    "groupId": 245
  }, {
    "userId": 128,
    "role": {
      "id": 2,
      "label": "User Administrator"
    },
    "groupId": 245
  }, {
    "userId": 128,
    "role": {
      "id": 3,
      "label": "Maker"
    },
    "groupId": 245
  }],
  "groupsIndex": [{
    "id": 245,
    "parentId": 1
  }, {
    "id": 246,
    "parentId": 245
  }],
  "user": {
    "email": "jenkins.daniel.02@gmail.com",
    "username": "jenkins.daniel.02@gmail.com",
    "firstname": "Daniel",
    "lastname": "Jenkins",
    "id": 128,
    "mobile": "",
    "password": "****"
  }
}
```

Great! You've successfully logged in! You'll see that with the above login request, you get a JSON response that should look similar to that on the right.

We know it's a little daunting at first, but here's a breakdown of what's included in the response:

Field name | Description
-----------|------------
authToken  | This is the authToken that you may use instead of your password for making requests.
systemRoles | This is an array of all of the default roles associated with your account. Each entry consists of the ID of that group, and a human-friendly label. Custom roles will not be displayed here.
userRoles | This is an array of every role that has been assigned to you. Each entry contains your Person ID, a role object with the role ID and a description, and the ID of the group that you have that role in.
groupsIndex | This is an array of every group that you belong to. It shows you the group's ID, as well as the ID of the parent group to which this group belongs.
user | Finally, this section provides you with information on your user account. It shows you your email address and username, your first and last names, your Person ID, your mobile phone number, and a hidden version of your password. Note that this will always show four stars, regardless of password length.

This information will come in handy later, but for now, we're mostly just interested in the `authToken` field.

The `authToken` field can be used to replace the password in all further requests, and in both types of authentication. This is more secure than using your password, as if something ever goes wrong, we can easily revoke your `authToken` and issue you a new one.

To use it you would have:

`-u username:authToken`

Or

`Authorization: Basic <login details>`

Where `<login details>` is made up of Base64 encoded `username:authToken`

## Password reset

> Example Request

```cURL
curl https://webapp.kotive.com/api/user/resetpassword  \
	-X POST                                            \
	-H "Content-Type: application/json"                \
	-d '{"email": "example@example.com"}' 
```

> Example Response

```cURL
OK
```

* Endpoint: `POST /user/resetpassword`

You forgot your password? And you've already tried '1234'? Don't worry, it happens to the best of us! Here's how to recover it using the API:

Send a `POST` request to `/user/resetpassword` with `"email": "<your email address>"` as the payload.

That's it! Now the user just has to follow the email prompts in their inbox to change their password.

<aside class="notice">
If there is no user account associated with the email that you've entered, Kotive will send a new invitation email to that address, but will still return <code>OK</code>.
</aside>
