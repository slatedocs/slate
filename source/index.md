---
title: Astronomer Documentation

language_tabs:
  - javascript

toc_footers:
  - <a href='http://astronomer.io'>Sign up for a free Astronomer account</a>

search: true
---

# Introduction

We believe that setting up user analytics and supporting tools is currently way
harder than it needs to be. We're working hard to take the pain away for
both devs and product managers.

Astronomer consists of:

1. **Open source libraries** that automatically emit well-formed user events
from your app. Our [Meteor package](https://atmospherejs.com/astronomerio/core)
is in alpha testing presently.
2. The **data hub** backend service, which:
  * archives all raw events to S3 (for historical playback)
  * broadcasts events to popular tools
  * pushes the events into other databases
  * allows you to run any javascript on the stream
3. The **configuration/monitoring portal** through astronomer.io, which provides a GUI interface to monitor and configure your app's data. If you're here, you've probably already seen it.

Presently, Astronomer is available only in SaaS form. We are engineering the
product, however, to license the entire architecture for private use. We
envision a world where "datastreams" are as important as databases.

First things first :)

# Analytics.js

At present, Astronomer collects data client-side. We have standardized
on [analytics.js](https://github.com/segmentio/analytics.js) to minimize
work required to access our data hub.

If you've already instrumented your app
using analytics.js or Segment, our service is 100% API-compatible.
We've implemented a standard
[analytics.js integration](https://github.com/astronomerio/analytics.js-integrations/blob/astronomer/lib/astronomer/index.js)
to the Astronomer backend service.

```
analytics.track("Custom Event");
```
You can use all the normal features of Analytics.js.

[Full Documentation](https://segment.com/docs/libraries/analytics.js/)

## Multi-hub analytics.js build

We've published a custom build of analytics.js that pushes data to both Segment and Astronomer so you can evaluate both. Additionally, some users may wish to employ both Segment and Astronomer and create a larger array of available destinations than either separately.


# Meteor auto-events package

If you're using Meteor and haven't instrumented your app for **user analytics** yet,
you're in luck! Our [Meteor package](https://atmospherejs.com/astronomerio/core)
will scan your code, identify all user events with available metadata, and instrument your entire Meteor app automatically.

Simply type `meteor add astronomerio:core`, add configuration, and your app
will emit well-formed user events automatically to the Astronomer service.
From there you can choose where to send your user data.

## Alpha Test process

### Step 1 - Sign up for [Astronomer](https://app.astronomer.io/signup)

We’ll use the Astronomer Data Hub service to broadcast our user events to both Google Analytics and Keen IO. The service also archives all events in a separate, secure database. This will also allow for a future feature release enabling for historical playback into new tools you decide to use down the road.

### Step 2 - Sign up for [Google Analytics](https://www.google.com/analytics/)

Every website + app should push data to Google Analytics — it provides a great value/effort ratio.
If you already have Google Analytics for your app, you can just use your current code as we only send
events to Google Analytics, not the standard pageviews.

After you have your code (hint: it starts with UA-), flip on the Google Analytics
integration in Astronomer, open up the credential window by clicking on 'Google Analytics', the and paste in your Tracking ID.

### Step 3 - Sign up for [Keen IO](https://keen.io/signup?source=astronomer)

We’re going to push our data to Keen IO, which gives you ad-hoc query capability, and is free at low volume. After you sign up, turn on Keen IO in Astronomer, paste in your Project ID and Write Key in the window that pops up when you click 'Keen IO.'

``` json
{
  "public": {
    "astronomer": {
      "appId": "XXXXXXXXX",
      "appSecret": "XXXXXXXXXXXXXXXXXXX"
    }
  }
}
```

### Step 4 - Add [Astronomer package](https://atmospherejs.com/astronomerio/core) to your Meteor app

This package emits user events from your app to the Astronomer Data Hub.

1. Type `meteor add astronomerio:core` into your command line.

2. Add a [settings.json](http://docs.meteor.com/#/full/meteor_settings) file to your app.

3. Get the appId and appSecret from Astronomer "Settings" tab by clicking the 'Copy to Clipboard' button. Both will be copied in the appropriate format (see sample on right.)

*Note: be sure to restart your Meteor app when you change settings.json file.*

### Step 5 - Confirm Events are Being Sent

1. Check the web browser's javascript console for your app, make sure you see **"Authenticating with https://app.astronomer.io:443"** to ensure you got the Meteor settings correct.
2. Go to Google Analytics Real-Time, and click on Events tab.
3. Take some actions in your app (sign up, change routes).
4. Confirm events are flowing through the Real-Time tab in Google Analytics.
5. Repeat steps 4 with Keen IO. If events are not showing up with either, wait a few minutes and refresh the page to try again.

### Step 6 - Create separate production/dev apps

You may want to create a separate Astronomer/Google Analytics/Keen instances to keep your test/dev events out of your production data. I use the naming convention “{AppName} Prod” and “{AppName} Dev” across all the services to keep it all straight.

### Step 7 - Share your Keen IO project with us (optional)

Invite setup@astronomer.io user to be a project member to your Keen IO database(s), so we can see the events that are being generated (you can remove us later).

And please report any issues, confusing steps, etc. you encounter in the process. Or any feedback of any kind :) The fastest way to get a response from us is to join our [developer slack channel](https://astronomerchat.slack.com). Email [ben@astronomer.io](mailto:ben@astronomer.io) for an invite.

Or you can always send us a good ol' fashioned email at [setup@astronomer.io](mailto:setup@astronomer.io).
We'll probably respond to that too. :)


# Getting set Up without Meteor
For those of you who are not using Meteor, follow these simple steps to start tracking your events.

``` javascript
<script type='text/javascript' src="http://cdn.astronomer.io/v1/analytics.min.js"></script>  
```

### Step 1 - Include the Javascript snippet (shown right) into your app.

``` javascript
analytics.initialize({  
  "astronomer": {
    "appId": "YOURAPPID"
  }
});
```
<br>
<br>

### Step 2 - Initialize it with your appId. If you haven't made an account yet, sign up [here](https://app.astronomer.io/signup) and create a new app by clicking the + icon at the top right of your dashboard. Once the new app is created, the appId will be located within the settings tab.

``` javascript
analytics.identify('f9s83swk4', {  
  firstName : 'Ry',
  lastName : 'Walker',
  email : 'ry@astronomer.io'
});
```

<br>
<br>

### Step 3 - Identify your users using their userId and any traits you have for them, such as name and email

``` javascript
analytics.track("Viewed Project", {  
  projectId: 42
});
```

<br>
<br>

### Step 4 - Begin tracking events wherever they are occurring. Name the event (in this case "Viewed Project"), and add any relevant traits to that event (such as the project id).




# Frequently Asked Questions

### What about USERcycle?

If you push your data into Keen IO, you can use USERcycle. We're not actively
developing new features in USERcycle at the moment, but it does generate some
great cohort and behavior flow charts for your app.

We may integrate some features of USERcycle into Astronomer at some point,
but it's not on the immediate todo list.

### I turned on an integration but I don't see where I can put in my credentials.

Right now, when you switch on an integration, you'll need to click on the integration name to open up a window to put your credentials in. We're working on a fix to have this happen automatically when you switch the integration on.

###Do I need to keep the Google Analytics script tag in my app?

Yes, you will still need to keep your script tag.

###Do I need to add Keen IO to my app in some way? Maybe with this npm package: https://github.com/keen/keen-js

Nope! Once you've set up your Keen account with Astronomer, you'll be all set to go.

###Where do events get sent?

That's all up to you! Check out the integrations we have live by logging into your dashboard. We're working hard to add new integrations all the time and prioritize this work by demand so please let us know if you have a specific tool you'd like to send your data to! Odds are that we'll be able to help you out ;)

###Which events are being tracked within the app?
All of them! In Meteor (which is the only framework that's live), this is done by tracking all methods and routes.

###Does this work for Angular routing as well?
Not yet, but we're working on it! Angular is the next framework that we'll be going after.


# Integrations Roadmap

<s>Keen IO</s> - (6/29/15)

<s>Google Analytics</s> - (6/29/15)

<s>Mixpanel</s> - (7/16/15)

<s>KISSmetrics</s> - (7/16/15)

<s>Heap</s> - (7/20/15)

<s>Amplitude</s> - (7/20/15)

<s>Customer.io</s> - (7/20/15)

<s>Calq</s> - (7/20/15)

Intercom

Mailchimp

