---
title: Leah's API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='mailto:hello@leah.care'>Ask for your API Key</a>
  - <a href='https://www.leah.care'>Discover Leah</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
 # - errors

search: true

code_clipboard: true
---

# Rest API

## Introduction

Welcome to Leah's API! You can use our API to access different endpoints and make requests on our services.
Our API allows for the moment to generate sequence of reminders when creating an appointment, but soon, it will also be possible to manage document sharing, offices creation or even invoicing.

You can directly see the examples of Shell queries in the right column in all our documentation.

## Authentification

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request

curl --location --request POST 'https://myorganization.leah.care/api/end_point' \
  --header 'LEAH-AUTH-TOKEN: $your_api_key' \

```
> Make sure to replace `myorganization` with your organization name and `$your_api_key` with your API key.


### Query URL

As an organization, we've created a dedicated URL for you for white label use or your API access. Use this URL to make your queries. It looks like the following:

`https://myorganization.leah.care`

<aside class="notice">
You must replace <code>myorganization</code> with your organization name
</aside>

### API Key

Leah uses API keys to allow access to the API. 
If you have not received a key, you can directly contact your sales representative to obtain it.
Otherwise, do not hesitate to contact us by [email](mailto:hello@leah.care)

Leah expects for the API key to be included in all API requests to the server in a header that looks like the following:

`'LEAH-AUTH-TOKEN: $your_api_key' \`

<aside class="notice">
You must replace <code>$your_api_key</code> with your personal API key.
</aside>

## Healthcare Workers

### Collect Healthcare Workers list

```shell
curl --location --request GET 'https://myorganization.leah.care/api/healthcare_workers' \
--header 'LEAH-AUTH-TOKEN: $your_api_key'
```

> The above command returns JSON structured like this:

```json
{
    "@context":"\/api\/contexts\/HealthcareWorker","
    @id":"\/api\/healthcare_workers",
    "@type":"hydra:Collection",
    "hydra:member":
        [
            {
                "@id":"\/api\/healthcare_workers\/7dd37344-5d8d-4c90-a015-5518ab97adaf",
                "@type":"HealthcareWorker",
                "firstname":"John",
                "lastname":"Doe",
                "email":"john.doe@gmail.com",
                "currentOrganization":null
            },    
        ],
        "hydra:totalItems":1,       
}
```

Allows you to retrieve all offices of your organization.

#### HTTP Request

`GET https://myorganization.leah.care/api/healthcare_workers`

#### Query Parameters

Parameter | Attendance | Description
- | - | -
email | Optional | Filters results for a single healthcare worker via the specified email

## Offices

### Collect offices list

```shell
curl --location --request GET 'https://myorganization.leah.care/api/offices' \
--header 'LEAH-AUTH-TOKEN: $your_api_key'
```

> The above command returns JSON structured like this:

```json
{
    "@context":"\/api\/contexts\/Office",
    "@id":"\/api\/offices",
    "@type":"hydra:Collection",
    "hydra:member":
    [
        {
            "@id":"\/api\/offices\/6e229d04-1880-4b6b-a520-36f757f4a531",
            "@type":"Office","id":"6e229d04-1880-4b6b-a520-36f757f4a531",
            "slug":"my-office",
            "organization":"\/api\/organizations\/440b4e01-d3e4-4cbc-afb2-ca62177cd630",
            "features":["\/api\/features\/1054acd0-b3e7-4420-b01d-d18c1e57fe6a"],
            "createdAt":"2021-01-22T14:20:48+00:00",
            "currentMeeting":null
        }
    ],
    "hydra:totalItems":1,
}
```

Allows you to retrieve all offices of your organization.

#### HTTP Request

`GET https://myorganization.leah.care/api/offices`

#### Query Parameters

Parameter | Attendance | Description
- | - | -
healthcareWorker.email | Optional | Filters results for a single healthcare worker via the specified email

## Appointment

### Reminders

Creating a new appointment generates two reminders for your organization, which can be configured respectively:

+ per day
+ per minutes

<aside class="notice">We will set these values with you when you create your account, and they can be modified on request. To, the API does not allow you to parameterize these values.
</aside>

### Creating

```shell
curl --location --request POST 'https://myorganization.leah.care/api/appointments' \
--header 'LEAH-AUTH-TOKEN: $your_api_key' \
--header 'Content-Type: application/json' \
--data-raw '{
    "phoneNumber": "+33612345678",
    "email":"john.doe@gmail.com",
    "office":"/api/offices/6e229d04-1880-4b6b-a520-36f757f4a531",
    "startTime" : "2021-04-25T13:15:00",
	"externalId" : "000001"
}'
```

> This request returns <code>201</code> with JSON structured like this:

