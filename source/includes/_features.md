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

Method calls are aggregrated together and listed from most expensive to least expensive. The time displayed is the total time across all calls (not the time per-call).

![stream show breakdown](stream_show_call_breakdown.png)

### SQL Queries

Scout captures a santized version of SQL queries. Click the "SQL" button next to a call to view details. 

![stream show sql](stream_show_sql_annotated.png)

#### Don't see the query next to an SQL call?

For performance reasons, Scout doesn't attempt to sanitize large SQL queries. When this occurs, you won't see an "SQL" button to view the raw query next to an SQL method call.

### Code Backtraces

You'll see "CODE" buttons next to method calls that are >= 500 ms. If you've enabled the Github integration, you can see the line-of-code, associated SQL or HTTP endpoint (if applicable), author, commit date, and deploy time for the relevant slow code.

![stream show git](stream_slow_git_annotated.png)

If you don't enable the Github integration, you'll see a backtrace.

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


## Memory Bloat Detection

If a user triggers a request to your Rails application that results in a large number of object allocations (example: loading a large number of ActiveRecord objects), your app may require additional memory. The additional memory required to load the objects in memory is released back very slowly. Therefore, a single memory-hungry request will have a long-term impact on your Rails app’s memory usage.

There are 3 specific features of Scout to aid in fixing memory bloat.

### Memory Bloat Insights

The Insights area of the dashboard identifies controller-actions and background jobs that have triggered significant memory increases. An overview of the object allocation breakdown by tier (ActiveRecord, ActionView, etc) is displayed on the dashboard.

![memory insights](memory_insights.png)

### Memory Traces

When inspecting a [transaction trace](#transaction-traces), you'll see a "Memory Allocation Breakdown" section:

![memory trace](memory_trace.png)

For perspective, we display how this trace's allocations compare to the norm.

## Alerting

__Alerting is a BETA feature.__

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

If your code is hosted at Github, you can see the [relevant slow line-of-code within the Scout user interface](#code-backtraces) when viewing a transaction trace. Additionally, you'll also see the:

* author
* commit time
* deploy time

Git integration must be configured on the settings page for each app. Scout integrates with Github via OAuth. Pick the repository name and branch name used for your application.

![git settings](git_settings_annotated.png)

## Context

Context lets you see the forest from the trees. For example, you can add custom context to answer critical questions like:

* How many users are impacted by slow requests?
* How many trial customers are impacted by slow requests?
* How much of an impact are slow requests having on our highest paying customers?

Adding custom context is easy - learn how via [Ruby](#custom-context) or [Elixir](#custom-context27).

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

View our [Ruby](#enabling-devtrace) and [Elixir](#enabling-devtrace30) instructions.

## Data Retention

Scout stores 30 days of metrics and seven days of transaction traces.

