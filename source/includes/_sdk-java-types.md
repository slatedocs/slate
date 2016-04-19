# DRAFT Java Aggregation SDK Types DRAFT

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

# Exceptions

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
