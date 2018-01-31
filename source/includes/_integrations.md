# Integrations

## GitHub

Scout annotates several areas of the UI with additional data from the app's associated Git repository when the GitHub integration is enabled.

### Traces

When the GitHub integration is enabled, Scout displays the actual code from backtraces collected from [transaction traces](#transaction-traces). The code is annotated with the `git blame` data (the author and commit date), making it easier to track down developers most familar with bottlenecks.

![stream show git](stream_slow_git_annotated.png)

### Deploys

When the GitHub integration is enabled, Scout annotates [deploys](#deploy-tracing) with the associated Git branch or tag along. When hovering over a deploy, a `diff` summary is displayed. This displays the changes between the selected deploy and the previous deploy.

![deploy tracking](deploy_tracking.png)

### Configuration

The GitHub integration is an __app-specific__ integration, authenticated via OAuth. After authenticating, choose the Git repository name and branch name used for your application.

![git settings](git_settings_annotated.png)

## Rollbar

When the Rollbar integration is enabled, Scout displays errors from the app's associated Rollbar project alongside performance data within the Scout UI.

![rollbar errors](rollbar_errors_screenshot.png)

When the error count is in <span style="color:#fff;background:#f0592a;padding: 2px">orange</span>, a new error has appeared in the current timeframe. When the error count is in <span style="background:#ccc;padding:2px">gray</span>, older errors are continuing in this timeframe.

### Configuration

The Rollbar configuration is an __app-specific__ integration, configured by providing a read-only Rollbar __Project Access Token__ (not an Account Access Token) in the app settings within Scout.

![rollbar access token](rollbar_access_token.png) 

![rollbar settings](rollbar_settings.png)