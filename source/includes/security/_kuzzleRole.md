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


## delete

```js
var role = kuzzle.security.getRole('myrole');

// Using callbacks (NodeJS or Web Browser)
role
  .delete(function(error, result) {
    // result is the id of deleted role
  });

// Using promises (NodeJS)
role
  .deletePromise()
  .then((result) => {
    // result is the id of deleted role
  });
```

```java
```

Deletes the role from Kuzzle's database layer.

#### delete()

#### delete([callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves to the id of the deleted role.


## save

```js
var roleDefinition = {
  // define role definition
};

var role = kuzzle.security.roleFactory('myrole', roleDefinition);

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
```

Creates or replaces the role in Kuzzle's database layer.

#### save()

#### save([callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``callback`` | function | (Optional) Callback handling the response |

#### Callback response

Resolves to a `KuzzleRole` object.


## setContent

```js
var role = kuzzle.security.getRole('myrole');
var roleDefinition = {
  // define new role definition
};

role = role.setContent(roleDefinition);
```

```java
```

Replaces the content of the `KuzzleRole` object.

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object | Role content |

#### Return value

Returns the `KuzzleRole` object.
