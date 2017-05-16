# Elixir Agent

<aside class="warning">
Elixir support is in BETA.
</aside>

<h2 id="elixir-requirements">Requirements</h2>

Our Elixir agent supports Phoenix 1.2.0+ and Elixir 1.4+.

<!-- old unique-ified anchor link -->
<a name="#installation22"></a>
<h2 id="elixir-install">Installation</h2>

<aside class="notice">
  A free Scout account is required. <a href="https://apm.scoutapp.com/users/sign_up" target: '_blank'>Signup here</a>.
</aside>

Tailored instructions are provided within our user interface. General instructions:

<div class="install">

 <p class="instruct">
      <span class="step">A</span>Add the <code>scout_apm</code> dependency.
    </p>
    <p class="smaller">Your <code>mix.exs</code> file:
    </p>
    <pre class="terminal"># mix.exs

 def application do
   [mod: {YourApp, []},
    applications: [..., <span>:scout_apm</span>]]
 end

 def deps do
   [{:phoenix, "~> 1.2.0"},
    ...
    <span>{:scout_apm, "~> 0.0"}</span>]
 end</pre>
    <p class="smaller">
      Shell:
    </p>
    <div class="terminal">
      mix deps.get
    </div>
    <p class="instruct">
      <span class="step">B</span><span class="glyphicon glyphicon-download"></span> Download your customized config file, placing it at <code>config/scout_apm.exs</code>.
    </p>
    <p class="smaller">Your customized config file is available within your Scout account. Inside the file, replace <code>"YourApp"</code> with the app name you'd like to appear within Scout.
    </p>
    <p class="instruct">
      <span class="step">C</span>Integrate into your Phoenix app.
    </p>
    <p class="smaller"><code>config/config.exs</code>:
    </p>
    <pre class="terminal">
# config/config.exs
import_config "scout_apm.exs"

config :your_app, YourApp.Repo,
  loggers: [{Ecto.LogEntry, :log, []}, 
            <span>{ScoutApm.Instruments.EctoLogger, :log, []}</span>]</pre>
    <p class="smaller"><code>web/web.ex</code>:
    </p>
    <pre class="terminal"># web/web.ex
defmodule HeroReview.Web do
  def controller do
    quote do
      use Phoenix.Controller
      <span>use ScoutApm.Instrumentation</span>
      ...</pre>
  
    <p class="instruct">
      <span class="step">D</span>Restart your app.
      <div class="terminal">
        mix phoenix.server
      </div>
    </p>

</div>

<h2 id="elixir-troubleshooting">Troubleshooting</h2>

Not seeing data? <a href="mailto:support@scoutapp.com">Send us an email</a> with the following:

* A recent sample of your log file (the more, the better).
* Your application's `mix.lock` file.

We typically respond within a couple of hours during the business day.

<h2 id="elixir-configuration">Configuration</h2>

The Elixir agent can be configured via the `config/scout_apm.exs` file. A config file with your organization key is available for download as part of the install instructions. A application name and key is required:

```
config :scout_apm,
  name: "Your App", # The app name that will appear within the Scout UI
  key: "YOUR SCOUT KEY"
```

### Configuration Reference

The following configuration settings are available:

<table class="lookup">
  <thead>
    <tr>
      <th>
        Setting&nbsp;Name
      </th>
      <th>
        Description
      </th>
      <th>
        Default
      </th>
      <th>
        Required
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>
        name
      </th>
      <td>
        Name of the application (ex: 'Photos App').
      </td>
      <td>       
      </td>
      <td>
        Yes
      </td>
    </tr>
    <tr>
      <th>
        monitor
      </th>
      <td>
        Whether monitoring data should be reported.
      </td>
      <td>
        <code>true</code>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        key
      </th>
      <td>
        The organization API key.
      </td>
      <td></td>
      <td>
        Yes
      </td>
    </tr>
    <tr>
      <th>
        dev_trace
      </th>
      <td>
        Indicates if DevTrace, the Scout development profiler, should be enabled.
      </td>
      <td>
        <code>false</code>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        host
      </th>
      <td>
        The protocol + domain where the agent should report. 
      </td>
      <td>
        <code>https://apm.scoutapp.com</code>
      </td>
      <td>
        No
      </td>
    </tr>
  </tbody>
</table>

<h2 id="elixir-upgrade">Updating to the Newest Version</h2>

<div class="install">

 <p class="instruct">
  <span class="step">A</span>Ensure your <code>mix.exs</code> dependency entry for <code>scout_apm</code> is: <code>{:scout_apm, "~> 0.0"}`</code>
 </p>

 <p class="instruct">
  <span class="step">B</span><span class="terminal">mix deps.get scout_apm</span>
 </p>

  <p class="instruct">
    <span class="step">C</span>Recompile and deploy.
 </p>


</div>

<h2 id="elixir-instrumented-libaries">Instrumented Libraries</h2>

By default, the following libraries are instrumented:

* Phoenix
  * controllers
  * views
  * templates
* Ecto 2.0

<h2 id="elixir-custom-instrumentation">Custom Instrumentation</h2>

Traces that allocate significant amount of time to `Controller` or `Job` are good candidates to add custom instrumentation. This indicates a significant amount of time is falling outside our default instrumentation.

### Limits

We limit the number of metrics that can be instrumented. Tracking too many unique metrics can impact the performance of our UI. Do not dynamically generate metric types in your instrumentation (ie `instrument("user_#{user.id}", "generate", fn -> do_work() end)` as this can quickly exceed our rate limits.

### Instrumenting blocks of code

Use `ScoutApm.Tracing.instrument` to track the execution time of a block of code. Here's an example:

```elixir
defmodule User do
  require HTTPoison
  import ScoutApm.Tracing

  def github_avatar(user \\ %{id: "itsderek23"}) do
    instrument("HTTP", "GitHub_Avatar", fn ->
      HTTPoison.get("https://github.com/#{user.id}.png")
    end)
  end

