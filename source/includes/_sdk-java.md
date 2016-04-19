# DRAFT Java Aggregation SDK operations DRAFT

## Installing the library

TODO

## Using the library

> These items will be provided during implementation

```java
import com.geezeo.sdk.Sdk

public class Main {
    public static void main(String[] args) {
        Sdk sdk = new Sdk(apiKey, userId, url);

        // ...
    }
}
```

> Returns an SDK instance.


Java SDK for the Geezeo API.

The use of this package starts with an Sdk instance, which is created with the authentication information required by Geezeo’s web API.


| Argument | Description |
| -------- | ----------- |
| getApiKey | Authentication key for the partner institution being contacted. |
| getUserId | Shared identifier for the scoped user.|
| getUrl | URL for the partner institution’s web site. |
| getAggregation | Aggregation object associated with this session. |

Once you have an instance the SDK has methods to handle basic operations, and its
[Aggregation](#aggregation-objects) object can be used to access aggregation functionality.


## Aggregation objects

An Aggregation object, like an Sdk object, is primarily a home for methods -
specifically, those involving the third-party aggregation services. Aggregation
objects are not instantiated directly, but retrieved from Sdk objects.


### Aggregation.getFeaturedInstitutions


```java

agg = sdk.getAggregation();
sdk.getFeaturedInstitutions();

```

> Returns a Collection of [AuthPrompt](#aggregation-dto-authprompt) objects.

Partners can maintain a list of featured institutions. This method will return that list in the specified order.

Contact support to change the list of featured institutions for a partner.

### Aggregation.searchInstitutions

```java

agg = sdk.getAggregation();

// scope, if present, is an Aggregation.SearchScope value
// (either NAME or URL)

agg.searchInstitutions(searchString);
agg.searchInstitutions(searchString, scope);
agg.searchInstitutions(searchString, page);
agg.searchInstitutions(searchString, scope, page);

```

> Returns a [PagedResults](#dto-pagedresults) object.

Partners can search for an Institutions based on name, url, or both.

| Argument | Description |
| -------- | ----------- |
| search_string | The search term to search for. |
| scope | (Aggregation.SearchScope) An optional argument to limit the search to the name or url. |
| page | Optional page number, since the results are paginated. Defaults to the first page. |


### Aggregation.getInstitution

```java

agg.getInstitution(id)

```

> Returns an [AuthPrompt](#aggregation-dto-authprompt) object.

Partners can load the AuthPrompt for a specific institution.

| Argument | Description |
| -------- | ----------- |
| id | The id of the institution |

### Aggregation.authenticate

```java

sdk.authenticate(submitKey, parameters)
sdk.authenticate(authPrompt, parameters)

```

> Raises a [MfaException](#aggregation-exceptions-mfaexception) if MFA is required.

> Returns an [AuthenticatedInstitution](#aggregation-dto-authenticatedinstitution) object.


To execute a specific AuthPrompt request, submit its submitKey with the list of parameters that were provided.

All parameters should now have a populated value field.

| Argument | Description |
| -------- | ----------- |
| submitKey or prompt | An [AuthPrompt](#aggregation-dto-authprompt) has a submitKey that is used to submit authentication requests. Either this submit key, or the prompt itself, can be used as the first argument. |
| parameters | An [AuthPrompt](#aggregation-dto-authprompt) has an array of parameters that should be displayed to the user. This argument needs to be a dictionary with a key for the key attribute of each of those parameter objects. |


### Aggregation.updateAuthentication

```python

sdk.updateAuthentication(submitKey, parameters)
sdk.updateAuthentication(authPrompt, parameters)

```

> Raises a [DoesNotExistError](#exceptions.doesnotexisterror) if account is not found.

> Raises a [MfaException](#aggregation.exceptions.mfaexception) if MFA is required.

> Returns an [AuthenticatedInstitution](#aggregation-dto-authenticatedinstitution) object.


To change a user's credentials a partner must first get an [AuthPrompt](#authprompt) and submitKey. [Accounts](#dto-account) expose fi.id. This id can be used to get an [AuthPrompt](#aggregation-dto-authprompt) from [getInstitution](#aggregation-getinstitution).



| Argument | Description |
| -------- | ----------- |
| account_id | The id of the account that will be updated.|
| parameters | The login_parameters from an [AuthPrompt](#authprompt)|
