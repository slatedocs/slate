# Third party login

Metype lets you any third party authentication system to login users to Metype on your website. Metype uses shared key authentication method to implement this.

## Third party login - Terminology
* `Shared key` - Shared key is used to generate [JWT](https://jwt.io/).

## Third party login - Prerequisites

* Sign up for an account @ [www.metype.com](https://www.metype.com).
* You will find all your accounts @ [www.metype.com/admin](https://www.metype.com/admin) if you are signed in.
* You will find the `Shared key` in the `Embed Metype` tab on your admin panel.

## Generating JWT

* Most of the languages have libraries to generate [JWT](https://jwt.io/).
* Expected user pay load:
  {
    'email': 'bathman@gotham.com',
    'name': 'batman',
    'avatar': 'https://gothamcity.com/batman-photo.jpg',
    'member-id': 123345,
  }
* `member-id` is the unqiue id to idenity member on your system.
* [JWT](https://jwt.io/) generator should be used to generate token using `Shared key` from Metype, `payload` and `SHA-256` as the hashing algorithm.

## Posting user data to Metype using login callback

```javascript
    talktype.accountUserLogin({
      name: 'batman',
      avatar: 'https://gothamcity.com/batman-photo.jpg',
      jwt: 'jwtForTheBatman'
    });
```
* User data including JWT is sent to Metype using callback function provided by Metype in Metype javascript.

*  To login the user we need to call `accountUserLogin()` as shown on the right.

## Logout callback

```javascript
  talktype.accountUserLogout();
```

* To logout the user we need to call `accountUserLogout`.

## Listening to metype to initiate login
```javascript
function listenToLogin(event) {
      if(event.data.action === "metype_login") {
        login();
      }
    }
window.addEventListener("message", listenToLogin, false);
```
* Parent window should have an event listener listening to event message.
* Metype will post data with `metype_login` action in event's data. This should initiate login
* An example is shown here on the right.
