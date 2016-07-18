---
title: Versatile Credit

language_tabs:
 - javascript: JavaScript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  
search: true
---

# VERSATILE CREDIT
 
##Background

Versatile Credit is a kiosk based system used by stores to offer financing to their customers via a cascade approach.

# Scope

###-API

Existing plugin application makes post and patch requests to the application resource, in addition to a separate call to the pre-approval endpoint, and separate calls to receive and update verification codes


<aside class="warning">
This is too much complexity for a direct integration to be expected to manage.
</aside>

<aside class="notice">
V2 api needs to be updated to support pre-approval.
</aside>

###-DB

###-Implementation

->Verify phone

->Enter verification code

->Patch in application data

->Apply for preapproval

###-Steps

->Get an application

->Build an application

->Commit an application



# Pre-Approval

###Partners that would like the Zibby preapproval functionality, but are unable to integrate via our zibby.js plugin, can interact directly with the Zibby API. 

There are three steps involved in the Zibby preapproval process:


->Create the application

->Build the application

->Commit the application for approval

##Create the Application

>Submit Phone Number for Verification

>DEFINITION:

```script
POST https://sandbox.zibby.com/api/ng/application/create
```


To begin an application, Zibby requires that the consumer verify their phone number. This is done by sending an SMS message to the input number.

###Submit Phone Number for Verification->

To begin a Zibby application, we require verification of the the consumer’s phone number. This is done by sending a code via SMS to their input phone. 

>Example Request:

```script
-d {‘phone’: ‘2127338439’}
```

>Example Response:

```script
{‘id’: 4832}
```

###Verify Phone number->

<aside class="notice">
The SMS code sent to the customer will be verified in this step.
</aside>

>Verifiy Phone Number

>DEFINITION:

```script
POST https://sandbox.zibby.com/api/ng/application/verify_verification_code
```
>Example Request:

```script
-d {‘code’: ‘3GS37W’}
```

>Example Response:

```script
{‘success’: true}
```

##Build the Application

>Customer Application Data:

```script
{‘billing’: {
  ‘first_name’: ‘Jane’,
  ‘last_name’: ‘Doe’,
  ‘phone’: ‘2144324537’,
  ‘address’: ‘119 saint marks place’,
  ‘address2’: ‘Apt 5b’,
  ‘city’: ‘New York’,
  ‘state’: ‘NY’,
  ‘zip’: ‘10009’,
  ‘email’: ‘jqdoe@anonmail.com’},
‘personal’: {
  ‘ssn’: ‘1782378757’,
  ‘income’: ‘50000’,
  ‘ip_address’: ‘483.28.289’,
  ‘dob_year’: ‘1981’,
  ‘dob_month’: ‘11’,
  ‘dob_day’: ‘15’,
  ‘driver_license_number’: ‘E82923892’,
  ‘driver_license_state’: ‘NY’,
  ‘driver_license_expiration_year’: ‘2018’,
  ‘driver_license_expiration_month’: ‘09’,
  ‘driver_license_expiration_day’: ‘12’,
  ‘employment_type’: ‘full-time’,
  ‘reference_name’: ‘Jamie Smith’,
  ‘reference_phone_number’: ‘2172849548’,
  ‘employment_name’: ‘Streamlake Insurance’,
  ‘employment_number’: ‘3672734875’}}
```

To build the Zibby application for a consumer, the customer’s application data as shown in the Application JSON to the right should be sent either in a POST or PATCH request to Zibby. 

<aside class="notice">
The zibby application supports the following employment types
</aside>

<b>`Employment Types`</b>

Public Display | API Mapping
-------------- | --------------
Full time | full-time
Part time | part-time
Self employed | self-employed
Unemployed | unemployed
Social Security/Disability | social-security-disability
Pension/Retirement | pension-retirement
Military | military


##Commit the Application for Approval


>DEFINITION:

```script
POST https://sandbox.zibby.com/api/ng/application/preapprove
```
###Once the application has been built successfully, the final step in the Zibby approval process is to commit it for preapproval.







