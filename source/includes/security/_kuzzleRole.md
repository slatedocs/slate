# ~ KuzzleRole

KuzzleRole is the object representation of a set of right policy


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

Instantiate a new KuzzleRole object.

#### KuzzleRole(KuzzleSecurity, id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleSecurity`` | KuzzleSecurity | An instanciated KuzzleSecurity object |
| ``id`` | string | Unique role identifier |
| ``content`` | JSON Object | Role content |

**Note:**  this constructor won't make any call to Kuzzle.

#### Return value

Returns the `KuzzleRole` object.


## save

```js
var roleDefinition = {
  // define role definition
};

var role = kuzzle.security.roleFactory('myrole', roleDefinition)

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

Create or replace the role in kuzzle

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
var role = kuzzle.security.getRole('myrole');
var roleDefinition = {
  // define new role definition
};

role = role.setContent(roleDefinition);
```

```java
```

Replace the content of KuzzleRole

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object | Role content |

#### Return value

Returns the `KuzzleRole` object.
