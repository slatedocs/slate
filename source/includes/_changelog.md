# Changelog

## 2023-07-27

- datetime values in webhook bodies and API responses are ISO 8601-formatted date strings. For example: `"2023-06-21T16:00:28.315-07:00"`.

## 2023-07-17

- Add information about [notes with `type` 1](#the-note-resource).

## 2023-07-03

- Updated API access information for Professional tier customers.

## 2023-06-13

- The `created_at` parameter on the [POST endpoint for notes](#create-a-new-note) no longer accepts timestamps in the future.

## 2023-05-17

- Added [403 error code](#requests-amp-responses) for permissions-related errors.

## 2023-03-27

- Added the ability to [create a List](#create-a-new-list).
- Updated [Postman collection](#useful-resources) to help developers get started.
- Added [documentation](#formatting-content-as-html) on formatting options for HTML notes.

## 2023-03-09

- Account for chat messages when returning interaction info on the GET endpoints for [Persons](#persons) and [Organizations](#organizations).

## 2023-02-28

- Added the ability to [create HTML notes](#create-a-new-note).
- Added the ability to [create a note within a thread](#create-a-new-note).

## 2023-02-10

- Added [Rate Limit Headers](#rate-limit-headers) section to the [Rate Limits](#rate-limits) documentation.

## 2023-02-08

- Added `created_at` and `updated_at` timestamps to [Field Values](#field-values).
- Added an `updated_at` timestamp to [Notes](#notes).

## 2023-02-07

- Added the ability to retrieve Current Organization column data on [Persons](#persons).

## 2022-09-06

- Added [Rate Limit](#rate-limit) endpoint and documentation. Moved from a daily to a per minute per user limit. Monthly per account limits remain the same.

## 2022-09-02

- Added `entity_type` and `exclude_dropdown_options` documentation to [Fields](#fields).

## 2022-05-05

- Added `enrichment_source` documentation to [Fields](#fields).

## 2022-04-11

- Added [Partner With Us](#partner-with-us) section.

## 2022-03-21

- Added `opportunity_ids` fields to person and organization responses.

## 2022-02-23

- Added [Interactions API](#interactions) documentation.

## 2022-02-17

- Updated [GET entity files](#get-all-files) and entity file webhooks to exclude non-user uploaded files.

## 2022-02-03

- Added [Whoami API](#whoami) documentation.

## 2022-02-01

- Added [Reminder API](#reminders) documentation.
- Added [Reminder webhook](/#webhooks) events.

## 2022-01-28

- Added `organization.merged` event to [Webhooks](#webhooks).
- Added `mentioned_person_ids` and `is_meeting` fields to [Notes](#notes).

## 2021-11-22

- Added link out to <a href="https://support.affinity.co/hc/en-us/articles/4413976035085-Webhook-Responses">Help Center</a> for webhook responses

## 2021-11-19

- Updated [GET field values changes](#get-field-values-changes) to be filterable by `action_type`, `person`, `organization`, `opportunity` or `list_entry` by passing in the appropriate parameter.

## 2021-10-15

- Minor content updates

## 2021-10-04

- Updates to Example Responses.
- Responsive tweaks.

## 2021-09-07

- Revamped API documentation
  - Added [Common Use Cases](#common-use-cases) section.
  - Added [Rate Limits](#rate-limits) section.
  - Updates to `PUT` and `POST` cURL examples.

## 2021-08-18

- Fixed typo in the API docs where `entity_id` and `creator_id` was in path paramaters when they should be inside the payload parameters for [Create a New List Entry](#create-a-new-list-entry).

## 2021-07-28

- Fixed typo in Relationship Strength section.

## 2021-05-05

- Updated API rate limit information.
