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
// using the static instance
KuzzleSecurity security = kuzzle.security;

// or instanciating a new KuzzleSecurity object
KuzzleSecurity security = new KuzzleSecurity(kuzzle);
```

```objective_c
// using the static instance
KuzzleSecurity* security = kuzzle.security;

// or instanciating a new KuzzleSecurity object
KuzzleSecurity* security = [[KuzzleSecurity alloc] initWithKuzzle: kuzzle];
```

```swift
// using the static instance
let security = kuzzle.security

// or instanciating a new KuzzleSecurity object
let security = KuzzleSecurity(kuzzle: kuzzle)
```

#### KuzzleSecurity(Kuzzle)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| `Kuzzle` | object | An instanciated `Kuzzle` object |


## Properties

There are no exposed properties for this object.


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
JSONObject roleDefinition = new JSONObject()
  .put("indexes", new JSONObject()
    .put("_canCreate", true)
    .put("*", new JSONObject()
      .put("collection", new JSONObject()
        .put("_canCreate", true)
        .put("*", new JSONObject()
          .put("controllers", new JSONObject()
            .put("*", new JSONObject()
              .put("actions", new JSONObject()
                .put("*", true)
              )
            )
          )
        )
      )
    )
  );

KuzzleOptions opts = new KuzzleOptions().setReplaceIfExist(true);

kuzzle
  .security
  .createRole("myrole", roleDefinition, opts, new KuzzleResponseListener<KuzzleRole>() {
    @Override
    public void onSuccess(KuzzleRole role) {
      // the result is an instanciated KuzzleRole object
    }

    @Override
    public void onError(JSONObject error) {

    }
  })
```

```objective_c
NSDictionary* roleDefinition = @{
  @"indexes":@{
    @"_canCreate": @true,
    @"*": @{
      @"collections": @{
        @"_canCreate": @true,
        @"*": @{
          @"controllers": @{
            @"*": @{
              @"actions": @{
                @"*": @true
              }
            }
          }
        }
      }
    }
  }
};

NSError* error = nil;
KuzzleOptions* opts = [[KuzzleOptions alloc] init];
opts.replaceIfExist = true;

[kuzzle.security createRoleWithId: @"myRole" content: roleDefinition options:opts error: &error callback:^(KuzzleRole * createdRole, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
let roleDefinition = [
  "indexes":[
    "_canCreate": true,
    "*": [
      "collections": [
        "_canCreate": true,
        "*": [
          "controllers": [
            "*": [
              "actions": [
                "*": true
              ]
            ]
          ]
        ]
      ]
    ]
  ]
]

do {
  let opts = KuzzleOptions()
  opts.setReplaceIfExist(true)
  try kuzzle.security.createRole(id: "myRole", content: roleDefinition, options: opts, callback: { result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is KuzzleRole
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Create a new role in Kuzzle.

<aside class="notice">
There is a small delay between role creation and their creation in our advanced search layer, usually a couple of seconds.
That means that a role that was just been created will not be returned by <code>searchRole</code> function
</aside>


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
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleRole` object.

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
JSONObject roles = new JSONArray()
  .put("myrole")
  .put("default");

KuzzleOptions opts = new KuzzleOptions().setReplaceIfExist(true);

