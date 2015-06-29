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

## Multi-hub analytics.js build

**COMING SOON**

We've published a custom build of analytics.js that pushes data to both Segment and Astronomer. This is useful for
testing/evaluating Astronomer if you're currently a Segment user.

We expect that some customers will choose to use both Segment and Astronomer,
as our services are different.

# Meteor auto-events package

If you're using Meteor and haven't instrumented your app for **user analytics** yet,
you're in luck. Our [Meteor package](https://atmospherejs.com/astronomerio/core)
will instrument your entire Meteor app automatically.

Simply type `meteor add astronomerio:core`, add configuration, and your app
will emit well-formed user events automatically to the Astronomer service.

## Alpha Test process

### Step 1 - Sign up for [Astronomer](https://app.astronomer.io/signup)

We’ll use the Astronomer Data Hub service to broadcast our user events to both Google Analytics and Keen IO. The service also archives all events for future playback into new tools we may choose to adopt later (this isn’t 100% working yet, though).

### Step 2 - Sign up for [Google Analytics](https://www.google.com/analytics/)

Every website + app should push data to Google Analytics — it provides a great value:effort ratio.
If you already have Google Analytics for your app, you can just use your current code. We only send
Events to Google Analytics.

After you have your code (starts with UA-), flip on the Google Analytics
integration in Astronomer, and paste in your Tracking ID .

### Step 3 - Sign up for [Keen IO](https://keen.io/signup?source=astronomer)

We’re going to push our data to Keen IO, which gives you ad-hoc query capability, and is free at low volume. After you sign up, turn on Keen IO in Astronomer, paste in your Project ID and Write Key.

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

This package emits well-formed user events from your app to the Astronomer Data Hub.

`meteor add astronomerio:core`

Add a settings.json file, with the appropriate settings, see sample to the right.

Get the appId and appSecret from Astronomer "settings" tab.

### Step 5 - Confirm it's working

1. Check the web browser's javascript console for your app, make sure you see **"Authenticating with https://app.astronomer.io:443"** to ensure you got the Meteor settings correct.
2. Go to Google Analytics Real-Time, and click on Events tab.
3. Take some actions in your app (sign up, change routes).
4. Confirm events are flowing through the Real-Time tab in Google Analytics.

### Step 6 - Create separate production/dev apps

You may want to create a separate Astronomer/Google Analytics/Keen instances to keep your test/dev events out of your production data. I use the naming convention “{AppName} Prod” and “{AppName} Dev” across all the services to keep it all straight.

### Step 7 - Share your Keen IO project with us (optional)

Invite setup@astronomer.io user to be a project member to your Keen IO database(s), so we can see the events that are being generated (you can remove us later).

And please report any issues, confusing steps, etc. you encounter in the process. Or any feedback of any kind :) Drop email to [setup@astronomer.io](mailto:setup@astronomer.io).

# Frequently Asked Questions

### What about USERcycle?

If you push your data into Keen IO, you can use USERcycle. We're not actively
developing new features in USERcycle at the moment, but it does generate some
great cohort and behavior flow charts for your app.

We may integrate some features of USERcycle into Astronomer at some point,
but it's not on the immediate todo list.
