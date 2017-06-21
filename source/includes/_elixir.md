# Elixir Agent

<aside class="warning">
Elixir support is in BETA.
</aside>

<h2 id="elixir-requirements">Requirements</h2>

Our Elixir agent supports Phoenix 1.2.0+ and Elixir 1.4+.

<!-- old unique-ified anchor link -->
<a name="installation22"></a>
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
    <tr>
      <th>
        log_level
      </th>
      <td>
        The logging level of the agent. Possible values: <code>:debug</code>, <code>:info</code>, <code>:warn</code>, and <code>:error</code>.
      </td>
      <td>
        <code>:info</code>
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

<h2 id="elixir-instrumented-libaries">Auto-Instrumented Libraries</h2>

Our [install instructions](#elixir-install) walk through instrumenting the following libraries:

* Phoenix
  * controllers
  * views
  * templates
* Ecto 2.0

See [instrumenting common librariess](/#instrumenting-common-libraries) for guides on instrumenting other Elixir libraries.

## Instrumenting Common Libraries

We've collected best practices for instrumenting common transactions and timing functions below. If you have a suggestion, [please share it](mailto:support@scoutapp.com). See our [custom instrumentation quickstart](#elixir-custom-instrumentation) for more details on adding instrumentation.

* Transactions
  * [Phoenix Channels](#phoenix-channels)
  * [GenServer calls](#genserver-calls)
  * [Task.start](#task-start)
  * [Task.Supervisor.start_child](#task-supervisor-start_child)
  * [Exq](#exq)
  * [Absinthe (GraphQL)](#absinthe)
* Timing
  * [HTTPoison](#httpoison)
  * [MongoDB Ecto](#mongodb-ecto)

### Phoenix Channels

#### Web or background transactions?

* __web__: For channel-related functions that impact the user-facing experience. Time spent in these transactions will appear on your app overboard dashboard and appear in the "Web" area of the UI.
* __background__: For functions that don't have an impact on the user-facing experience (example: click-tracking). These will be available in the "Background Jobs" area of the UI.

#### Naming channel transactions

Provide an identifiable name based on the message the `handle_out/` or `handle_in/` function receives.

An example:

```elixir
defmodule FirestormWeb.Web.PostsChannel do
  use FirestormWeb.Web, :channel

  # Will appear under "Web" in the UI, named "PostsChannel.update"
  @transaction(type: "web", name: "PostsChannel.update")
  def handle_out("update", msg, socket) do
    push socket, "update", FetchView.render("index.json", msg)
  end
```

### GenServer calls

It's common to use `GenServer` to handle background work outside the web request flow. Suggestions:

* Treat these as `background` transactions
* Provide a `name` based on the message each `handle_call/` function handles.

An example:

```elixir
defmodule Flight.Checker do
  use GenServer
  use ScoutApm.Tracing

  # Will appear under "Background Jobs" in the UI, named "Flight.handle_check".
  @transaction(type: "background", name: "check")
  def handle_call({:check, flight}, _from, state) do
    # Do work...
  end
```

### Task.start

These execute asynchronously, so treat as a `background` transaction.

```elixir
Task.start(fn ->
  # Will appear under "Background Jobs" in the UI, named "Crawler.crawl".
  ScoutApm.Tracing.transaction(:background,"Crawler.crawl") do
    Crawler.crawl(url)
  end
end)
```

### Task.Supervisor.start_child

Like `Task.start`, these execute asynchronously, so treat as a `background` transaction.

```elixir
Task.Supervisor.start_child(YourApp.TaskSupervisor, fn ->
  # Will appear under "Background Jobs" in the UI, named "Crawler.crawl". 
  ScoutApm.Tracing.transaction(:background,"Crawler.crawl") do
    Crawler.crawl(url)
  end
end)
```

### Exq

To instrument [Exq](https://github.com/akira/exq) background jobs, add a `@transaction` module attribute to each worker's `perform/` function:

```elixir
defmodule MyWorker do
  # Will appear under "Background Jobs" in the UI, named "MyWorker.perform".
  @transaction(type: "background")
  def perform(arg1, arg2) do
    # do work
  end
end
```

### Absinthe

Requests to the Absinthe plug can be grouped by the GraphQL `operationName` under the "Web" UI by adding <a href="https://gist.github.com/itsderek23/d9435b21c9a44cd9629e93c4e8c2750e" target="_blank">this plug</a> to your pipeline.  

### HTTPoison

Download this <a href="https://gist.github.com/itsderek23/50296b49df16b266e47cc04d227d4b4a" target="_blank">ScoutApm.HTTPoison module</a> into your app's `/lib` folder, then `alias ScoutApm.HTTPoison` when calling `HTTPoison` functions:

```elixir
defmodule Demo.Web.PageController do
  use Demo.Web, :controller
  # Will route function calls to `HTTPoision` through `ScoutApm.HTTPoison`, which times the execution of the HTTP call.
  alias ScoutApm.HTTPoison

  def index(conn, _params) do
    # "HTTP" will appear on timeseries charts. "HTTP/get" and the url "https://cnn.com" will appear in traces.
    HTTPoison.get("https://cnn.com")
    render conn, "index.html"
  end
end
```

### MongoDB Ecto

Download <a href="https://gist.github.com/itsderek23/051327a152bc4d95451fd76808b8e83f" target="_blank">this example MongoDB Repo module</a> to use inplace of your existing MongoDB Repo module.

<h2 id="elixir-custom-instrumentation">Custom Instrumentation</h2>

You can extend Scout to record additional types of transactions (background jobs, for example) and time the execution of code that fall outside our custom instrumentation.

For full details on instrumentation functions, see our <a href="https://hexdocs.pm/scout_apm/ScoutApm.Tracing.html" target="_blank">ScoutApm.Tracing Hex docs</a>.

### Transactions & Timing

Scout’s instrumentation is divided into 2 areas:

1. __Transactions__: these wrap around a flow of work, like a web request or a GenServer call. The UI groups data under transactions. Use `@transaction` module attributes and the `transaction/4` macro.
2. __Timing__: these measure individual pieces of work, like an HTTP request to an outside service or an Ecto query. Use `@timing` module attributes and the `timing/4` macro.

### Instrumenting transactions

Via `@transaction` module attributes:

```elixir
defmodule YourApp.Web.RoomChannel do
  use Phoenix.Channel
  use ScoutApm.Tracing

  # Will appear under "Web" in the UI, named "YourApp.Web.RoomChannel.join".
  @transaction(type: "web")
  def join("topic:html", _message, socket) do
    {:ok, socket}
  end

  # Will appear under "Background Jobs" in the UI, named "RoomChannel.ping".
  @transaction(type: "background", name: "RoomChannel.ping")
  def handle_in("ping", %{"body" => body}, socket) do
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end
```

Via `transaction/4`:

```elixir
import ScoutApm.Tracking

def do_async_work do
  Task.start(fn ->
    # Will appear under "Background Jobs" in the UI, named "Do Work".
    transaction(:background, "Do Work") do
      # Do work...
    end
  end)
end
```

See the <a href="https://hexdocs.pm/scout_apm/ScoutApm.Tracing.html" target="_blank">ScoutApm.Tracing Hexdocs</a> for details on instrumenting transactions.

### Timing functions and blocks of code

Via `@timing` module attributes:

```elixir
defmodule Searcher do
  use ScoutApm.Tracing

  # Time associated with this function will appear under "Hound" in timeseries charts.
  # The function will appear as `Hound/open_search` in transaction traces.
  @timing(category: "Hound")
  def open_search(url) do
    navigate_to(url)
  end

  # Time associated with this function will appear under "Hound" in timeseries charts.
  # The function will appear as `Hound/homepage` in transaction traces.
  @timing(category: "Hound", name: "homepage")
  def open_homepage(url) do
    navigate_to(url)
  end
```

Via `timing/4`:

```elixir
defmodule PhoenixApp.PageController do
  use PhoenixApp.Web, :controller
  import ScoutApm.Tracing

  def index(conn, _params) do
    timing("Timer", "sleep") do
      :timer.sleep(3000)
    end
    render conn, "index.html"
  end
```

See the <a href="https://hexdocs.pm/scout_apm/ScoutApm.Tracing.html" target="_blank">ScoutApm.Tracing Hexdocs</a> for details on timing functions and blocks of code.

#### Limits on category arity

We limit the number of unique categories that can be instrumented. Tracking too many unique category can impact the performance of our UI. Do not dynamically generate categories in your instrumentation (ie `timing("user_#{user.id}", "generate", do: do_work())` as this can quickly exceed our rate limits.

#### Adding a description

Call `ScoutApm.Tracing.update_desc/1` to add relevant information to the instrumented item. This description is then viewable in traces. An example:

```elixir
timing("HTTP", "GitHub_Avatar") do
  url = "https://github.com/#{user.id}.png"
  update_desc("GET #{url}")
  HTTPoison.get(url)
end
```

#### Tracking already executed time

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

<a href="https://hexdocs.pm/scout_apm/ScoutApm.Tracing.html#track/5" target="_blank">See the scout_apm hex docs</a> for more information on `track/`.

<h3 id="elixir-testing-instrumentation">Testing instrumentation</h3>

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

It typically makes sense to treat each environment (production, staging, etc) as a separate application within Scout. To do so, configure a unique app name for each environment. Scout aggregates data by the app name. 

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
