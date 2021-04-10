<hr>
<section>

# SCIM

## SCIM endpoints

Asana supports SCIM operations at `https://app.asana.com/api/1.0/scim`. Okta provides greats docs for 
[understanding SCIM](https://developer.okta.com/docs/concepts/scim/).

Note that only Service Accounts in Enterprise Domains can access SCIM endpoints.

|API call|Asana Behavior|
|--------|--------------|
|GET /Users|Return full list of users in the domain.  Does not return Asana guest users|
|GET /Users/:id|Return specific user in the domain.  Does not return Asana guest users.|
|POST /Users|Creates new user if the user does not exist|
|PUT /Users/:id|Update / remove attributes for a user. Deprovision user (zombify) in Asana upon active=false|
|PATCH /Users/:id|Deprovision user (zombify) in Asana upon active=false|
|DELETE /Users/:id|Deprovision user (zombify) in Asana|
|GET /ServiceProviderConfig|Read-only meta information|
|GET /ResourceTypes|Read-only meta information|
|GET /Schemas|Read-only meta information|

The accepted user attributes are:

|Attribute|Type|Info|
|---------|----|----|
|userName|string|Unique identifier for the User, typically used by the user to directly authenticate to the service provider. Each User MUST include a non - empty userName value, and it must  be an email address. REQUIRED.|
|name|complex|The user's name|
|name.givenName|string|Unsupported, use `formatted`"|
|name.familyName|string|Unsupported, use `formatted`"|
|name.formatted|string|The full name of the user.|
|emails|complex|Email addresses for the user.|
|emails.value|string|Email address for the user|
|email.primary|string|Whether this email address is the preferred email address for this user. `true` may only appear once for this  attribute.|
|active|boolean|Indicates whether the user's account is active in Asana.|
|photo|string|URL for the user's profile photo.|

</section>
