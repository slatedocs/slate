---
title: Front Plugin API Reference

toc_footers:
  - <a href='https://github.com/frontapp/frontapp.github.io/'>Plugin example</a>
  - <a href='/'>API reference</a>
  - <a href='changelog.html'>Changelog</a>
  - <a href='mailto:api@frontapp.com'>Contact us</a>

includes:
  - plugin/events
  - plugin/controlling_front
  - plugin/dialogs
  - plugin/accessing_data

search: true
---

# Introduction

Front supports **plugins**. A plugin is a small web application that can communicate with Front using a JavaScript API. It allows you to extend Front with new features, making it possible to connect it with other tools you use and optimize the workflow of your team:

* Show additional data about your customers, that you can pull from your backend, your knowledge or any other source.
* Take actions directly inside Front on behalf of the user so you can automate a workflow.
* Link or create entries in your CRM, your knowledge base or any other tool.

![Plugin example](plugin-example.png)

## Creating a plugin

> You can use any web framework or library you wish: it's just a web page that can communicate with Front.
> It has to be hosted on your servers and include our library. Just add:

```html
<script src="https://dl.frontapp.com/libs/frontjs.min.js"></script>
```

To create a new plugin, go to Settings > API & integrations > Plugins ans click on "Add a plugin":

![Add a new plugin](plugin-settings.png)

<aside class="warning">
<strong>HTTPS</strong><br>
Your plugin has to be hosted on an HTTPS domain. You can use <a href="https://ngrok.com/">https://ngrok.com/</a> if you want to quickly serve a local development server over HTTPS.
</aside>

We provide a small sample plugin that shows some basic things you can do using our Javascript API. You can check the code on [https://github.com/frontapp/frontapp.github.io](https://github.com/frontapp/frontapp.github.io/).
If you want to test directly, you can even set the plugin URL to be `https://frontapp.github.io/plugin.html` to see what the basic plugin can do.

## Security

In order to avoid compromising your data, every time the plugin SDK is loaded, Front will check if the plugin's current URL matches the one saved in the settings. If it doesn't, no data will be sent to it.
This is why we recommend designing your plugin as a single page applications.

<aside class="warning">
If your plugin redirects to an unregistered URL, Front will stop sending any data.
</aside>

## Authentication

On your side, it might be desirable to ensure that your plugin is indeed requested by Front, especially if it displays confidential information.

Front provides a simple way to verify that your plugin is requested by Front. In the settings of your plugin, you will see an authentication secret. This secret will be passed as a query parameter named `auth_secret` when requesting your plugin.

![Plugin authentication](plugin-auth.png)

If you need any help in getting your plugin working, would like more information or a new feature please drop us a line at api@frontapp.com we will be happy to help.

## Mobile restrictions

Plugins can be used on Mobile devices directly from a conversation. Some helper methods have not been implemented and will not work on iOS and Android: 

```
- insertHTML
- setPanelWidth
- updateDraft
- addTopic 
```
