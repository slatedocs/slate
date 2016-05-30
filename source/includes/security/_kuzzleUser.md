# ~ KuzzleUser

KuzzleUser is the object representation of an user, which is associated to a KuzzleProfile

## Constructors

```js
/*
 Constructors are not exposed in the JS/Node SDK.
 KuzzleUser objects are returned by KuzzleSecurity.userFactory method:
 */
 var userContent = {
   // A "profile" field is required to bind a user to an existing profile
   profile: 'admin',

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
  .put("profile", "admin")
  // The "local" authentication strategy requires a password
  .put("password", "secret password")
  // You can also set custom fields to your user
  .put("firstname", "John")
  .put("lastname", "Doe");

// Using the KuzzleSecurity factory:
KuzzleUser user = kuzzle.security.userFactory("user ID", userContent);

// Or directly with the constructor:
KuzzleUser user = new KuzzleUser(kuzzle.security, "user ID", userContent);
```

```objective_c
NSDictionary* userContent = @{
  @"profile": @"admin",
  @"password": @"secret password",
  @"firstname": @"John",
  @"lastname": @"Doe"
};

// Using the KuzzleSecurity factory:
KuzzleUser* user = [kuzzle.security userFactoryWithId: @"userId" content: userContent];

// Or directly with the constructor:
KuzzleUser* user = [[KuzzleUser alloc] initWithSecurity: kuzzle.security id: @"userId" content: userContent];
```

```swift
let userContent = [
  "profile": "admin",
  "password": "secret password",
  "firstname": "John",
  "lastname": "Doe"
]

// Using the KuzzleSecurity factory:
let user = kuzzle.security.userFactory(id: "userId", content: userContent)

// Or directly with the constructor:
let user = KuzzleUser(security: kuzzle.security, id: "userId", content: userContent)
```

Instantiate a new KuzzleUser object.

#### KuzzleUser(KuzzleSecurity, id, content)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``KuzzleSecurity`` | KuzzleSecurity | An instanciated KuzzleSecurity object |
| ``id`` | string | Unique user identifier |
| ``content`` | JSON Object | User content |

**Note:**  this constructor won't make any call to Kuzzle.

#### Return value

Returns the `KuzzleUser` object.

## Properties

| Property name | Type | Description | get/set |
|--------------|--------|-----------------------------------|---------|
| `content` | JSON object | Raw user content | get |
| `id` | string | Unique profile identifier | get |

## delete

```js
// Using callbacks (NodeJS or Web Browser)
user
  .delete(function(error, result) {
    // result is the id of deleted user
  });

// Using promises (NodeJS)
user
  .deletePromise()
  .then((result) => {
    // result is the id of deleted user
  });
```

```java
user.delete(new KuzzleResponseListener<String>() {
  @Override
  public void onSuccess(String deletedId) {

  }

  @Override public void onError(JSONObject error) {

  }
});
```

```objective_c
NSError* error = nil;
[user deleteAndReturnError: &error callback:^(NSString * userId, NSError * error) {
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
  try user.delete(callback: { result in
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

Deletes the user in Kuzzle

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

Resolves to a `String` containing the deleted user ID

## getProfiles

```js
for (profile of user.getProfiles()) {
  // profile can either be a profile ID if the object has not been hydrated,
  // or a KuzzleProfile object otherwise
}
```

```java
for(KuzzleProfile profile : user.getProfiles()) {
  // if this object has not been hydrated, the profile object has no content
}
```

```objective_c
for (KuzzleProfile* profile in [user getProfiles]) {
  // if this object has not been hydrated, the profile object has no content
}
```

```swift
for profile in user.getProfiles() {
    // if this object has not been hydrated, the profile object has no content
}
```

Returns this user associated profiles.

#### Return value

Returns an array of associated profiles

## hydrate

```js
var userContent = {
  profile: ['myprofile']
};

var user = kuzzle.security.userFactory('myuser', userContent);

// Using callbacks (NodeJS or Web Browser)
user
  .hydrate(function(error, result) {
    // result is a KuzzleUser object
    // with hydrated profile as KuzzleProfile
    // which contains also hydrated roles as KuzzleRole
  });

// Using promises (NodeJS)
user
  .hydratePromise()
  .then((result) => {
    // result is a KuzzleUser object
    // with hydrated profile as KuzzleProfile
    // which contains also hydrated roles as KuzzleRole
  });
```

```java
JSONObject userContent = new JSONObject()
  .put("profile", new JSONArray()
    .put("myprofile")
  );

KuzzleUser = kuzzle.security.userFactory("myuser", userContent);

