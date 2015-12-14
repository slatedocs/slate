# Authentication

## Initial log in

> To authorize, use this code:

```
curl 'https://webapp.kotive.com/api/login'
	-H 'Authorization: Basic <token>'
```

> Make sure to replace `<token>` with a Base64 encoded version of `username:password`

* Endpoint: `/login`
* Request: `POST`

The Kotive API uses BASIC to authenticate, and when you log in initially, it will provide you with an `authToken` that must be used with other requests. This `authToken` is sent instead of your password, and will expire when your session ends. To get an `authToken`, send a `GET` request to `/login` with the following header:

`Authorization: Basic <token>`

<aside class="notice">
You must replace <code>&lt;token&gt;</code> with your Base64 encoded username and password.
</aside>

## Requests

> Example Response:

```
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

Great! You've successfully logged in! You'll see that with the above login request, you get an output that should look similar to that on the right, in JSON.

This response is a summary of all of your user data, and includes all of the predefined roles you can be (`systemRoles`), as well as which you actually are and in which group (`userRoles`). Also in the response is a list of all of the groups that you belong to and their respective IDs (`groupsIndex`), and a summary of your personal information, with the password blanked out (`user`).

The `authToken` is the important part to us here, as in all further requests this will replace the password. All this basically means that instead of sending along a Base64 encoded authentication header with `username:password`, it now looks more like `username:authToken`. Your header still looks like this:

`Authorization: Basic <token>`

But `<token>` is made up of Base64 encoded `username:authToken`

## Password Reset

> Example Request

```
curl https://webapp.kotive.com/api/user/resetpassword
	-H "Content-Type: application/json"
	-X POST
	-d '{"email": "<your email address>"}' 
```

> Example Response

```
OK
```

* Endpoint: `/user/resetpassword`
* Request: `POST`

You forgot your password? Shock, horror! But don't worry, it happens to the best of us! Here's how to recover it using the API:

Send a `POST` request to `/user/resetpassword` with `"email": "<email address"` as the payload. 

That's it! Now the user just has to follow the email prompts in their inbox to change their password

<aside class="notice">
This, along with a password-less login system, are still being worked on, so this information is subject to change
</aside>
