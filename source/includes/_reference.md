# Service Status

We're transparent about our uptime and service issues. If you appear to be experiencing issues with our service:

* [Check out status site](https://status.scoutapm.com). You can subscribe to service incidents.
* [Email us](mailto:support@scoutapm.com)

# Contacting Support

Don't hesitate to contact us at [support@scoutapm.com](mailto:support@scoutapm.com) with any issues. We typically respond in a couple of hours during the business day.

Or, join us on [Slack](http://slack.scoutapm.com/). We are often, but not always, in Slack. 

# Reference

## How we collect metrics

Scout is engineered to monitor the performance of mission-critical production applications. Here's a short overview of how this happens:

* Our agent is added as an application dependency (ex: for Ruby apps, add our gem to your Gemfile).
* The agent instruments key libraries (database access, controllers, views, etc) automatically using low-overhead instrumentation.
* Every minute, the agent connects over HTTPS through a 256-bit secure, encrypted connection and sends metrics to our servers.

## Performance Overhead

Our agent is designed to run in production environments and is extensively benchmarked to ensure it performs on high-traffic applications.

Our most recent benchmarks (_lower is better_):

![overhead](overhead.png)

We've [open-sourced our benchmarks](https://scoutapm.com/blog/overhead-benchmarks-new-relic-vs-scout) so you can test on our own. If your results differ, [reach out to us at support@scoutapm.com](mailto:support@scoutapm.com).

### Call Aggregation

During a transaction, the Scout agent records each database call, each external HTTP request, each rendering of a view, and several other instrumented libraries. While each individual pieces of this overall trace has a tiny memory footprint, large transactions can sometimes build up thousands and thousands of them.  

To limit our agent's memory usage, we stop recording the details of every instrument after a relatively high limit. Detailed metrics and backtraces are collected for all calls up to the limit and aggregated metrics are collected for calls over the limit.

## Security

We take the security of your code metrics extremely seriously. Keeping your data secure is fundamental to our business. Scout is nearing a decade storing critical metrics and those same fundamentals are applied here:

* All data transmitted by our agent to our servers is sent as serialized JSON over SSL.
* Our UI is only served under SSL.
* When additional data is collected for slow calls (ex: SQL queries), query parameters are sanitized before sending these to our servers.
* Our infrastructure resides in an SOC2 compliant datacenter.

### Information sent to our servers

The following data is sent to our servers from the agent:

* Timing information collected from our instrumentation
* Gems used by your application
* Transaction traces, which include:
  * The URL, including query parameters, of the slow request. This can be modified to exclude query params via the <a href="#configuration-reference"><code>uri_reporting</code></a> configuration option.
  * IP Address of the client initiating the request
  * Sanitized SQL query statements
* Process memory and CPU usage
* Error counts

<h3 id="git-integration-security">Git Integration</h3>

Scout only needs read-only access to your repository, but unfortunately, Github doesn't currently allow this - they only offer read-write permissions through their OAuth API.

We have asked Github to offer read-only permissions, and they've said that the feature coming soon. In the mean time, we're limited to the permissions structure Github offers. Our current Git security practices:

* we don't clone your repository's code; we only pull the commit history
* the commit history is secured on our servers according to industry best practices
* authentication subsystems within our application ensure your commit history is never exposed to anyone outside your account.

All that said, we suggest the following:

* [Contact Github](https://github.com/contact) about allowing read-only access. This will ensure it stays top-of-mind.
* This is optional and you are able to view backtrace information w/o the integration. It's likely possible to even write a UserScript to open the code locally in your editor or on Github.

#### Workaround for read-only Github Access

With a few extra steps, you can grant Scout read-only access. Here's how:

* Create a team in your Github organization with read-only access to the respective application repositories.
* Create a new Github user and make them a member of that team.
* Authenticate with this user.

## ScoutProf FAQ

### Does ScoutProf work with Stackprof?

[ScoutProf](#scoutprof) and StackProf are not guaranteed to operate at the same time.  If you wish to use Stackprof, temporarily disable profiling in your config file (`profile: false`) or via environment variables (`SCOUT_PROFILE=false`). See the agent's [configuration options](#ruby-configuration-options).

### How is ScoutProf different than Stackprof?

Stackprof was the inspiration for ScoutProf.  Although little original Stackprof code remains, we started with Stackprof's core approach, and integrated it with our APM agent gem, changed it heavily to work with threaded applications, and implemented an easy to understand UI on our trace view.

### What do sample counts mean ?

ScoutProf attempts to sample your application every millisecond, capturing a snapshot backtrace of what is running in each thread.  For each successful backtrace captured, that is a sample.  Later, when we process the raw backtraces, identical traces get combined and the sample count is how many of each unique backtrace were seen.

### Why do sample counts vary?

Samples will be paused automatically for a few different reasons:

* If Ruby is in the middle of a GC run, samples won't be taken.
* If the previous sampling hasn't been run, a new sampling request won't be added.

The specifics of exactly how often these scenarios happen depend on how and in what order your ruby code runs. Different sample counts can be expected, even for the same endpoint.

### What are the ScoutProf requirements?

* A Linux-based operating system
* Ruby 2.1+

### What's supported during BETA?

During our BETA period, ScoutProf has a few limitations:

* ScoutProf only runs on Linux. Support for additional distros will be added.
* ScoutProf only breaks down time spent in ActionController, not ActionView and not Sidekiq. Support for other areas will be added.

The ScoutProf-enabled version of `scout_apm` can be safely installed on all environments our agent supports: the limitations above only prevent ScoutProf from running.

### Can ScoutProf be enabled for ActionController::API and ActionController::Metal actions?

Yes. Add the following to your controller:

```ruby
def enable_scoutprof?; true; end
```

## Billing

### Free Trial

We offer a no risk, fully featured, free trial. Enter a credit or debit card anytime to continue using Scout APM after the end of your trial.

### Billing Date

Your first bill is 30 days after your signup date.

### Subscription Style
#### Per-Request

We currently offer three transaction-based [pricing plans](https://scoutapm.com/info/pricing). Custom plans are available for higher transaction volume. Contact [support@scoutapm.com](mailto:support@scoutapm.com) for pricing options.

## Replacing New Relic

Scout is an attractive <a href="https://scoutapm.com/newrelic-alternative" target="_blank">alternative to New Relic</a> for modern dev teams. We provide a laser-focus on getting to slow custom application code fast vs. wide breadth as debugging slow custom application code is typically the most time-intensive performance optimization work.

In many cases, Scout is able to replace New Relic as-is. However, there are cases where your app has specific needs we currently don't provide. Don't fret - here's some of the more common scenarios and our suggestions for building a monitoring stack you'll love:

* __Exception Monitoring__ - Scout doesn't provide exception monitoring, but we do integrate with ([Rollbar](#rollbar) and [Sentry](#sentry)) to provide a side-by-side view of your performance metrics and errors within the Scout UI.

* __Browser Monitoring (Real User Monitoring)__ - there are a number of dedicated tools for both Real User Monitoring (RUM) and synthetic monitoring. We've [reviewed Raygun Pulse](https://scoutapm.com/blog/real-user-monitoring-with-raygun), an attractive RUM product. You can also continue to use New Relic for browser monitoring and use Scout for application monitoring.

## Our Monitoring Stack

Curious about what a company that lives-and-breathes monitoring (us!) uses to monitor our apps? [We shared our complete monitoring stack on our blog](https://scoutapm.com/blog/rails-monitoring-stack-2016).

### Talk to us about your monitoring stack

Don't hesitate to [email us](mailto:support@scoutapm.com) if you need to talk through your monitoring stack. Monitoring is something we know and love.
