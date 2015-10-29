# V2 (September 2015)

* _first_name_ and _last_name fields added to the Collection Requests API
* _instrucitons_ field added to the Collection Requests API - enables overriding of payment instructions sent to the customer
* _send_instructions_ field added to the Collection Requests API - it defaults to True, but allows disabling payment instructions
* _success_message_ added to the Collection Requests API to allow users to override the message sent to subscribers after successful payment.
* Version information is now automatically saved for each organization the first time the organization reacts with the API & that version is used subsequently until changed in the organization configuration or overridden for a specific request

# V1 (2014 - 2015)

* Initial API version