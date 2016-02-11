# KuzzleSecurity

The KuzzleSecurity component lets you handle the permissions in Kuzzle.

Kuzzle defines the permissions by attaching a `profile` to each `user`.

A `profile` is defined as a set of `roles`.  
Each `role` defines some permissions on Kuzzle's `indexes`, `collections`, `controllers` and `actions`.

Within a profile, the `role` permissions are cumulative. If one of the profile `role` allows to execute the action, all the users attached to this `profile` will be allowed to execute the action.

Within a `role`, the permissions can be defined and overriden. The precedence order is defined as `the most specific rule` overrides `the less specific rule`.

<!--
  @todo: once the documentation on the security is ready, add a link to it here
-->

## Constructors

```js
/*
 Constructor is not exposed in the JS/Node SDK. You may get the instantiated
 KuzzleSecurity object by calling Kuzzle.security
 */
var kuzzleSecurity = kuzzle.security;
```

```java
```


## createProfile

```js
var roles = ['myrole', 'default'];

// You can chose to replace the given profile if already exists
var options {
  replaceIfExist: true
};

// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .createProfile('myprofile', roles, options, function(error, response) {
    // result is a KuzzleProfile object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .createProfilePromise('myprofile', roles, options)
  .then((response) => {
    // result is a KuzzleProfile object
  });
```

```java
```

Create a new profile in Kuzzle.

<aside class="notice">
There is a small delay between profile creation and their creation in our advanced search layer, usually a couple of seconds.
That means that a profile that was just been created will not be returned by <code>searchProfiles</code> function
</aside>

#### createProfile(id, content, callback)

#### createProfile(id, content, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique profile identifier |
| ``content`` | JSON Object | A plain javascript object representing the profile |
| ``options`` | string | (Optional) Optional arguments |
| ``callback`` | function | Callback handling the response |

Available options:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``replaceIfExist`` | boolean | If the same profile already exists: throw an error if sets to false. Replace the existing profile otherwise | ``false`` |

#### Callback response

Resolves to a `KuzzleProfile` object.

## createRole

```js
var roleDefinition = {
  indexes: {
    "_canCreate": true,
    "*": {
      collections: {
        "_canCreate": true,
        "*": {
          controllers: {
            "*": {
              actions: {
                "*": true
              }
            }
          }
        }
      }
    }
  }
};

// You can chose to replace the given role if already exists
var options {
  replaceIfExist: true
};

// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .createRole('myrole', roleDefinition, options, function(error, response) {
    // result is a KuzzleRole object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .createRolePromise('myrole', roleDefinition, options)
  .then((response) => {
    // result is a KuzzleRole object
  });
```

```java
```

Create a new role in Kuzzle.

<aside class="notice">
There is a small delay between role creation and their creation in our advanced search layer, usually a couple of seconds.
That means that a role that was just been created will not be returned by <code>searchRole</code> function
</aside>

#### createRole(id, content, callback)

#### createRole(id, content, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier |
| ``content`` | JSON Object | A plain javascript object representing the role |
| ``options`` | string | (Optional) Optional arguments |
| ``callback`` | function | Callback handling the response |

Available options:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``replaceIfExist`` | boolean | If the same role already exists: throw an error if sets to false. Replace the existing role otherwise | ``false`` |

#### Callback response

Resolves to a `KuzzleRole` object.


## createUser

```js
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

// You can chose to replace the given user if already exists
var options {
  replaceIfExist: true
};


// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .createUser('myuser', userContent, options, function(error, response) {
    // result is a KuzzleUser object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .createUserPromise('myuser', userContent, options)
  .then((response) => {
    // result is a KuzzleUser object
  });
```

```java
```

Create a new user in Kuzzle.

<aside class="notice">
There is a small delay between user creation and their creation in our advanced search layer, usually a couple of seconds.
That means that a user that was just been created will not be returned by <code>searchUsers</code> function
</aside>

#### createUser(id, content, callback)

