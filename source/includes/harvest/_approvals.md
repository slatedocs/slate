# Approvals

An organization's approvals

## The approval flow object

```json
{
  "id": 49394,
  "offer_id": 45545,
  "sequential": true,
  "version": 2,
  "approval_type": "offer_candidate",
  "approval_status": "pending",
  "job_id": 12321,
  "requested_by_user_id": 543,
  "approver_groups": [
    {
      "id": 2011242,
      "approvals_required": 1,
      "created_at": "2018-03-30T19:32:04.295Z",
      "resolved_at": null,
      "priority": 1,
      "job_id": 12321,
      "offer_id": null,
      "approvers": [
        {
          "id": 1234,
          "name": "Michael Clayton",
          "employee_id": "abc-123",
          "email_addresses": ["mclayton@example.com"]
        }
      ]
    },
    {
      "id": 2011241,
      "approvals_required": 1,
      "created_at": "2018-03-30T19:32:00.150Z",
      "resolved_at": "2018-03-30T19:34:17.374Z",
      "priority": 0,
      "job_id": 12321,
      "offer_id": null,
      "approvers": [
        {
          "id": 1235,
          "name": "Clay Michaels",
          "employee_id": "abc-124",
          "email_addresses": ["cmichaels@example.com"]
        }
      ]
    }
  ]
}
```

### Noteworthy Attributes

