# ~ KuzzleProfile

KuzzleProfile is the object representation of a profile, which is a set of one or many KuzzleRole objects.


## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleProfile objects are returned by KuzzleSecurity.profileFactory method:
 */
var profileDefinition = {
  roles: [
    'myrole', 'default'
  ]
};

var role = kuzzle.security.profileFactory('myprofile', profileDefinition);
```

```java
```

Instantiates a new ̀`KuzzleProfile` object.

#### KuzzleProfile(KuzzleSecurity, id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleSecurity`` | KuzzleSecurity | An instanciated KuzzleSecurity object |
| ``id`` | string | Unique profile identifier |
| ``content`` | JSON Object | Profile content |

**Note:**  this constructor won't make any call to Kuzzle.

#### Return value

Returns to the `KuzzleRole` object.


## addRole

```js
var role = kuzzle.security.getRole('myrole');
var profile = kuzzle.security.getProfile('myprofile');

// Passing a KuzzleRole object
profile.addRole(role);

// Or by passing its id
profile.addRole('myrole');
```

Adds a role to the profile.

<aside class="notice">
If you are trying to bind roles which have not be saved before, an error will be thrown if you try to save or hydrate this object.
</aside>

#### addRole(id)

#### addRole(role)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique id corresponding to the new associated role |
| ``role`` | KuzzleRole | Role instance corresponding to the new associated role |

#### Return value

Returns the `KuzzleRole` object.


## delete

```js
var profile = kuzzle.security.getProfile('myprofile');

// Using callbacks (NodeJS or Web Browser)
profile
  .delete(function(error, result) {
    // result is the id of deleted profile
  });

// Using promises (NodeJS)
profile
  .deletePromise()
  .then((result) => {
    // result is the id of deleted profile
  });
```

```java
```

Deletes the profile from Kuzzle's database layer.

#### delete([options, callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to the id of deleted profile.


## hydrate

```js
var profileDefinition = {
  roles: [
    'myrole', 'default'
  ]
};

var profile = kuzzle.security.profileFactory('myprofile', profileDefinition);

// Using callbacks (NodeJS or Web Browser)
profile
  .hydrate(function(error, result) {
    // result is a KuzzleProfile object
    // with hydrated roles as KuzzleRole
  });

// Using promises (NodeJS)
profile
  .hydratePromise()
  .then((result) => {
    // result is a KuzzleProfile object
    // with hydrated roles as KuzzleRole
  });
```

```java
```

Hydrates the KuzzleProfile object with its associated KuzzleRole.  
Hydrating the object transforms the `roles` property from an array of role ids to an array of KuzzleRole objects.

<aside class="warning">
Hydrating the object will rise an error if the roles are not previously created in Kuzzle.
</aside>

#### hydrate([options], callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleProfile` object.


## save

```js
var profileDefinition = {
  roles: [
    // list of associated roles id
  ]
};

var profile = kuzzle.security.profileFactory('myprofile', profileDefinition);

// Using callbacks (NodeJS or Web Browser)
profile
  .save(function(error, result) {
    // result is a KuzzleProfile object
  });

// Using promises (NodeJS)
profile
  .savePromise()
  .then((result) => {
    // result is a KuzzleProfile object
  });
```

```java
```

Creates or replaces the profile in Kuzzle.

<aside class="warning">
Saving the object will rise an error if the roles are not previously created in Kuzzle.
</aside>

#### save([options, callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleRole` object.


## setContent

```js
var profile = kuzzle.security.getProfile('myprofile');
var profileDefinition = {
  roles: [
    // list of associated roles id
  ]
};

profile = profile.setContent(profileDefinition);
```

```java
```

Replaces the content of the `KuzzleRole` object.

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object | Profile content |

#### Return value

Returns the `KuzzleRole` object.


## setRoles

```js
var role = kuzzle.security.getRole('myrole');
var profile = kuzzle.security.getProfile('myprofile');

// Replaces the profile roles set with the given entry.
// The entry can be an array of KuzzleRole objects, an array of role ids or a mix of the two.
profile.setRoles([role, 'default']);
```

Replaces the roles associated to the profile.

<aside class="notice">
If you are trying to bind roles which have not been previously saved, an error will rise if you try to save or hydrate this object.
</aside>

#### setRoles(roles)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``roles`` | array | Array of string or KuzzleRole objects |

#### Return value

Returns the `KuzzleRole` object.
