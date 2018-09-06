## message object

### message.broadcast

> Request example:

```JSON
{
  "message_plain" : "everyone get out of the building now",
  "message_html" : "<b>everyone get out of the building now</b>",
  "subject" : "read this when you have time",
  "sender" : {
    "name" : "Your Boss",
    "email" : "your.boss@example.com"
  },
  "cc" : true,
  "sms" : true,
  "workgroups" : ["1", "2"],
  "venue" : "3",
  "client" : "4",
  "department" : "5",
  "role" : "6",
  "reference_id" : "my event id",
  "profile_type" : "7",
  "tier" : "8",
  "level" : ["level"],
  "score" : {
    "no_score" : true,
    "value" : "10",
    "cmp" : ">="
  },
  "org_hold" : false,
  "org_pending" : 2,
  "restrict_delivery" : {
    "type" : "with_assignment",
    "start_date" : "2018-07-01T00:00:00",
    "end_date" : "2018-08-01T00:00:00",
    "dates" : ["2018-08-02","2018-08-03"]
  },
  "include" : {
    "link_account" : true,
    "link_referrals" : true,
    "link_schedule" : true,
    "login_info" : true,
    "personalize" : true
  },
  "zip" : {
    "zip_code" : "98101",
    "range" : "50"
  },
  "extended_filter" : { "favorite_ice_cream" : "Hot Pudge" }
}
```

> Response example:

```JSON
{
  "id" : "1",
  "jsonrpc" : "2.0",
  "result": {
    "sent": ["1@servola.org","2@servola.org"],
    "warning": [
      {
        "message": "accounts have bad addresses",
        "emails" : ["3@servola.org"]
      }
    ]
  },
  "seconds" : "0.089939"
}
```

<span class="tryit" id="message-broadcast-tryit"></span>
Sends a broadcast message. Only site admins can send messages to everyone. Other accounts are limited to sending messages to only the specific teams they are on.

#### Required Parameters

* **subject** - text string of the message subject
* **level** - array of strings for what level of accounts to send to. For workgroup messages: `member`, `coordinator`, `manager`; for site messages: `member`, `team_mgr`, `site_admin`
* **workgroups** - array of workgroup IDs to send to _(required unless site admin)_

#### Optional Parameters

* **message_plain** - plain text message sent as plain text email or as SMS
* **message_html** - HTML message sent as HTML email
* **sender** - object describing the sender of the message
    * **email** - email address of the sender (default: email address of the sending account)
    * **name** - name of the sender (default: none)
* **cc** - boolean to send copy back to sending account (default: `false`)
* **sms** - boolean to also send message via SMS (default: `false`)
* **include** - object of optional items, with boolean values, to include in the message (default `false` for each one)
    * **link_account**
    * **link_referrals**
    * **link_schedule**
    * **login_info**
    * **personalize**


##### Optional Filters

Filters further resrict which accounts to send the message to. Defaults are no additional restrictions.

* **tier** - an exact team tier (must match the account's tier for one or more of the specified workgroups)
* **profile_type** - the profile of the accounts to send to
* **org_hold** - boolean whether to send users on admin hold (default `false`)
* **org_pending** - an onboarding status (unused if **org_hold** is `true`)
* **score** - object describing the score of the accounts to send to
    * **value** - the score value
    * **cmp** - a string for the comparison operator, one of: `>=` (or better; default), `<=` (or worse), `==` (exactly)
    * **no_score** - also include accounts with no score
* **zip** - object of ZIP code restrictions
    * **zip_code** - ZIP code to restrict to
    * **range** - distance in miles from the ZIP code (default: `0`)
* **restrict_delivery** - object describing who to further restrict delivery to. It has a **type**, and then other restrictions, including date ranges for the type, etc.
    * *Example*: if `without_assignment` is selected, with a **start_date** of `2018-08-01`, **end_date** of `2018-08-07`, and **venue** of `1001`, then only accounts who were not assigned a shift for that venue, between those dates, will be sent the message.
    * *NOTE*: options relating to shifts specifically only apply to a **type** of `with_assignment` and `without_assignment`, and no options apply to a **type** of everyone`
    * **type** - string of one of the following values
        * `everyone` - all matching accounts (default)
        * `with_assignment` - if the account was assigned a shift
        * `without_assignment` - if the account was not assigned a shift
        * `signed_on` - if the account was signed on
        * `not_signed_on` - if the account was not signed on
        * `without_acknowledgment` - if the account did not acknowledge a shift
    * **start_date** - a date *at or after* to restrict the type (signed on, didn't sign on, had assignment, didn't have assignment, or didn't acknolwedge, *at or after* this datetime)
    * **end_date** - a date *at or before* to restrict the type
        * *NOTE*: **start_date** and **end_date** must both be set, or neither
    * **dates** - array of arbitrary individual dates for restricting (instead of, or in addition to, **start_date** and **end_date**)
        * *NOTE*: **start_date** and **end_date** must both be set for **dates** to be used
    * **start_time** - the time the shift started
    * **venue** - the venue ID for the shift
    * **client** - the client ID for the shift
    * **department** - the department ID for the shift
    * **role** - the role ID for the shift
    * **reference_id** - the reference ID for the shift
* **extended_filter** - object (TBD)


#### Response

On success, include the list of addresses sent to in the `sent` key, and a list of `warning` objects, if any addresses could not be sent to.
