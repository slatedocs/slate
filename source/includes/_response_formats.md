# Response Formats
To ensure that you are effectively using the api, we encourage you to go through this section. 

1. All responses coming from the server, either from rest api or socket rpc calls will have the following success and error formats.
2. All timestamps reported in the apis will be in microseconds
3. All big decimal values are sent as string

```
// Success format
{
  success: true,
  result: ...,              // response body
  meta: {                   // response meta - like pagination info
    ...
  }
}

// Error format
{
  success: false,
  error: {
    code: ...,                // standard error code
    context: {                // extra context data to explain the cause of error
      ...
    }
  }
}
```