end
```

In the example above, "HTTP" will appear on timeseries charts and "HTTP/GitHub_Avatar" will appear in traces.

#### Adding a description

Call `ScoutApm.Tracing.update_desc/1` to add relevant information to the instrumented item. This description is then viewable in traces. An example:

```elixir
instrument("HTTP", "GitHub_Avatar", fn ->
  url = "https://github.com/#{user.id}.png"
  update_desc("GET #{url}")
  HTTPoison.get(url)
end)
```

<a href="https://hexdocs.pm/scout_apm/ScoutApm.Tracing.html#instrument/3" target="_blank">See the scout_apm hex docs</a> for more details on `instrument`.

### Tracking already executed time

Libraries like Ecto log details on executed queries. This includes timing information. To add a trace item for this, use `ScoutApm.Tracing.track`. An example:

```elixir
defmodule YourApp.Mongo.Repo do
  use Ecto.Repo

  # Scout instrumentation of Mongo queries. These appear in traces as "Ecto/Read", "Ecto/Write", etc.
  def log(entry) do
    ScoutApm.Tracing.track(
      "Ecto",
      query_name(entry),
      entry.query_time,
      :microseconds
    )
    super entry
  end

end

```

In the example above, the metric will appear in traces as `Ecto/#{query_time(entry)}`. On timeseries charts, the time will be allocated to `Ecto`.

#### Adding a description

Metadata - like a raw query - can be passed to `track`. Pass it via the `desc` option. Example:

```elixir
ScoutApm.Tracing.track(
  "Ecto", 
  query_name(entry), 
  entry.query_time, 
  :microseconds, 
  desc: entry.raw_query)
```

<a href="https://hexdocs.pm/scout_apm/ScoutApm.Tracing.html#track/5" target="_blank">See the scout_apm hex docs</a> for more information on `track`.

### Testing instrumentation

Improper instrumentation can break your application. It's important to test before deploying to production. The easiest way to validate your instrumentation is by running [DevTrace](#elixir-devtrace) and ensuring the new metric appears as desired.

After restarting your app with DevTrace enabled, refresh the browser page and view the trace output. The new metric should appear in the trace.

<h2 id="elixir-custom-context">Custom Context</h2>

[Context](#context) lets you see the forest from the trees. For example, you can add custom context to answer critical questions like:

* How many users are impacted by slow requests?
* How many trial customers are impacted by slow requests?
* How much of an impact are slow requests having on our highest paying customers?

It's simple to add [custom context](#context) to your app. There are two types of context:

### User Context

For context used to identify users (ex: email, name):

```elixir
ScoutApm.add_user(key, value)
```

Examples:

```elixir
ScoutApm.Context.add_user(:email, user.email)
ScoutApm.Context.add_user(:name, user.name)
```

### General Context

```elixir
ScoutApm.Context.add(key, value)
```

Examples:

```elixir
ScoutApm.Context.add(:account, account.name)
ScoutApm.Context.add(:monthly_spend, account.monthly_spend)
```

### Default Context

Scout reports the Request URI and the user's remote IP Address by default.

### Context Value Types

Context values can be any of the following types:

* Printable strings (`String/printable?/1` returns `true`)
* Boolean
* Number

### Context Key Restrictions

Context keys can be an `Atom` or `String` with only printable characters. Custom context keys may contain alphanumeric characters, dashes, and underscores. Spaces are not allowed.

Attempts to add invalid context will be ignored.

<h2 id="elixir-environments">Environments</h2>

It typically makes sense to treat each environment (production, staging, etc) as a separate application within Scout. To do so, configure a unique app name for each environment. Scout aggregrates data by the app name. 

An example:

```elixir
# config/staging.exs

config :scout_apm,
  name: "YOUR APP - Staging"
```

<!-- old reference -->
<a name="enabling-devtrace30"></a>
<h2 id="elixir-devtrace">Enabling DevTrace</h2>

<aside class="notice" style="font-size: 12px">
Follow the <a href="#elixir-install">install instructions</a> first. There's no need to download the config file as signup isn't required.
</aside>

To enable [DevTrace](#devtrace), our in-browser profiler:

<table class="help install">
  <tbody>
    <tr>
      <td><span class="step">1</span></td>
      <td>
        <p style="line-height: 170%">
          Add <code>dev_trace: true</code> to the <code>scout_apm</code> section of your <code>config/dev.exs</code>  file:
        </p>
<pre>
# config/dev.exs
config :scout_apm,
  dev_trace: true
</pre>
      </td>
    </tr>
    <tr>
      <td>
        <span class="step">2</span>
      </td>
      <td style="vertical-align: middle">
        <p style="line-height: initial">Restart your app.</p>
      </td>
    </tr>
    <tr>
      <td>
        <span class="step">3</span>
      </td>
      <td style="vertical-align: middle">
        <p style="line-height: initial">Refresh your browser window and look for the speed badge.</p>
      </td>
    </tr>
  </tbody>
</table>
