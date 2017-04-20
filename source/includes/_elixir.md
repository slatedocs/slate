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