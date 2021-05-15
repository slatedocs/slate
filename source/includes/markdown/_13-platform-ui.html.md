<hr class="platform-ui-alpha">
<section class="platform-ui-alpha">

# UI Components Alpha

<span class="beta-indicator">ALPHA</span>

User interface (UI) components are currently in a **Closed Alpha**. If you want to participate in the UI components alpha program, please 
complete and submit [this form](https://form-beta.asana.com?k=-pVvfJKSSeboL3ySjdhYSg&d=15793206719). We are limiting 
the number of apps that can use these features at this time. This will open up more as we move to beta. 

The UI Components Alpha Program is a pre-general-release version of a program developed by Asana that allows developers 
to develop and test UI components. The UI Component Alpha Program is for development, evaluation, and testing purposes 
only, and is not for production use or subject to availability or security obligations from Asana. The UI Components 
Alpha Program is made available on an “as is” basis without warranties (express or implied) of any kind, and may be 
discontinued or modified at any time.

*This Alpha program was previously named the Workflow Apps Alpha.*

# UI Components Overview

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

To start building, follow our [Quickstart Guide](/docs/have-an-app-server-running-locally-or-remotely)!

Apps can use UI components to display customized widgets, forms, and rules within Asana's UI. 
Requests go from Asana directly to an App's server. The App Server controls  
the information within these customized widgets and the App Server controls what 
happens when a User takes actions within these components.

A new in-app gallery and install flow, a customizable modal, a widget, and more.
<img src="../images/UI_Components.gif" />

<hr>

## App Widget

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> Request to the App Server

```http
https://app-server.com/widget?workspace=12345&task=23456&user=34567&locale=en&attachment=45678&asset=56789&expires_at=2011-10-05T14%3A48%3A00.000Z&resource_url=https%3A%2F%2Fcompany.atlassian.net%2Fissue%2F1254
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
widget may change, but the overall format stays consistent across apps.
Apps can control what layout they prefer by supplying their preferred 
`template`. You can see the available templates in the *Enumerated Values* 
section of [response schema](/docs/widget-metadata).

The App Server controls the content of this widget. When an 
Asana user's browser navigates to a widget, Asana sends a 
request to the registered App Server. As long as the response from 
the server is valid (like the example on the right), the widget 
will display.

How does Asana determine when a widget should be shown? When a task is opened in
Asana, it checks each attachment on the task. If an attachment has a url 
that fits with an App's registered `match url` (ex: `https:\/\/.*.atlassian.net\/.*`) 
then it shows a widget. A GET request is sent to the App's `widget url`, including 
URL parameters like `task`, `user`, and `workspace`. 

Related References: 

* [Get widget metadata](/docs/get-widget-metadata)
* [Attach resource](/docs/attach-resource)

<hr>

## App Form

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> Request to the App Server

```http
https://app-server.com/form?workspace=12345&task=23456&user=34567&locale=en&expires_at=2011-10-05T14%3A48%3A00.000Z
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
      "is_required": true
    },
    {
      "type": "rich_text",
      "name": "description",
      "title": "Description",
      "value": "",
      "placeholder": "",
      "is_required": true
    },
    {
      "type": "typeahead",
      "name": "jira-project",
      "title": "Jira project",
      "value": "",
      "placeholder": "Search Jira for a project...",
      "is_required": true,
      "typeahead_url": "https://app-server.com/jira/project/typeahead",
    },
    {
      "type": "checkboxes",
      "name": "attachments",
      "is_required": false,
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

An App Form allows users to fill out a dynamic app-controlled list of fields. The # of fields can range from 0-20.
Once a form is submitted, the information is sent to the App Server and Asana will perform different functionality
depending on what they responded with. If the App wants to cause additional changes within Asana, the App 
Server will need to make the changes via the API. 

An advanced feature of App Forms is live `on_change` events. While a user is filling out a form,
the App Server can receive `on_change` requests. These requests include what the user has changed, and
allow the App Server to respond with an updated form. Apps can build complex branching logic depending
on changes a user makes.

To take advantage of `on_change` events, set some form fields `is_watched` value to `true` and an `on_change_callback` 
endpoint to hit with updates. 
See the `on_change` field in the response to the 
[form metadata request](/docs/get-form-metadata). The request sent to that
endpoint is the [On change callback request](/docs/on-change-callback).

Related References: 

* [Get form metadata](/docs/get-form-metadata)
* [On change callback](/docs/on-change-callback)
* [On submit callback](/docs/on-submit-callback)

<hr>

## Widget Resource Searching

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> Request to the App Server

```http
https://app-server.com/resource-search?value=Cool&workspace=12345&task=23456&user=34567&locale=en&expires_at=2011-10-05T14%3A48%3A00.000Z
```

> Response from the App Server

```json
{
    "resource_name": "Cool Attachment",
    "resource_url": "https://localhost:5000/attachments/123456789"
}
```

<img style="max-width:658px" src="../images/jira-resource-search.png" />

Users can send a search term to the app server. The term is often a url or 
the title of an external resource. The app server then responds with a 
resource or an error. 

Related References: 

* [App Widget](/docs/app-widget)

<hr>

## App Action

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> Request to the App Server

```http
https://app-server.com/rule?workspace=12345&project=23456&action_type=45678&action=56789&user=34567&locale=en&expires_at=2011-10-05T14%3A48%3A00.000Z
```

> Response from the App Server

```json
{
  "on_submit_callback": "https://app-server.com/slack/action/onsubmit",
  "on_change": {
    "on_change_callback": "https://app-server.com/slack/action/onchange",
  },
  "fields": [
    {
      "title": "Choose a channel",
      "type": "typeahead",
      "id": "typeahead_full_width",
      "is_watched": true,
      "is_required": true,
      "typeahead_url": "https://app-server.com/slack/typeahead"
    },
    {
      "title": "Write a message",
      "type": "rich_text",
      "name": "description",
      "is_required": true
    }
  ]
}
```

<img style="max-width:380px; box-shadow: 0 0 0 1px rgba(111,119,130,.15), 0 5px 20px 0 rgba(21,27,38,.08); border-radius: 4px;" src="../images/slack-rule.png" />

An App Action allows users to customize app actions triggered by Asana's rule engine. They use the same functionality as
the [App Form](/docs/app-form), as Asana requests a form definition from the App Server. The app controls the form 
fields, handles `on_change` events, and stores the inputs of the form. When a rule is created, Asana sends a request to 
the App Server with the user-specified inputs. When the rule is triggered, Asana sends an event to the App Server.

 

App actions are a part of [Asana Rules](https://asana.com/guide/help/premium/rules).

Related References: 

* [Get action metadata](/docs/get-action-metadata)
* [On action change callback](/docs/on-action-change-callback)
* [On action submit callback](/docs/on-action-submit-callback)

<hr class="full-line">

# UI Components Security

## UI Components Authorization

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

Authorization is handled by the app. When an app with UI components is added to a project, the user adding it is sent 
to the App's `authenticationUrl`. The App may perform OAuth with Asana, OAuth with a different app, perform both, or 
perform none!

As long as the app confirms the flow was complete, Asana will successfully add the app to the project. This will allow 
requests to be sent to the App's pre-defined endpoints.

If the App wants additional data from Asana or wants to make changes within Asana, they should have the user complete 
an OAuth flow against Asana (see https://developers.asana.com/docs/oauth). 

Keep in mind, this authorization provides the App Server with a single user's auth token. Multiple users of Asana will
hit the UI Hooks and send requests to the App Server, but the server will likely only have the token for 1 user. It 
might be a good idea to suggest users authenticate with a bot account. 

<hr>

## UI Components Message Integrity

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

Message integrity is provided by a SHA-256 HMAC signature on the contents of the request. This is URL parameters in the 
case of GET requests and a JSON blob in the case of a POST request. The signature is transmitted via a header. The app 
calculates the same signature and compares that to the value in the header, rejecting the request if the two do not match.
The signature must be on the exact parameter string that will be passed to the app because the signature will change if 
something as trivial as spacing changes.

The burden of verifying the request is on the app. Without this check, attackers can send requests to the App 
Server pretending to be Asana.

<hr>

## UI Components Timeliness

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

Timeliness is provided by the addition of an expiration parameter. If this parameter were not added then a request 
recorded, such as in logs, could be reused to continue to request information from the app at a later time.

The burden of verifying the request has not expired is on the app. Without this check, the App Server is vulnerable to 
replay attacks. 

<hr class="full-line">

# UI Components Definition

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> Sample of an app with a full UI components definition

```json

{
  identifier: "jira",
  name: "Jira Cloud",
  description: "Short description of the app.",
  extendedDescription: "A long description of the functionality of the app and the value it provides for users.",
  features: [
    {
      src: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/create.svg",
      alt: "Create issue dialog",
      text: "Kick off new work by creating Jira issues from Asana.",
    },
    {
      src: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/sync.svg",
      alt: "Syncing Jira Widget",
      text: "Add issues to Asana tasks to sync the status from Jira.",
    },
    {
      src: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/visibility.svg",
      alt: "Person surrounded by issues",
      text: "Add visibility for stakeholders to reduce status meetings.",
    },
  ],
  siteUrl: "https://jira-asana-integration.asana.com",
  appDirectoryUrl: "https://www.asana.com/apps/jiracloud",
  authenticationUrl: "https://jira-asana-integration.asana.com/auth",
  icon: {
    x32: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/jira_cloud_32.png",
    x64: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/jira_cloud_64.png",
    x96: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/jira_cloud_96.png",
    x192: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/jira_cloud_192.png",
  },
  logo: "https://abcdefghijklmnop.cloudfront.net/obj/56fd875687fa6875fda7f586dsa/Jira-full.png",
  capabilities: [
    {
      type: "ResourceSearch",
      resourceTypeaheadUrl: "https://jira-asana-integration.asana.com/project/typeahead",
      resourceAttachUrl: "https://jira-asana-integration.asana.com/actions/attach"
    },
    {
      type: "ResourceWidget",
      widgetMetadataUrl: "https://jira-asana-integration.asana.com/issue/widget",
      matchUrlPattern: "https:\\/\\/.*.atlassian.net\\/.*"
    },
    {
      type: "CreateResource",
      formMetadataUrl: "https://jira-asana-integration.asana.com/actions/form",
      formOnChangeUrl: "https://jira-asana-integration.asana.com/actions/form/onchange",
      formOnSubmitUrl: "https://jira-asana-integration.asana.com/actions/create",
    },
  ],
  authModalMetadata: {
      title: "Drive visibility & transparency across teams",
      subtitle: "Here's what you can do in Asana with the Jira Cloud app.",
      buttonText: "Get started",
  },
  coachmarkText: "Add or create new Jira issues on any task in this project.",
  actionsMenuTitle: "Add Jira Issue",
  feedbackLink: "https://form-beta.asana.com?hash=6da775cf552078ee2299eda9309d22f32239aa29900b5b9330cd57891e7d6068&id=1148560723305775",
  externalSupportUrl: "https://asana.com/guide/help/api/jira",
}
```

To create an app with UI components, you will need to create an OAuth App and request the 
UI components functionality onto it via the 
[Create a UI Components App](https://form-beta.asana.com?k=LBWpDpqZ6b-6pV4ZIbP-OA&d=15793206719) form.

To create an OAuth app, see [Authentication Quick Start](/docs/authentication-quick-start).

To create a UI components app you'll need to fill out the [Create a UI Components App](https://form-beta.asana.com?k=LBWpDpqZ6b-6pV4ZIbP-OA&d=15793206719)
form with the data in the table below.

|Field|Type|Description|
|---|---|---|
| `description`               | String       | A short description of the app shown in the app gallery. |
| `extendedDescription`       | String       | An extended description of the functionality of the app shown in the app settings. |
| `features`                  | Object       | A list of feature descriptions used to illustrate the functionality of the app in marketing views. |
|» `src`                      | String (url) | (Optional) src for image of feature |
|» `alt`                      | String (url) | (Optional) alt for image of feature |
|» `text`                     | String (url) | text below image of feature |
| `siteUrl`                   | String (url) | A URL which informs Asana which domain will handle auth |
| `authenticationUrl`         | String (url) | A URL which informs Asana where to make requests for authenticating and authorizing users.  This is called during installation or when the app returns a response indicating the user must authenticate to continue. |
| `icon`                      | Object       | A collection of URLs pointing to icon assets of various sizes. Used to display icons of the app in the Asana UI.<br><br>Note: This field is experimental. We may move to managing uploading and displaying these assets instead of allowing developers to specify them as a url in the app definition. |
|» `x32`                      | String (url) | 32x32 icon asset |
|» `x48`                      | String (url) | 48x48 icon asset |
|» `x64`                      | String (url) | 64x64 icon asset |
|» `x96`                      | String (url) | 96x96 icon asset |
|» `x192`                     | String (url) | 192x192 icon asset |
| `capabilities`              | Object       | A list of capabilities supported by the app and their configuration. |
|» `resource_widget`          | String (url) | The container for resource widget functionality  |
|»» `widgetMetadataUrl`       | String (url) | A URL that Asana uses to make requests for the data needed to load an app widget which displays information about a 3rd party resource. |
|»» `matchUrlPattern`         | String (url) | A regex which allows Asana to compute whether a UrlAttachment is supported by an activated app on the project in order to render an app widget. |
|» `resource_search`          | Object       | The container for typeahead functionality |
|»» `resourceAttachUrl`       | String (url) | A URL that Asana will make a request of when a user submits a value to attach. |
|» `create_resource`          | Object       | The container for resource creation functionality |
|»» `formMetadataUrl`         | String (url) | A URL that Asana uses to request data from the app about fields it should display in the resource creation modal when the form is first displayed. |
|» `automation`               | Object       | The container for automation functionality |
|»» `app_actions`             | Object[]     | The set of app actions exposed by the app |
|»»» `identifier`             | String       | The unique identifier for the action on the app. |
|»»» `display_name`           | String       | App action name visible to end users, e.g. "Create a Jira issue" |
|»»» `run_action_url`         | String       | App Server URL for requests to run an app action |
|»»» `form_metadata_url`      | String       | App Server URL for requests about configuring an app action |
| `logo`                      | String (url) | A link to the image of the App logo. Appears in the app installation modal |
| `authModalMetadata`         | Object       | Information about the text displayed in the auth modal |
|» `title`                    | String       | The title displayed in the auth modal |
|» `subtitle`                 | String       | The subtitle displayed in the auth modal |
|» `buttonText`               | String       | The buttonText displayed in the auth modal |
| `coachmarkText`             | String       | Text displayed to new users to inform them about the app’s capabilities. |
| `actionsMenuTitle`          | String       | Text displayed in the app field in the task pane |
| `feedbackLink`              | String (url) | Link to a form for collecting feedback about the app. |
| `externalSupportUrl`        | String (url) | Link to page where users can learn more about the app, access detailed setup instructions, or get support. | 

Once your app is submitted, an Asana Developer will enable your app and notify you via email when it's ready to use. 

<hr class="full-line">

# UI Components Quickstart

## Have an App Server running locally (or remotely)

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

For this guide, we will assume your server is running locally at `localhost:5000/`. `localhost` works for requests
that come from the browser, but won't work for server based requests (like the `run_action_url`). You should log the 
request body and url for all requests to your server to help get everything setup. For each UI Component feature you 
want to use, you'll need to supply some endpoints. You are in charge of what each path looks like, but here are some 
provided example paths you can use for now. Add these paths for each feature you want:

[App Widget](/docs/app-widget) 

 * `widgetMetadataUrl` (ex: `GET http://localhost:5000/resource/widget/metadata`)
 
[Widget Resource Searching](/docs/widget-resource-searching)

 * `resourceAttachUrl` (ex: `GET http://localhost:5000/resource/attach`)

[App Form](/docs/app-form) 

 * `formMetadataUrl` (ex: `GET http://localhost:5000/resource/create`)
 * One or more `typeahead_url`s (ex: `GET http://localhost:5000/users/typeahead`). You'll need different urls for 
 different types of results, like users vs tickets.
 
One or more Automation/[App Actions](/docs/app-action)

 * `form_metadata_url` (ex: `GET http://localhost:5000/automation/action/metadata`)
 * `run_action_url` (ex: `POST http://your.server.url/automation/action`)

You will provide Asana these paths in the next step.

<hr>

## Register an App to use UI Components

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

First, complete the [Create a UI Components Alpha App](https://form-beta.asana.com?k=LBWpDpqZ6b-6pV4ZIbP-OA&d=15793206719)
described in the [UI Components Section](/docs/ui-components-definition). Here is a cheat-sheet for what data you need to 
provide:

 * `authenticationUrl` & `authModalMetadata` is only required if your app needs access to the Asana API and/or needs to 
 OAuth with a different application. If you plan to use Asana's API, create an [OAuth App](/docs/oauth) via the [Developer Console](https://app.asana.com/0/developer-console). 
 The URL you place in `authenticationUrl` should be something like `https://localhost:5000/auth`. This url should redirect
 users to the [User Authorization Endpoint](#user-authorization-endpoint) with the required url parameters for OAuth.
 * `resource_widget` is required if you want to display an [App Widget](/docs/app-widget). Widgets are displayed for 
 connected resources. For the `matchUrlPattern`, you can place `http:\\/\\/.*.localhost:5000\\/.*` for now.
 * `resource_search` is required if you want type in functionality to connect an external resource to an asana 
 task.
 * `create_resource` is required if you want to use the [App Form](/docs/app-form). The App Form submits data that 
 should be used to create an external resource.
 * `automation` is required if you want to connect your app to [Asana Automation](https://asana.com/product/automation).

Once your app is submitted, an Asana Developer will enable your app and notify you via email when it's ready to use.

<hr>

## Install your app in a project

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

Login with your user and ensure you're in your sandbox domain (The one you provided in the register form). Open or 
create an Asana project and open it.

*Note, you may need to use the "Customize" dropdown instead.*

<img src="../images/project-apps-button.png" />

In the top right, hit "Apps" -> "Add apps". Scroll until you locate your app. Hit install. At this point one of two 
things happened:

 1. The button now says "Installed" or "Uninstall". If so, you can close this window and continue.
 2. A new modal popped up. If this happened, an iframe was opened and redirected to your 
 `authenticationUrl`. If your OAuth is set up properly, you should be able to complete this flow. 
    * If the flow completes but the window doesn't close, ensure the last step of your OAuth sends a
    `postMessage` with the message "success". The origin of this message should be set to the url of 
    the app server. 

If your app installed successfully, you should now open a task. Create one if you need to. 

Right when you open a Task, Asana looks at all of the attachments on the task. If any of the attachments match your 
`matchUrlPattern` regex, Asana will display a widget. At this point, it's unlikely you have an attachment ready to go, 
so lets attach one now.

On the task pane, there should be a new field for your app with a dropdown next to it. Click the dropdown and you will
see options for Search and Create. Create will open the form in a modal, Search will allow you to type in a query which is 
sent to your Attach endpoint.

<hr>

## Form Basics

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> GET http://localhost:5000/resource/create

```json
{
  "title": "My Form",
  "fields": [],
  "on_submit_callback": "http://localhost:5000/resource",
  "submit_button_text": "Create"
}
```

Let's hit the `Create` option and check the logs for our server. You should have seen a request to your `create_resource`
url. This request tells Asana what fields to display here. For now, you should change your server to respond with 
the "My Form" example on the right.  You can add more to this by referencing the
[Resource Form Reference](/docs/get-form-metadata). 

Once you've made the change, close and re-open the modal. You should see something new! (If you don't try debugging 
`http://localhost:5000/resource/create` with Postman)

Try hitting "Create", and depending on your server, you may get an error here. This is expected, ad you still need to 
create an endpoint for `http://localhost:5000/resource`. Different errors cause different things to happen (For 
example, if your server returns a `401`, the UI will try to reauthorize with your app!). Either change your form to 
point to a url you have already defined (perhaps your `resourceAttachUrl`) or define a new endpoint for this request. 

> POST http://localhost:5000/resource/attach

```json
{
  "resource_name": "My Attachment",
  "resource_url": "https://localhost:5000/attachments/123456789"
}
```

The intention of the form modal is for a user to provide enough information to create the resource on the App Server. If
a user prefers to connect via search, they'll instead hit your `resourceAttachUrl` with a url param named 
`value`. `value` is usually the id or name of the resource they want to connect to. For example, some of our server's 
`/resource/attach` endpoints handle both typeahead attachments and new resources via forms. You're in charge of what 
your urls look like and handle.

Whatever endpoint you use for the form, change it to return the "My Attachment" example on the right (or something 
similar). The important part here is the `resource_url`. Your `matchUrlPattern` regex should match against it if you 
want your widget to show up. Earlier, this guide suggested you place `http:\\/\\/.*.localhost:5000\\/.*` as your regex. 
If you followed that, provide a `resource_url` that matches it, like `http://test.localhost:5000/test_attachment`.

Open the form again (if needed), and hit "Create". Your response tells Asana to add an attachment to the Task. This new
attachment matches your `matchUrlPattern` so Asana will try to load the Widget.

<hr>

## Widget Basics

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> GET http://localhost:5000/resource/widget/metadata

```json
{
   "template": "summary_with_details_v0",
   "data": {
      "title": "My Widget",
      "subtitle": "Still My Widget",
      "footer": "Also My Widget",
      "fields": []
   }
}
```

You can think of the widget as an "advanced attachment". Asana evaluates each attachment and displays a widget if the 
`resource_url` matches any installed app's `matchUrlPattern`. When a match occurs, Asana hits the corresponding app's 
`widgetMetadataUrl` with some parameters to help the app identify what to display (See the full
[Resource Widget Reference](resource-widget). 

Change your `widgetMetadataUrl` path on your server to return the "My Widget" example on the right. Once you restart 
your server, refresh Asana.

You should now see this Widget on the right. This guide has you faking all of the data currently, but there's an 
attachment on the Asana task that tells Asana to hit your server with information about the task. Your server is giving
Asana the data to display in the widget. Clicking on the widget will take you to the attachment's url. 

<hr>

## Typeahead Basics

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> GET http://localhost:5000/resource/typeahead

```json
{
  "items": [
    {
      "title": "Item 1",
      "subtitle": "Sub 1",
      "value": "val-1",
      "icon_url": "https://some-icon.png"
    },
    {
      "title": "Item 2",
      "subtitle": "Sub 2",
      "value": "val-2",
      "icon_url": "https://some-icon.png"
    }
  ]
}
```

> New Form

```json
{
  "title": "My Form",
  "on_submit_callback": "http://localhost:5000/resource",
  "submit_button_text": "Create",
  "fields": [
    {
      "type": "typeahead",
      "name": "example_typeahead",
      "title": "Example Typeahead",
      "placeholder": "Search your app for an object",
      "required": true,
      "typeahead_url": "https://jira-asana-integration.asana.com/user/typeahead",
    }
  ]
}
```

Lets add a functioning typeahead. Change your `resourceTypeaheadUrl` response to return the "items" example on the 
right. Additionally, change your Restart your server, refresh your Asana tab. Nothing will have changed! In order to see this typeahead in action,
you'll need to remove the currently connected resource. You can do this by hitting the x on the corresponding 
attachment or using the kabob menu (three dots) on the top right of the widget.

Once you remove the attachment, you'll need to open click the dropdown you hit earlier in this guide, but this time use the typeahead option. 
Pick either one of your results. Either way, they will hit the `resourceAttachUrl`. As long as that URL returns a valid
resource, a new attachment will be made and attached. Your widget should return!

<hr>

## Automation Basics

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

> GET http://localhost:5000/automation/action/metadata

```json
{
  "on_submit_callback": "http://localhost:5000/automation/submit",
  "fields": [
    {
      "title": "[Single Line Text]",
      "type": "single_line_text",
      "id": "single_line_text_full_width",
      "required": true,
      "placeholder": "[full width]",
      "width": "full"
    }
  ]
}
```

> POST http://not-localhost:5000/automation/action (localhost won't work here!)

```json
{
  "action_result": "resources_created",
  "resources_created": [
    {
      "resource_name": "My Attachment",
      "resource_url": "https://localhost:5000/attachments/123456789"
    }
  ]
}
```

Automation is a little more complicated. If you understand how to customize and handle requests from the 
[App Form](/docs/app-form), then you know how to handle the first part of automation as it works essentially 
the same. For this guide, go ahead and change your server to return the example jsons on the right.

The first step of automation is setting up a rule. When an Asana user is done creating the rule (filling in the fields you 
asked for), they will hit submit. That data is sent to your servers immediately, just like the modal form. Note that the automation
has likely not fired yet.

Later on, when the automation fires, Asana will send different information to your server. Instead of including all 
of the responses from the user again, Asana simply includes an `id` of the `action` and a `target_object`. 
In order for your app to fully understand what the automation is suppose to do, you will need to look up the 
`action` that the user setup in the first step. Asana does not save this information for you. This means you will need
a persistent data store to write & read this information.

Additionally, when a rule fires, the request is sent from Asana's servers. This means localhost will not work for 
debugging this (unless you setup a localhost proxy like ngrok).

Once your server is ready, follow the [Asana Rules_Guide](https://asana.com/guide/help/premium/rules) to create a rule.
When choosing an action, you should select your app's action. These will only show up if the project has the app installed
and you submitted app actions when you [defined your UI Component endpoints](/docs/register-a-platform-ui-app). You should 
see your customized form. Feel free to submit it and create the rule.

Sadly, you will be unable to test the action being triggered while hosting locally. To test this, deploy your server 
or setup something like ngrok to expose your localhost server.

<hr>

## Being Secure

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

```javascript
function forAllRequests(req) {
  let secret = getSecret();
  stringToVerify = null;
  
  if (req.verb === "POST") {
    stringToVerify = req.body().toString();
  } else if (req.verb === "GET") {
    stringToVerify = req.url.query; // ?target=2421543&res...
  }
  
  let computedSignature = require("crypto").createHmac("sha256", secret)
    .update(stringToVerify)
    .digest("hex");
    
  if (req.headers["X-Asana-Signature"] !== computedSignature) {
    reject(req);
    return;
  }
  
  let now = new Date();
  if (now.getTime() > Date.parse(req.query["expires_at"])) {
    reject(req);
    return;
  }
  
  // Handle Request
}
```

If you deploy your server now, it will be vulnerable to attackers hitting your endpoints pretending to be Asana. 
In order to counter this, Asana includes a signature with each request. The signature is a SHA-256 HMAC of either
the url params (for GET requests) or the json body (for POST requests) using a shared secret. Your app should verify 
this signature as shown in pseudocode on the right.

Additionally, your app should respect the timeliness of requests. Without this, attackers can replay requests to your 
server. This is also shown in the pseudocode on the right.

You should read the [UI Hooks Security](/docs/ui-hooks-security) section before deploying anything to production.

<hr>

## Deploying

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

To deploy you'll need to host your localhost server to a full [App Server](/docs/app-server).
   
   1. All of your urls need to change to the new hosted location (both in your app definition and your responses).
   2. We recommend hosting on AWS Lambda, Google Cloud Functions, or Microsoft Azure for reliable uptime and easy maintenance.
   
<hr>

## Publishing

<span class="beta-indicator">ALPHA</span> - For access, please see [UI Components Alpha](/docs/ui-components-alpha)

**Publishing is generally not available during the Alpha**

Reach out to the Developer Relations team when your app is ready to publish. You can use any avenue to do this or simply 
email devrel@asana.com with your app's email and the name of the app you wish to publish. 

</section>
