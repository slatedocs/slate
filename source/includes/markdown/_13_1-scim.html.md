<hr>
<section>

# SCIM

## SCIM endpoints

Asana supports SCIM operations at `https://app.asana.com/api/1.0/scim`. Okta provides greats docs for 
[understanding SCIM](https://developer.okta.com/docs/concepts/scim/).


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

</section>
