# DRAFT Python Aggregation SDK Types DRAFT

## AuthPrompt
| Property | Description |
| -------- | ----------- |
| id  | Identifier for this financial institution. |
| name | Name of this financial institution.|
| url      | url of this financial institution. |
| login_parameters | A list of [AuthParameter](#authparameter) objects for authentication. |
| submit_key | The key for this auth prompt. This key should be used when submitting this AuthPrompt for authentication. |

| Operation | Description |
| -------- | ----------- |
| to_json | Create a json representation. |

## AggregatedInstitution
| Property | Description |
| -------- | ----------- |
| id  | Identifier for this financial institution. |
| name | Name of this financial institution.|
| url      | url of this financial institution. |
| accounts | An array of accounts for this institution. |

| Operation | Description |
| -------- | ----------- |
| to_json | Create a json representation. |


## AuthParameter
| Property | Description |
| -------- | ----------- |
| key | String that identifies this parameter uniquely among the parameters for the parent prompt.|
| caption |  String challenge for the user, e.g. "What is your favorite color?". |
| type | String description of the information to be provided. If this is “password”, the field should be masked.|
| max_length | Maximum length that the answer for the parameter can have (int). |
| value | The value parameter should be provided by the end user. It will default to *None*. |

| Operation | Description |
| -------- | ----------- |
| to_json | Create a json representation. |


## PagedResults
| Property | Description |
| -------- | ----------- |
| auth_prompts | A list of auth_prompts that match the criteria.|
| current_page |  Current page of the results. |
| total_pages | Total number of pages that match the criteria. |

## MFARequiredError
| Property | Description |
| -------- | ----------- |
| AuthPrompt | An additional [AuthPrompt](#authprompt) for the user to complete. There may be multiple in succession. |

## UnauthorizedError

## DoesNotExistError

## NetworkError

