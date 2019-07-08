# Elixir Agent

<h2 id="elixir-requirements">Requirements</h2>

Our Elixir agent supports Phoenix 1.2.0+, Ecto 2.0+, and Elixir 1.4+.

<!-- old unique-ified anchor link -->
<a name="installation22"></a>
<h2 id="elixir-install">Installation</h2>

Tailored instructions are provided within our user interface. General instructions for a Phoenix 1.3+ app:

<div class="install">
 <p class="instruct">
      <span class="step">A</span>Add the <code>scout_apm</code> dependency.
    </p>
    <p class="smaller">Your <code>mix.exs</code> file:
    </p>
    <pre class="terminal"># mix.exs

 def deps do
   [{:phoenix, "~> 1.2.0"},
    ...
    <span>{:scout_apm, "~> 0.0"}</span>]
 end</pre>
    <p class="smaller">If your Mixfile manually specifies <code>applications</code>, <code>:scout_apm</code> must be added:</p>
    <pre class="terminal"># mix.exs
 def application do
   [mod: {YourApp, []},
    applications: [..., <span>:scout_apm</span>]]
 end
 </pre>
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

    <p class="smaller">Instrument Controllers. In <code>lib/your_app_web.ex</code>:
    </p>
    <pre class="terminal"># lib/your_app_web.ex
defmodule YourApp.Web do
  def controller do
    quote do
      use Phoenix.Controller
      <span>use ScoutApm.Instrumentation</span>
      ...</pre>

    <p class="smaller">Instrument Templates. In <code>config/config.exs</code>:
    </p>
<pre class="terminal">
# config/config.exs
<span>config :phoenix, :template_engines,
  eex: ScoutApm.Instruments.EExEngine,
  exs: ScoutApm.Instruments.ExsEngine</span>
</pre>

<p class="instruct">
  <span class="step">D</span>Integrate Ecto
</p>

    <p class="smaller">Using <strong>Ecto 2.x?</strong>. In <code>config/config.exs</code>:</p>
    <pre class="terminal">
# config/config.exs
<span>import_config "scout_apm.exs"</span>

<span>config :your_app, YourApp.Repo,
  loggers: [{Ecto.LogEntry, :log, []},
            {ScoutApm.Instruments.EctoLogger, :log, []}]</span></pre>


    <p class="smaller">Using <strong>Ecto 3.x?</strong>. In <code>lib/my_app/application.ex</code>:</p>
<pre class="terminal">
# lib/my_app/application.ex
defmodule MyApp.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [
        # ...
    ]
<span>
    :ok = ScoutApm.Instruments.EctoTelemetry.attach(MyApp.Repo)
</span>
    # ...
    Supervisor.start_link(children, opts)
  end
end
</pre>


    <p class="instruct">
      <span class="step">E</span>Restart your app.
      <div class="terminal">
        mix phoenix.server
      </div>
    </p>

</div>

<h2 id="elixir-troubleshooting">Troubleshooting</h2>

Not seeing data?

<table class="help">
  <tbody>
    <tr>
      <td>
        <span class="step">1</span>
      </td><td>
        <p>Examine your log file for any lines that match <code>Scout</code>.</p>

        <p>Look for:</p>

<pre class="terminal">
[info] Setup ScoutApm.Watcher on ScoutApm.Store
[info] Setup ScoutApm.Watcher on ScoutApm.Config
[info] Setup ScoutApm.Watcher on ScoutApm.PersistentHistogram
[info] Setup ScoutApm.Watcher on ScoutApm.Logger
[info] Setup ScoutApm.Watcher on ScoutApm.Supervisor</pre>

        <p>
          If none of the above appears, ensure <code>scout_apm</code> was added as a dependency. See the first step in the <a href="#elixir-install">Elixir install instructions</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <span class="step">2</span>
      </td>
      <td>
        <p>Is <code>use ScoutApm.Instrumentation</code> specified in <em>every</em> controller module you wish to instrument?</p>

        <p>
          This step is frequently missed if you are using multiple controller modules. See the third step in the <a href="#elixir-install">Elixir install instructions</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <span class="step">3</span>
      </td>
      <td>
        <p>Still stuck? Email us.</p>

        The following process helps us resolve issues faster:
         <ul>
            <li>Increase the log level of <code>scout_apm</code> by setting <code>log_level: "debug"</code> in your <code>config/scout_apm.exs</code> file and restart your app.</li>
            <li>
              Wait five minutes, then email <a href="mailto:support@scoutapm.com">support@scoutapm.com</a> 
              your log output and the application's <code>mix.lock</code> file.</li>
          </ul>

        <p>We typically respond within a couple of hours during the business day.</p>
      </td>
    </tr>
  </tbody>
