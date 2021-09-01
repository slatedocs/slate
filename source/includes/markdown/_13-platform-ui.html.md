<hr class="platform-ui-alpha">
<section class="platform-ui-alpha">

# App Components Beta

<span class="beta-indicator">BETA</span>

App Components are currently in **Closed Beta**. At this time, we are limiting the number of app submissions to be published
in the in-product app gallery for the official launch. If you are interested in having your app published, please
[visit the forum](https://forum.asana.com/c/developersapi/app-components-beta/150) for instructions on participating in the
App Components Beta Program. 

The App Components Beta Program is a pre-general-release version of a program developed by Asana that allows developers 
to develop and test App Components. The App Component Beta Program is for development, evaluation, and testing purposes 
only, and is not for production use or subject to availability or security obligations from Asana. The App Components 
Beta Program is made available on an “as is” basis without warranties (express or implied) of any kind, and may be 
discontinued or modified at any time.

<hr class="full-line">

# App Components Overview

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

To start building, follow our [Quick Start guide](/docs/app-components-quick-start)!

Apps can use App Components to display customized widgets, forms, and rules within Asana's UI. 
Requests go from Asana directly to an App's server. The App Server controls  
the information within these customized widgets and the App Server controls what 
happens when a User takes actions within these components.

A new in-app gallery and install flow, a customizable modal, a widget, and more.
<img src="../images/UI_Components.gif" />

<hr>

## App Widget

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

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

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

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

## App Resource Search

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

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

<span class="beta-indicator">BETA</span> - For access, please see [App Components BETA](/docs/app-components-beta)

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

# App Components Definition

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

> Sample of an app with a full App Components definition

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

To create an app with App Components, you will need to create an OAuth App and request the 
App Components functionality onto it via the 
[Create an App Components App](https://form-beta.asana.com?k=LBWpDpqZ6b-6pV4ZIbP-OA&d=15793206719) form.

To create an OAuth app, see [Authentication Quick Start](/docs/authentication-quick-start).

To create an App Components app you'll need to fill out the [Create an App Components App](https://form-beta.asana.com?k=LBWpDpqZ6b-6pV4ZIbP-OA&d=15793206719)
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

# App Components Guidelines

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

Apps built on App Components are manually reviewed before they are accessible within Asana. To ensure a smooth review process and user experience, here are some guidelines you can follow.

When submitting an [app definition](/docs/app-components-definition), you should:

* Add necessary images (e.g., feature images, icon, logo, etc.)
* Add support links (e.g., feedback link, external support URL)
* Proof-read marketing-related text (e.g., description, extended description, features)
* Make sure button text has 3-4 words or fewer and start with a verb
* Use consistent language for similar concepts (where applicable)
* Use sentence case by default and capitalize proper nouns

When testing your application, you should:

* Try to "break" your forms (e.g., test watched fields, limit invalid submissions, test typeahead fetches, etc.)
* Test and proof-read any custom error messages
* Test the auth flow from both the web browser and [desktop app](https://asana.com/download)
* Test app actions with a variety of trigger combinations

<hr class="full-line">

# App Components Security

## App Components Security Checklist

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

When handling requests from Asana, an App Components app should:
 
 - Reject requests with missing or incorrect signatures.
 - Reject requests with an "expires" time in the past.
    - **Note**: Make sure to use the correct units for this. "expires" is in milliseconds. If you compare the expiration time to a timestamp in seconds, it will always look like the request expires thousands of years in the future.

If an app uses OAuth for authentication, the app should:
 
 - Prevent OAuth CSRF attacks. This is often done using a one-time CSRF token in the "state" parameter. This can also be done using PKCE instead, if it's supported.

If an app doesn't use OAuth for authentication, the Asana Security Team should manually review the authentication scheme the app uses. In particular, we will try to verify that:

 - An attacker can't authenticate themselves as someone else
 - An attacker can't force a victim to authenticate as another user (eg. with a CSRF attack)

## App Components Authorization

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

Authorization is handled by the app. When an app with App Components is added to a project, the user adding it is sent 
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

## App Components Message Integrity

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

Message integrity is provided by a SHA-256 HMAC signature on the contents of the request. This is URL parameters in the 
case of GET requests and a JSON blob in the case of a POST request. The signature is transmitted via a header. The app 
calculates the same signature and compares that to the value in the header, rejecting the request if the two do not match.
The signature must be on the exact parameter string that will be passed to the app because the signature will change if 
something as trivial as spacing changes.

The burden of verifying the request is on the app. Without this check, attackers can send requests to the App 
Server pretending to be Asana.

<hr>

## App Components Timeliness

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

Timeliness is provided by the addition of an expiration parameter. If this parameter were not added then a request 
recorded, such as in logs, could be reused to continue to request information from the app at a later time.

The burden of verifying the request has not expired is on the app. Without this check, the App Server is vulnerable to 
replay attacks. 

<hr class="full-line">

# App Components Quick Start

<span class="beta-indicator">BETA</span> - For access, please see [App Components Beta](/docs/app-components-beta)

This guide offers a quick way for developers to start building on App Components. By following these steps, you'll gain an understanding of how to install App Component apps to your developer sandbox, as well as how an example app communicates with endpoints exposed on a pre-built local server. 

Note that for the App Components apps [that you create](https://developers.asana.com/docs/app-components-definition), you'll be able to define your own icons, images, descriptions, and other content. Many of the values for these fields are marked by **{curly braces}** in the example app.

Before you begin, you'll need a developer sandbox in order to use App Components in your application. [Click here to request a sandbox](https://developers.asana.com/docs/developer-sandbox) if you don't already have one.

1. Clone [this repository](https://github.com/Asana/app-components-example-app) containing an example Express server.
2. Follow the instructions in the [README](https://github.com/Asana/app-components-example-app/blob/main/README.md) to run the server. This server needs to remain on as you use the example app.
3. Open the developer sandbox in your browser.
4. In an existing project, go to **Customize** > **Apps** > **{Example}** to install the App Components example app.
<br>
<br>
<img src="../images/example-app-gallery-tile.png" />
<br>
<br>
5. Once the example app is installed, create a task in your project. In the task's **{Example}** custom field, go to **{Add Example Resource}** > **{Open form}** to see examples of customizable inputs. Click **Submit**.
<br>
<br>
<img src="../images/example-app-form.gif" />
<br>
<br>
6. View the newly-generated widget on your task. You can begin editing `index.js` to modify the contents of the widget. Note that you'll need to restart the local server and reload the page to see your changes.
<br>
<br>
<img src="../images/example-app-widget.png" />
<br>
<br>
That's it! At this point, feel free to keep exploring how changes in the server affects data in the task's widget. Once you're ready to define an app, [click here to create your own app](https://developers.asana.com/docs/app-components-definition) with App Components.

</section>
