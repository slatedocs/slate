# Reference

## How we collect metrics

Scout is engineered to monitor the performance of your mission-critical production applications by providing an easy-install, low-overhead monitoring agent with a hosted SaaS service that values your security. The basic flow:

* Embed our agent in your application. You don't access to the servers your app is deployed on.
* The agent instruments key libraries (database access, controllers, views, etc) using low-overhead instrumentation. 
* Every minute, the agent connects over https (always) through a 256-bit secure, encrypted connection (the same encryption your bank uses) and sends metrics to our servers.
* Over servers store the data.

## Performance Overhead

Our agent is designed to run in production environments. We've benchmarked the response time overhead at roughly 3%. Generally, overhead increases as the number of methods are instrumented.

## Security

We take the security of your code metrics extremely seriously. Keeping your data secure is fundamental to our business. Scout is nearing a decade storing critical metrics with our server monitoring product and those same fundamentals are applied here:

* All data transmitted by our agent to our servers is sent via SSL.
* Our UI is only served under SSL.
* When additional data is collected for slow calls (ex: SQL queries), query parameters are sanitized before sending these to our servers.

### Git Integration

Scout only needs read-only access to your repository, but unfortunately, Github doesn't currently allow this - they only offer read-write permissions through their OAuth API.

We have asked Github to offer read-only permissions, and they've said that the feature coming soon. In the mean time, we're limited to the permissions structure Github offers. Our current Git security practices:

* we don't clone your repository's code; we only pull the commit history
* the commit history is secured on our servers according to industry best practices
* authentication subsystems within our application ensure your commit history is never exposed to anyone outside your account.

All that said, we suggest the following:

* [Contact Github](https://github.com/contact) about allowing read-only access. This will ensure it stays top-of-mind.
* This is optional and you are able to view backtrace information w/o the integration. It's likely possible to even write a UserScript to open the code locally in your editor or on Github.

## Billing

### Free Trial

We offer a no-risk, free 14-day trial. Delete your monitored apps before the trial concludes and you don't pay.

### Billing Date

Your first bill is 30 days after your signup date.

### Subscription Style

You can choose the subscription style that makes sense for your organization. We offer two subscription styles:

#### Per-Server

__This is the default approach__. You are billed for the number of servers that are actively reporting on your billing date. 

#### Per-Request

If you have a smaller application or have many smaller instances or Docker containers per-request billing may make more sense. Volume discounts are automatically applied as your application handles more throughput. 

### Changing your subsciption style

You can pick your subscription styles in the billing area within Scout. Your billing preference can not be retroactively applied.

## Replacing New Relic

Scout is an attractive option for modern dev teams (frequent deploys, using Git, deploying to many micro instances & containers, using vendors for key infrastructure services like Amazon RDS, etc). We provide a laser-focus on getting to slow custom application code fast vs. wide breadth as debugging slow custom application code is typically the most time-intensive performance optimization work. 

In many cases, Scout is able to replace New Relic as-is. However, there are cases where your app has specific needs we currently don't provide. Don't fret - here's some of the more common scenarios and our suggestions for building a monitoring stack you'll love:

* __Exception Monitoring__ - we provide metrics on the rate of exceptions but we don't currently provide details on exceptions. Our favorite tool for this is [Sentry](http://getsentry.com):
  * Affordable: starts @ $29/mo. 
  * Realtime exceptions: you'll see new exceptions coming through as-they-happen (every second). 
  * Great UI
  * Context tracking (easy to see how an exception is impacting which users). We implemented a similar API for our slow request tracking.
* __Alerting__ - while on our roadmap, we don't yet provide alerting within application monitoring. However, [Scout Server Monitoring](https://scoutapp.com/info/server_monitoring) has robust alerting functionality. With the [Scout StatsD Rack Gem](https://github.com/scoutapp/scout_statsd_rack) you can easily get alerted on jumps in error rates and response times.
* __Background Job Monitoring__ - this is on our roadmap as well. [Scout Server Monitoring](https://scoutapp.com/info/server_monitoring) can be used to monitor queue depths, failure rates, etc for all of the common Ruby background job systems. Many background job systems also provide a web ui (for example, the [Sidekiq Web UI](https://github.com/mperham/sidekiq/wiki/Monitoring#web-ui)).
* __Browser Monitoring (Real User Monitoring)__ - there are a number of dedicated tools for both Real User Monitoring (RUM) and synthetic monitoring. You can also continue to use New Relic for browser monitoring and use Scout for application monitoring.

### Our Monitoring Stack

Curious about what a company that lives-and-breathes monitoring (us!) uses to monitor our apps? [We shared our complete monitoring stack on our blog](http://blog.scoutapp.com/articles/2015/12/02/rails-monitoring-stack-2016).

### Talk to us about your monitoring stack

Don't hesitate to [email us](mailto:apm.support@scoutapp.com) if you need to talk through your monitoring stack. Monitoring is something we know and love.
