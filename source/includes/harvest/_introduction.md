# Introduction

```
  _          _ _
 | |__   ___| | | ___
 | '_ \ / _ \ | |/ _ \
 | | | |  __/ | | (_) |
 |_| |_|\___|_|_|\___/     _
 __      _____  _ __| | __| |
 \ \ /\ / / _ \| '__| |/ _` |
  \ V  V / (_) | |  | | (_| |
   \_/\_/ \___/|_|  |_|\__,_|
```

With Harvest, you have access to most of your Greenhouse data!

The Harvest API was designed to allow our customers to export their data from Greenhouse. However, it can also be used to...

1.  Update candidate information.
2.  Add attachments to candidate profiles.
3.  Advance, move, and reject applications.

We have usage examples for cURL (and soon, Ruby)! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This documentation is open source! Feel free to leave feedback as issues in the [GitHub repo](https://github.com/grnhse/greenhouse-api-docs) or fork it and contribute changes!

## Authentication

> To authorize, use this code:

```ruby
require 'base64'
api_token = 'a7183e1b7e9ab09b8a5cfa87d1934c3c'
credential = Base64.strict_encode64(api_token + ':')
# => "YTcxODNlMWI3ZTlhYjA5YjhhNWNmYTg3ZDE5MzRjM2M6"

headers = {
  "Authorization" => "Basic " + credential
}
```

```shell
# Note the trailing colon after the username (API token):
$ curl https://harvest.greenhouse.io/v1/candidates/ -u a7183e1b7e9ab09b8a5cfa87d1934c3c:
...

> GET /v1/candidates/ HTTP/1.1
> Host: harvest.greenhouse.io
> Authorization: Basic YTcxODNlMWI3ZTlhYjA5YjhhNWNmYTg3ZDE5MzRjM2M6

...
```

Harvest uses Basic Auth over HTTPS for authentication. The username is your Greenhouse API token and the password should be blank. Unauthenticated requests will return an HTTP 401 response.

Harvest API keys can be obtained in Greenhouse. In order to create a Harvest API key, a user must be granted the "Can manage ALL organization's API Credentials" in the "Developer permission" section. That user can then go Configure >> Dev Center >> API Credential Management. From there, you can create a Harvest API key and choose which endpoints it may access.

**Important Note:** Users with Harvest API keys may access all the data in the endpoint. Access to data in Harvest is binary: everything or nothing. Harvest API keys should be given to internal developers with this understanding and to third parties with caution. Each key should only be allowed to access the endpoints it absolutely needs.

### Authorization header

> Your `Authorization` header should look like this:

```
Authorization: Basic YTcxODNlMWI3ZTlhYjA5YjhhNWNmYTg3ZDE5MzRjM2M6
```

Most HTTP clients will automatically use a given username and password to generate the required Authorization header. However, you may need to explicity set this header. The header has the following format:

`Authorization: Basic <base64("username:password")>`

Since only a username needs to be provided in our case, you'll need to append a `:` (colon) to your Greenhouse API token and then Base64 encode the resulting string.

<aside class="success">
<b>Important</b>: Use HTTPS for all requests. Requests made over HTTP will always return an HTTP 403 response. Keep your API key a secret!
</aside>

### Setting credentials with cURL

If you're making test API requests with cURL you can use the `-u` flag to set the username and password (which is blank). cURL will automatically generate the `Authorization` header.

### Setting permissions for API Keys

You can specify which API endpoints your API keys have access to from the Greenhouse Dev Center. This will allow you to permit or deny access to each endpoint individually. Any API keys created before January 18th, 2017 will have full permissions to all API endpoints that existed at that time, but any new API keys created after that point will need to be explicitly granted the required endpoint permissions.

To add or remove endpoint permissions on an API key, go to the Dev Center in Greenhouse, click "API Credential Management," then click "Manage Permissions" next to your Harvest API Key. From there, check or uncheck permissions for any endpoints.

## Throttling

```
Status: 200 OK
X-RateLimit-Limit: 50
X-RateLimit-Remaining: 49
```

API requests are limited to the amount specified in the returned `X-RateLimit-Limit` header (per 10 seconds). Exceeding that limit will cause Harvest to return an `HTTP 429` response. Check the `X-RateLimit-Limit` and `X-RateLimit-Remaining` headers to see how many more requests you are allowed until throttling kicks in. Note that the `HTTP 429` response will exclude the `X-RateLimit-Limit` and `X-RateLimit-Remaining` headers.

## Pagination

> Example paging header

```
Link: <https://harvest.greenhouse.io/v1/candidates?page=2&per_page=2>; rel="next",
<https://harvest.greenhouse.io/v1/candidates?page=474&per_page=2>; rel="last"
```

API methods that return a collection of results are always paginated. Paginated results will include a `Link` (see [RFC-5988](https://tools.ietf.org/html/rfc5988)) response header with the following information.

- `next`. The corresponding URL is the link to the next page.
- `prev`. The corresponding URL is the link to the previous page.
- `last`. The corresponding URL is the link to the last page.

Note that when this header is not set, there is only one page, the first page, of results.

As of February 2017, we are transitioning to a new method for paging while maintaining backwards compatibility. Currently, the new method _only_ supports providing a `next` link and is used by the following endpoints:

- [GET: List EEOC](#get-list-eeoc)
- [GET: List User Roles](#get-list-user-roles)
- [GET: List Custom Fields](#get-list-custom-fields)
- [GET: List Custom Field Options](#get-list-custom-field-options)
- [GET: List Job Openings](#get-list-job-openings)
- [GET: List Approvals For Job](#get-list-approvals-for-job)
- [GET: Pending Approvals For User](#get-pending-approvals-for-user)
- [GET: List Demographic Questions](#get-list-demographic-questions)
- [GET: List Demographic Answer Options](#get-list-demographic-answer-options)
- [GET: List Demographic Answer Options For Demographic Question](#get-list-demographic-answer-options-for-demographic-question)
- [GET: List Demographic Answers](#get-list-demographic-answers)
- [GET: List Demographic Answers for Application](#get-list-demographic-answers-for-application)

<aside class="warning">Since paging mechanisms may differ per paginated endpoint and may change in the future, it is important to use the Link headers and not page manually by changing the paging-related query parameters.</aside>

## Validation

```json
{
  "message": "Validation error",
  "errors": [
    {
      "message": "Must be one of: candidate, prospect",
      "field": "type"
    }
  ]
}
```

Methods that take input will validate all parameters. Any parameter that fails validation will trigger an error response with status `HTTP 422`. The response body will be a JSON object that includes a message as well as a list of fields that failed validation.

## General considerations

Unless otherwise specified, API methods generally conform to the following:

- Properties without a value will use `null` instead of being undefined
- "Snake Case" is used for attribute names (e.g. `first_name`)
- Timestamps are rendered in ISO-8601 format (e.g. `2016-02-03T16:38:46.985Z)
- URLs to external resources are valid for 30 days
- We reserve the right to add more properties to objects, but will never change or remove them
- Custom Fields on the [application object](#applications) are only available to customers with Enterprise-level accounts
- Resumes, cover letters, and other document attachments in Greenhouse are hosted on Amazon Web Services and are provided via signed, temporary URLs. Due to the ephemeral nature of these resource links, users should download these documents immediately after the request is made and should not rely on these URLs to be available for future requests. In the event AWS S3 is experiencing issues, document attachments will not be available in Harvest.

## Errors

| Error Code | Meaning                                                                                                                      |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------- |
| 401        | Unauthorized -- Invalid Harvest API key. Check to make sure you're passing it in via the `Authorization` header (Basic Auth) |
| 403        | Forbidden -- You do not have access to that record.                                                                          |
| 404        | Not Found -- Resource not found                                                                                              |
| 500        | Server Error -- We had a problem with our server. Try again later or contact us: support@greenhouse.io                       |

## Harvest Change Log

The timestamps below are Eastern Time.

| Date                          | Description                                                                                                                       |
|-------------------------------| --------------------------------------------------------------------------------------------------------------------------------- |
| March 7, 2023 10:00:00AM  | Modified `intenal` querystring parameter on [job post](#job-posts) GET requests to work in the reverse manner. When included in a request and set to `false`, the response will only include external job posts.
| February 28, 2023 12:00:00PM  | Added `internal` querystring paramater to [job post](#job-posts) GET requests to return only internal job posts. When included in a request and set to `true`, the response will only include internal job posts.
| November 21, 2022 12:00:00PM  | Deprecated version 1 of the [DELETE: Destroy Openings](#delete-destroy-openings) endpoint. Only v2 is available going forward. 
| November 9, 2022 04:00:00PM  | The `full_content` querystring parameter has been modified on [job post](#job-posts) GET requests to return Pay Transparency ranges (if present). When included in a request, the "content" or "internal_content" fields will return a concatenated string that includes the Board-level introduction, the Post-level description, pay transparency ranges, and the Board-level conclusion.
| October 18, 2022 12:00:00PM   | Added ability to create and update User Attributes to the [Users](#users) endpoints
| September 22, 2022 12:00:00PM | Updated [DELETE: Destroy Openings](#delete-destroy-openings) to a v2 endpoint. The v1 endpoint will be deprecated in a future release. Users and partners should switch over to the v2 endpoint as soon as possible to avoid issues with your integration.
| September 12, 2022 12:00:00PM | Added `created_at` field for application's attachments object.
| September 9, 2022 12:00:00PM  | Added [PATCH: Convert Prospect To Candidate](#patch-convert-prospect-to-candidate) endpoint to allow conversion of a prospect application to a candidate application on a selected job.
| August 1, 2022 12:00:00PM     | Making `content_type` required for attachments unless uploading using a URL.
| May 18, 2021 12:00:00PM       | Added `video_conferencing_url` to Scheduled Interview object.
| May 3, 2021 05:00:00PM        | Added `priority` to Job Stages object.
| May 3, 2021 04:00:00PM        | Added `job_post_id` field to application's response object.
| April 21, 2021 11:00:00AM     | Added ability to change external_id for custom field options.
| April 13, 2021 01:00:00PM     | Added ability to change user permission level to basic.
| September 28, 2020 12:00:00PM | "Required" field added to Demographic Questions.
| September 23, 2020 03:00:00PM | Attachments have been added at the application level. Previously, an aggregation of all attachments on all applications was included at the candidate level and not at all in the applications endpoint. Now, the applications endpoint includes attachments specific to each application and the candidates endpoint includes attachments in each application specific to that application.
| September 10, 2020 05:00:00PM | A new querystring parameter has been added to [job post](#job-posts) GET requests to return Board-level Introductions and Conclusions (if present). When included in a request, the "content" or "internal_content" fields will return a concatenated string that includes the Board-level introduction, the Post-level description, and the Board-level conclusion. |
| May 28, 2020 05:00:00PM       | Candidate photos have been removed from Greenhouse and will no longer be accepted as a field to be anonymized in [PUT Anonymize Candidates](#put-anonymize-candidate) |
| May 5, 2020 12:00:00PM        | Added "interview_step" field to the scorecards response. This provides the "ID" of the existing "interview" field. The "name" sub-element of the "interview_step" element should match the current "interview" element. The "interview" field is maintained for backward compatibility.
| Apr 22, 2020 09:00:00AM       | Added external_id as field to the [Custom Field Option object](#the-custom-field-options-object). |
| Apr 13, 2020 09:00:00AM       | The V1 endpoints for [PATCH: Edit User], [PATCH: Disable User], and [PATCH: Enable User] have been deprecated. Users should move to the V2 endpoints as soon as convenient. This change was made to take advantage of additional ways to look up users in Greenhouse. |
| Apr 12, 2020 09:00:00AM       | V1 of [PATCH: Update Job Post] has been deprecated. Updating a job post's status has been extracted to [PATCH: Update Job Post Status], while updating all other properties remains on [PATCH: Update Job Post]. The new endpoint more accurately reflects the permissions required by the On-Behalf-Of user to access and edit the Job Post's properties. |
| Apr 5, 2020 09:00:00AM        | Added V2 of [POST: Scheduled Interviews](#post-scheduled-interviews) and [PATCH: Scheduled Interviews](#patch-scheduled-interviews). Deprecated V1. |
| Jan 30, 2020 05:30:00PM       | Added ability to update custom field values in a [PATCH: Job Openings](#patch-edit-openings) request |
| Jan 30, 2020 05:30:00PM       | Added ability to re-open a closed job opening in a [PATCH: Job Openings](#patch-edit-openings) request |
| Jan 15, 2020 04:00:00PM       | Added ability to update a rejection reason on a rejected application. [PATCH: Update Rejection Reason](#patch-update-rejection-reason) |
| Dec 20, 2019 04:00:00PM       | Added ability to assign custom field values in a [POST: Job Openings](#post-create-new-openings) request |
| Nov 26, 2019 11:00:00 AM      | Updated the error response text to be more descriptive when attempting to delete a required custom field |
| Nov 26, 2019 11:00:00 AM      | Added ability to update custom fields on an application's current offer via [PATCH: Update Current Offer](#patch-update-current-offer) |
| Nov 12, 2019 10:00:00 AM      | Added a v2 version of [PATCH: Edit User](#patch-edit-user-v2), [PATCH: Disable User](#patch-disable-user-v2), and [PATCH: Enable User](#patch-enable-user-v2)
| Oct 7, 2019 03:00:00 PM       | Added custom fields to openings on organizations with this option enabled. [GET: Openings](#get-list-job-openings)
| Oct 1, 2019 11:00:00AM        | Added ability to filter offers by start_date with starts_before and starts_after. [GET: Offers](#get-list-offers) |
| Sep 18, 2019 01:00:00PM       | Added ability to create prospect applications for existing candidates/prospects [POST: Add Application to Candidate/Prospect](#post-add-application-to-candidate-prospect) |
| Aug 12, 2019 05:00:00PM       | Prospect post data will return in Job Posts endpoints. |
| Jul 31, 2019 01:00:00PM       | Added ability to filter demographic data answers by created_at and updated_at dates [GET: Demographic Answers](#get-list-demographic-answers) |
| Jul 17, 2019 01:00:00PM       | Added ability to update the current offer on an application via [PATCH: Update Current Offer](#patch-update-current-offer) |
| Jul 17, 2019 01:00:00PM       | Added ability to post new attachments to applications via [POST: Add Attachment to Application](#post-add-attachment-to-application) |
| Jun 26, 2019 12:00:00PM       | Added ability to create new Offices linked by external parent ids to [POST: Add Office](#post-add-office).                        |
| Jun 26, 2019 12:00:00PM       | Added ability to create new Departments linked by external parent ids to [POST: Add Department](#post-add-department).            |
| Jun 26, 2019 12:00:00PM       | Added child and parent office external IDs to the [Office object](#the-office-object).                                            |
| Jun 26, 2019 12:00:00PM       | Added child and parent department external IDs to the [Department object](#the-department-object).                                |
| Jun 12, 2019 02:00:00PM       | Added `prospective_department` and `prospective_office` to the [Application object](#the-application-object).                     |
| Jun 7, 2019 02:00:00PM        | Added default interviewers and estimated duration to the [Job Stage object](#the-job-stage-object)                                |
| May 24, 2019 01:00:00PM       | Added ability to set location on job posts via office and custom location id via [PATCH: Update Job Post](#patch-update-job-post) |
| May 24, 2019 01:00:00PM       | Added `schedulable` field to [Job Stages Endpoints](#job-stages)                                                                  |
| May 24, 2019 01:00:00PM       | Added `first_published_at` field to [Job Posts Endpoints](#job-posts)                                                             |
| May 15, 2019 05:00:00PM       | Added ability to change prospect pool and stage via [PATCH: Update Application](#patch-update-application)                        |
| May 15, 2019 03:15:00PM       | Added `opening` field to [Offers](#offers).                                                                                       |
| May 7, 2019 03:30:00PM        | Added [Demographic Data endpoints](#demographic-data)                                                                             |
| Apr 8 , 2019 04:00:00PM       | Added `interviewer` to [Scorecard object](#the-scorecard-object)                                                                  |
| Mar 18, 2019 03:30:00PM       | Added ability to delete a Candidate Tag via [DELETE: Destroy a Candidate Tag](#delete-destroy-a-candidate-tag)                    |
| Mar 6, 2019 02:15:00PM        | Added `linked_candidate_ids` to [Users Endpoints](#users)                                                                         |
| Feb 28, 2019 02:34:00PM       | Added `primary_email_address` to [Users Endpoints](#users)                                                                        |
| Feb 28, 2019 12:30:00PM       | Added `updated_at` to [Jobs Endpoints](#jobs)                                                                                     |
| Feb 13, 2019 03:30:00PM       | Added ability to create new candidate tags via [POST: Add New Candidate Tag](#post-add-new-candidate-tag)                         |
| Feb 1, 2019 11:28:00AM        | Added partial response (HTTP Status code 202) to [POST: Create Job](#post-create-job)                                             |
| Jan 8, 2019 12:00:00PM        | Added `can_email` flag to [Candidates Endpoints](#the-candidate-object)                                                           |
