# ~ KuzzleRole

KuzzleRole is the object representation of a set of right policies.


## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleRole objects are returned by KuzzleSecurity.roleFactory method:
 */
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

var role = kuzzle.security.roleFactory('myrole', roleDefinition);
```

```java
JSONObject content = new JSONObject();
KuzzleRole role = new KuzzleRole(kuzzle.security, "role ID", content);
```

Instantiates a new `KuzzleRole` object.

#### KuzzleRole(KuzzleSecurity, id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleSecurity`` | KuzzleSecurity | An instanciated KuzzleSecurity object |
| ``id`` | string | Unique role identifier |
| ``content`` | JSON Object | Role content |

**Note:**  this constructor won't make any call to Kuzzle.

#### Return value

Returns the `KuzzleRole` object.

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| `content` | JSON object | Raw role content | get |
| `id` | string | Unique profile identifier | get |

## delete

```js
// Using callbacks (NodeJS or Web Browser)
role.delete(function(error, deletedId) {
  // ...
});

// Using promises (NodeJS)
role.deletePromise()
  .then(deletedId => {
    // ...
  });
```

```java
role.delete(new KuzzleResponseListener<String>() {
  @Override
  public void onSuccess(String deletedId) {

  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

Deletes the role from Kuzzle's database layer.

#### delete([options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to the id of the deleted role.

## update

```js
var updateContent = {
  indexes: {
    "some index": {
      _canCreate: false,
      "*": {
        collections: {
          _canCreate: true,
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
  }
};

// Using callbacks (NodeJS or Web Browser)
role.update(updateContent, function(err, updatedRole) {
  // the updatedRole variable is the updated KuzzleRole object
})

// Using promises (NodeJS)
role
  .updatePromise(updateContent)
  .then(updatedRole => {
    // the updatedRole variable is the updated KuzzleRole object
  });
```

```java
JSONObject updateContent = new JSONObject()
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

role.update(new KuzzleResponseListener<KuzzleRole>() {
  @Override
  public void onSuccess(KuzzleRole updatedRole) {

  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

Updates the role object Kuzzle's database layer.

<aside class="warning">
  <p>
    Unlike a regular document update, this method will replace the whole role definition under the indexes node by the <code>updateContent</code> parameter.<br>
    In other words, you always need to provide the complete role definition in the <code>updateContent</code> object.
  </p>
  <p>
    This method has the same effect as calling <a href="#setContent"><code>setContent</code></a> followed by the <a href="#save"><code>save</code></a> method.
  </p>
</aside>

To get some more detailed information on the expected role definition, please refer to [Kuzzle's role reference definition documentation](https://github.com/kuzzleio/kuzzle/blob/master/docs/security/roles-reference.md).

To get some more detailed information about Kuzzle's user management model, please refer to [Kuzzle's security documentation](https://github.com/kuzzleio/kuzzle/blob/master/docs/security/).


#### update([options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | Optional callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |


#### Callback response

Resolves to the updated version of this object

## save

```js
// Using callbacks (NodeJS or Web Browser)
role
  .save(function(error, result) {
    // result is a KuzzleRole object
  });

// Using promises (NodeJS)
role
  .savePromise()
  .then((result) => {
    // result is a KuzzleRole object
  });
```

```java
role.save(new KuzzleResponseListener<KuzzleRole> {
  @Override
  public void onSuccess(KuzzleRole savedRole) {

  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

Creates or replaces the role in Kuzzle's database layer.


#### save([options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``options`` | JSON Object | Optional parameters |
| ``callback`` | function | (Optional) Callback handling the response |

Available options:

| Option | Type | Description | Default |
|---------------|---------|----------------------------------------|---------|
| ``queuable`` | boolean | Mark this request as (not) queuable | ``true`` |

#### Callback response

Resolves to a `KuzzleRole` object.


## setContent

<aside class="note">
Updating a role content will have no impact until the <code>save</code> method is called
</aside>

```js
role = role.setContent(roleDefinition);
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

role.setContent(roleDefinition);
```

Replaces the content of the `KuzzleRole` object.

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object | Role content |

#### Return value

Returns the `KuzzleRole` object.
