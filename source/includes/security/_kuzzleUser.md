# ~ KuzzleUser

KuzzleUser is the object representation of an user, which is associated to a KuzzleProfile



## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleUser objects are returned by KuzzleSecurity.userFactory method:
 */
var userContent = {
  // Profile field is mandatory to bind user to an existing profile
  // defaults profiles are 'anonymous', 'default' and 'admin'
  profile: 'admin',

  // To allow user to login with plugin 'kuzzle-plugin-auth-passport-local'
  // users must have a 'password' field, which will be hashed by the plugin
  password: 'secretPassword',

  // You can also set custom fields to your user
  firstname: 'John',
  lastname: 'Doe'
};

var user = kuzzle.security.userFactory('myuser', userContent)
```

```java
```

Instantiate a new KuzzleUser object.

#### KuzzleRole(KuzzleSecurity, id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleSecurity`` | KuzzleSecurity | An instanciated KuzzleSecurity object |
| ``id`` | string | Unique user identifier |
| ``content`` | JSON Object | User content |

**Note:**  this constructor won't make any call to Kuzzle.

#### Return value

Returns the `KuzzleUser` object.


## hydrate

```js
var userContent = {
  profile: ['myprofile']
};

var user = kuzzle.security.userFactory('myuser', userContent)

// Using callbacks (NodeJS or Web Browser)
user
  .hydrate(function(error, result) {
    // result is a KuzzleUser object
    // with hydrated profile as KuzzleProfile
    // which contains also hydrated roles as KuzzleRole
  });

// Using promises (NodeJS)
user
  .hydratePromise()
  .then((result) => {
    // result is a KuzzleUser object
    // with hydrated profile as KuzzleProfile
    // which contains also hydrated roles as KuzzleRole
  });
```

```java
```

Hydrate KuzzleUser with associated KuzzleProfile

#### hydrate(callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | Callback handling the response |

#### Callback response

Resolves to a `KuzzleUser` object.


## save

```js
var userContent = {
  // define users properties
};

var user = kuzzle.security.userFactory('myuser', userContent)

// Using callbacks (NodeJS or Web Browser)
user
  .save(function(error, result) {
    // result is a KuzzleUser object
  });

// Using promises (NodeJS)
user
  .savePromise()
  .then((result) => {
    // result is a KuzzleUser object
  });
```

```java
```

Create or replace the user in kuzzle

#### save()

#### save([callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves to a `KuzzleUser` object.


## setContent

```js
var user = kuzzle.security.getUser('myuser');
var userContent = {
  // define new users properties
};

user = user.setContent(userContent);
```

```java
```

Replace the content of KuzzleUser

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object |  User content |

#### Return value

Returns the `KuzzleUser` object.


## serialize

```js
var user = kuzzle.security.getUser('myuser');

var userContent = user.serialize();
```

```java
```

Serialize this object into a JSON object

#### serialize()

#### Return value

Returns the content of `KuzzleUser` as JSON object.


## setProfile

```js
var profile = kuzzle.security.getProfile('myprofile');
var user = kuzzle.security.getUser('myuser');

// Can set the profile directly with a KuzzleRole object
user.setProfile(profile);

// Or by passing it's id
user.setProfile('myprofile');
```

Replace the profile associated to the user

#### setProfile(profile)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``profile`` | string OR KuzzleProfile  | Profile identifier or a KuzzleProfile instance |

#### Return value

Returns the `KuzzleRole` object.
