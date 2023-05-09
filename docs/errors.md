When things go wrong, the API would respond with an error code and a human readable description to describe the incorrect submission. Currently the error code is given in the form of Operation Outcome and can have different options as given below. If you need more information, please reach out to [ctdata@mskcc.org](mailto:ctdata@mskcc.org).

## Response

??? Error "Error Payload Example"
    ```json
    {
        "resourceType": "OperationOutcome",
        "issue": [
        {
            "severity": "error",
            "code": "value",
            "details": {
            "text": "Unable to find sponsor with partner id"
            }
        }
        ]
    }
    
    ```

    ### Error Codes

| Error Code                                    | Issue Type    | Description                                                                           |
| -----------                                   | -------       | ----------------------------------                                                    |
| 403 - Access to sponsor denied                | Security      | The partner ID does not have access to the Sponsor id provided.                       |
| 403 - Access to protocol denied.              | Security      | The partner ID doesn't have access to the Research Study/Protocol provided.           |
| 403 - Access to sponsor and protocol denied   | Security      | The partner Id does not have access to the Sponsor and Protocol/Research Study given. |
| 401 - Incorrect Partnerid name.               | Error         | The header should contain `x-partnerid` with provided Partner Id parameter.           |
| 401 - Api Key was not provided.               | Error         | Missing Partner Id parameter value in the request header.                             |
| 400 - Missing required query parameter.       | Error         | The required parameter Research Study or Sponsor Id is not provided.                  |
| 404 - Unable to find sponsor with partner id  | Error         | The sponsor is not associated with the given Partner Id.                              |
| 404 - Internal Error.                         | Exception     | Internal Error occured while executing the request.                                   |
| 404 - No records found.                       | Information   | No records were found for the given request                                           |
