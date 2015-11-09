# Features

Scout is Application Monitoring built for modern development teams. It's built to provide the fastest path to a slow line-of-code. [Signup for a free trial](https://apm.scoutapp.com/users/sign_up).

## App Performance Overview

The overview page provides an at-a-glance, auto-refreshing view of your app's performance and resource usage. You can compare metrics in the overview chart and see how your app's performance compares to different time periods.

![overview](dash_annotated.png)

### Zooming into Slow Requests

See a large spike in response time? Click-and-drag (or pinch-and-expand on an iPad) on the overview chart. You'll see the number of slow requests over the selected period. Click the link to view details on those requests.

![overview drag](dash_drag_annotated.png)

## Slow Stream

The Slow Stream gives direct access to slow web requests (>= 2 seconds).

![stream](stream_annotated.png)

Requests are aggregrated by the endpoint name. Scout captures details on every slow request your app handles - it doesn't sample - to ensure you have the complete picture of what's slow.

Click on an endpoint name to view details on slow requests for the respective endpoint.

## Slow Request Details

Dig into bottlenecks - down to the line-of-code, author, commit date, and deploy time - with the slow request detail view. 

![stream show](stream_show_annotated.png)

### Aggregrate Trace

When clicking on an endpoint from the Slow Stream, you'll see an __aggregrate trace__ by default. This aggregrates slow request traces from multiple requests together so you can see common bottlenecks across requests.

### Individual Slow Requests

You can view details on individual slow requests vs. an aggregrate trace by selecting the request in the sidebar.

![stream show request](stream_show_request.png)

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

### Rate Limiting of Slow Requests

Scout records details on every slow request but limits the collection of call breakdown metrics to ten slow requests per-server to prevent sending too much data to Scout.

## Git Integration

If your code is hosted at Github, you can see the relevant slow line-of-code within the Scout user interface when viewing slow request details. Additionally, you'll also see the:

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

When viewing slow request details from the Slow Stream, click the "Context" link:

![context](stream_show_context_annotated.png)


You'll see a histogram representation for each piece of context for the endpoint.

## Endpoints Performance

### Endpoints Overview

The endpoints area within Scout provides a sortable view of your app's overall performance aggregated by endpoint name. Click on an endpoint to view details.

![endpoints overview](endpoints_annotated.png)

### Endpoint Details

View aggregated metrics across requests for a specific endpoint by clicking on the endpoint name from overview area. You can also drill into slow requests for this endpoint from this page.

![endpoint details](endpoints_show_annotated.png)

## Time Comparisons

You can easily compare the performance of your application between different time periods via the time selection on the top right corner of the UI.

![time compare](time_compare_annotated.png)

## Data Retention

Scout stores 30 days of metrics and seven days of slow request details.

