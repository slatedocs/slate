# ~ KuzzleProfile

KuzzleProfile is the object representation of a profile, which is an set of one or many KuzzleRole


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

Instantiate a new KuzzleProfile object.

#### KuzzleProfile(KuzzleSecurity, id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleSecurity`` | KuzzleSecurity | An instanciated KuzzleSecurity object |
| ``id`` | string | Unique profile identifier |
| ``content`` | JSON Object | Profile content |

**Note:**  this constructor won't make any call to Kuzzle.

#### Return value

Returns the `KuzzleRole` object.


## addRole

```js
var role = kuzzle.security.getRole('myrole');
var profile = kuzzle.security.getProfile('myprofile');

// Passing a KuzzleRole object
profile.addRole(role);

// Or by passing it's id
profile.addRole('myrole');
```

Adds a role to the profile.

<aside class="notice">
If you are trying to bind roles which have not be saved before, an error will if you try to save or hydrate this object.
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

Delete the profile in Kuzzle

#### delete()

#### delete([callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves the id of deleted profile.


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

Hydrate KuzzleProfile with associated KuzzleRole

<aside class="warning">
Hydrating this object can rise an error if one of the associated roles are not created in Kuzzle
</aside>

#### hydrate(callback)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | Callback handling the response |

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

Creates or replaces the profile in Kuzzle

<aside class="warning">
Saving this object can rise an error if one of the associated roles are not created in Kuzzle
</aside>

#### save()

#### save([callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | (Optional) Callback handling the response |

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

Replace the content of KuzzleRole

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

Replace the roles associated to the profile

<aside class="notice">
If you are trying to bind roles which have not be saved before, an error will rise if you try to save or hydrate this object.
</aside>

#### setRoles(roles)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``roles`` | array | Array of string or KuzzleRole objects |

#### Return value

Returns the `KuzzleRole` object.
