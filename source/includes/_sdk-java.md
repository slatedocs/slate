# Java SDK

## Installing the library

Currently the SDK is available via source distribution only. We will be packaging the SDK and releasing it into a Maven repository as well.

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

The package also comes with a build.sbt file. If you have scala and sbt installed, typing sbt console in the project folder will load a REPL with access to the SDK.


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

## aggregation.dto.AuthPrompt
| Method | Description |
| -------- | ----------- |
| getId  | Identifier for this financial institution. |
| getName | Name of this financial institution.|
| getParameters | A Collection of [AuthParameter](#aggregation-dto-authparameter) objects for authentication. |
| getSubmitKey | The key for this auth prompt. This key should be used when submitting this AuthPrompt for authentication. |
| toJson | Create a stringified JSON representation. |
| toJsonTree | Create a GSON-compatible JSON AST from this object. |

## aggregation.dto.AuthenticatedInstitution
| Operation | Description |
| -------- | ----------- |
| getId  | Identifier for this financial institution. |
| getName | Name of this financial institution.|
| getAccounts | A Collection of Accounts for this institution. |
| toJson | Create a stringified JSON representation. |
| toJsonTree | Create a GSON-compatible JSON AST from this object. |

## aggregation.dto.AuthParameter
| Operation | Description |
| -------- | ----------- |
| getKey | String that identifies this parameter uniquely among the parameters for the parent prompt.|
| getCaption |  String challenge for the user, e.g. "What is your favorite color?". |
| getType | String description of the information to be provided. If this is “password”, the field should be masked.|
| getMaxLength | Maximum length that the answer for the parameter can have (int). |
| toJson | Create a stringified JSON representation. |
| toJsonTree | Create a GSON-compatible JSON AST from this object. |

## dto.PagedResults
| Operation | Description |
| -------- | ----------- |
| getCurrentPage |  Current page of the results (starting with 1). |
| getData | A Collection of paginated objects. |
| getLastPage | Total number of pages that match the criteria. |
| hasMore | Boolean, true if there are more pages, false otherwise. |
| toJson | Create a stringified JSON representation. |
| toJsonTree | Create a GSON-compatible JSON AST from this object. |

## dto.Account
| Operation | Description |
| -------- | ----------- |
| getAccountType | Get a string describing the nature of this account. |
| getId | Get a unique string identifier for this account. |
| getName | Get the name of this account. |
| toJson | Create a stringified JSON representation. |
| toJsonTree | Create a GSON-compatible JSON AST from this object. |

## Exceptions

## aggregation.exceptions.MfaException
| Operation | Description |
| --------- | ----------- |
| getPrompt | An additional [AuthPrompt](#aggregation-dto-authprompt) for the user to complete. There may be multiple in succession. |
| getMessage | Get the user-readable message associated with this MFA request. |
| toJson | Create a stringified JSON representation. |
| toJsonTree | Create a GSON-compatible JSON AST from this object. |

## aggregation.exceptions.InvalidSubmitKeyException

The user has submitted a mangled string submit key that does not correspond to valid data.

## exceptions.GeezeoException

Parent for all of the following exceptions. This is a very general umbrella class for when you just want to catch exceptions that occur while using the SDK.

## exceptions.NetworkException

Somehting has gone wrong while attempting to communicate with the server. No response has been received. The server was not found, the connection timed out, etc.

## exceptions.PendingAccountDeletionException

One or more exceptions occurred while attempting to delete pending accounts.

| Operation | Description |
| --------- | ----------- |
| getErrors() | A Collection of [GeezeoException](#exceptions-geezeoexception)s thrown during pending account deletion. |

## exceptions.ApiException

The server has reported an error. Parent class for all of the following exceptions.

## exceptions.ServerException

The server encountered an internal error. Triggered by HTTP 500.

## exceptions.DoesNotExistException

A requested resource was not found. Triggered by HTTP 404.

## exceptions.UnauthorizedException

The user is not authenticated at the appropriate level. Triggered by HTTP 401.

