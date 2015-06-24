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
  * archives all raw events to S3 (for future playback)
  * broadcasts events to popular tools
  * pushes the events into other databases
  * allows you to run any javascript on the stream
3. The **configuration/monitoring portal**, which provides a GUI interface to monitor and configure your app's data.

Presently, Astronomer is available only in SaaS form. We are engineering the
product, however, to license the entire architecture for private use. We
envision a world where "datastreams" are as important as databases.

First things first :)

# Analytics.js

At present, Astronomer collects data client-side. We have standardized
on [analytics.js](https://github.com/segmentio/analytics.js) to minimize
work required to access our data hub.

If you've already instrumented your app
using analytics.js or Segment, our service 100% API-compatible.
We've implemented a standard
[analytics.js integration](https://github.com/astronomerio/analytics.js-integrations/blob/astronomer/lib/astronomer/index.js)
to the Astronomer backend service.

## Multi-hub analytics.js build

We've published a [custom build of analytics.js]()
that pushes data to both Segment and Astronomer. This is useful for
testing/evaluating Astronomer if you're currently a Segment user.

We expect that some customers will choose to use both Segment and Astronomer,
as our services are different.

# Meteor auto-events package

If you're using Meteor and haven't instrumented your app for analytics yet,
you're in luck. Our [Meteor package](https://atmospherejs.com/astronomerio/core)
will instrument your entire Meteor app automatically.

Simply type `meteor add astronomerio:core`, add configuration, and your app
will emit well-formed user events automatically to the Astronomer service.
