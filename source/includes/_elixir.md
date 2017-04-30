# Elixir Agent

<aside class="warning">
Elixir support is in BETA.
</aside>

## Requirements

Our Elixir agent supports Phoenix 1.2.0+ and Elixir 1.4+.

## Installation

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

## Troubleshooting

Not seeing data? <a href="mailto:support@scoutapp.com">Send us an email</a> with the following:

* A recent sample of your log file (the more, the better).
* Your application's `mix.lock` file.

We typically respond within a couple of hours during the business day.

## Configuration

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

## Updating to the Newest Version

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

## Instrumented Libraries

By default, the following libraries are instrumented:

* Phoenix
  * controllers
  * views
  * templates
* Ecto 2.0

## Custom Instrumentation

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

Call `ScoutApm.Tracing.add_desc/1` to add relevant information to the instrumented item. This description is then viewable in traces. An example:

```elixir
instrument("HTTP", "GitHub_Avatar", fn ->
  url = "https://github.com/#{user.id}.png"
  add_desc("GET #{url}")
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
