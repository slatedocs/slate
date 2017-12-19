# Features

Scout is Application Monitoring built for modern development teams. It's built to provide the fastest path to a slow line-of-code. [Signup for a free trial](https://apm.scoutapp.com/users/sign_up).

## App Performance Overview

The overview page provides an at-a-glance, auto-refreshing view of your app's performance and resource usage (mean response time by category, 95th percentile response time, throughput, error rate, and more). You can quickly dive into endpoint activity via click-and-drag (or pinch-and-expand with a mobile device) on the overview chart.

![overview](app_show.gif)

Additionally, you can compare metrics in the overview chart and see how your app's performance compares to different time periods.

## Endpoint Details

You can view metrics for specific controller-action and background job workers. There is a similar chart interaction to the App Performance Overview page, with one difference: your selection will render an updated list of transaction traces that correspond to the selected time period:
![stream](endpoint_show.gif)

You can sort traces by response time, object allocations, date, and more.

## Transaction Traces

Scout collects detailed transactions across your endpoints automatically. The transaction traces provide a number of visual queues to direct you to hotspots. Dig into bottlenecks - down to the line-of-code, author, commit date, and deploy time - from this view. 

![transaction traces](transaction_traces.png)

### Call Breakdown

Method calls are aggregated together and listed from most expensive to least expensive. The time displayed is the total time across all calls (not the time per-call).

![stream show breakdown](stream_show_call_breakdown.png)

### SQL Queries

Scout captures a sanitized version of SQL queries. Click the "SQL" button next to a call to view details. 

![stream show sql](stream_show_sql_annotated.png)

#### Don't an SQL query next to an SQL call?

Scout collects a sanitized version of SQL queries and displays these in transaction traces. To limit agent overhead sanitizing queries, we do not collect query statements with more than 16k characters.

