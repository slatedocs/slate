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

Adding custom context is easy - [learn how](#adding-custom-context).

When viewing a transaction trace, click the "Context" section to see the context Scout has collected.

## Endpoints Performance

### Endpoints Overview

The endpoints area within Scout provides a sortable view of your app's overall performance aggregated by endpoint name. Click on an endpoint to view details.

![endpoints overview](endpoints_annotated.png)

## Time Comparisons

You can easily compare the performance of your application between different time periods via the time selection on the top right corner of the UI.

![time compare](time_compare_annotated.png)

## DevTrace

DevTrace is our development profiler: it's included with the `scout_apm` gem and can be used for free without signup. Enabling DevTrace adds a speed badge when navigating your Rails app in development. Clicking the speed badge reveals a shareable transaction trace of the request.

DevTrace is a BETA feature.

![devtrace](devtrace.png)

To enable DevTrace:

1. Ensure you are on the latest version of `scout_apm`. See our [upgrade instructions](#updating-to-the-newest-version).
2. Add `dev_trace: true` to the `development` section of your `scout_apm.yml` config file or start your local Rails server with:
`SCOUT_DEV_TRACE=true rails server`.

## Data Retention

Scout stores 30 days of metrics and seven days of transaction traces.