```json
{
    "@context": "/api/contexts/Appointment",
    "@id": "/api/appointments/70cbe776-1de2-48b2-86aa-e9e9410bc711",
    "@type": "Appointment",
    "status": "scheduled",
    "startTime": "2021-03-24T13:15:00+00:00",
    "email": "john.doe@gmail.com",
    "phoneNumber": "+33612345678"
}
```

Create an appointment. You'll have to get the **office**'s id, as explain [here](#collect-offices-list), first.

#### HTTP Request

<code>POST 'https://myorganization.leah.care/api/appointments'</code>

#### Content-type

<code>application/json</code>

#### Query parameters

Parameter | Attendance | Description
- | - | -
phoneNumber | Mandatory | Phone number on which the guest will receive the reminder
email | Mandatory | Email on wich the guest will receive all informations and the reminder
office | Mandatory | Healthcare work IRI's office
startTime | Mandatory | Date and time of the appointment. Format <code>yyyy-mm-ddThh:mm:ss</code> UTC
externalId | Optional | Associate an external <code>ID</code> 

<aside class="success">
A confirmation email is sent to the guest, and reminders are created.
</aside>

### Edit 

```shell
curl --location --request PATCH 'https://myorganization.leah.care/api/appointments/70cbe776-1de2-48b2-86aa-e9e9410bc711' \
--header 'Content-Type: application/merge-patch+json' \
--header 'LEAH-AUTH-TOKEN: $your_api_key' \
--data-raw '{
    "startTime" : "2021-05-18T09:00:00"
}'
```

> This request returns <code>200</code> with JSON structured like this:

```json
{
    "@context": "/api/contexts/Appointment",
    "@id": "/api/appointments/70cbe776-1de2-48b2-86aa-e9e9410bc711",
    "@type": "Appointment",
    "status": "scheduled",
    "startTime": "2021-05-18T09:00:00+00:00",
    "email": "john.doe@gmail.com",
    "phoneNumber": "+33612345678"
}
```

Reschedule appointment.

<aside class="notice">
If you edit an appointment when the reminders have already passed, they will be replayed if they are in the future.
</aside>

#### HTTP Request

<code>PATCH 'https://myorganizationleah.care/api/appointments/@id'</code>

#### Content-type

<code>application/merge-patch+json </code>

#### Query parameters

Parameter | Attendance | Description
- | - | -
startTime | Mandatory | New date and time of the appointment. Format <code>yyyy-mm-ddThh:mm:ss</code> UTC

<aside class="success">
A confirmation email is sent to the guest, and reminders are updated.
</aside>

### Delete 

```shell
curl --location --request PATCH 'https://myorganization.leah.care/api/appointments/70cbe776-1de2-48b2-86aa-e9e9410bc711' \
--header 'Content-Type: application/merge-patch+json' \
--header 'LEAH-AUTH-TOKEN: $your_api_key' \
--data-raw '{
    "status": "cancelled"
}'
```

> This request returns <code>200</code> with JSON structured like this:

```json
{
    "@context": "/api/contexts/Appointment",
    "@id": "/api/appointments/70cbe776-1de2-48b2-86aa-e9e9410bc711",
    "@type": "Appointment",
    "status": "cancelled",
    "startTime": "2021-05-18T09:00:00+00:00",
    "email": "john.doe@gmail.com",
    "phoneNumber": "+33612345678"
}
```

Cancel appointment.

<aside class="warning">
If you cancel an appointment, it will be permanently deleted and cannot be recovered.
</aside>

#### HTTP Request

<code>PATCH 'https://myorganization.leah.care/api/appointments/@id'</code>

#### Content-type

<code>application/merge-patch+json </code>

#### Query parameters

Parameter | Attendance | Description
- | - | -
status | Mandatory | cancelled

<aside class="success">
A email is sent to the guest to cancel the appointment
</aside>


## Document sharing

### Sending process

You can send a document to a guest from an healthcare worker account.
It's a three-step process :

1. [Creating transfer](#creating-transfer)
2. [Upload files](#upload-files)
3. [Send the transfer](#send-the-transfer)

### Creating transfer

Create a transfer. You'll have to get the **healthcare worker**'s id, as explain [here](#healthcare-workers), first.

```shell
curl --location --request POST 'https://myorganization.leah.care/api/transfers' \
--header 'LEAH-AUTH-TOKEN: $your_api_key' \
--header 'Content-Type: application/json' \
--data-raw '{
     "healthcareWorker" : "/api/healthcare_workers/51176ec8-670b-4fa5-8f15-df21jh23d30ea"
}'
```

> This request returns <code>200</code> with JSON structured like this:

```json
{
    "@context":"\/api\/contexts\/Transfer",
    "@id":"\/api\/transfers\/acdca04c-97af-4d20-bcaa-708ceqsdq36b9f",
    "@type":"Transfer",
    "id":"acdca04c-97af-4d20-bcaa-708ceqsdq36b9f","hash":"ZmQ3NTFlNmU1NjhhN2FmMjAxMzcyMmRlZjgwNmYxYmQ3Yzg0OTc2ZWQ4ODgxZDJlNDE4MjUzM2ZhNDdlZTFmMg==","expiresAt":"2021-07-05T08:38:44+00:00",
    "healthcareWorker":"\/api\/healthcare_workers\/51176ec8-670b-4fa5-8f15-df21jh23d30ea",
    "status":"in_progress",
    "files":[],
    "type":"healthcare_worker",
    "email":null,
    "firstname":null,
    "lastname":null
}
```
#### HTTP Request

<code>POST 'https://myorganization.leah.care/api/transfers'</code>

#### Content-type

<code>application/json</code>

#### Query parameters

Parameter | Attendance | Description
- | - | -
healthcare_workers | Mandatory | Healthcare worker's id you want to send the files from 

<aside class="notice">
The transfer automatically expires after 7 days
</aside>

### Upload files
Upload files to the transfer

```shell
curl --location --request POST 'https://myorganization.leah.care/api/transfers/acdca04c-97af-4d20-bcaa-708ceqsdq36b9f/files' \
--header 'LEAH-AUTH-TOKEN: $your_api_key' \
--header 'Content-Type: multipart/form-data' \
--form 'file[]=@"/Users/John_doe/Desktop/prescription_echo.jpg"' 
```

> This request returns <code>200</code> with JSON structured like this:

```json
{
    "@context":"\/api\/contexts\/Transfer",
    "@id":"\/api\/transfers\/acdca04c-97af-4d20-bcaa-708ceqsdq36b9f",
    "@type":"Transfer",
    "id":"acdca04c-97af-4d20-bcaa-708ceqsdq36b9f","hash":"NzM4MzM2MjQ4ODJmOGUzOGE3NzdkNDg0ODUwYWZmY2FiOWQ0NjE3OTQyYjJhM2NiNmFiOWYwZGE4OTg2ODJhOQ==",
    "expiresAt":"2021-07-05T08:39:25+00:00",
    "healthcareWorker":"\/api\/healthcare_workers\/51176ec8-670b-4fa5-8f15-df21jh23d30ea",
    "status":"ready",
    "files":["\/api\/transfer_files\/5af6e1bb-3182-47cc-bbc4-528aEjdhq442afb"],
    "type":"healthcare_worker",
    "email":null,
    "firstname":null,
    "lastname":null
}
```
#### HTTP Request

<code>POST 'https://myorganization.leah.care/api/transfers/@id/files'</code>

#### Content-type

<code>multipart/form-data</code>

#### Requirements 
- Maximum number of files: 10 per transfer
- Maximum weight: 15 Mo per file
- Supported file formats: .png/.jpg/.pdf

#### Query parameters

Parameter | Attendance | Description
- | - | -
file[]=@ | Mandatory | The file path


### Send the transfer

Send the files to the email adress provided 

```shell
curl --location --request POST 'https://myorganization.leah.care/api/transfers/acdca04c-97af-4d20-bcaa-708ceqsdq36b9f/share' \
--header 'LEAH-AUTH-TOKEN: $your_api_key' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "benjamin@leah.care"
}'
```

> This request returns <code>200</code> 

#### HTTP Request

<code>POST 'https://myorganization.leah.care/api/transfers/@id/share'</code>

#### Content-type

<code>application/json</code>

#### Query parameters

Parameter | Attendance | Description
- | - | -
email | Mandatory | recipient email address 

<aside class="success">
A email is sent to the guest with a secured linked to download files
</aside>


# Webhook

Webhooks allow Leah to provide and send real-time information to other applications.

Leah Webhooks are designed to notify external system each time an event occurs on an Leah, like when appointment is created, when a guest arrives in a waiting room, when paiement is charged etc.

## Webhook usage

<aside class="notice">
Make sure your server can receive POST requests, reads JSON format and always answers a 200 HTTP Code!
</aside>

### Web server

Once the endpoints are registered, a simple web server is needed in order to receive events. Then, Leah will send a `POST` request to the Webhook's URL each time an event occurs with a JSON payload body.

## Register an endpoint

The following steps describe how to register a server endpoint to start receiving Webhook events:

1. Provide a valid URL to Leah in order to receive events
2. That's it!

<aside class="notice">
Please note that only securized requests are valid: through SSL connection or behind a VPN 
</aside>

## Events

### Appointment events

The following events refers to the [appointment](#appointment) events.

#### `appointment.guest.online`

Sent when a guest arrives in the waiting room.

```json
"event": "appointment.guest.online"
"payload": 
    "{
        "externalId":"1234567",
        "administrativeFileNumber":"1234567"
    }"
```

Attribute | type | Description
- | - | -
externalId | string | Consultation's id from your system
administrativeFileNumber | string | Stay's id when guest is pre-admitted