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

DELETE /api/*

GET /api/*

POST /api/*

PUT /api/*

# activities

GET /api/activities/

## :id

PUT /api/activities/:id

# admin

## dedupe

### facility

POST /api/admin/dedupe/facility

### patient

POST /api/admin/dedupe/patient

### provider

POST /api/admin/dedupe/provider

## reload-patients

POST /api/admin/reload-patients

## shorten

POST /api/admin/shorten

# appointmentTypes

GET /api/appointmentTypes/

POST /api/appointmentTypes/

## :id

DELETE /api/appointmentTypes/:id

GET /api/appointmentTypes/:id

PUT /api/appointmentTypes/:id

## crudList

GET /api/appointmentTypes/crudList

## hidden

GET /api/appointmentTypes/hidden

## search

GET /api/appointmentTypes/search

# appointments

GET /api/appointments/

POST /api/appointments/

## :id

DELETE /api/appointments/:id

GET /api/appointments/:id

PUT /api/appointments/:id

### cancel

PUT /api/appointments/:id/cancel

### confirm

PUT /api/appointments/:id/confirm

## crudList

GET /api/appointments/crudList

## getByPatientId

### :id

GET /api/appointments/getByPatientId/:id

## reports

### find

GET /api/appointments/reports/find

### summary

GET /api/appointments/reports/summary

### xls

GET /api/appointments/reports/xls

## summary

GET /api/appointments/summary

## upload

### dentrix

POST /api/appointments/upload/dentrix

### referral

POST /api/appointments/upload/referral

### successehs

POST /api/appointments/upload/successehs

### theraoffice

POST /api/appointments/upload/theraoffice

# availabilities

GET /api/availabilities/

POST /api/availabilities/

PUT /api/availabilities/

## :id

GET /api/availabilities/:id

### book

PUT /api/availabilities/:id/book

## book

### :id

POST /api/availabilities/book/:id

## freebusy

GET /api/availabilities/freebusy

# billing

GET /api/billing/

POST /api/billing/

PUT /api/billing/

## :id

### subscriptions

GET /api/billing/:id/subscriptions

## charges

### last-status

GET /api/billing/charges/last-status

### last-status/:id

GET /api/billing/charges/last-status/:id

### success-count

GET /api/billing/charges/success-count

## subscriptions

DELETE /api/billing/subscriptions

POST /api/billing/subscriptions

# broadcasts

GET /api/broadcasts/

POST /api/broadcasts/

## :id

DELETE /api/broadcasts/:id

GET /api/broadcasts/:id

PUT /api/broadcasts/:id

### xls

GET /api/broadcasts/:id/xls

## bulk

### action

POST /api/broadcasts/bulk/action

## count

GET /api/broadcasts/count

## patients

GET /api/broadcasts/patients

# callback

## email

### offers

GET /api/callback/email/offers

### reminders

GET /api/callback/email/reminders

### sendgrid

POST /api/callback/email/sendgrid

## integrators

### :integrator/auth/:userId/:secret/:integratorId?

POST /api/callback/integrators/:integrator/auth/:userId/:secret/:integratorId?

## mi7

### ack/:apikey/:systemid/:messageid

POST /api/callback/mi7/ack/:apikey/:systemid/:messageid

### from/:apikey/:systemid

POST /api/callback/mi7/from/:apikey/:systemid

### to/:apikey/:systemid

GET /api/callback/mi7/to/:apikey/:systemid

## plivo

### sms/reminders

GET /api/callback/plivo/sms/reminders

## practicefusion

### auth/:userId/:secret

POST /api/callback/practicefusion/auth/:userId/:secret

### textcode

GET /api/callback/practicefusion/textcode

## slack

POST /api/callback/slack/

## sms

### offers

GET /api/callback/sms/offers

### referrals

GET /api/callback/sms/referrals

### reminders

GET /api/callback/sms/reminders

## status

### :vendor

POST /api/callback/status/:vendor

## stripe

### charges

POST /api/callback/stripe/charges

## twilio

### :id

POST /api/callback/twilio/:id

## voice

### offers

GET /api/callback/voice/offers

### referrals

GET /api/callback/voice/referrals

POST /api/callback/voice/referrals

### reminders

GET /api/callback/voice/reminders

# chatActivities

GET /api/chatActivities/

## :id

### assign

PUT /api/chatActivities/:id/assign

### clear

PUT /api/chatActivities/:id/clear

### close

PUT /api/chatActivities/:id/close

## all

GET /api/chatActivities/all

## mentions

GET /api/chatActivities/mentions

## presence

GET /api/chatActivities/presence

## unread

GET /api/chatActivities/unread

### patients

GET /api/chatActivities/unread/patients

# contexts

## :refId

GET /api/contexts/:refId

# demoUsers

POST /api/demoUsers/

## :salesforceId

### messages/:messageTemplate

POST /api/demoUsers/:salesforceId/messages/:messageTemplate

# deploymentWebhooks

## circle

### :repoName/:branch

GET /api/deploymentWebhooks/circle/:repoName/:branch

## github

POST /api/deploymentWebhooks/github

### :username/reviews

GET /api/deploymentWebhooks/github/:username/reviews

# diagnoses

GET /api/diagnoses/

# downtimeMessage

GET /api/downtimeMessage/

# facilities

GET /api/facilities/

POST /api/facilities/

## :id

DELETE /api/facilities/:id

GET /api/facilities/:id

PUT /api/facilities/:id

## hidden

GET /api/facilities/hidden

## search

GET /api/facilities/search

# feedbackResponses

GET /api/feedbackResponses/

## negative

POST /api/feedbackResponses/negative

### :id

GET /api/feedbackResponses/negative/:id

## positive

POST /api/feedbackResponses/positive

GET /api/feedbackResponses/positive/:id

## promoters|detractors

GET /api/feedbackResponses/promoters|detractors

## reports

### clicks

GET /api/feedbackResponses/reports/clicks

### detractors

GET /api/feedbackResponses/reports/detractors

### find

GET /api/feedbackResponses/reports/find

### findAll

GET /api/feedbackResponses/reports/findAll

### npsscore

GET /api/feedbackResponses/reports/npsscore

### npsscores

GET /api/feedbackResponses/reports/npsscores

### promoters

GET /api/feedbackResponses/reports/promoters

### summary

GET /api/feedbackResponses/reports/summary

### xls

GET /api/feedbackResponses/reports/xls

## score

POST /api/feedbackResponses/score

# fileMappings

GET /api/fileMappings/

# fileUploads

POST /api/fileUploads/

## :id

DELETE /api/fileUploads/:id

GET /api/fileUploads/:id

PUT /api/fileUploads/:id

### binary

DELETE /api/fileUploads/:id/binary

GET /api/fileUploads/:id/binary

PUT /api/fileUploads/:id/binary

### file

GET /api/fileUploads/:id/file

### thumbnail

GET /api/fileUploads/:id/thumbnail

## binary

POST /api/fileUploads/binary

# followups

GET /api/followups/

POST /api/followups/

## :id

DELETE /api/followups/:id

GET /api/followups/:id

PUT /api/followups/:id

## bulk

POST /api/followups/bulk

## groups

GET /api/followups/groups

# groupInvites

GET /api/groupInvites/

# groups

GET /api/groups/

POST /api/groups/

## :id

DELETE /api/groups/:id

GET /api/groups/:id

PUT /api/groups/:id

### :user

DELETE /api/groups/:id/:user

POST /api/groups/:id/:user

### accept-invitation

POST /api/groups/:id/accept-invitation

### invite-user

POST /api/groups/:id/invite-user

### invites

GET /api/groups/:id/invites

## accept-pending-invites

PUT /api/groups/accept-pending-invites

## public

### get-invite

GET /api/groups/public/get-invite

## users

### :id

GET /api/groups/users/:id

# hl7messages

POST /api/hl7messages/

# insurances

GET /api/insurances/

POST /api/insurances/

## :id

DELETE /api/insurances/:id

GET /api/insurances/:id

PUT /api/insurances/:id

### binary

POST /api/insurances/:id/binary

### coverage

GET /api/insurances/:id/coverage

## binary

POST /api/insurances/binary

## payers

GET /api/insurances/payers

### :id

GET /api/insurances/payers/:id

# integratorClients

GET /api/integratorClients/

POST /api/integratorClients/

## :id

DELETE /api/integratorClients/:id

GET /api/integratorClients/:id

PUT /api/integratorClients/:id

## login

POST /api/integratorClients/login

# integrators

GET /api/integrators/

POST /api/integrators/

## :id

DELETE /api/integrators/:id

GET /api/integrators/:id

PUT /api/integrators/:id

## admin

GET /api/integrators/admin

## configuration

GET /api/integrators/configuration

### :integrator

GET /api/integrators/configuration/:integrator

# messageTemplates

POST /api/messageTemplates/

## :id

DELETE /api/messageTemplates/:id

## :key

POST /api/messageTemplates/:key

### resolve

GET /api/messageTemplates/:key/resolve

## :key?

GET /api/messageTemplates/:key?

## list

GET /api/messageTemplates/list

# messages-errors

GET /api/messages-errors/

## reports

### xls

GET /api/messages-errors/reports/xls

# messages

GET /api/messages/

POST /api/messages/

## :id

GET /api/messages/:id

## crudList

GET /api/messages/crudList

# notifications

GET /api/notifications/

## clear

PUT /api/notifications/clear

# offers

GET /api/offers/

POST /api/offers/

## :id

GET /api/offers/:id

PUT /api/offers/:id

### cancel

POST /api/offers/:id/cancel

### waitlists

GET /api/offers/:id/waitlists

## crudList

GET /api/offers/crudList

## findByPatientId

### :id

GET /api/offers/findByPatientId/:id

## reports

### find

GET /api/offers/reports/find

### summary

GET /api/offers/reports/summary

# organizations

GET /api/organizations/

POST /api/organizations/

## :id

DELETE /api/organizations/:id

GET /api/organizations/:id

PUT /api/organizations/:id

### access

GET /api/organizations/:id/access

### users

GET /api/organizations/:id/users

### users/:invitedUserId/invite

POST /api/organizations/:id/users/:invitedUserId/invite

### users/:organizationUser/switch

POST /api/organizations/:id/users/:organizationUser/switch

### users/:userId

PUT /api/organizations/:id/users/:userId

# patientFormTemplates

GET /api/patientFormTemplates/

POST /api/patientFormTemplates/

DELETE /api/patientFormTemplates/:id

GET /api/patientFormTemplates/:id

PUT /api/patientFormTemplates/:id

## callback

### updated

POST /api/patientFormTemplates/callback/updated

# patientForms

GET /api/patientForms/

## *

POST /api/patientForms/*

## :id

GET /api/patientForms/:id

### pdf

GET /api/patientForms/:id/pdf

## callback

### completed

POST /api/patientForms/callback/completed

### created

POST /api/patientForms/callback/created

# patientMessageTemplates

GET /api/patientMessageTemplates/

POST /api/patientMessageTemplates/

## :id

DELETE /api/patientMessageTemplates/:id

GET /api/patientMessageTemplates/:id

PUT /api/patientMessageTemplates/:id

# patientSubscribers

GET /api/patientSubscribers/

### follow

POST /api/patientSubscribers/:id/follow

### unfollow

POST /api/patientSubscribers/:id/unfollow

# patients

GET /api/patients/

POST /api/patients/

DELETE /api/patients/:id

GET /api/patients/:id

PUT /api/patients/:id

### doNotContact

GET /api/patients/:id/doNotContact

### follow

POST /api/patients/:id/follow

### journey

GET /api/patients/:id/journey

### provider

GET /api/patients/:id/provider

### reload

POST /api/patients/:id/reload

### unfollow

POST /api/patients/:id/unfollow

### verify

POST /api/patients/:id/verify

## crudList

GET /api/patients/crudList

## login

POST /api/patients/login

## merge

POST /api/patients/merge

## recent

GET /api/patients/recent

POST /api/patients/recent

## reports

GET /api/patients/reports

### do-not-contact/xls

GET /api/patients/reports/do-not-contact/xls

## search

GET /api/patients/search

## upload

### :integrator

POST /api/patients/upload/:integrator

# phoneNumbers

## :phone

GET /api/phoneNumbers/:phone

# procedures

GET /api/procedures/

# providers

GET /api/providers/

POST /api/providers/

## :id

DELETE /api/providers/:id

GET /api/providers/:id

PUT /api/providers/:id

### availabilities

GET /api/providers/:id/availabilities

### waitlists

GET /api/providers/:id/waitlists

## crudList

GET /api/providers/crudList

## hidden

GET /api/providers/hidden

## login

POST /api/providers/login

## npi

### search

GET /api/providers/npi/search

## referring

GET /api/providers/referring

### :id/activate

PUT /api/providers/referring/:id/activate

### :id/deactivate

PUT /api/providers/referring/:id/deactivate

### :id/referrals

GET /api/providers/referring/:id/referrals

### :id/share

POST /api/providers/referring/:id/share

## search

GET /api/providers/search

# recalls

GET /api/recalls/

# referrals

GET /api/referrals/

POST /api/referrals/

## :id

DELETE /api/referrals/:id

GET /api/referrals/:id

PUT /api/referrals/:id

### approve

POST /api/referrals/:id/approve

### reject

POST /api/referrals/:id/reject

## batch

DELETE /api/referrals/batch

PUT /api/referrals/batch

## count

GET /api/referrals/count

## crudList

GET /api/referrals/crudList

## reports

### find

GET /api/referrals/reports/find

### summary

GET /api/referrals/reports/summary

### xls

GET /api/referrals/reports/xls

## search

GET /api/referrals/search

# reminders

GET /api/reminders/

POST /api/reminders/

## :id

DELETE /api/reminders/:id

GET /api/reminders/:id

PUT /api/reminders/:id

## crudList

GET /api/reminders/crudList

## findByApptId

### :id

GET /api/reminders/findByApptId/:id

## findByPatientId

GET /api/reminders/findByPatientId/:id

## reports

### find

GET /api/reminders/reports/find

### summary

GET /api/reminders/reports/summary

### xls

GET /api/reminders/reports/xls

# reports

## periscope

### :dashboard

GET /api/reports/periscope/:dashboard

### dashboards

GET /api/reports/periscope/dashboards

# scheduler

## availabilities

GET /api/scheduler/availabilities

### count

GET /api/scheduler/availabilities/count

# settings

GET /api/settings/

POST /api/settings/

## :id

DELETE /api/settings/:id

GET /api/settings/:id

PUT /api/settings/:id

### subscribe/:messageKey

PUT /api/settings/:id/subscribe/:messageKey

### unsubscribe

PUT /api/settings/:id/unsubscribe

### unsubscribe/:messageKey

PUT /api/settings/:id/unsubscribe/:messageKey

# status

GET /api/status/

## services

### :serviceName

GET /api/status/services/:serviceName

# tokens

## validate

GET /api/tokens/validate

POST /api/tokens/validate

## zendesk

POST /api/tokens/zendesk

# uploads

GET /api/uploads/

POST /api/uploads/

## :id

GET /api/uploads/:id

### mapping

PUT /api/uploads/:id/mapping

# users

GET /api/users/

POST /api/users/

GET /api/users/:id

PUT /api/users/:id

### activate

PUT /api/users/:id/activate

### groupInvites

GET /api/users/:id/groupInvites

### resetPasswordLink

GET /api/users/:id/resetPasswordLink

### upload

PUT /api/users/:id/upload

## admin

POST /api/users/admin

### :id

POST /api/users/admin/:id

## decommission

POST /api/users/decommission/:id

## forgot-password

POST /api/users/forgot-password

## login

POST /api/users/login

## reset-password

### :token

GET /api/users/reset-password/:token

POST /api/users/reset-password/:token

## signup

POST /api/users/signup

## transfer

PUT /api/users/transfer

## unsubscribe

PUT /api/users/unsubscribe

# waitlists

GET /api/waitlists/

POST /api/waitlists/

## :id

DELETE /api/waitlists/:id

GET /api/waitlists/:id

PUT /api/waitlists/:id

## bulk

### action

POST /api/waitlists/bulk/action

## cancelOffer

### :id

GET /api/waitlists/cancelOffer/:id

## candidates

POST /api/waitlists/candidates

## confirmOffer

GET /api/waitlists/confirmOffer/:id

## count

GET /api/waitlists/count

## crudList

GET /api/waitlists/crudList

## declineOffer

GET /api/waitlists/declineOffer/:id

## filter

GET /api/waitlists/filter

## find

### count

POST /api/waitlists/find/count

## move

### update-position/:providerId/:id/:replacedId

POST /api/waitlists/move/update-position/:providerId/:id/:replacedId

## search

GET /api/waitlists/search

# widgets

## login

POST /api/widgets/login

## user

GET /api/widgets/user