#### createUser(id, content, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique user identifier, will be used as username |
| ``content`` | JSON Object | A plain javascript object representing the user |
| ``options`` | string | (Optional) Optional arguments |
| ``callback`` | function | Callback handling the response |


Available options:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``replaceIfExist`` | boolean | If the same user already exists: throw an error if sets to false. Replace the existing user otherwise | ``false`` |

#### Callback response

Resolves to a `KuzzleUser` object.


## deleteProfile

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .deleteProfile('myprofile', function(error, result) {

  });

// Using promises (NodeJS)
kuzzle
  .security
  .deleteProfilePromise('myprofile')
  .then((result) => {

  });
```

```java
```

Delete profile.

<aside class="notice">
There is a small delay between profile deletion and their deletion in our advanced search layer, usually a couple of seconds.
That means that a profile that was just been delete will be returned by <code>searchProfiles</code> function
</aside>

#### deleteProfile(id)

#### deleteProfile(id, [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique profile identifier to delete |
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves the profile id which has been deleted.

## deleteRole

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .deleteRole('myrole', function(error, result) {

  });

// Using promises (NodeJS)
kuzzle
  .security
  .deleteRolePromise('myrole')
  .then((result) => {

  });
```

```java
```

Delete role.

<aside class="notice">
There is a small delay between role deletion and their deletion in our advanced search layer, usually a couple of seconds.
That means that a role that was just been delete will be returned by <code>searchRoles</code> function
</aside>

#### deleteRole(id)

#### deleteRole(id, [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier to delete |
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves the role id which has been deleted.


## deleteUser

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .deleteUser('myuser', function(error, result) {

  });

// Using promises (NodeJS)
kuzzle
  .security
  .deleteUserPromise('myuser')
  .then((result) => {

  });
```

```java
```

Delete user.

<aside class="notice">
There is a small delay between user deletion and their deletion in our advanced search layer, usually a couple of seconds.
That means that a user that has just been delete will be returned by <code>searchUsers</code> function
</aside>

#### deleteUser(id)

#### deleteUser(id, [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique user identifier to delete |
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves the user id which has been deleted.


## getProfile

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .getProfile('myprofile', function(error, result) {
    // result is a KuzzleProfile object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .getProfilePromise('myprofile')
  .then((result) => {
    // result is a KuzzleProfile object
  });
```

```java
```

Retrieves a single stored profile using its unique ID.

#### getProfile(id, hydrate, callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique profile identifier |
| ``hydrate`` | boolean | (option) If set to false, return the attribute roles as array of string instead of `KuzzleRole` (default true) |
| ``callback`` | function | Callback handling the response |

#### Callback response

Resolves to a `KuzzleProfile` object.


## getRole

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .getRole('myrole', function(error, result) {
    // result is a KuzzleRole object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .getRolePromise('myrole')
  .then((result) => {
    // result is a KuzzleRole object
  });
```

```java
```

Retrieves a single stored role using its unique ID.

#### getRole(id, callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier |
| ``callback`` | function | Callback handling the response |

#### Callback response

Resolves to a `KuzzleRole` object.


## getUser

```js
// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .getUser('myuser', function(error, result) {
    // result is a KuzzleUser object
  })

// Using promises (NodeJS)
kuzzle
  .security
  .getUserPromise('myuser')
  .then((result) => {
    // result is a KuzzleUser object
  })
```

```java
```

Retrieves a single stored user using its unique ID.

#### getUser(id, callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique user identifier |
| ``hydrate`` | boolean | (option) If set to false, return the attribute profile as string instead of KuzzleProfile (default true) |
| ``callback`` | function | Callback handling the response |

#### Callback response

Resolves to a `KuzzleUser` object.


## profileFactory

```js
var profileDefinition = {
  roles: [
    'myrole', 'default'
  ]
};

