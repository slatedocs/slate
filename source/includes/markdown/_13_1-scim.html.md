<hr>
<section>

# SCIM


Asana supports SCIM operations at `https://app.asana.com/api/1.0/scim`. Okta provides greats docs for 
[understanding SCIM](https://developer.okta.com/docs/concepts/scim/).

Only Service Accounts in Enterprise Domains can access SCIM endpoints.



## Service Provider Configuration Endpoints

|HTTP Method|API Endpoint|Asana Behavior|
|---------|--------|--------------|
|GET|/ServiceProviderConfig|Read-only meta information.|
|GET|/ResourceTypes|Read-only meta information.|
|GET|/Schemas|Read-only meta information.|


## SCIM Endpoints

### User Resource

> Example

```
POST https://app.asana.com/api/1.0/scim/Groups
{
    "userName": "johnsmith@example.com",
    "name": {
        "givenName": "John",
        "familyName": "Smith",
        "formatted": "John Smith"
    },
    "emails": [{
        "primary": true,
        "value": johnsmith@example.com
    }],
    "active": true,
    "title": "Software Engineer",
    "preferredLanguage": "en",
    "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User": {
        "department": "R&D"
    }
}
```
```
201 Created
{
    "id": "1",
    "name": {
        "familyName": "John",
        "givenName": "Smith",
        "formatted": "John Smith"
    },
    "userName": "joinsmith@example.com",
    "emails": [
        {
            "value": "joinsmith@example.com",
            "primary": true,
            "type": "work"
        }
    ],
    "active": true,
    "schemas": [
        "urn:ietf:params:scim:schemas:core:2.0:User",
        "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User"
    ],
    "title": "Software Engineer",
    "preferredLanguage": "en",
    "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User": {
        "department": "R&D"
    }
}
```

|HTTP Method|API Endpoint|Asana Behavior|
|---|--------|--------------|
|GET|/Users|Return full list of users in the domain.  Does not return Asana guest users.|
|GET|/Users/:id|Return specific user in the domain.  Does not return Asana guest users.|
|POST|/Users|Create a new user if the user does not exist.|
|PUT|/Users/:id|Update / remove attributes for a user. Deprovision user (zombify) in Asana upon active=false.|
|PATCH|/Users/:id|Add / update attributes for a user. Deprovision user (zombify) in Asana upon active=false.|
|DELETE|/Users/:id|Deprovision user (zombify) in Asana.|


Accepted attributes:

|Attribute|Type|Info|
|---------|----|----|
|userName|string|Unique identifier for the User, typically used by the user to directly authenticate to the service provider. Each User MUST include a non - empty userName value, and it must  be an email address. REQUIRED.|
|name|complex|The user's name|
|name.givenName|string|Unsupported, use `formatted`.|
|name.familyName|string|Unsupported, use `formatted`.|
|name.formatted|string|The full name of the user.|
|emails|multi-valued complex|Email addresses for the user.|
|emails.value|string|Email address for the user.|
|email.primary|string|Whether this email address is the preferred email address for this user. `true` may only appear once for this  attribute.|
|active|boolean|Indicates whether the user's account is active in Asana.|
|title|string|The user's title, such as "Vice President".|
|preferredLanguage|string|The user's preferred language. Used for selecting the localized user interface.|
|"urn:ietf:params:scim:<br>schemas:extension:enterprise:<br>2.0:User"|complex|The Enterprise User Schema Extension attribute.|
|"urn:ietf:params:scim:<br>schemas:extension:enterprise:<br>2.0:User.department"|string|The department the user belongs to.|


### Group Resource

> Example

```
POST https://app.asana.com/api/1.0/scim/Users
{
    "schemas": ["urn:ietf:params:scim:schemas:core:2.0:Group"],
    "displayName": "Marketing",
        "members": [
        {"value": "1"},
        {"value": "2"}
    ]
}
```
```
201 Created
{
    "id": 1,
    "displayName": "Marketing",
    "members": [
        {"value": "1"},
        {"value": "2"}
    ],
    "schemas": [
        "urn:ietf:params:scim:schemas:core:2.0:Group"
    ],
    "meta": {
        "resourceType": "Group"
    }
}
```

SCIM groups are equivalent to Asana Teams.

|HTTP Method|API Endpoint|Asana Behavior|
|---------|------|--------------|
|GET|/Groups|Return full list of teams in the domain, including private teams.|
|GET|/Groups/:id|Return specific team in the domain. |
|POST|/Groups|Create a new team.|
|PUT|/Groups/:id|Update / remove attributes for a team.|
|PATCH|/Groups/:id|Update the team's attributes.|


Accepted attributes:

|Attribute|Type|Info|
|---------|----|----|
|displayName|string|Unique identifier for the team. REQUIRED.|
|members|multi-valued complex|The members of the team.|
|members.value|string|The team member's user ID.|

</section>