| Attribute | Description |
|-----------|-------------|
| id | The approval's unique identifier |
| offer_id | The specific offer for this approval. This will be empty for job approvals. |
| sequential | true or false based on whether the groups in this flow must approve sequentially |
| version | The specific version of this flow. |
| approval_type | One of 'open_job,' 'offer_job' or 'offer_candidate.' `open_job` refers to approval flows to [start recruiting on a job](https://support.greenhouse.io/hc/en-us/articles/201094534-Request-approval-to-start-recruiting-). `offer_job` refers to approval flows to [make offers on a job](https://support.greenhouse.io/hc/en-us/articles/360025776391). `offer_candidate` refers to approval flows for a [candidate offer](https://support.greenhouse.io/hc/en-us/articles/360035625832-Offer-approval-overview). |
| approval_status | one of 'pending', 'approved', or 'rejected' |
| job_id | The job for which approval is configured. This always has a value. |
| requested_by_user_id | The user who requested this approval be started. |

## GET: List Approvals For Job

```shell
curl 'https://harvest.greenhouse.io/v1/jobs/{job_id}/approval_flows'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
    {
        "id": 49394,
        "offer_id": 45545,
        "sequential": true,
        "version": 2,
        "approval_type": "offer_candidate",
        "approval_status": "pending",
        "job_id": 12321,
        "requested_by_user_id": 543,
        "approver_groups": [
            {
                "id": 2011242,
                "approvals_required": 1,
                "created_at": "2018-03-30T19:32:04.295Z",
                "resolved_at": null,
                "priority": 1,
                "job_id": 12321,
                "offer_id": null,
                "approvers": [
                  {
                    "id": 1234,
                    "name": "Michael Clayton",
                    "employee_id": "abc-123",
                    "email_addresses": ["mclayton@example.com"]
                  }
               ]
            },
            {
                "id": 2011241,
                "approvals_required": 1,
                "created_at": "2018-03-30T19:32:00.150Z",
                "resolved_at": "2018-03-30T19:34:17.374Z",
                "priority": 0,
                "job_id": 12321,
                "offer_id": null,
                "approvers": [
                  {
                    "id": 1235,
                    "name": "Clay Michaels",
                    "employee_id": "abc-124",
                    "email_addresses": ["cmichaels@example.com"]
                  }
               ]
            }
        ]
    },
    {
        "id": 49395,
        "offer_id": null,
        "sequential": true,
        "version": 1,
        "approval_type": "offer_job",
        "approval_status": "pending",
        "job_id": 12321,
        "requested_by_user_id": 545,
        "approver_groups": [
            {
                "id": 2011247,
                "approvals_required": 1,
                "created_at": "2018-03-30T19:32:04.295Z",
                "resolved_at": null,
                "priority": 1,
                "job_id": 12321,
                "offer_id": null,
                "approvers": [
                  {
                    "id": 1234,
                    "name": "Michael Clayton",
                    "employee_id": "abc-123",
                    "email_addresses": ["mclayton@example.com"]
                  }
               ]
            },
        ]
    }
]
```

List all of a job's approval flows

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs/{id}/approval_flows`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| id | The id of the job for which you'd like to see approvals |

<br>
[See noteworthy response attributes.] (#the-approval-flow-object)

## GET: Retrieve Approval Flow

```shell
curl 'https://harvest.greenhouse.io/v1/approval_flows/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "id": 49394,
  "offer_id": 45545,
  "sequential": true,
  "version": 2,
  "approval_type": "offer_candidate",
  "approval_status": "pending",
  "job_id": 12321,
  "requested_by_user_id": 543,
  "approver_groups": [
    {
      "id": 2011242,
      "approvals_required": 1,
      "created_at": "2018-03-30T19:32:04.295Z",
      "resolved_at": null,
      "priority": 1,
      "job_id": 12321,
      "offer_id": null,
      "approvers": [
        {
          "id": 1234,
          "name": "Michael Clayton",
          "employee_id": "abc-123",
          "email_addresses": ["mclayton@example.com"]
        }
      ]
    },
    {
      "id": 2011241,
      "approvals_required": 1,
      "created_at": "2018-03-30T19:32:00.150Z",
      "resolved_at": "2018-03-30T19:34:17.374Z",
      "priority": 0,
      "job_id": 12321,
      "offer_id": null,
      "approvers": [
        {
          "id": 1235,
          "name": "Clay Michaels",
          "employee_id": "abc-125",
          "email_addresses": ["cmichaels@example.com"]
        }
      ]
    }
  ]
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/approval_flows/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the approval flow to retrieve

<br>
[See noteworthy response attributes.] (#the-approval-flow-object)

## POST: Request Approvals

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/approval_flows/{id}/request_approvals'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

Given an approval flow, request it be started. This will change the state of the first approver group from "waiting" to "due" and mark the On-Behalf-Of user as the requesting user. This endpoint will fail with a 403 response if the On-Behalf-Of user can't see the hiring plan or can't request approvals. It will fail with a 422 response if the approval flow can't be started.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/approval_flows/{id}/request_approvals`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

## GET: Pending Approvals For User

```shell
curl -X GET 'https://harvest.greenhouse.io/v1/users/{id}/pending_approvals'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns a JSON response, structured like this:

```
[
    {
        "id": 34564,
        "status": "waiting",
        "created_at": "2017-03-23T18:58:27.796Z",
        "resolved_at": null,
        "request_sent_at": "2017-03-23T18:58:27.796Z",
        "reminder_sent_at": "2017-03-25T18:58:27.796Z",
        "reminders_sent": 2,
        "approver_group_id": 3432,
        "reminder_sent_by_user_id": 343,
        "hiring_plan_id": 4567,
        "offer_id": null,
        "approval_flow_id": 292244,
        "approval_flow_type": "open_job",
        "approval_flow_status": "pending"
        
    },
    {
        "id": 34568,
        "status": "due",
        "created_at": "2017-04-23T18:58:27.796Z",
        "resolved_at": null,
        "request_sent_at": "2017-04-23T18:58:27.796Z",
        "reminder_sent_at": "2017-04-25T18:58:27.796Z",
        "reminders_sent": 1,
        "approver_group_id": 3436,
        "reminder_sent_by_user_id": 343,
        "hiring_plan_id": 4568,
        "offer_id": 4534,
        "approval_flow_id": 268182,
        "approval_flow_type": "offer_candidate",
        "approval_flow_status": "pending"
    }
]
```

Returns all pending approvals for this user. Pending approvals are defined as an approval chain that is not approved or rejected, that this user has not already approved or rejected, in a group that has not yet determined approval or rejection.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/users/{user_id}/pending_approvals`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the user whose pending approvals we want.

### Querystring Parameters

Parameter | Description
--------- | -----------
type | 'job' or 'offer', where 'offer' returns only approvals which are for a specific offer and 'job' specifically excludes approvals for specific offers. Leaving this blank will return all approvals.


### Noteworthy Attributes

| Attribute | Description |
|-----------|-------------|
| status | This is either "waiting" or "due" for pending approvals |
| approver_group_id | This is Approver Group ID used in post requests to replace this user in approval steps. |

## PUT: Replace an approver in an approver group

```shell
curl -X PUT 'https://harvest.greenhouse.io/v1/approver_groups/{id}/replace_approvers'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "remove_user_id": 1443,
  "add_user_id": 5432
}
```

> The above returns a JSON success message with the following information.

```
{
  "success": "true",
  "message": "Approver group updated.",
  "approval_flow_id": 454,
  "approver_group_id": 343,
  "removed_user_id": 1443,
  "added_user_id": 5432
}
```

Removes the approver with user id given in remove_user_id and adds a new approver with the user id in add_user_id. Only approvers in unresolved groups may be replaced with this endpoint. If a group is currently "due", the new user will be notified that action is required.

### HTTP Request

`PUT https://harvest.greenhouse.io/v1/approver_groups/{approver_group_id}/replace_approvers`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes. Must have access to the approval flow.

### URL Parameters

Parameter | Description
--------- | -----------
approver_group_id | The approver group in which we are replacing an approver.

### Input JSON Parameters

Parameter | Description
--------- | -----------
remove_user_id | The user id of the approver to be removed. |
add_user_id | The user id of the new approver. Must have access to this approval flow.

### Noteworthy Output JSON Parameters

Parameter | Description
--------- | -----------
approval_flow_id | The approval flow that was changed. |

## PUT: Create or replace an approval flow

```shell
curl -X PUT 'https://harvest.greenhouse.io/v1/jobs/{job_id}/approval_flows'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
    "approval_type": "offer_candidate",
    "offer_id": 343,
    "sequential": false,
    "approver_groups": [
        {
            "approvals_required": 2,
            "approvers": [
                { "user_id": 1432 },
                { "email": "eddie.vedder@example.com" }
            ]
        },
        {
            "approvals_required": 1,
            "approvers": [
                { "employee_id": "abc-123" }
            ]
        }
    ]
}
```

> The above returns a JSON success message with the following information.

```json
{
    "success": true,
    "approval_flow_id": 49394,
}
```

Endpoint may create or replace the entirety of an approval flow on a certain job or offer. If no approval flow exists, it will create it. Otherwise, it will modify the existing one. The priority of the approver group is implied by the order of the approver_groups element, with the first receiving first priority. Approvers who already exist in the group with matching priority will remain unchanged, approvers who are not included will be removed, and new approvers will be added. If modifying an approval that has been started, this endpoint will restart it, which will remove previous approvals, and notify the first group that an approval is due. Approvals in the rejected or approved state can not be modified by this endpoint.

### HTTP Request

`PUT https://harvest.greenhouse.io/v1/jobs/{job_id}/approval_flows`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes. Must have access to the approval flow.

### URL Parameters

Parameter | Description
--------- | -----------
job_id | We will replace the approval flow on this job.

### Input JSON Parameters

Parameter | Description
--------- | -----------
approval_type | Required. One of offer_job, open_job, or offer_candidate. Designates which of the approval flows to replace. This is used for look-up and will not be edited by the endpoint.
offer_id | Optional. If included, it will search for an offer approval for this specific offer only. The job level approval will stay unchanged. If this is included, only 'offer_candidate' is a valid approval type. This is used for look-up and will not be edited by the endpoint.
sequential | Required. Accepts boolean true or false.
approver_groups | The list of approver groups. The order of the approver group list implies the 'priority' value in the approver group object, with the first listed group receiving the highest priority and so on.
approvals_required | Required. The number of approvals that must be given for this group to be considered approved and sent to the next group. Must be a number greater than zero.
approvers | Must contain the Greenhouse user_id, e-mail address, or employee_id for an active user in Greenhouse. The user must have access to the job. The number of users supplied must be greater than or equal to the approvals_required value for this group. If the approver appears in more than one group, he will be appear in the group with the highest priority and ignored in later groups.
 
