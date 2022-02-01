<hr class="platform-ui-alpha">
<section class="platform-ui-alpha">

# Overview of App Components

<span class="beta-indicator">BETA</span>

An important step in maintaining flow at work is having all the information you need in one place. Asana is for teams to track 
projects, to provide clarity on *who* is doing *what* by *when*, and to automate repetitive processes. Now, it's easier than ever to 
see key work information from other tools on the surface of tasks, and automate cross-tool processes.

Apps can use App Components to display customized widgets, forms, and rules within Asana's user interface. Requests go from
Asana directly to an App Server. The App Server controls the information within these customized widgets and the App Server
controls what happens when a User takes actions within these components.

<img src="../images/UI_Components.gif" />

The App Components open beta is **coming soon**. At the moment, we are offering this documentation as a preview of how will be
able to build with App Components. For the latest updates and announcements,
[subscribe to our developer forum](https://forum.asana.com/c/developersapi/app-components-beta/150).

_The App Components Beta Program is a pre-general-release version of a program developed by Asana that allows developers_
_to develop and test App Components. The App Component Beta Program is for development, evaluation, and testing purposes_
_only, and is not for production use or subject to availability or security obligations from Asana. The App Components_
_Beta Program is made available on an “as is” basis without warranties (express or implied) of any kind, and may be_
_discontinued or modified at any time._

<hr>

## Widget

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

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

A Widget displays external data within Asana. The contents of a 
Widget may change, but the overall format stays consistent across apps.
Apps can control what layout they prefer by supplying their preferred 
`template`. You can see the available templates in the *Enumerated Values* 
section of [response schema](/docs/widget-metadata).

The App Server controls the content of this Widget. When an 
Asana user's browser navigates to a Widget, Asana sends a 
request to the registered App Server. As long as the response from 
the server is valid (like the example on the right), the Widget 
will display.

How does Asana determine when a Widget should be shown? When a task is opened in
Asana, it checks each attachment on the task. If an attachment has a URL 
that fits with an App's registered `match url` (ex: `https:\/\/.*.atlassian.net\/.*`) 
then it shows a Widget. A GET request is sent to the App's `widget url`, including 
URL parameters like `task`, `user`, and `workspace`. 

Related References: 

* [Get widget metadata](/docs/get-widget-metadata)
* [Attach resource](/docs/attach-resource)

<hr>

## Modal Form

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

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

A Modal Form allows users to fill out a dynamic app-controlled list of fields. The number of fields can range from 0-20.
Once a form is submitted, the information is sent to the App Server and Asana will perform different functionality
depending on what they responded with. If the App wants to cause additional changes within Asana, the App 
Server will need to make the changes via the API. 

An advanced feature of Modal Forms is live `on_change` events. While a user is filling out a form,
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

## Lookup

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

> Request to the App Server

```http
https://app-server.com/lookup?value=Cool&workspace=12345&task=23456&user=34567&locale=en&expires_at=2011-10-05T14%3A48%3A00.000Z
```

> Response from the App Server

```json
{
    "resource_name": "Cool Attachment",
    "resource_url": "https://localhost:5000/attachments/123456789"
}
```

<img style="max-width:658px" src="../images/jira-lookup.png" />

Users can send a search term to the app server. The term is often a URL or 
the title of an external resource. The app server then responds with a 
resource or an error. 

Related References: 

* [Widget](/docs/widget)

<hr>

## Rule Action

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

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

A Rule Action allows users to customize actions triggered by Asana's rule engine. They use the same functionality as
the [Modal Form](/docs/modal-form), as Asana requests a form definition from the App Server. The app controls the form 
fields, handles `on_change` events, and stores the inputs of the form. When a rule is created, Asana sends a request to 
the App Server with the user-specified inputs. When the rule is triggered, Asana sends an event to the App Server.

 

Rule Actions are a part of [Asana Rules](https://asana.com/guide/help/premium/rules).

Related References: 

* [Get action metadata](/docs/get-action-metadata)
* [On action change callback](/docs/on-action-change-callback)
* [On action submit callback](/docs/on-action-submit-callback)

<hr class="full-line">

# Quick Start

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

This guide offers a quick way for developers to start building on App Components. By following these steps, you'll gain an understanding of how to install App Component apps to your developer sandbox, as well as how an example app communicates with endpoints exposed on a pre-built local server. 

Note that for the App Components apps [that you create](/docs/configurations), you'll be able to define your own icons, images, descriptions, and other content. Many of the values for these fields are marked by **{curly braces}** in the example app.

Before you begin, you'll need a developer sandbox in order to use App Components in your application. [Click here to request a sandbox](/docs/developer-sandbox) if you don't already have one.

1. Clone [this repository](https://github.com/Asana/app-components-example-app) containing an example Express server.
2. Follow the instructions in the [README](https://github.com/Asana/app-components-example-app/blob/main/README.md) to run the server. This server needs to remain on as you use the example app.
3. Open the developer sandbox in your browser.
4. In an existing project, go to **Customize** > **Apps** > **{Example}** to install the App Components example app. 
    - **Important**: The installation flow this takes you through is only shown once per user. To see it a second time, navigate to 
      `https://app.asana.com/-/install_platform_ui_app?app_id=<app_client_id>`.
<br>
<br>
<img src="../images/example-app-gallery-tile.png" />
<br>
<br>
5. Once the example app is installed, create a task in your project. In the task's **{Example}** custom field, go to **{Add Example Resource}** > **{Open form}** to see examples of customizable inputs. Click **Submit**.
<br>
<br>
<img src="../images/example-modal-form.gif" />
<br>
<br>
6. View the newly-generated Widget on your task. You can begin editing `index.js` to modify the contents of the widget. Note that you'll need to restart the local server and reload the page to see your changes.
<br>
<br>
<img src="../images/example-widget.png" />
<br>
<br>
That's it! At this point, feel free to keep exploring how changes in the server affects data in the task's Widget. Once you're ready to define an app, [click here to create your own app](/docs/configurations) with App Components.

<hr class="full-line">

# Installing an App

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

When a user connects an app with App Components to Asana for the first time, they will go through an installation flow. This involves walking the user through the app's features (i.e., "value props"), authorizing the app, and adding it to projects in Asana. The installation flow can be triggered through either one of two ways:

1. The in-product app gallery. Users can access the app gallery by going into a project (in which they want to install an app), then navigating to **Customize** > **Add App**.
<br>
<br>
<img src="../images/app-gallery.png" alt="app gallery"/>
<br>
<br>
2. The [Asana app directory](https://asana.com/apps):
<br>
<br>
<img src="../images/app-directory.png" alt="app directory"/>

Note that subsequent interactions with the same application by the same user will _not_ trigger the following installation flow. To force the installation flow in its entirety again (e.g., for QA purposes), you can visit `https://app.asana.com/-/install_platform_ui_app?app_id=<app_client_id>`, replacing the value of the `app_id` query parameter with the application's Client ID (accessible via the [developer console](https://app.asana.com/0/developer-console)).

<hr>

### Features

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

After entering the installation flow, the first screen that users see are the app's features, or value props. 

<img src="../images/features.png" alt="features"/>

As part of the customizations, a `valuePropTitle` and `valuePropSubtitle` can be shown at the top of the screen. Additionally, up to three value prop images can be displayed on the screen, each containing the image itself (via an `imageUrl`), accompanying `text` to display under each image, as well as `alt` text.

<hr>

### Authenticating

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

On the next screen, the user will be directed to the auth screen, which will ask them to connect to the external app.

<img src="../images/authentication.png" alt="authentication"/>

When the user clicks the button to continue, Asana will make a request to the application's specified `authenticationUrl` in a pop-up window. From here, it is developer's discretion as to how the user proceeds with authentication. In most cases, this authentication step usually involves completing the [Asana OAuth](/docs/oauth) flow, as well as the third-party (i.e., external) OAuth flow.

<img src="../images/authenticate-asana.png" alt="authentication with Asana"/>

<img src="../images/authenticate-external.png" alt="authentication with external app"/>

Additionally, you may choose to present custom screens, forms, or otherwise logic to prompt the user for additional information needed to set up the application.

The authentication flow is concluded when the app confirms that authentication is complete with a "success" message using [window.postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage). For more information, feel free to review [Authorization](/docs/authorization) requirements when publishing an app.

<hr>

### Adding to a Project

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

Once the user has successully granted permissions, they'll be taken to different screens depending on how they entered the installation flow:

1. If the user began the installation flow from outside of a project (e.g., through the [Asana app directory](https://asana.com/apps)), the user will be shown an additional screen that prompts them to add the app to any necessary projects. This screen will not be shown otherwise.
<br>
<br>
<img src="../images/add-app-to-projects.png" alt="add app to projects"/>
<br>
<br>
From here, the user may choose to add the app to one or more projects, or even skip adding the app for the time being. Once the user has made their choice, the final screen will confirm the user's choices, and the installation flow will be completed.
<br>
<br>
2. If the user began the installation flow from within a project, the user will see a confirmation of the app they've added, and the installation flow will be completed.
<br>
<br>
<img src="../images/installation-flow-finish.png" alt="installation flow finish"/>
<br>

<hr class="full-line">

# Publishing an App

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

Apps built on App Components are manually reviewed before they are accessible within Asana. To ensure a smooth review process and user experience, here are some guidelines you can follow.

<hr>

## General Guidelines

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

When submitting an [app configuration](/docs/configurations), you should:

* Add necessary images (e.g., feature images, icon, logo, etc.)
* Add support links (e.g., feedback link, external support URL)
* Proofread marketing-related text (e.g., description, extended description, features)
* Make sure button text has 3-4 words or fewer and start with a verb
* Use consistent language for similar concepts where applicable
* Use sentence case by default and capitalize proper nouns

When testing your application, you should:

* Try to "break" your forms (e.g., test watched fields, limit invalid submissions, test typeahead fetches, etc.)
* Test and proof-read any custom error messages
* Test the auth flow from both the web browser and [desktop app](https://asana.com/download)
  * You can enter the installation flow manually by navigating to `https://app.asana.com/-/install_platform_ui_app?app_id=<app_client_id>`
* Test [Rule Actions](/docs/rule-actions) with a variety of trigger combinations

<hr>

## Security

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

When handling requests from Asana, an App Components app should:
 
 - Reject requests with missing or incorrect signatures.
 - Reject requests with an "expires" time in the past.
    - **Note**: Make sure to use the correct units for this. "expires" is in milliseconds. If you compare the expiration time to a timestamp in seconds, it will always look like the request expires thousands of years in the future.

If an app uses [OAuth for authentication](/docs/oauth), the app should:
 
 - Prevent OAuth CSRF attacks. This is often done using a one-time CSRF token in the "state" parameter. This can also be done using PKCE instead, if it's supported.

If an app doesn't use OAuth for authentication, the Asana Security Team should manually review the authentication scheme the app uses. In particular, we will try to verify that:

 - An attacker can't authenticate themselves as someone else
 - An attacker can't force a victim to authenticate as another user (eg. with a CSRF attack)

 <hr>

## Authorization

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

```html
<!-- Example: An app might return this HTML in response to the 
authenticationUrl request after the Oauth flow is completed:
 -->

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>You have successfully connected Asana to the app</title>
  </head>
  <body>
    Success!
    <script>
      window.opener.postMessage("success", "https://app.asana.com");
      window.close();
    </script>
  </body>
</html>
```

### Overview

The Asana platform needs confirmation from the App Components app that authentication has completed successfully. When 
an app is added to a project, the user adding it is sent to the app's `authenticationUrl`. The app may perform OAuth with Asana,
OAuth with a different app, perform both, or perform none. As long as the app confirms the flow was complete, Asana will
successfully add the app to the project. This will allow requests to be sent to the app's predefined endpoints.

### How it works

Under the hood, we carry this out by listening for a message from the authentication popup window containing the string "success".
When we make a request to the app's `authenticationUrl`, the browser opens a popup or "child" window and waits for it to respond
with "success"  using [window.postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage). The target window
for this `postMessage` call should be the opener, accessible via
[window.opener](https://developer.mozilla.org/en-US/docs/Web/API/Window/opener).

Note that for security purposes, the _origin_ of the event (which is added to the event by the browser) needs to match the root of the 
`authenticationUrl` registered to the app. That is, the authentication success message must be initiated from the same origin that receives the 
authentication request. This is different from the `targetOrigin` of the `window.opener.postMessage` call, which must be exactly 
`"https://app.asana.com"`.

### Additional notes

If the app wants additional data from Asana or wants to make changes within Asana, they should have the user complete 
an [OAuth flow](/docs/oauth) against Asana. 

Keep in mind that this authorization provides the app server with a single user's auth token. Multiple users of Asana will
hit the UI hooks and send requests to the app server, but the server will likely only have the token for one user. You may want
to suggest users to authenticate with a bot account. 

<hr>

## Message Integrity

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

Message integrity is provided by a SHA-256 HMAC signature on the contents of the request. This is URL parameters in the 
case of GET requests and a JSON blob in the case of a POST request. The signature is transmitted via a header. The app 
calculates the same signature and compares that to the value in the header, rejecting the request if the two do not match.
The signature must be on the exact parameter string that will be passed to the app because the signature will change if 
something as trivial as spacing changes.

The burden of verifying the request is on the app. Without this check, attackers can send requests to the App 
Server pretending to be Asana.

<hr>

## Timeliness

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

Timeliness is provided by the addition of an expiration parameter. If this parameter were not added then a request 
recorded, such as in logs, could be reused to continue to request information from the app at a later time.

The burden of verifying the request has not expired is on the app. Without this check, the App Server is vulnerable to 
replay attacks.

<hr>

## Submit for Review

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

After you have completed development of your app (and you have addressed the guidelines above), you can begin the process
to have your app published on Asana. This feature is ([coming soon](/docs/overview-of-app-components)).

<hr class="full-line">

# Additional Resources

## Configurations

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

> Sample of a "full" App Components configuration

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

The following table lists the configurations you can make to define your App Components app.

To create an app with App Components functionality, you'll first need to [create an app](/docs/authentication-quick-start), then provide
the configurations for your application with the data described in the table below ([coming soon](/docs/overview-of-app-components)).
Note that certain fields, such as the app name and icon, are directly customizable in the developer console and will also be used by the App Components system.

|Field|Type|Description|
|---|---|---|
| `description`               | String       | A short description of the app shown in the app gallery. |
| `extendedDescription`       | String       | An extended description of the functionality of the app shown in the app settings. |
| `features`                  | Object       | A list of feature descriptions used to illustrate the functionality of the app in marketing views. |
|» `src`                      | String (url) | (Optional) src for image of feature |
|» `alt`                      | String (url) | (Optional) alt for image of feature |
|» `text`                     | String (url) | text below image of feature |
| `authenticationUrl`         | String (url) | A URL which informs Asana where to make requests for authenticating and authorizing users.  This is called during installation or when the app returns a response indicating the user must authenticate to continue. |
| `capabilities`              | Object       | A list of capabilities supported by the app and their configuration. |
|» `resource_widget`          | Object       | The container for resource Widget functionality  |
|»» `widgetMetadataUrl`       | String (url) | A URL that Asana uses to make requests for the data needed to load a Widget which displays information about a 3rd party resource. |
|»» `matchUrlPattern`         | String (url) | A regex which allows Asana to compute whether a UrlAttachment is supported by an activated app on the project in order to render a Widget. |
|» `resource_search`          | Object       | The container for typeahead functionality |
|»» `resourceAttachUrl`       | String (url) | A URL that Asana will make a request of when a user submits a value to attach. |
|» `create_resource`          | Object       | The container for resource creation functionality |
|»» `formMetadataUrl`         | String (url) | A URL that Asana uses to request data from the app about fields it should display in the resource creation modal when the form is first displayed. |
|» `automation`               | Object       | The container for automation functionality |
|»» `app_actions`             | Object[]     | The set of Rule Actions exposed by the app |
|»»» `identifier`             | String       | The unique identifier for the action on the app. |
|»»» `display_name`           | String       | Rule Action name visible to end users, e.g. "Create a Jira issue" |
|»»» `run_action_url`         | String       | App Server URL for requests to run a Rule Action |
|»»» `form_metadata_url`      | String       | App Server URL for requests about configuring an Rule Action |
| `logo`                      | String (url) | A link to the image of the App logo. Appears in the app installation modal |
| `authModalMetadata`         | Object       | Information about the text displayed in the auth modal |
|» `title`                    | String       | The title displayed in the auth modal |
|» `subtitle`                 | String       | The subtitle displayed in the auth modal |
|» `buttonText`               | String       | The buttonText displayed in the auth modal |
| `coachmarkText`             | String       | Text displayed to new users to inform them about the app’s capabilities. |
| `actionsMenuTitle`          | String       | Text displayed in the app field in the task pane |
| `feedbackLink`              | String (url) | Link to a form for collecting feedback about the app. |
| `externalSupportUrl`        | String (url) | Link to page where users can learn more about the app, access detailed setup instructions, or get support. | 

<hr>

## Toolkit

<span class="beta-indicator">BETA</span>

Our [App Components Toolkit](https://www.figma.com/file/my7DKSUnuVjEiNSnJuMFcI/branch/HiCYzuMtAkhdXQy1srf2Ug/App-Components-Toolkit?node-id=94%3A15940) provides
a visual documentation of App Components. You'll see at-a-glance how the different features and capabilities surface within
Asana, including how they fit together and what you can do with them. Feel free to use the toolkit to supplement the process
of designing and building your apps with App Components.

<img src="../images/ac-toolkit-screenshot.png" />

<hr>

## Example App

<span class="beta-indicator">BETA</span> - For access, please see [Overview of App Components](/docs/overview-of-app-components)

After you have obtained a [developer sandbox](/docs/developer-sandbox), you will have access to the "External Example App"
in the app gallery.

<img src="../images/example-app-gallery-tile.png" />

To test out the features of App Components, feel free to install the app into any project in your sandbox. Note that
the corresponding [Express server](https://github.com/Asana/app-components-example-app) must be running at the same
time as well. For more information on the example app, visit the [App Components Quick Start](/docs/quick-start) guide.

<hr>

## Forum

<span class="beta-indicator">BETA</span>

For the latest news on App Components, as well as opportunity to engage with other developers in the community,
feel free to visit our [App Components forum](https://forum.asana.com/c/developersapi/app-components-beta/150).

</section>
