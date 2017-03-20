# Errors

The API uses the following success codes:

## Common errors
Error Code | Meaning
---------- | -------
5105 | Server error (Possible missconfiguration)
5110 | Invalid namespace
5115 | Invalid JSON format
5116 | Missing requests wrapper or invalid request
5117 | Invalid request method
5118 | Invalid request path
5140 | Invalid application
5141 | Invalid profile

## Login errors
Error Code | Meaning
---------- | -------
5507 | Invalid login request: social data or username and password required
5508 | Password required
5509 | Invalid social_provider_id
5510 | Invalid client credentials
5511 | Social account not verified

## Register errors
Error Code | Meaning
---------- | -------
5501 | Registration type_id is required
5502 | Invalid email
5503 | Invalid brand_id
5504 | Invalid phone
5505 | Email already taken
5506 | Invalid social data
5509 | Invalid social_provider_id
5511 | Social account not verified
5512 | Social account already registered