kuzzle
  .security
  .createProfile("myprofile", roles, opts, new KuzzleResponseListener<KuzzleProfile>() {
    @Override
    public void onSuccess(KuzzleProfile profile) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSArray* roles = @[
  @"myrole",
  @"default"
];

NSError* error = nil;
KuzzleOptions* opts = [[KuzzleOptions alloc] init];
opts.replaceIfExist = true;

[kuzzle.security createProfileWithId: @"myprofile" content: roles options:opts error: &error callback:^(KuzzleProfile * createdProfile, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
let roles = [
  "myrole",
  "default"
]

do {
  let opts = KuzzleOptions()
  opts.setReplaceIfExist(true)
  try kuzzle.security.createProfile(id: "myprofile", content: roles, options: opts, callback: { result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is KuzzleProfile
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Create a new profile in Kuzzle.

<aside class="notice">
There is a small delay between profile creation and their creation in our advanced search layer, usually a couple of seconds.
That means that a profile that was just been created will not be returned by <code>searchProfiles</code> function
</aside>

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
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleProfile` object.


## createUser

```js
var userContent = {
  // A "profile" field is required to bind a user to an existing profile
  profile: 'admin',

  // The "local" authentication strategy requires a password
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
JSONObject newUser = new JSONObject()
  // A "profile" field is required to bind a user to an existing profile
  .put("profile", "admin")
  // The "local" authentication strategy requires a password
  .put("password", "secret password")
  // You can also set custom fields to your user
  .put("firstname", "John")
  .put("lastname", "Doe");

KuzzleOptions opts = new KuzzleOptions().setReplaceIfExist(true);

kuzzle
  .security
  .createUser("myNewUser", newUser, opts, new KuzzleResponseListener<KuzzleUser>() {
    @Override
    public void onSuccess(KuzzleUser user) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSDictionary* newUser = @{
  @"profile": @"admin",
  @"password": @"secret password",
  @"firstname": @"John",
  @"lastname": @"Doe"
};

NSError* error = nil;
KuzzleOptions* opts = [[KuzzleOptions alloc] init];
opts.replaceIfExist = true;

[kuzzle.security createUserWithId: @"myRole" content: newUser options:opts error: &error callback:^(KuzzleUser * createdUser, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
let newUser = [
  "profile": "admin",
  "password": "secret password",
  "firstname": "John",
  "lastname": "Doe"
]

do {
  let opts = KuzzleOptions()
  opts.setReplaceIfExist(true)
  try kuzzle.security.createUser(id: "newUser", content: newUser, options: opts, callback: { result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is KuzzleRole
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Create a new user in Kuzzle.

<aside class="notice">
There is a small delay between user creation and their creation in our advanced search layer, usually a couple of seconds.
That means that a user that was just been created will not be returned by <code>searchUsers</code> function
</aside>

#### createUser(id, content, [options], [callback])

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
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

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
kuzzle
  .security
  .deleteProfile("myprofile", new KuzzleResponseListener<String>() {
    @Override
    public void onSuccess(String profileName) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSError* error = nil;
[kuzzle.security deleteProfileWithId: @"myprofile" error:&error callback:^(NSString * deletedProfileId, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  try kuzzle.security.deleteProfile(id: "myprofile", callback: {result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is string with id of deleted KuzzleProfile
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Delete profile.

<aside class="notice">
There is a small delay between profile deletion and their deletion in our advanced search layer, usually a couple of seconds.
That means that a profile that was just been delete will be returned by <code>searchProfiles</code> function
</aside>

#### deleteProfile(id, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique profile identifier to delete |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

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
kuzzle
  .security
  .deleteRole("myrole", new KuzzleResponseListener<String>() {
    @Override
    public void onSuccess(String roleName) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSError* error = nil;
[kuzzle.security deleteRoleWithId: @"myrole" error:&error callback:^(NSString * deletedRoleId, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  try kuzzle.security.deleteRole(id: "myrole", callback: {result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is string with id of deleted KuzzleRole
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Delete role.

<aside class="notice">
There is a small delay between role deletion and their deletion in our advanced search layer, usually a couple of seconds.
That means that a role that was just been delete will be returned by <code>searchRoles</code> function
</aside>

#### deleteRole(id, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier to delete |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

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
kuzzle
  .security
  .deleteUser("myuser", new KuzzleResponseListener<String>() {
    @Override
    public void onSuccess(String userName) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSError* error = nil;
[kuzzle.security deleteUserWithId: @"myuser" error:&error callback:^(NSString * deletedUserId, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  try kuzzle.security.deleteUser(id: "myuser", callback: {result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is string with id of deleted KuzzleUser
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Delete user.

<aside class="notice">
There is a small delay between user deletion and their deletion in our advanced search layer, usually a couple of seconds.
That means that a user that has just been delete will be returned by <code>searchUsers</code> function
</aside>

#### deleteUser(id, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique user identifier to delete |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves the user id which has been deleted.

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
KuzzleOptions opts = new KuzzleOptions().setHydrate(true);

kuzzle
  .security
  .getRole("myrole", opts, new KuzzleResponseListener<KuzzleRole>() {
    @Override
    public void onSuccess(KuzzleRole role) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSError* error = nil;
[kuzzle.security getRoleWithId: @"myrole" error: &error callback:^(KuzzleRole * role, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  try kuzzle.security.getRole(id: "myrole", callback: { result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is KuzzleRole
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Retrieves a single stored role using its unique ID.

#### getRole(id, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleRole` object.


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
KuzzleOptions opts = new KuzzleOptions().setHydrate(true);

kuzzle
  .security
  .getProfile("myprofile", opts, new KuzzleResponseListener<KuzzleProfile>() {
    @Override
    public void onSuccess(KuzzleProfile profile) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSError* error = nil;
KuzzleOptions* opts = [[KuzzleOptions alloc] init];
opts.hydrate = true;
[kuzzle.security getProfileWithId: @"myprofile" options: opts error: &error callback:^(KuzzleProfile * profile, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let opts = KuzzleOptions()
  opts.setHydrate(true)
  try kuzzle.security.getProfile(id: "myprofile", options: opts, callback: { result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is KuzzleProfile
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Retrieves a single stored profile using its unique ID.

#### getProfile(id, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique profile identifier |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``hydrate`` | boolean | (option) If set to false, return the attribute roles as array of string instead of `KuzzleRole` (default true) | ``true``
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleProfile` object.


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
KuzzleOptions opts = new KuzzleOptions().setHydrate(true);

kuzzle
  .security
  .getUser("myuser", opts, new KuzzleResponseListener<KuzzleUser>() {
    @Override
    public void onSuccess(KuzzleUser user) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSError* error = nil;
KuzzleOptions* opts = [[KuzzleOptions alloc] init];
opts.hydrate = true;
[kuzzle.security getUserWithId: @"myuser" options: opts error: &error callback:^(KuzzleUser * user, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let opts = KuzzleOptions()
  opts.setHydrate(true)
  try kuzzle.security.getUser(id: "myuser", options: opts, callback: { result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is KuzzleUser
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Retrieves a single stored user using its unique ID.

#### getUser(id, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique user identifier |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``hydrate`` | boolean | (option) If set to false, return the attribute profile as string instead of `KuzzleProfile` (default true) | ``true``
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleUser` object.


## profileFactory

```js
var profileDefinition = {
  roles: [
    'myrole', 'default'
  ]
};

var profile = kuzzle.security.profileFactory('myprofile', profileDefinition);
```

```java
JSONObject profileDefinition = new JSONObject()
  .put("roles", new JSONArray()
    .put("some role")
    .put("some other role")
  );

KuzzleProfile profile = kuzzle.security.profileFactory("myprofile", profileDefinition);
```

```objective_c
NSDictionary* profileContent = @{
  @"roles":@[
    @"someRole",
    @"someOtherRole"
  ]
};

KuzzleProfile* profile = [kuzzle.security profileFactoryWithId: @"myprofile" content: profileContent];
```

```swift
let profileContent = [
  "roles": [
    "someRole",
    "someOtherRole"
  ]
]

let profile = kuzzle.security.profileFactory(id: "myprofile", content: profileContent)
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
JSONObject roleDefinition = new JSONObject()
  .put("indexes", new JSONObject()
    .put("_canCreate", true)
    .put("*", new JSONObject()
      .put("collection", new JSONObject()
        .put("_canCreate", true)
        .put("*", new JSONObject()
          .put("controllers", new JSONObject()
            .put("*", new JSONObject()
              .put("actions", new JSONObject()
                .put("*", true)
              )
            )
          )
        )
      )
    )
  );

KuzzleRole role = kuzzle.security.roleFactory("myrole", roleDefinition);
```

```objective_c
NSDictionary* roleContent = @{
  @"indexes":@{
    @"_canCreate": @true,
    @"*": @{
      @"collections": @{
        @"_canCreate": @true,
        @"*": @{
          @"controllers": @{
            @"*": @{
              @"actions": @{
                @"*": @true
              }
            }
          }
        }
      }
    }
  }
};

KuzzleRole* role = [kuzzle.security roleFactoryWithId: @"myrole" content: roleContent];
```

```swift
let roleContent = [
  "indexes":[
    "_canCreate": true,
    "*": [
      "collections": [
        "_canCreate": true,
        "*": [
          "controllers": [
            "*": [
              "actions": [
                "*": true
              ]
            ]
          ]
        ]
      ]
    ]
  ]
]

let role = kuzzle.security.roleFactory(id: "myrole", content: roleContent)
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
  .searchProfiles(filters, {hydrate: true}, function(error, result) {
    // result is a JSON Object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .searchProfilesPromise(filters, {hydrate: true})
  .then((result) => {
    // result is a JSON Object
  });
```

```java
JSONObject filters = new JSONObject()
  // filter can contains a "roles" array with a list of role IDs
  .put("roles", new JSONArray().put("myrole", "admin"))
  // search results can be paginated
  .put("from", 0)
  .put("size", 10);

KuzzleOptions opts = new KuzzleOptions().setHydrate(false);

kuzzle
  .security
  .searchProfiles(filters, opts, new KuzzleResponseListener<KuzzleSecurityDocumentList>() {
    @Override
    public void onSuccess(KuzzleSecurityDocumentList profiles) {
      // Contains a profiles list
      for(KuzzleProfile profile : profiles.getDocuments()) {

      }

      // And the total number of profiles, regardless of pagination
      profiles.getTotal();
    }

    @Override
    public void onError(JSONObject error) {

    }
  });

```

```objective_c
NSError* error = nil;
KuzzleOptions* opts = [[KuzzleOptions alloc] init];
opts.hydrate = YES;
NSDictionary* filters = @{
  @"roles": @[
    @"myrole",
    @"admin"
  ],
  @"from": @0,
  @"size": @10
};

[kuzzle.security searchProfilesWithFilters: filters options: opts error: &error callback:^(NSArray<KuzzleProfile *> * profiles, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let opts = KuzzleOptions()
  opts.setHydrate(false)
  let filters = [
      "roles": [
          "myrole",
          "admin"
      ],
      "from": 0,
      "size": 1
  ]
  try kuzzle.security.searchProfiles(filters: filters, options: opts, callback: {result in
    switch result {
      case let .onError(error):
      // error occured during call, error is NSError
      break
      case let .onSuccess(success):
      // everything went fine, success is array with KuzzleProfile objects
      break
    }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

> Callback response:

```json
{
  "total": 124,
  "documents": [
    // array of KuzzleProfile
  ]
}
```

Executes a search on profiles according to a filter

#### searchProfiles(filters, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | List of filters to retrieves roles |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``hydrate`` | boolean | (Optional) if hydrate is `true`, return the attribute roles as array of string instead of `KuzzleRole` (default true) | ``true``
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

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
  .searchUsers(filters, {hydrate: true}, function(error, result) {
    // result is a JSON Object
  });

// Using promises (NodeJS)
kuzzle
  .security
  .searchUsersPromise(filters, {hydrate: true})
  .then((result) => {
    // result is a JSON Object
  });
```

```java
JSONObject filter = new JSONObject()
  .put("filter", new JSONObject()
    .put("and", new JSONArray()
      .put("terms", new JSONObject()
        .put("profile", new JSONArray().put("anonymous").put("default"))
      )
      .put("geo_distance", new JSONObject()
        .put("distance", "10km")
        .put("pos", new JSONObject()
          .put("lat", "48.8566140")
          .put("lon", "2.352222")
        )
      )
    )    
  );

KuzzleOptions opts = new KuzzleOptions().setHydrate(false);

kuzzle
  .security
  .searchUsers(filters, opts, new KuzzleResponseListener<KuzzleSecurityDocumentList>() {
    @Override
    public void onSuccess(KuzzleSecurityDocumentList users) {
      // users.getDocuments() returns an users list
      for(KuzzleUser user : users.getDocuments()) {

      }

      // users.getTotal() returns the number of matched users, regardless of pagination
      users.getTotal();
    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSError* error = nil;
KuzzleOptions* opts = [[KuzzleOptions alloc] init];
opts.hydrate = NO;
NSDictionary* filters = @{
  @"filter": @{
    @"and": @[
      @{
        @"terms": @{
          @"profile": @[
            @"anonymous",
            @"default"
          ]
        }
      },
      @{
        @"geo_distance": @{
          @"distance": @"10km",
            @"pos": @{
             @"lat": @"54.4838902",
             @"lon": @"17.01559"
            }
          }
        }
      ]
    }
};

[kuzzle.security searchUsersWithFilters: filters options: opts error: &error callback:^(NSArray<KuzzleUser *> * users, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let opts = KuzzleOptions()
  opts.setHydrate(false)
  let filters = [
    "filter": [
      "and": [
        [
          "terms": [
            "profile": [
              "anonymous",
              "default"
            ]
          ]
        ],
        [
          "geo_distance": [
            "distance": "10km",
            "pos": [
              "lat": "54.4838902",
              "lon": "17.01559"
            ]
          ]
        ]
      ]
    ]
  ]

  try kuzzle.security.searchUsers(filters: filters, options: opts, callback: {result in
    switch result {
      case let .onError(error):
      // error occured during call, error is NSError
      break
      case let .onSuccess(success):
      // everything went fine, success is array with KuzzleUser objects
      break
    }
})
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
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

#### searchUsers(filters, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | Filters in [Kuzzle DSL](https://github.com/kuzzleio/kuzzle/blob/master/docs/filters.md) format |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``hydrate`` | boolean | (option) If set to false, return the attribute profile as string instead of `KuzzleProfile` (default true) | ``true``
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

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
JSONObject filter = new JSONObject()
  .put("indexes", new JSONArray()
    .put("index")
    .put("index2")
  )
  .put("from", 0)
  .put("size", 10);


kuzzle
  .security
  .searchRoles(filter, new KuzzleResponseListener<KuzzleSecurityDocumentList>() {
    @Override
    public void onSuccess(KuzzleSecurityDocumentList roles) {
      // roles.getDocuments() returns a roles list
      for(KuzzleRole role : roles.getDocuments()) {

      }

      // roles.getTotal() returns the number of matched roles, regardless of pagination
      roles.getTotal();
    }
  });
```

```objective_c
NSError* error = nil;
NSDictionary* filters = @{
  @"roles": @[
    @"myrole",
    @"admin"
  ],
  @"from": @0,
  @"size": @10
};

[kuzzle.security searchRolesWithFilters: filters error: &error callback:^(NSArray<KuzzleRole *> * roles, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let filters = [
      "roles": [
          "myrole",
          "admin"
      ],
      "from": 0,
      "size": 1
  ]
  try kuzzle.security.searchRoles(filters: filters, allback: {result in
    switch result {
      case let .onError(error):
      // error occured during call, error is NSError
      break
      case let .onSuccess(success):
      // everything went fine, success is array with KuzzleRole objects
      break
    }
})
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
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

#### searchRoles(filters, [options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``filters`` | JSON Object | List of filters to retrieves roles |
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

Available filters:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``indexes`` | array | List of indexes id related to the searched role | ``undefined`` |
| ``from`` | number | Starting offset | ``0`` |
| ``to`` | number |  Number of hits to return | ``20`` |

#### Callback response

Resolves to a JSON Object

## updateProfile

```js
var newContent = { roles: ['other', 'roles']}

// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .updateProfile("profile ID", newContent, function (err, updatedProfile) {

  });

// Using promises (NodeJS)
kuzzle
  .security
  .updateProfilePromise("profile ID", newContent)
  .then(updatedProfile => {

  });
```

```java
JSONObject newContent = new JSONObject()
  .put("roles", new JSONArray()
    .put("other")
    .put("roles")
  );

kuzzle
  .security
  .updateProfile("profile ID", newContent, new KuzzleResponseListener<KuzzleProfile>() {
    @Override
    public void onSuccess(KuzzleProfile profile) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSDictionary* newContent = @{
  @"roles": @[
    @"other",
    @"roles"
  ]
};

NSError* error = nil;
[kuzzle.security updateProfileWithId: @"profileId" content: newContent error: &error callback:^(KuzzleProfile * updatedProfile, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let newContent = [
    "roles": [
      "other",
      "roles"
    ]
  ]
  try kuzzle.security.updateProfile(id: "profileId", content: newContent, callback: { result in
    switch result {
      case let .onError(error):
      // error occured during call, error is NSError
      break
      case let .onSuccess(success):
      // everything went fine, success is updated KuzzleProfile object
      break
    }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

#### updateProfile(id, content, [options], [callback])

Performs a partial update on an existing profile.

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier |
| ``content`` | JSON Object | A plain javascript object representing the profile |
| ``options`` | string | (Optional) Optional arguments |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to an updated `KuzzleProfile` object

## updateRole

```js
var newContent = {
  indexes: {
    'some index': {
      '_canCreate': false
    }
  }
};

// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .updateRole("role ID", newContent, function (err, updatedRole) {

  });

// Using promises (NodeJS)
kuzzle
  .security
  .updateRolePromise("profile ID", newContent)
  .then(updatedRole => {

  });
```

```java
JSONObject newContent = new JSONObject()
  .put("indexes", new JSONObject()
    .put("some index", new JSONObject()
      .put("_canCreate", false)
    )
  );

kuzzle
  .security
  .updateRole("Role ID", newContent, new KuzzleResponseListener<KuzzleRole>() {
    @Override
    public void onSuccess(KuzzleRole role) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSDictionary* newContent = @{
  @"indexes": @{
    @"someIndex": @{
      @"_canCreate": @NO
    }
  }
};

NSError* error = nil;
[kuzzle.security updateRoleWithId: @"roleId" content: newContent error: &error callback:^(KuzzleRole * updatedRole, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let newContent = [
    "indexes": [
      "someIndex": [
        "_canCreate": false
      ]
    ]
  ]
  try kuzzle.security.updateRole(id: "roleId", content: newContent, callback: { result in
    switch result {
      case let .onError(error):
      // error occured during call, error is NSError
      break
      case let .onSuccess(success):
      // everything went fine, success is updated KuzzleRole object
      break
    }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

#### updateRole(id, content, [options], [callback])

Performs a partial update on an existing role.

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier |
| ``content`` | JSON Object | A plain javascript object representing the role |
| ``options`` | string | (Optional) Optional arguments |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to an updated `KuzzleRole` object


## updateUser

```js
var newContent = {
  firstname: 'My Name Is',
  lastname: 'Jonas'
};


// Using callbacks (NodeJS or Web Browser)
kuzzle
  .security
  .updateUser("User ID", newContent, function (err, updatedUser) {

  });

// Using promises (NodeJS)
kuzzle
  .security
  .updateUserPromise("User ID", newContent)
  .then(updatedUser => {

  });
```

```java
JSONObject newContent = new JSONObject()
  .put("firstname", "My Name Is")
  .put("lastname", "Jonas");

kuzzle
  .security
  .updateUser("User ID", newContent, new KuzzleResponseListener<KuzzleUser>() {
    @Override
    public void onSuccess(KuzzleUser user) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

```objective_c
NSDictionary* newContent = @{
  @"firstname": @"My Name Is",
  @"lastname": @"Jonas"
};

NSError* error = nil;
[kuzzle.security updateUserWithId: @"userId" content: newContent error: &error callback:^(KuzzleUser * updatedUser, NSError * error) {
  if(error) {
    // error occured
  }
  // everything went fine
}];

if(error) {
  // NSError reprsentation for KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

```swift
do {
  let newContent = [
    "firstname": "My Name Is",
    "lastname": "Jonas"
  ]
  try kuzzle.security.updateUser(id: "userId", content: newContent, callback: { result in
    switch result {
      case let .onError(error):
      // error occured during call, error is NSError
      break
      case let .onSuccess(success):
      // everything went fine, success is updated KuzzleUser object
      break
    }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

#### updateUser(id, content, [options], [callback])

Performs a partial update on an existing user.

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique role identifier |
| ``content`` | JSON Object | A plain javascript object representing the user |
| ``options`` | string | (Optional) Optional arguments |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Filter | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to an updated `KuzzleUser` object

## userFactory

```js
var userContent = {
  // A "profile" field is required to bind a user to an existing profile
  profile: 'some profile',

  // The "local" authentication strategy requires a password
  password: 'secretPassword',

  // You can also set custom fields to your user
  firstname: 'John',
  lastname: 'Doe'
};

var user = kuzzle.security.userFactory('myuser', userContent);
```

```java
JSONObject userContent = new JSONObject()
    // A "profile" field is required to bind a user to an existing profile
    .put("profile", "some profile")
    // The "local" authentication strategy requires a password
    .put("password", "a password")
    // You can also set custom fields to your user
    .put("firstname", "John")
    .put("lastname", "Doe");

KuzzleUser user = kuzzle.security.userFactory("userId", userContent);  
```

```objective_c
NSDictionary* userContent = @{
                              @"profile": @"someProfile",
                              @"password": @"a password",
                              @"firstname": @"John",
                              @"lastname": @"Doe"
                              };

KuzzleUser* user = [kuzzle.security userFactoryWithId: @"myuser" content: userContent];
```

```swift
let userContent = [
    "profile": "someProfile",
    "password": "a password",
    "firstname": "John",
    "lastname": "Doe"
]

let user = kuzzle.security.userFactory(id: "myuser", content: userContent)
```

Instantiate a new KuzzleUser object.

#### userFactory(id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique user identifier |
| ``content`` | JSON Object | User content |

#### Return value

Returns the `KuzzleUser` object.
