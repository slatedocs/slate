# Publisher login

Metype lets publishers use their own authentication system to login user to metype. Metype uses shared key authentication method to implement this.

## Publisher login - Terminology
* `Shared key` - Shared key is used to generate JWT[https://jwt.io/].

## Publisher login - Prerequisites

* Sign up for an account @ www.metype.com.
* You will find all your accounts @ www.metype.com/admin if you are signed in.
* You will find the `shared key` in the `Embed Metype` tab on your admin panel.

## Generating JWT

* Most of the languages have libraries to generate JWT.
* Expected user pay load:
  {
    'email': 'bathman@gotham.com',
    'name': 'batman',
    'avatar': 'https://gothamcity.com/batman-photo.jpg',
    'member-id': 123345,
  }
* `member-id` is the unqiue id to idenity member on your system.
* JWT generator should be used to generate token using `shared key` from metype, `payload` and `SHA-256` as the hashing algorithm.

## Posting user data to metype
* User data including JWT is sent to metype using callback function provided by metype in metype js.
* Callback supports the following two actions `publisher_login`, `publisher_logout`.

```javascript
    {
      action: 'publisher_login',
      user: {
        name: 'batman',
        avatar: 'https://gothamcity.com/batman-photo.jpg',
        jwt: 'jwtForTheBAtman'
      }
    }
```
### User data for login function
*  To login the user we need to call `updateUserState()` as shown here

```javascript
    talktype.updateUserState({
        action: 'publisher_login',
        user: {
          name: 'batman',
          avatar: 'https://gothamcity.com/batman-photo.jpg',
          jwt: 'jwtForTheBAtman'
        }
      });
```
</br>
</br>
</br>
</br>
### Login callback
* `updateUserState()` function is the callback function that can be used to set user on metype.

```javascript
  talktype.updateUserState({
    action: 'publisher_logout'
  });
```
</br>
</br>
### Logout callback
* To logout the user we need to call `updateUserState` and data to this function with `publisher_logout` action

```javascript
function listenToLogin(event) {
      if(event.data.action === "login") {
        login();
      }
    }
window.addEventListener("message", listenToLogin, false);
```

### Listening to metype to initiate login
* Parent window should have an event listener listening to event message.
* Metype will post data with `login` action in event's data. This should initiate login
* An example is show here.
