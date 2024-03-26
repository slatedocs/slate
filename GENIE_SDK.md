# Genie SDK

## Introduction
This documentation outlines the installation process, usage, and configuration options of the Genie SDK.

## Getting Started

### Installation
To integrate the Genie SDK into your web application, include the following script tag in the `<head>` section of your HTML document:

```html
<script src="https://genie-an.s3.ap-south-1.amazonaws.com/genie_sdk/v1.1.0/genieSDK.min.js" defer></script>
```

### Initialization
Initialize the Genie SDK by adding the following JavaScript code, typically after the script tag or within a script file that is loaded after the page content:

```javascript
document.addEventListener("DOMContentLoaded", function() {
    const genieSDK = new GenieSDK({
        containerId: "your_iframe_container_id_here",
        iframeId: "your_iframe_id_here",
        agentId: "your_agent_id_here",
        entity: "lead",
        iframeClassName: "your_iframe_class_name_here",
        landingPageUrl: "your_redirection_url_here"
    });
    genieSDK.insertIframe();
});
```

### HTML Setup
Ensure there is a container in your HTML to host the iframe, like this:

```html
<div id="iframe-wrapper" class="iframe-container"></div>
```

For example, your complete HTML might look like this:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Genie SDK Integration Example</title>
    <script src="https://genie-an.s3.ap-south-1.amazonaws.com/genie_sdk/v1.1.0/genieSDK.min.js" defer></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const genieSDK = new GenieSDK({
                containerId: "iframe-wrapper",
                iframeId: "genie-iframe",
                agentId: "11",
                entity: "lead",
                iframeClassName: "iframe-fullscreen",
                landingPageUrl: "https://example.com/"
            });
            genieSDK.insertIframe();
        });
    </script>
</head>
<body>
    <div id="iframe-wrapper" class="iframe-container"></div>
</body>
</html>
```

## Configuration

### GenieSDKOptions
Configure the `GenieSDK` class using the following options:
| Option             | Type   | Required/Optional | Default Value       | Description                                              |
|--------------------|--------|-------------------|----------------|----------------------------------------------------------|
| `containerId`      | string | **Required**      |                | The ID of the container element where the iframe will be embedded. |
| `iframeId`         | string | *Optional*        | `"genie-id"`   | The ID that will be assigned to the iframe.    |
| `agentId`          | string | **Required**      |                | Identifier for the agent or service the SDK is interacting with. |
| `entity`           | string | *Optional*        | `"lead"`       | The type of entity the iframe will interact with. |
| `iframeClassName`  | string | *Optional*        | `"genie-class"`| CSS class to assign to the iframe.             |
| `landingPageUrl`   | string | *Optional*        |                | URL to redirect the user to in case something went wrong. |


### Methods

#### `insertIframe()`
This method creates and inserts an iframe into the specified container on the web page. It generates the iframe's source URL using the configured options and the current page's URL parameters.

## Styling

Customize the appearance of the iframe and its container using CSS. Apply styles directly to the container using its ID or class.

Example:
```css
.iframe-fullscreen {
  width: 100%;
  height: 100%;
  border: none;
}

.iframe-container {
  max-width: 640px;
  margin: auto;
}
```

## Required Query Params in Parent Window
The query parameters of the parent window should include: Name, Phone Number, Country Code and ID of the lead. 

Use the following example to pass the required parameters.
```javascript
function onLeadSuccessCallback(leadId) {
    const ccode = 'Lead`s CountryCode'; // Example: '91'
    const phone = 'Lead`s PhoneNumber'; // Example: '1234567890'
    const name = 'Lead`s Name'; // Example: 'John Doe'

    const params = new URLSearchParams({
        country_code: ccode,
        phone: phone,
        lead_id: leadId,
        name: name,
    });

    window.location.href = `${window.location.protocol}//${window.location.hostname}/thank-you.html?${params.toString()}`;
}
```

Replace `Lead's CountryCode`, `Lead's PhoneNumber`, and `Lead's Name` with actual data relevant to your application. The `leadId` parameter is provided to the callback function upon a successful lead submission.

## Conclusion
The Genie SDK facilitates the integration of a dynamic iframe into web pages, providing various customization and configuration options to meet application needs.