var role = kuzzle.security.profileFactory('myprofile', profileDefinition);
```

```java
```

Instantiate a new KuzzleProfile object.

#### profileFactory(id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique profile identifier |
| ``content`` | JSON Object | Profile content |

#### Return value

Returns the `KuzzleProfile` object.


## roleFactory

```js
var roleDefinition = {
  indexes: {
    "_canCreate": true,
    "*": {
      collections: {
        "_canCreate": true,
        "*": {
          controllers: {
            "*": {
              actions: {
                "*": true
              }
            }
          }
        }
      }
    }
  }
};

var role = kuzzle.security.roleFactory('role', roleDefinition);
```

```java
```

Instantiate a new `KuzzleRole` object.

#### roleFactory(id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier |
| ``content`` | JSON Object | Role content |

#### Return value

Returns the `KuzzleRole` object.


## searchProfiles

```js
var filters = {
   // filter can contains an array `roles` with a list of role id
  roles:  ['myrole', 'admin'],
  // filter can handler pagination with properties `from` and `size`
  from: 0,
  size: 10
};

// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .searchProfiles(filters, true, function(error, result) {
    // result is a JSON Object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .searchProfilesPromise(filters, true)
  .then((result) => {
    // result is a JSON Object
  });
```

```java
```

> Callback response:

```js
{
  total: 124,
  documents: [
    // array of KuzzleProfile
  ]
}
```

Executes a search on profiles according to a filter

#### searchProfiles(filters, callback)

#### searchProfiles(filters, [hydrate], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | List of filters to retrieves roles |
| ``hydrate`` | boolean | (Optional) if hydrate is `true`, profiles will have a list of `KuzzleRole` object instead of just a list of role id |
| ``callback`` | function | Callback handling the response |


Available filters:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``roles`` | array | Contains an array `roles` with a list of role id | ``undefined`` |
| ``from`` | number | Starting offset | ``0`` |
| ``to`` | number |  Number of hits to return | ``20`` |

#### Callback response

Resolves to a JSON Object


## searchUsers

```js
var filter = {
  filter: {
    and: [
      {
        terms: {
          profile: ['anonymous', 'default'],
        }
      },
      {
        geo_distance: {
          distance: '10km',
          pos: {
            lat: '48.8566140', lon: '2.352222'
          }
        }
      }
    ]
  }
};

// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .searchUsers(filters, true, function(error, result) {
    // result is a JSON Object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .searchUsersPromise(filters, true)
  .then((result) => {
    // result is a JSON Object
  });
```

```java
```

> Callback response:

```js
{
  total: 124,
  documents: [
    // array of KuzzleUser
  ]
}
```

Executes a search on users according to a filter

#### searchUsers(filters, callback)

#### searchUsers(filters, [hydrate], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| ``hydrate`` | boolean | (Optional) if hydrate is `true`, users will have a list of `KuzzleProfile` object with hydrated `KuzzleRole` instead of just a list of profiles id |
| ``callback`` | function | Callback handling the response |

#### Callback response

Resolves to a JSON Object


## searchRoles

```js
var filters = {
   // filter can contains an array `indexes` with a list of index id
  indexes:  ['index', 'index2'],
  // filter can handler pagination with properties `from` and `size`
  from: 0,
  size: 10
};

// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .searchRoles(filters, function(error, result) {
    // result is a JSON Object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .searchRolesPromise(filters)
  .then((result) => {
    // result is a JSON Object
  });
```

```java
```

> Callback response:

```js
{
  total: 124,
  documents: [
    // array of KuzzleRole
  ]
}
```

Executes a search on roles according to a filter

#### searchRoles(filters, callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | List of filters to retrieves roles |
| ``callback`` | function | Callback handling the response |

Available filters:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``indexes`` | array | List of indexes id related to the searched role | ``undefined`` |
| ``from`` | number | Starting offset | ``0`` |
| ``to`` | number |  Number of hits to return | ``20`` |

#### Callback response

Resolves to a JSON Object


## userFactory

```js
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

var user = kuzzle.security.userFactory('myuser', userContent);
```

```java
```

Instantiate a new KuzzleUser object.

#### userFactory(id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique user identifier |
| ``content`` | JSON Object | User content |

#### Return value

Returns the `KuzzleUser` object.
