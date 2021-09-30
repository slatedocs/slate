<hr>
<section>

# SCIM


Asana supports SCIM operations at `https://app.asana.com/api/1.0/scim`. Okta provides greats docs for 
[understanding SCIM](https://developer.okta.com/docs/concepts/scim/).

Note that only Service Accounts in Enterprise Domains can access SCIM endpoints.

<br>

## Service Provider Configuration Endpoints

|API call|Asana Behavior|
|--------|--------------|
|GET /ServiceProviderConfig|Read-only meta information|
|GET /ResourceTypes|Read-only meta information|
|GET /Schemas|Read-only meta information|

<br>

## SCIM Endpoints

### User Resource

|API call|Asana Behavior|
|--------|--------------|
|GET /Users|Return full list of users in the domain.  Does not return Asana guest users|
|GET /Users/:id|Return specific user in the domain.  Does not return Asana guest users.|
|POST /Users|Creates new user if the user does not exist|
|PUT /Users/:id|Update / remove attributes for a user. Deprovision user (zombify) in Asana upon active=false|
|PATCH /Users/:id|Deprovision user (zombify) in Asana upon active=false|
|DELETE /Users/:id|Deprovision user (zombify) in Asana|

<br>

### Group Resource
Note that SCIM groups are equivalent to Asana Teams.

|API call|Asana Behavior|
|--------|--------------|
|GET /Groups|Return full list of teams in the domain, including private teams|
|GET /Groups/:id|Return specific team in the domain |
|POST /Groups|Creates new team|
|PUT /Groups/:id|Update / remove attributes for a team|
|PATCH /Groups/:id|Update the team's attributes|
|DELETE /Groups/:id|Remove a team in Asana|

<br>
The accepted user attributes are:

|Attribute|Type|Info|
|---------|----|----|
|userName|string|Unique identifier for the User, typically used by the user to directly authenticate to the service provider. Each User MUST include a non - empty userName value, and it must  be an email address. REQUIRED.|
|name|complex|The user's name|
|name.givenName|string|Unsupported, use `formatted`|
|name.familyName|string|Unsupported, use `formatted`|
|name.formatted|string|The full name of the user.|
|emails|complex|Email addresses for the user.|
|emails.value|string|Email address for the user|
|email.primary|string|Whether this email address is the preferred email address for this user. `true` may only appear once for this  attribute.|
|active|boolean|Indicates whether the user's account is active in Asana.|
|photo|string|URL for the user's profile photo.|
|title|string|The user's title, such as "Vice President".|
|preferredLanguage|string|The user's preferred language. Used for selecting the localized user interface.|
|"urn:ietf:params:scim:schemas: extension:enterprise:2.0: User.department"|string|The department the user belongs to.|


<br>
The accepted group attributes are:

|Attribute|Type|Info|
|---------|----|----|
|displayName|string|Unique identifier for the Team. REQUIRED.|
|members|complex|The members of a team.|
|members.value|string|The ID of the members in the team.|

</section>