This limit was raised to 16k characters from 4k characters in version 2.4.0 of the Ruby agent after determining the higher threshold was safe for production environments. If you have an older version of `scout_apm`, [update to the latest](#updating-to-the-newest-version).

### Code Backtraces

You'll see "CODE" buttons next to method calls that are >= 500 ms. If you've enabled the GitHub integration, you can see the line-of-code, associated SQL or HTTP endpoint (if applicable), author, commit date, and deploy time for the relevant slow code.

![stream show git](stream_slow_git_annotated.png)

If you don't enable the GitHub integration, you'll see a backtrace.

## ScoutProf

Every millisecond, ScoutProf captures a backtrace of what each thread in your application is currently running.  Over many backtraces, when you combine them, it tells a story of what code paths are taking up the most time in your application.

Compared with our more traditional instrumentation of libraries like `ActiveRecord`, `Net::HTTP` and similar, ScoutProf works with your custom code.  Now, when your application spends time processing your data in custom application code, or in libraries that Scout doesn't yet instrument, instead of only being able to assign that to a large bucket of `ActionController` time, the time can be broken down to exactly what is taking up the most time.

Notice how the time in `ActionController` is broken down:

<a href="/images/scoutprof.png" target="_blank">![scoutprof](scoutprof.png)</a>

We still employ our traditional instrumentation, because it can give us deeper insights into common libraries, capturing the SQL being run, or the URL being fetched.

### Enabling ScoutProf

ScoutProf is a BETA feature. To enable:

<table class="help install">
  <tbody>
    <tr>
      <td>
        <span class="step">1</span>
      </td>
      <td>
        <p>Modify your <code>Gemfile</code> entry for <code>scout_apm</code>, changing it to: <code>gem 'scout_apm', '~> 3.0.x'</code></p>
      </td>
    </tr>
    <tr>
      <td><span class="step">2</span></td>
      <td><p><code>bundle update scout_apm</code></p></td>
    </tr>
      <tr>
      <td><span class="step">3</span></td>
      <td><p>Deploy</p></td>
    </tr>
  </tbody>
</table>

A [detailed ScoutProf FAQ](#scoutprof-faq) is available in our reference area.

## Database Monitoring

A database is shared resource: one expensive query can trigger a flood of slow queries that impact many web endpoints and background jobs. Scout's database monitoring helps in three primary areas:

1. Identifying the cause of database capacity issues.
2. Understanding your query workload and which web endpoints and background jobs are the greatest users of database time.
3. Highlighting changes in query workload and performance metrics vs. the norm.

Database metrics appear in two areas of the UI:

1. [Database Overview](#database-overview)
2. [Web Endpoint & Background Job Breakdown](#endpoint-database-breakdown)

The video below shows the two areas in action. There is a detailed description of each area beneath the video.

<iframe src="https://player.vimeo.com/video/241390934" width="640" height="400" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>



### Database Overview

![database monitoring](db_monitoring.png)

#### Overview chart

The database monitoring overview chart helps answer important questions at-a-glance. For example:

* Is time consumed by queries increasing because throughput is increasing?
* Is one type of query showing a dramatic increase in time consumed?
* How are query response times changing under load?

The overview chart shows the top 4 most time-consuming queries and an aggregate of all other queries vs. overall query throughput.

#### Zooming

The primary interaction point of Scout's database monitoring is the zoom functionality.

If you notice a spike in time spent by database queries, simply click and drag on the overview chart. The queries list will update, showing changes during the zoom window. 

Annotations are added to the queries list when zooming:

* The change in rank, based on % time consumed, of each query. Queries that jump significantly in rank may trigger a dramatic change in database performance.
* The % change across metrics in the zoom window vs. the larger timeframe. If the % change is not significant, the metric is faded.
* A bullseye appears next to the max query time if the slowest occurrence of this query was executed during the zoom window. This may indicate a single slow query triggered a problem.

#### Queries List

A list of queries, broken down by their ActiveRecord model, operation, and caller (either a web endpoint or background job) is listed below the overview chart.

By default, this list is truncated to display just the most time-consuming queries.

#### Database Events

Scout highlights significant events in database performance in the sidebar. For example, if time spent in database queries increases dramatically, you'll find an insight here. Clicking on an insight jumps to the time window referenced by the insight.

### Endpoint Database Breakdown

A breakdown of time spent per-transaction appears beneath the overview chart for both web endpoints and database metrics. Database queries are broken out in this breakdown:

![database breakdown](db_monitoring_endpoint.png)

### Pricing

Database Monitoring is available as an addon. See your billing page for pricing information.

### Database Monitoring Library Support

Scout currently monitors queries executed via ActiveRecord, which includes most relational databases (PostgreSQL, MySQL, etc).

## Memory Bloat Detection

If a user triggers a request to your Rails application that results in a large number of object allocations (example: loading a large number of ActiveRecord objects), your app may require additional memory. The additional memory required to load the objects in memory is released back very slowly. Therefore, a single memory-hungry request will have a long-term impact on your Rails app's memory usage.

There are 3 specific features of Scout to aid in fixing memory bloat.

### Memory Bloat Insights

The Insights area of the dashboard identifies controller-actions and background jobs that have triggered significant memory increases. An overview of the object allocation breakdown by tier (ActiveRecord, ActionView, etc) is displayed on the dashboard.

![memory insights](memory_insights.png)

### Memory Traces

When inspecting a [transaction trace](#transaction-traces), you'll see a "Memory Allocation Breakdown" section:

![memory trace](memory_trace.png)

For perspective, we display how this trace's allocations compare to the norm.

## Alerting

![alerts_chart](alerts_chart.png)

Alerting keeps your team updated if your app's performance degrades. Alerts can be configured on the app as a whole and on individual endpoints. Metrics include:

* mean response time
* 95th percentile response time
* Apdex
* error rate
* throughput

### Alert conditions

Configure alert conditions via the "Alerts" pill in the UI:

![alert_conditions](alert_conditions.png)

### Notification groups

Alerts are sent to a notification group, which is composed of notification channels. You can configure these under your org's settings menu:

![alert notification groups](alert_notification_groups.png)

## Deploy Tracking

![deploy tracking](deploy_tracking.png)

Correlate deploys with your app's performance: Scout's GitHub-enhanced deploy tracking makes it easy to identify the Git branch or tag running now and which team members contributed to every deploy.

Scout tracks your deploys without additional configuration if you are running Capistrano. If you aren't using Capistrano or deploying your app to Heroku, see our [deploy tracking configuration docs](#deploy-tracking-config).

### Sorting

You can sort by memory allocations throughout the UI: from the list of endpoints, to our pulldowns, to transaction traces.

![memory sort](memory_sort.png)

## Git Integration

If your code is hosted at GitHub, you can see the [relevant slow line-of-code within the Scout user interface](#code-backtraces) when viewing a transaction trace. Additionally, you'll also see the:

* author
* commit time
* deploy time

Git integration must be configured on the settings page for each app. Scout integrates with GitHub via OAuth. Pick the repository name and branch name used for your application.

![git settings](git_settings_annotated.png)

## Context

Context lets you see the forest from the trees. For example, you can add custom context to answer critical questions like:

* How many users are impacted by slow requests?
* How many trial customers are impacted by slow requests?
* How much of an impact are slow requests having on our highest paying customers?

Adding custom context is easy - learn how via [Ruby](#ruby-custom-context) or [Elixir](#elixir-custom-context).

When viewing a transaction trace, click the "Context" section to see the context Scout has collected.

## Endpoints Performance

### Endpoints Overview

The endpoints area within Scout provides a sortable view of your app's overall performance aggregated by endpoint name. Click on an endpoint to view details.

![endpoints overview](endpoints_annotated.png)

## Time Comparisons

You can easily compare the performance of your application between different time periods via the time selection on the top right corner of the UI.

![time compare](time_compare_annotated.png)

## DevTrace

DevTrace is our development profiler: it's included with our Ruby and Elixir libraries. DevTrace can be used for free without signup. Enabling DevTrace adds a speed badge when navigating your app in development. Clicking the speed badge reveals a shareable transaction trace of the request.

![devtrace](devtrace.png)

View our [Ruby](#ruby-devtrace) and [Elixir](#elixir-devtrace) instructions.

## Chart Embeds

You can embed an app's overview chart inside another web page (ex: an internal key metrics dashboard):

1. Access the application dashboard within the Scout UI.
2. Adjust the timeframe and metrics to those you'd like to include in the embedded chart.
3. Click the embed icon and copy the relevant code.

![chart_embed](chart_embed.png)

Note that you'll need to update the provided iframe url with a Scout API key. 

When clicking on an embedded chart, you'll be redirected to the relevant application.

## Data Retention

Scout stores 30 days of metrics and seven days of transaction traces.

