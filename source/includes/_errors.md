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
5513 | Invalid referral code
5514 | First name is required
5515 | Last name is required
5516 | At least 5-character password is required

## Request reset password errors
Error Code | Meaning
---------- | -------
5502 | Invalid email
5530 | Email not found

## Reset password user details errors
Error Code | Meaning
---------- | -------
5531 | Invalid reset password token

## Reset password errors
Error Code | Meaning
---------- | -------
5531 | Invalid reset password token
5516 | At least 5-character password is required
5532 | Password and password confirmation do not match - # optional if password_confirm passsed

## Register voucher errors
Error Code | Meaning
---------- | -------
6018 | This voucher is already registered to another user
6019 | This voucher is not available to be registered to a user
6026 | Missing voucher code

## Tracked locations errors
Error Code | Meaning
---------- | -------
5721 | Latitude is required
5722 | Longitude is required
5723 | Event time is required

## Push notifications errors
Error Code | Meaning
---------- | -------
5810 | Invalid push notification
5811 | Invalid push notification status
