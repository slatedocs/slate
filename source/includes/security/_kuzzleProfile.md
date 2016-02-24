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
JSONObject roles = new JSONObject()
  .put("roles", new JSONArray()
    .put("some role")
    .put("some othe role")
  );

KuzzleProfile profile = new KuzzleProfile(kuzzle.security, "profileId", roles);
```

Instantiates a new `KuzzleProfile` object.

#### KuzzleProfile(KuzzleSecurity, id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleSecurity`` | KuzzleSecurity | An instanciated KuzzleSecurity object |
| ``id`` | string | Unique profile identifier |
| ``content`` | JSON Object | Profile content |

**Note:**  this constructor won't make any call to Kuzzle.

#### Return value

Returns to the `KuzzleProfile` object.

## Properties

There are no exposed properties for this object.


## addRole

```js
// Passing a KuzzleRole object
profile.addRole(kuzzle.security.roleFactory("some role ID", {}));

// Or by passing its id
profile.addRole('myrole');
```

```java
profile.addRole("a role ID");

// you may also add a KuzzleRole object directly
profile.addRole(kuzzle.security.getRole("another role ID"));
```

Adds a role to the profile.

<aside class="note">
Updating a profile will have no impact until the <code>save</code> method is called
</aside>

#### addRole(id)

#### addRole(role)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``id`` | string | Unique id corresponding to the new associated role |
| ``role`` | KuzzleRole | Role instance corresponding to the new associated role |

#### Return value

Returns the `KuzzleProfile` object to allow chaining calls.


## delete

```js
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
profile
  .delete(new KuzzleResponseListener<String>() {
    @Override
    public void onSuccess(String deleteId) {

    }

    @Override
    public void onError(JSONObject error) {

    }
  });
```

Deletes this profile from Kuzzle.

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
  .hydrate(function(error, hydratedProfile) {
    // the result is a KuzzleProfile object
    // with hydrated roles as KuzzleRole
  });

// Using promises (NodeJS)
profile
  .hydratePromise()
  .then(hydratedProfile => {
    // the result is a KuzzleProfile object
    // with hydrated roles as KuzzleRole
  });
```

```java
JSONObject roles = new JSONObject()
  .put("roles", new JSONArray()
    .put("myrole")
    .put("default")
  );

KuzzleProfile profile = kuzzle.security.profileFactory("myprofile", roles);

profile.hydrate(new KuzzleResponseListener<KuzzleProfile>() {
  @Override
  public void onSuccess(KuzzleProfile hydratedProfile) {
    // the HydratedProfile now contains role definitions for each bound roles
  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

Hydrates the KuzzleProfile object with its associated KuzzleRole.  
Hydrating the object transforms the `roles` property from an array of role ids to an array of KuzzleRole objects.

<aside class="warning">
Hydrating the object will rise an error if the bound roles have not yet been created in Kuzzle.
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
JSONObject roles = new JSONObject()
  .put("roles", new JSONArray()
    .put("myrole")
    .put("default")
  );

KuzzleProfile profile = kuzzle.security.profileFactory("myprofile", roles);

profile.save(new KuzzleResponseListener<KuzzleProfile>() {
  @Override
  public void onSuccess(KuzzleProfile savedProfile) {

  }

  @Overrid public void onError(JSONObject error) {

  }
});
```

Creates or replaces the profile in Kuzzle.

<aside class="warning">
Saving the object will rise an error if the bound roles have not been previously created in Kuzzle.
</aside>

#### save([options], [callback])

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


## setContent

<aside class="note">
Updating a profile will have no impact until the <code>save</code> method is called
</aside>

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
JSONObject newRolesList = new JSONObject()
  .put("roles", new JSONArray()
    .put("a role ID")
    .put("another role ID")
    .put("this profile")
    .put("has too many")
    .put("roles in it")
  );

profile.setContent(newRolesList);
```

Replaces the content of the `KuzzleProfile` object.

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object | Profile content |

#### Return value

Returns the `KuzzleProfile` object.


## setRoles

<aside class="note">
Updating a profile will have no impact until the <code>save</code> method is called
</aside>

```js
KuzzleRole role = kuzzle.security.roleFactory("roleId", {});

// Replaces the profile roles set with the given entry.
// The entry can be an array of KuzzleRole objects, an array of role ids or a mix of the two.
profile.setRoles([role, 'default']);
```

```java
KuzzleRole
  role1 = kuzzle.security.roleFactory("role1 ID", new JSONObject()),
  role2 = kuzzle.security.roleFactory("role2 ID", new JSONObject()),
  role3 = kuzzle.security.roleFactory("role3 ID", new JSONObject());

// Binding role objects to a profile
profile.setRoles({role1, role2, role3});

// Binding role IDs to a profile
profile.setRoles({"role1 ID", "role2 ID", "role3 ID"});
```

Replaces the roles associated to the profile.


#### setRoles(roles)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``roles`` | array | Array of string or KuzzleRole objects |

#### Return value

Returns the `KuzzleProfile` object.
