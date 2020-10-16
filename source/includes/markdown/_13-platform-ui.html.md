<hr>
<section class="beta">

# UI Hooks

Requires an [App Server](/docs/app-server).

With Hooks, apps can display customized widgets, modals, and rules within Asana's UI. 
Browsers, and sometimes Asana servers, make requests to an App's server. The App Server 
controls what information is shown and the App Server controls what happens when a User 
takes an action within these components.

We will cover some of the main UI Hook components here.
 
## App Widget

> Request to the App Server

```http
https://app-server.com/widget?workspace=12345&task=23456&user=34567&locale=en&attachment=45678&asset=56789&expires=1602192507761&resource_url=https%3A%2F%2Fcompany.atlassian.net%2Fissue%2F1254
```

> Response from the App Server

```json
{
    "template": "summary_with_details_v0",
    "data": {
        "title": "MSB-3 As a user, I see a flexible widget",
        "subtitle": "Jira Cloud Story · Open in Jira Cloud",
        "subicon_url": "https://jira.com/icons/subicon.png",
        "footer": "Last updated in Jira Cloud 10 minutes ago",
        "comment_count": 12,
        "fields": [
            {
                "name": "Status",
                "type": "pill",
                "text": "In Progress",
                "color": "blue"
            },
            {
                "name": "Priority",
                "type": "value_with_icon",
                "icon_url": "https://jira.com/icons/priority_highest.png",
                "text": "Highest"
            },
            {
                "name": "Assignee",
                "type": "value_with_icon",
                "icon_url": "https://jira.com/avatars/rhian.png",
                "text": "Rhian Sheehan"
            }
        ]
    }
}
```

<img style="max-width:420px" src="../images/jira-widget.png" />

An App Widget displays external data within Asana. The contents of a 
widget may change but the overall format stays consistent across apps.

The content of this widget is controlled by the App Server. When an 
Asana user's browser navigates to a widget, the browser sends a 
request to the registered App Server. As long as the response from 
the server is valid (like the example on the right), the widget 
will display.

How does Asana determine when a widget should be shown? When a task is opened in
Asana, we look at each attachment on the task. If an attachment has a url 
that fits with an App's registered `match url` (ex: `https:\/\/.*.atlassian.net\/.*`) 
we show a widget. We then send a GET request to the App's `widget url`, including 
URL parameters like `task`, `user`, and `workspace`. 

[Get started with widgets here]()

## App Modal

> Request to the App Server

```http
https://app-server.com/widget?workspace=12345&task=23456&user=34567&locale=en&expires=1602192507761
```

> Response from the App Server

```json
{
  "title": "Create New Issue",
  "on_submit_callback": "https://app-server.com/actions/create",
  "submit_button_text": "Create Issue",
  "fields": [
    {
      "type": "single_line_text",
      "name": "summary",
      "title": "Summary",
      "value": "",
      "placeholder": "Enter some text",
      "width": "full",
      "required": true
    },
    {
      "type": "rich_text",
      "name": "description",
      "title": "Description",
      "value": "",
      "placeholder": "",
      "required": true
    },
    {
      "type": "typeahead",
      "name": "jira-project",
      "title": "Jira project",
      "value": "",
      "placeholder": "Search Jira for a project...",
      "required": true,
      "typeahead_url": "https://app-server.com/jira/project/typeahead",
    },
    {
      "type": "checkboxes",
      "name": "attachments",
      "required": false,
      "options": [
        {
          "id": "shouldIncludeAttachments",
          "label": "Attach files from this Asana task"
        }
      ]
    }
  ]
}
```

<img style="max-width:580px; box-shadow: 0 0 0 1px rgba(111,119,130,.15), 0 5px 20px 0 rgba(21,27,38,.08); border-radius: 4px;" src="../images/jira-modal.png" />

An App Modal allows users to fill out a dynamic app-controlled form. The # of fields can range from 0-20.
Once a modal is submitted, all of the information is sent to the App Server and no further actions 
are taken on the Asana side of things. If the modal should cause changes within Asana, the App 
Server will need to make the changes via the API. 

An advanced feature of the App Modal is live `on_change` events. While a user is filling out a form,
the App Server can receieve `on_change` requests. These requests include what the user has changed, and
allow the App Server to respond with an updated form. Apps can build complex branching logic depending
on changes a user makes.



## App Action

> Request to the App Server

```http
https://app-server.com/rule?workspace=12345&project=23456&action_type=45678&action=56789&user=34567&locale=en&expires=1602192507761
```

> Response from the App Server

```json
{
  "on_submit_callback": "https://app-server.com/slack/action/onsubmit",
  "on_change": {
    "on_change_callback": "https://app-server.com/slack/action/onchange",
    "watched_fields": [
      "typeahead_full_width"
    ]
  },
  "fields": [
    {
      "title": "Choose a channel",
      "type": "typeahead",
      "id": "typeahead_full_width",
      "required": true,
      "typeahead_url": "https://app-server.com/slack/typeahead",
    },
    {
      "title": "Write a message",
      "type": "rich_text",
      "name": "description",
      "required": true
    }
  ]
}
```

<img style="max-width:380px; box-shadow: 0 0 0 1px rgba(111,119,130,.15), 0 5px 20px 0 rgba(21,27,38,.08); border-radius: 4px;" src="../images/slack-rule.png" />

An App Action allows users to customize app actions triggered by Asana's rule engine. Similar to a modal, 
Asana requests a form definition from the App Server. The app controls the form fields, handles `on_change` 
events, and stores the inputs of the form. When a rule is created, Asana sends a request to the App Server
with all of the user-specified inputs. When the rule is triggered, Asana sends an event to the App Server. 

App actions are a part of [Asana Rules](https://asana.com/guide/help/premium/rules).

# UI Hooks Quickstart

 1. Create an [App Server](/docs/app-server)
    
    a. We recommend hosting on AWS Lambda or Google Cloud for reliable uptime and easier maintenance.
    
    b. While building, you can host your server locally, however some features are not able to hit a 
    local server (like App Rules). We will use localhost for this guide.  
    
 2. 

</section>