</table>

<h2 id="elixir-configuration">Configuration</h2>

The Elixir agent can be configured via the `config/scout_apm.exs` file. A config file with your organization key is available for download as part of the install instructions. A application name and key is required:

```
config :scout_apm,
  name: "Your App", # The app name that will appear within the Scout UI
  key: "YOUR SCOUT KEY"
```

Alternately, you can also use environment variables of your choosing by formatting your configuration as a tuple
with :system as the first value and the environment variable expected as the second.

```
config :scout_apm,
  name: { :system, "SCOUT_APP_NAME" },
  key: { :system, "SCOUT_APP_KEY" }
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
        <code>https://scoutapm.com</code>
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
    <tr>
      <th>
        revision_sha
      </th>
      <td>
        The Git SHA associated with this release.
      </td>
      <td>
        <a href="#elixir-deploy-tracking-config">See docs</a>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        ignore
      </th>
      <td>
        An array of URL prefixes to ignore in the Scout Plug instrumentation.
      </td>
      <td>
        <code>[]</code>
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

<h2 id="elixir-deploy-tracking-config">Deploy Tracking Config</h2>

Scout can [track deploys](#deploy-tracking), making it easier to correlate changes in your app to performance. To enable deploy tracking, first ensure you are on the latest version of `scout_apm`. See our [upgrade instructions](#elixir-upgrade).

Scout identifies deploys via the following:

1. A `revision_sha` config setting.
2. A `SCOUT_REVISION_SHA` environment variable equal to the SHA of your latest release.
3. If you are using Heroku, enable [Dyno Metadata](https://devcenter.heroku.com/articles/dyno-metadata). This adds a `HEROKU_SLUG_COMMIT` environment variable to your dynos, which Scout then associates with deploys.


<h2 id="elixir-instrumented-libaries">Auto-Instrumented Libraries</h2>

Our [install instructions](#elixir-install) walk through instrumenting the following libraries:

* Phoenix
  * controllers
  * views
  * templates
* Ecto 2.0/3.0
* Slime Templates

See [instrumenting common libraries](/#instrumenting-common-libraries) for guides on instrumenting other Elixir libraries.

## Instrumenting Common Libraries

We've collected best practices for instrumenting common transactions and timing functions below. If you have a suggestion, [please share it](mailto:support@scoutapm.com). See our [custom instrumentation quickstart](#elixir-custom-instrumentation) for more details on adding instrumentation.

* Transactions
  * [Phoenix Channels](#phoenix-channels)
  * [Plug Chunked Response](#plug-chunked-response-http-streaming)
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
  use ScoutApm.Tracing

  # Will appear under "Web" in the UI, named "PostsChannel.update"
  @transaction(type: "web", name: "PostsChannel.update")
  def handle_out("update", msg, socket) do
    push socket, "update", FetchView.render("index.json", msg)
  end
```

### Plug Chunked Response (HTTP Streaming)

In a Plug application, a chunked response needs to be instrumented directly, rather than relying on
the default Scout instrumentation Plug. The key part is to `start_layer` beforehand, and then call
`before_send` after the chunked response is complete.

```
def chunked(conn, _params) do
  # The "Controller" argument is required, and should not be changed. The second argument is the
  # name this endpoint will appear as in the Scout UI. The `action_name` function determines this
  # automatically.
  ScoutApm.TrackedRequest.start_layer("Controller", ScoutApm.Plugs.ControllerTimer.action_name(conn))

  conn =
    conn
    |> put_resp_content_type("text/plain")
    |> send_chunked(200)

  {:ok, conn} =
    Repo.transaction(fn ->
      Example.build_chunked_query(...)
      |> Enum.reduce_while(conn, fn data, conn ->
        case chunk(conn, data) do
          {:ok, conn} ->
            {:cont, conn}

          {:error, :closed} ->
            {:halt, conn}
        end
      end)
    end)

  ScoutApm.Plugs.ControllerTimer.before_send(conn)

  conn
end
```