user.hydrate(new KuzzleResponseListener<KuzzleUser>() {
  @Override
  public void onSuccess(KuzzleUser user) {

  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

```objective_c
NSDictionary* userContent = @{@"profile": @[
                                  @"myprofile"
                                  ]
                              };

KuzzleUser* user = [kuzzle.security userFactoryWithId: @"myuser" content: userContent];

NSError* error = nil;
[user hydrateAndReturnError: &error callback:^(KuzzleUser * hydratedUser, NSError * error) {
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
let userContent = [
  "profile": [
    "myprofile"
  ]
]
let user = kuzzle.security.userFactory(id: "userId", content: userContent)
do {
  try user.hydrate(callback: { result in
      switch result {
        case let .onError(error):
        // error occured during call, error is NSError
        break
        case let .onSuccess(success):
        // everything went fine, success is KuzzleUser object
        break
      }
  })
} catch {
  // KuzzleError.IllegalState, when Kuzzle state is .DISCONNECTED
}
```

Hydrates this KuzzleUser object with its associated KuzzleProfile object
Hydrating the object transforms the internal profile ID with an instanciated KuzzleProfile object

<aside class="warning">
Hydrating this object can rise an error if the associated profile is not created in Kuzzle
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

Resolves to an hydrated `KuzzleUser` object.

## update

```js
var updateContent = {
  firstname: 'My Name Is',
  lastname: 'Jonas'
};

// Using callbacks (NodeJS or Web Browser)
user.update(updateContent, function(err, updatedUser) {
  // the updatedUser variable is the updated KuzzleUser object
})

// Using promises (NodeJS)
role
  .updatePromise(updateContent)
  .then(updatedUser => {
    // the updatedUser variable is the updated KuzzleUser object
  });
```

```java
JSONObject updateContent = new JSONObject()
  .put("firstname", "My Name Is")
  .put("lastname", "Jonas");

user.update(updateContent, new KuzzleResponseListener<KuzzleUser>() {
  @Override
  public void onSuccess(KuzzleUser updatedUser) {

  }

  @Override
  public void onError(JSONObject error) {

  }
});
```

```objective_c
NSError* error = nil;
NSDictionary* updatedContent = @{
                                 @"firstname": @"My Name Is",
                                 @"lastname": @"Jonas"
                                 };
[user updateWithContent: updatedContent error: &error callback:^(KuzzleUser * updatedUser, NSError * onError) {
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
    "firstname": "My Name Is",
    "lastname": "Jonas"
]
do {
    user.update(content: updatedContent, callback: {result in
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

Performs a partial content update on this object.

#### update(content, [options], [callback])

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``content`` | JSON Object | User content |
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
user
  .save(function(error, result) {
    // result is a KuzzleUser object
  });

// Using promises (NodeJS)
user
  .savePromise()
  .then((result) => {
    // result is a KuzzleUser object
  });
```

```java
user.save(new KuzzleResponseListener<KuzzleUser>() {
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
[user saveAndReturnError: &error callback:^(KuzzleUser * savedUser, NSError * error) {
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
  try user.save(callback: { result in
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

Create or replace the user in kuzzle

<aside class="warning">
Saving this object can rise an error if the associated profile is not created in Kuzzle
</aside>

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

Resolves to a `KuzzleUser` object.


## setContent

```js
var user = kuzzle.security.getUser('myuser');
var userContent = {
  // define new users properties
};

user = user.setContent(userContent);
```

```java
JSONObject newContent = new JSONObject()
  .put("profile", new JSONArray()
    .put("another profile id")
  );

user.setContent(newContent);
```

```objective_c
NSDictionary* newContent = @{
  @"profile": @[
    @"anotherProfileId"
  ]
};
[user setContentWithData: newContent];
```

```swift
let newContent = [
  "profile": [
    "anotherProfileId"
  ]
]

user.setContent(content: newContent)
```

<aside class="note">
Updating an user will have no impact until the <code>save</code> method is called
</aside>

Replaces the content of KuzzleUser

#### setContent(data)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``data`` | JSON Object |  User content |

#### Return value

Returns the `KuzzleUser` object.


## setProfile

```js
var profile = kuzzle.security.profileFactory('myprofile', { roles: ["role ID"]});

// Can set the profile directly with a KuzzleProfile object
user.setProfile(profile);

// Or by passing it's id
user.setProfile('myprofile');
```

```java
JSONObject newProfile = new JSONObject()
  .put("profile", new JSONArray()
    .put("another profile id")
  );

// Updating the profile with a KuzzleProfile object
user.setProfile(newProfile);

// Updating the profile with a profile ID
user.setProfile("new profile ID");
```

```objective_c
// Updating the profile with a KuzzleProfile object
NSDictionary* profileContent = @{
                                 @"profile": @[
                                         @"anotherProfileId"
                                     ]
                                 };
KuzzleProfile* profile = [[KuzzleProfile alloc] initWithSecurity: kuzzle.security id: @"profileId" content: profileContent];
[user setProfileWithProfile: profile];

// Updating the profile with a profile ID
[user setProfileWithId: @"profileId"];
```

```swift
// Updating the profile with a KuzzleProfile object
let profileContent = [
    "profile": [
        "anotherProfileId"
    ]
]
user.setProfile(withProfile: KuzzleProfile(security: kuzzle.security, id: "profileId", content: profileContent)

// Updating the profile with a profile ID
user.setProfile(withId: "profileId")
```

<aside class="note">
Updating an user will have no impact until the <code>save</code> method is called
</aside>


Replace the profile associated to the user

#### setProfile(profileId)

#### setProfile(kuzzleProfile)

| Arguments | Type | Description |
|---------------|---------|----------------------------------------|
| ``profileId`` | string | Profile ID |
| ``kuzzleProfile`` | KuzzleProfile | An instanciated KuzzleProfile object |

#### Return value

Returns the `KuzzleUser` object.
