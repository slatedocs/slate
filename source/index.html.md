---
title: LumahealthHQ API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/lord/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Root API

`DELETE` /api/*

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/*

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/*

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/*

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# activities

`GET` /api/activities/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/activities/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# admin

## dedupe

### facility

`POST` /api/admin/dedupe/facility

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### patient

`POST` /api/admin/dedupe/patient

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### provider

`POST` /api/admin/dedupe/provider

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reload-patients

`POST` /api/admin/reload-patients

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## shorten

`POST` /api/admin/shorten

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# appointments

`GET` /api/appointments/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/appointments/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/appointments/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/appointments/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/appointments/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### cancel

`PUT` /api/appointments/:id/cancel

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### confirm

`PUT` /api/appointments/:id/confirm

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/appointments/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## getByPatientId

`GET` /api/appointments/getByPatientId/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reports

### find

`GET` /api/appointments/reports/find

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### summary

`GET` /api/appointments/reports/summary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### xls

`GET` /api/appointments/reports/xls

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## summary

`GET` /api/appointments/summary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## upload

### dentrix

`POST` /api/appointments/upload/dentrix

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### referral

`POST` /api/appointments/upload/referral

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### successehs

`POST` /api/appointments/upload/successehs

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### theraoffice

`POST` /api/appointments/upload/theraoffice

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# appointmentTypes

`GET` /api/appointmentTypes/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/appointmentTypes/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/appointmentTypes/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/appointmentTypes/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/appointmentTypes/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/appointmentTypes/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## hidden

`GET` /api/appointmentTypes/hidden

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## search

`GET` /api/appointmentTypes/search

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# availabilities

`POST` /api/availabilities/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/availabilities/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/availabilities/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/availabilities/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### book

`PUT` /api/availabilities/:id/book

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## book

`POST` /api/availabilities/book/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## freebusy

`GET` /api/availabilities/freebusy

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# billing

`GET` /api/billing/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/billing/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/billing/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### subscriptions

`GET` /api/billing/:id/subscriptions

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## charges

### last-status

`GET` /api/billing/charges/last-status

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/billing/charges/last-status/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### success-count

`GET` /api/billing/charges/success-count

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## subscriptions

`DELETE` /api/billing/subscriptions

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/billing/subscriptions

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# broadcasts

`GET` /api/broadcasts/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/broadcasts/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/broadcasts/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/broadcasts/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/broadcasts/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### xls

`GET` /api/broadcasts/:id/xls

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## bulk

### action

`POST` /api/broadcasts/bulk/action

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## count

`GET` /api/broadcasts/count

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## patients

`GET` /api/broadcasts/patients

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# callback

## email

### offers

`GET` /api/callback/email/offers

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### reminders

`GET` /api/callback/email/reminders

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### sendgrid

`POST` /api/callback/email/sendgrid

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## integrators

#### auth

`POST` /api/callback/integrators/:integrator/auth/:userId/:secret/:integratorId?

Path parameter | Description 
-------------- | ----------- 
:integrator | xxx
:userId | xxx
:secret | xxx
:integratorId? | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:integrator | xxx
:userId | xxx
:secret | xxx
:integratorId? | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## mi7

### ack

`POST` /api/callback/mi7/ack/:apikey/:systemid/:messageid

Path parameter | Description 
-------------- | ----------- 
:apikey | xxx
:systemid | xxx
:messageid | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:apikey | xxx
:systemid | xxx
:messageid | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### from

`POST` /api/callback/mi7/from/:apikey/:systemid

Path parameter | Description 
-------------- | ----------- 
:apikey | xxx
:systemid | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:apikey | xxx
:systemid | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### to

`GET` /api/callback/mi7/to/:apikey/:systemid

Path parameter | Description 
-------------- | ----------- 
:apikey | xxx
:systemid | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## plivo

### sms

#### reminders

`GET` /api/callback/plivo/sms/reminders

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## practicefusion

### auth

`POST` /api/callback/practicefusion/auth/:userId/:secret

Path parameter | Description 
-------------- | ----------- 
:userId | xxx
:secret | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:userId | xxx
:secret | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### textcode

`GET` /api/callback/practicefusion/textcode

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## slack

`POST` /api/callback/slack/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## sms

### offers

`GET` /api/callback/sms/offers

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### referrals

`GET` /api/callback/sms/referrals

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### reminders

`GET` /api/callback/sms/reminders

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## status

`POST` /api/callback/status/:vendor

Path parameter | Description 
-------------- | ----------- 
:vendor | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:vendor | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## stripe

### charges

`POST` /api/callback/stripe/charges

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## twilio

`POST` /api/callback/twilio/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## voice

### offers

`GET` /api/callback/voice/offers

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### referrals

`POST` /api/callback/voice/referrals

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/callback/voice/referrals

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### reminders

`GET` /api/callback/voice/reminders

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# chatActivities

`GET` /api/chatActivities/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### assign

`PUT` /api/chatActivities/:id/assign

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### clear

`PUT` /api/chatActivities/:id/clear

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### close

`PUT` /api/chatActivities/:id/close

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## all

`GET` /api/chatActivities/all

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## mentions

`GET` /api/chatActivities/mentions

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## presence

`GET` /api/chatActivities/presence

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## unread

`GET` /api/chatActivities/unread

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### patients

`GET` /api/chatActivities/unread/patients

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# contexts

`GET` /api/contexts/:refId

Path parameter | Description 
-------------- | ----------- 
:refId | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# demoUsers

`POST` /api/demoUsers/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### messages

`POST` /api/demoUsers/:salesforceId/messages/:messageTemplate

Path parameter | Description 
-------------- | ----------- 
:salesforceId | xxx
:messageTemplate | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:salesforceId | xxx
:messageTemplate | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# deploymentWebhooks

## circle

`GET` /api/deploymentWebhooks/circle/:repoName/:branch

Path parameter | Description 
-------------- | ----------- 
:repoName | xxx
:branch | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## github

`POST` /api/deploymentWebhooks/github

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

#### reviews

`GET` /api/deploymentWebhooks/github/:username/reviews

Path parameter | Description 
-------------- | ----------- 
:username | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# diagnoses

`GET` /api/diagnoses/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# downtimeMessage

`GET` /api/downtimeMessage/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# facilities

`GET` /api/facilities/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/facilities/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/facilities/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/facilities/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/facilities/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## hidden

`GET` /api/facilities/hidden

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## search

`GET` /api/facilities/search

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# feedbackResponses

`GET` /api/feedbackResponses/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## negative

`POST` /api/feedbackResponses/negative

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/feedbackResponses/negative/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## positive

`POST` /api/feedbackResponses/positive

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/feedbackResponses/positive/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## promoters|detractors

`GET` /api/feedbackResponses/promoters|detractors

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reports

### clicks

`GET` /api/feedbackResponses/reports/clicks

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### detractors

`GET` /api/feedbackResponses/reports/detractors

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### find

`GET` /api/feedbackResponses/reports/find

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### findAll

`GET` /api/feedbackResponses/reports/findAll

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### npsscore

`GET` /api/feedbackResponses/reports/npsscore

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### npsscores

`GET` /api/feedbackResponses/reports/npsscores

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### promoters

`GET` /api/feedbackResponses/reports/promoters

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### summary

`GET` /api/feedbackResponses/reports/summary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### xls

`GET` /api/feedbackResponses/reports/xls

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## score

`POST` /api/feedbackResponses/score

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# fileMappings

`GET` /api/fileMappings/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# fileUploads

`POST` /api/fileUploads/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/fileUploads/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/fileUploads/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/fileUploads/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### binary

`GET` /api/fileUploads/:id/binary

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/fileUploads/:id/binary

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/fileUploads/:id/binary

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### file

`GET` /api/fileUploads/:id/file

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### thumbnail

`GET` /api/fileUploads/:id/thumbnail

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## binary

`POST` /api/fileUploads/binary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# followups

`GET` /api/followups/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/followups/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/followups/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/followups/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/followups/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## bulk

`POST` /api/followups/bulk

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## groups

`GET` /api/followups/groups

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# groupInvites

`GET` /api/groupInvites/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# groups

`GET` /api/groups/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/groups/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/groups/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/groups/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/groups/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/groups/:id/:user

Path parameter | Description 
-------------- | ----------- 
:id | xxx
:user | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/groups/:id/:user

Path parameter | Description 
-------------- | ----------- 
:id | xxx
:user | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:user | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### accept-invitation

`POST` /api/groups/:id/accept-invitation

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### invite-user

`POST` /api/groups/:id/invite-user

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### invites

`GET` /api/groups/:id/invites

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## accept-pending-invites

`PUT` /api/groups/accept-pending-invites

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## public

### get-invite

`GET` /api/groups/public/get-invite

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## users

`GET` /api/groups/users/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# hl7messages

`POST` /api/hl7messages/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# insurances

`POST` /api/insurances/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/insurances/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/insurances/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/insurances/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/insurances/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### binary

`POST` /api/insurances/:id/binary

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### coverage

`GET` /api/insurances/:id/coverage

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## binary

`POST` /api/insurances/binary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## payers

`GET` /api/insurances/payers

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/insurances/payers/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# integratorClients

`GET` /api/integratorClients/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/integratorClients/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/integratorClients/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/integratorClients/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/integratorClients/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## login

`POST` /api/integratorClients/login

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# integrators

`GET` /api/integrators/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/integrators/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/integrators/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/integrators/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/integrators/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## admin

`GET` /api/integrators/admin

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## configuration

`GET` /api/integrators/configuration

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/integrators/configuration/:integrator

Path parameter | Description 
-------------- | ----------- 
:integrator | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# messages-errors

`GET` /api/messages-errors/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reports

### xls

`GET` /api/messages-errors/reports/xls

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# messages

`POST` /api/messages/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/messages/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/messages/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/messages/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# messageTemplates

`POST` /api/messageTemplates/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/messageTemplates/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/messageTemplates/:key

Path parameter | Description 
-------------- | ----------- 
:key | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:key | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/messageTemplates/:key?

Path parameter | Description 
-------------- | ----------- 
:key? | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### resolve

`GET` /api/messageTemplates/:key/resolve

Path parameter | Description 
-------------- | ----------- 
:key | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## list

`GET` /api/messageTemplates/list

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# notifications

`GET` /api/notifications/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## clear

`PUT` /api/notifications/clear

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# offers

`POST` /api/offers/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/offers/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/offers/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/offers/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### cancel

`POST` /api/offers/:id/cancel

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### waitlists

`GET` /api/offers/:id/waitlists

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/offers/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## findByPatientId

`GET` /api/offers/findByPatientId/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reports

### find

`GET` /api/offers/reports/find

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### summary

`GET` /api/offers/reports/summary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# organizations

`GET` /api/organizations/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/organizations/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/organizations/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/organizations/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/organizations/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### access

`GET` /api/organizations/:id/access

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### users

`GET` /api/organizations/:id/users

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

##### invite

`POST` /api/organizations/:id/users/:invitedUserId/invite

Path parameter | Description 
-------------- | ----------- 
:id | xxx
:invitedUserId | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:invitedUserId | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

##### switch

`POST` /api/organizations/:id/users/:organizationUser/switch

Path parameter | Description 
-------------- | ----------- 
:id | xxx
:organizationUser | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:organizationUser | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/organizations/:id/users/:userId

Path parameter | Description 
-------------- | ----------- 
:id | xxx
:userId | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:userId | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patientForms

`GET` /api/patientForms/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patientForms/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### pdf

`GET` /api/patientForms/:id/pdf

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## *

`POST` /api/patientForms/*

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## callback

### completed

`POST` /api/patientForms/callback/completed

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### created

`POST` /api/patientForms/callback/created

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patientFormTemplates

`POST` /api/patientFormTemplates/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patientFormTemplates/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patientFormTemplates/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/patientFormTemplates/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/patientFormTemplates/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### updated

`POST` /api/patientFormTemplates/callback/updated

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patientMessageTemplates

`POST` /api/patientMessageTemplates/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patientMessageTemplates/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/patientMessageTemplates/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patientMessageTemplates/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/patientMessageTemplates/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patients

`POST` /api/patients/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patients/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/patients/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patients/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/patients/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### doNotContact

`GET` /api/patients/:id/doNotContact

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### follow

`POST` /api/patients/:id/follow

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### journey

`GET` /api/patients/:id/journey

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### provider

`GET` /api/patients/:id/provider

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### reload

`POST` /api/patients/:id/reload

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### unfollow

`POST` /api/patients/:id/unfollow

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### verify

`POST` /api/patients/:id/verify

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/patients/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## login

`POST` /api/patients/login

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## merge

`POST` /api/patients/merge

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## recent

`POST` /api/patients/recent

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/patients/recent

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reports

`GET` /api/patients/reports

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### do-not-contact

#### xls

`GET` /api/patients/reports/do-not-contact/xls

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## search

`GET` /api/patients/search

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## upload

`POST` /api/patients/upload/:integrator

Path parameter | Description 
-------------- | ----------- 
:integrator | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:integrator | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patientSubscribers

`GET` /api/patientSubscribers/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### follow

`POST` /api/patientSubscribers/:id/follow

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### unfollow

`POST` /api/patientSubscribers/:id/unfollow

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# phoneNumbers

`GET` /api/phoneNumbers/:phone

Path parameter | Description 
-------------- | ----------- 
:phone | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# procedures

`GET` /api/procedures/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# providers

`POST` /api/providers/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/providers/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/providers/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/providers/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/providers/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### availabilities

`GET` /api/providers/:id/availabilities

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### waitlists

`GET` /api/providers/:id/waitlists

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/providers/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## hidden

`GET` /api/providers/hidden

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## login

`POST` /api/providers/login

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## npi

### search

`GET` /api/providers/npi/search

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## referring

`GET` /api/providers/referring

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

#### activate

`PUT` /api/providers/referring/:id/activate

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

#### deactivate

`PUT` /api/providers/referring/:id/deactivate

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

#### referrals

`GET` /api/providers/referring/:id/referrals

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

#### share

`POST` /api/providers/referring/:id/share

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## search

`GET` /api/providers/search

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# recalls

`GET` /api/recalls/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# referrals

`POST` /api/referrals/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/referrals/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/referrals/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/referrals/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/referrals/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### approve

`POST` /api/referrals/:id/approve

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### reject

`POST` /api/referrals/:id/reject

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## batch

`PUT` /api/referrals/batch

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/referrals/batch

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## count

`GET` /api/referrals/count

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/referrals/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reports

### find

`GET` /api/referrals/reports/find

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### summary

`GET` /api/referrals/reports/summary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### xls

`GET` /api/referrals/reports/xls

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## search

`GET` /api/referrals/search

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# reminders

`GET` /api/reminders/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/reminders/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/reminders/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/reminders/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/reminders/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/reminders/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## findByApptId

`GET` /api/reminders/findByApptId/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## findByPatientId

`GET` /api/reminders/findByPatientId/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reports

### find

`GET` /api/reminders/reports/find

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### summary

`GET` /api/reminders/reports/summary

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### xls

`GET` /api/reminders/reports/xls

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# reports

## periscope

`GET` /api/reports/periscope/:dashboard

Path parameter | Description 
-------------- | ----------- 
:dashboard | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### dashboards

`GET` /api/reports/periscope/dashboards

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# scheduler

## availabilities

`GET` /api/scheduler/availabilities

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### count

`GET` /api/scheduler/availabilities/count

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# settings

`GET` /api/settings/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/settings/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/settings/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/settings/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/settings/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### subscribe

`PUT` /api/settings/:id/subscribe/:messageKey

Path parameter | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### unsubscribe

`PUT` /api/settings/:id/unsubscribe

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/settings/:id/unsubscribe/:messageKey

Path parameter | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# status

`GET` /api/status/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## services

`GET` /api/status/services/:serviceName

Path parameter | Description 
-------------- | ----------- 
:serviceName | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# tokens

## validate

`POST` /api/tokens/validate

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/tokens/validate

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## zendesk

`POST` /api/tokens/zendesk

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# uploads

`GET` /api/uploads/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/uploads/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/uploads/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### mapping

`PUT` /api/uploads/:id/mapping

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# users

`GET` /api/users/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/users/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/users/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/users/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### activate

`PUT` /api/users/:id/activate

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### groupInvites

`GET` /api/users/:id/groupInvites

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### resetPasswordLink

`GET` /api/users/:id/resetPasswordLink

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

### upload

`PUT` /api/users/:id/upload

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## admin

`POST` /api/users/admin

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/users/admin/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## decommission

`POST` /api/users/decommission/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## forgot-password

`POST` /api/users/forgot-password

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## login

`POST` /api/users/login

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## reset-password

`GET` /api/users/reset-password/:token

Path parameter | Description 
-------------- | ----------- 
:token | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/users/reset-password/:token

Path parameter | Description 
-------------- | ----------- 
:token | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:token | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## signup

`POST` /api/users/signup

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## transfer

`PUT` /api/users/transfer

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## unsubscribe

`PUT` /api/users/unsubscribe

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# waitlists

`GET` /api/waitlists/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`POST` /api/waitlists/

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`PUT` /api/waitlists/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`GET` /api/waitlists/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

`DELETE` /api/waitlists/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## bulk

### action

`POST` /api/waitlists/bulk/action

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## cancelOffer

`GET` /api/waitlists/cancelOffer/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## candidates

`POST` /api/waitlists/candidates

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## confirmOffer

`GET` /api/waitlists/confirmOffer/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## count

`GET` /api/waitlists/count

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## crudList

`GET` /api/waitlists/crudList

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## declineOffer

`GET` /api/waitlists/declineOffer/:id

Path parameter | Description 
-------------- | ----------- 
:id | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## filter

`GET` /api/waitlists/filter

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## find

### count

`POST` /api/waitlists/find/count

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## move

### update-position

`POST` /api/waitlists/move/update-position/:providerId/:id/:replacedId

Path parameter | Description 
-------------- | ----------- 
:providerId | xxx
:id | xxx
:replacedId | xxx

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:providerId | xxx
:id | xxx
:replacedId | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## search

`GET` /api/waitlists/search

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# widgets

## login

`POST` /api/widgets/login

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## user

`GET` /api/widgets/user

Request header | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

