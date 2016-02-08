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

var role = kuzzle.security.profileFactory('myprofile', profileDefinition)
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
var role = kuzzle.security.getRole('myrole')
var profile = kuzzle.security.getProfile('myprofile')

// Can add a role with directly give a KuzzleRole object
profile.addRole(role);

// Or by passing it's id
profile.addRole('myrole');
```

Add a role in the roles' profile list

#### addRole(id)

#### addRole(role)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique id corresponding to the new associated role |
| ``role`` | KuzzleRole | Role instance corresponding to the new associated role |

#### Return value

Returns the `KuzzleRole` object.


## hydrate

```js
var profileDefinition = {
  roles: [
    'myrole', 'default'
  ]
};

var profile = kuzzle.security.profileFactory('myprofile', profileDefinition)

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

var profile = kuzzle.security.profileFactory('myprofile', profileDefinition)

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

Create or replace the profile in kuzzle

#### save()

#### save([callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves to a `KuzzleRole` object.


## serialize

```js
var role = kuzzle.security.getRole('myrole');

var roleDefinition = role.serialize();
```

```java
```

Serialize this object into a JSON object

#### serialize()

#### Return value

Returns the content of `KuzzleRole` as JSON object.


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
var role = kuzzle.security.getRole('myrole')
var profile = kuzzle.security.getProfile('myprofile')

// Replace the associated roles with new set, which can be either strings, KuzzleRole or both
profile.setRoles([role, 'default']);
```

Replace the roles associated to the profile

#### setRoles(roles)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``roles`` | array | Array of string or KuzzleRole objects |

#### Return value

Returns the `KuzzleRole` object.