Then have the default instrumentation ignore the endpoint's URL prefix (since it is manually instrumented now).
See the [ignore configuration](#ignore-1) for more details.

```
config :scout_apm,
  name: "My Scout App Name",
  key: "My Scout Key",
  ignore: ["/chunked"]
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

To instrument [Exq](https://github.com/akira/exq) background jobs, `use ScoutApm.Tracing`, and add a `@transaction` module attribute to each worker's `perform` function:

```elixir
defmodule MyWorker do
  use ScoutApm.Tracing

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

Download this <a href="https://gist.github.com/itsderek23/048eaf813af4a1a31a219d75221eb7b7" target="_blank">Demo.HTTPClient module</a> (you can rename to something more fitting) into your app's `/lib` folder, then `alias Demo.HTTPClient` when calling `HTTPoison` functions:

```elixir
defmodule Demo.Web.PageController do
  use Demo.Web, :controller
  # Will route function calls to `HTTPoision` through `Demo.HTTPClient`, which times the execution of the HTTP call.
  alias Demo.HTTPClient

  def index(conn, _params) do
    # "HTTP" will appear on timeseries charts. "HTTP/get" and the url "https://cnn.com" will appear in traces.
    case HTTPClient.get("https://cnn.com") do
      {:ok, %HTTPoison.Response{} = response} ->
        # do something with response
        render(conn, "index.html")
      {:error, %HTTPoison.Error{} = error} ->
        # do something with error
        render(conn, "error.html")
    end
    HTTPClient.post("https://cnn.com", "")
    HTTPClient.get!("http://localhost:4567")
    render(conn, "index.html")
  end
end
```

### MongoDB Ecto

Download <a href="https://gist.github.com/itsderek23/051327a152bc4d95451fd76808b8e83f" target="_blank">this example MongoDB Repo module</a> to use inplace of your existing MongoDB Repo module.

<h2 id="elixir-custom-instrumentation">Custom Instrumentation</h2>

You can extend Scout to record additional types of transactions (background jobs, for example) and time the execution of code that fall outside our auto instrumentation.

For full details on instrumentation functions, see our <a href="https://hexdocs.pm/scout_apm/ScoutApm.Tracing.html" target="_blank">ScoutApm.Tracing Hex docs</a>.


### Transactions & Timing

Scout’s instrumentation is divided into 2 areas:

1. __Transactions__: these wrap around a flow of work, like a web request or a GenServer call. The UI groups data under transactions. Use the `deftransaction/2` macro or wrap blocks of code with the `transaction/4` macro.
2. __Timing__: these measure individual pieces of work, like an HTTP request to an outside service or an Ecto query, and displays timing information within a transaction trace. Use the `deftiming/2` macro or the `timing/4` macro.

### Instrumenting transactions

#### deftransaction Macro Example

Replace your function `def` with `deftransaction` to instrument it. You can override the name and type by setting the `@transaction_opts` attribute right before the function.

```elixir
defmodule YourApp.Web.RoomChannel do
  use Phoenix.Channel
  use ScoutApm.Tracing

  # Will appear under "Web" in the UI, named "YourApp.Web.RoomChannel.join".
  @transaction_opts [type: "web"]
  deftransaction join("topic:html", _message, socket) do
    {:ok, socket}
  end

  # Will appear under "Background Jobs" in the UI, named "RoomChannel.ping".
  @transaction_opts [type: "background", name: "RoomChannel.ping"]
  deftransaction handle_in("ping", %{"body" => body}, socket) do
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end
```

#### transaction/4 Example

Wrap the block of code you'd like to instrument with `transaction/4`:

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

#### deftiming Macro Example

Replace your function `def` with `deftiming` to instrument it. You can override the name and category by setting the `@timing_opts` attribute right before the function.


```elixir
defmodule Searcher do
  use ScoutApm.Tracing

  # Time associated with this function will appear under "Hound" in timeseries charts.
  # The function will appear as `Hound/open_search` in transaction traces.
  @timing_opts [category: "Hound"]
  deftiming open_search(url) do
    navigate_to(url)
  end

  # Time associated with this function will appear under "Hound" in timeseries charts.
  # The function will appear as `Hound/homepage` in transaction traces.
  @timing_opts [category: "Hound", name: "homepage"]
  deftiming open_homepage(url) do
    navigate_to(url)
  end
```

#### timing/4 Example

Wrap the block of code you'd like to instrument with `timing/4`:

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

<h2 id="elixir-server-timing">Server Timing</h2>

View performance metrics (time spent in Controller, Ecto, etc) for each of your app's requests in Chrome’s Developer tools with the [plug_server_timing](https://github.com/scoutapp/elixir_plug_server_timing) package. Production-safe.

![server timing](https://s3-us-west-1.amazonaws.com/scout-blog/elixir_server_timing.png
)

For install instructions and configuration options, see [plug_server_timing](https://github.com/scoutapp/elixir_plug_server_timing) on GitHub.
