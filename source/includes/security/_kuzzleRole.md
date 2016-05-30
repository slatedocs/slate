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

// Using the KuzzleSecurity factory:
KuzzleRole* role = [kuzzle.security roleFactoryWithId: @"roleId" content: roleContent];

// Or directly with the constructor:
KuzzleRole* role = [[KuzzleRole alloc] initWithSecurity: kuzzle.security id: @"roleId" content: roleContent];
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

// Using the KuzzleSecurity factory:
let role = kuzzle.security.roleFactory(id: "roleId", content: roleContent)

// Or directly with the constructor:
let role = KuzzleRole(security: kuzzle.security, id: "roleid", content: roleContent)
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

```objective_c
NSError* error = nil;
[role deleteAndReturnError: &error callback:^(NSString * roleId, NSError * error) {
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
  try role.delete(callback: { result in
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

role.update(updateContent, new KuzzleResponseListener<KuzzleRole>() {
  @Override
  public void onSuccess(KuzzleRole updatedRole) {

  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

```objective_c
NSError* error = nil;
NSDictionary* updatedContent = @{
  @"indexes": @{
    @"_canCreate": @true,
    @"*": @{
      @"collection": @{
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
[role updateWithContent: updatedContent error: &error callback:^(KuzzleRole * updatedRole, NSError * onError) {
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
let updatedContent = [
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
    role.update(content: updatedContent, callback: {result in
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


#### update(content, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``content`` | JSON Object | New role content |
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

```objective_c
NSError* error = nil;
[role saveAndReturnError: &error callback:^(KuzzleRole * savedRole, NSError * error) {
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
  try role.save(callback: { result in
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

```objective_c
NSDictionary* newContent = @{
  @"indexes": @{
    @"_canCreate": @true,
    @"*": @{
      @"collection": @{
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
[role setContentWithData: newContent];
```

```swift
let newContent = [
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

role.setContent(content: newContent)
```

Replaces the content of the `KuzzleRole` object.

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object | Role content |

#### Return value

Returns the `KuzzleRole` object.
