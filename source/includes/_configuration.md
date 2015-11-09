# Configuration

## Requirements

### Monitoring

Scout currently supports Ruby on Rails 2.2+ and Ruby 1.8.7+ and the following app servers:

* Phusion Passenger
* Puma
* Rainbows
* Thin
* Unicorn
* WEBrick

### Stack Profiling - Optional

Stack Profiling requires Ruby 2.1+.

### Git Integration - Optional

Viewing your application code within Scout requires that your source code is hosted at Github.com.

## Installation

Tailored instructions are provided within our user interface. General instructions:

<table class="help install">
  <tbody>
		<tr>
      <td>
        <span class="step">1</span>
      </td>
      <td>
				<p>Your Gemfile:</p>

<pre>
gem 'scout_apm'
</pre>

					<p><strong>Shell:</strong></p>

<pre>
bundle install
</pre>
      </td>
     </tr>
     <tr>
     	<td><span class="step">2</span></td>
     	<td><p>Download your customized config file, placing it at <code>config/scout_apm.yml</code>.</p></td>
     </tr>
          <tr>
     	<td><span class="step">3</span></td>
     	<td><p>Deploy.</p></td>
     </tr>
 	</tbody>
 </table>

## Configuration Options

Scout APM can be configured via the `config/scout_apm.yml` Yaml file and/or environment variables. A config file with your organization key is available for download as part of the install instructions.

### ERB evaluation

ERB is evaluated when loading the config file. For example, you can set the app name based on the hostname:

```yaml
common: &defaults
  name: <%= "ProjectPlanner.io (#{Rails.env})" %>
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
          <code>Rails.application.class.to_s.
             sub(/::Application$/, '')</code>
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
          monitor
        </th>
        <td>
          Whether monitoring should be enabled. 
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
          log_level
        </th>
        <td>
          The logging level of the agent. 
        </td>
        <td>
          <code>INFO</code>
        </td>
        <td>
          No
        </td>
      </tr>
      <tr>
        <th>
          log_file_path
        </th>
        <td>The path to the <code>scout_apm.log</code> log file directory. Use <code>stdout</code> to log to STDOUT.
        </td>
        <td>
          <code>Environment#root+log/</code>&nbsp;or <code>STDOUT</code> if running on Heroku.
        </td>
        <td>
          No
        </td>
      </tr>
      <tr>
        <th>
          hostname
        </th>
        <td>
          The hostname the metrics should be aggregrated under. 
        </td>
        <td>
          <code>Socket.gethostname</code>
        </td>
        <td>
          No
        </td>
      </tr>
      <tr>
        <th>
          proxy
        </th>
        <td>Specify the proxy URL (ex: <code>https://proxy</code>) if a proxy is required. 
        </td>
        <td></td>
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

### Environment Variables

You can also configure Scout APM via environment variables. _Environment variables override settings provided in_ `scout_apm.yml`.

Environment variables have the same names as those in the Yaml config file, but are prefixed with `SCOUT_`. For example, to set the organization key via environment variables:

```ruby
export SCOUT_KEY=YOURKEY
```

## Heroku <img src="images/heroku.png" style="float:right;width: 150px" />

Scout runs on Heroku without any special configuration. When Scout detects that an app is being served via Heroku:

* Logging is set to `STDOUT` vs. logging to a file. Log messages are prefixed with `[Scout]` for easy filtering.
* The dyno name (ex: `web.1`) is reported vs. the dyno hostname. Dyno hostnames are dynamically generated and don't have any meaningful information.

## Cloud Foundry <img src="images/cf_logo.png" style="float:right;width: 150px" />

Scout runs on Cloud Foundry without any special configuration. 

We suggest a few configuration changes in the `scout_apm.yml` file to best take advantage of Cloud Foundry:

1. Set `log_file_path: STDOUT` to send your the Scout APM log contents to the Loggregator. 
2. Use the application name configured via Cloud Foundry to identify the app.
3. Override the hostname reported to Scout. Cloud Foundry hostnames are dynamically generated and don't have any meaningful information. We suggest using a combination of the application name and the instance index.

A sample config for Cloud Foundry that implements the above suggestions:

```yaml
common: &defaults
  key: YOUR_KEY
  monitor: true
  # use the configured application name to identify the app.
  name: <%= ENV['VCAP_APPLICATION'] ? JSON.parse(ENV['VCAP_APPLICATION'])['application_name'] : "YOUR APP NAME (#{Rails.env})" %>
  # make logs available to the Loggregator
  log_file_path: STDOUT
  # reports w/a more identifiable instance name using the application name and instance index. ex: rails-sample.0
  hostname: <%= ENV['VCAP_APPLICATION'] ? "#{JSON.parse(ENV['VCAP_APPLICATION'])['application_name']}.#{ENV['CF_INSTANCE_INDEX']}"  : Socket.gethostname %>

production:
  <<: *defaults

development:
  <<: *defaults
  monitor: false

test:
  <<: *defaults
  monitor: false

staging:
  <<: *defaults
```

### Configuration

Scout can be configured via environment variables. This means you can use `heroku config:set` to configure the agent. For example, you can set the application name that appears in the Scout UI with:

```bash
heroku config:set SCOUT_NAME='My Heroku App'
```

See the configuration section for more information on the available config settings and environment variable functionality.

## Instrumented Libraries

The following libraries are currently instrumented:

* ActiveRecord
* ActionView
* ActionController
* Mongoid
* Net::HTTP
* Moped

## Adding Custom Context

[Context](#context) lets you see the forest from the trees. For example, you can add custom context to answer critical questions like:

* How many users are impacted by slow requests?
* How many trial customers are impacted by slow requests?
* How much of an impact are slow requests having on our highest paying customers?

It's simple to add [custom context](#context) to your app. There are two types of context:

### User Context

For context used to identify users (ex: email, name):

```ruby
ScoutApm::Context.add_user({})
```

Examples:

```ruby
ScoutApm::Context.add_user(email: @user.email)
ScoutApm::Context.add_user(email: @user.email, location: @user.location.to_s)
```

### General Context

```ruby
ScoutApm::Context.add({})
```

Examples:

```ruby
ScoutApm::Context.add(account: @account.name)
ScoutApm::Context.add(database_shard: @db.shard_id, monthly_spend: @account.monthly_spend)
```

### Default Context

Scout reports the Request URI and the user's remote IP Address by default.

### Context Types

Context values can be any of the following types:

* Numeric
* String
* Boolean
* Time
* Date

### Context Field Name Restrictions

Custom context names may contain alphanumeric characters, dashes, and underscores. Spaces are not allowed.

Attempts to add invalid context will be ignored.

### Example: adding the current user's email as context

Add the following to your `ApplicationController` class:

```ruby
before_filter :set_scout_context
```

Create the following method:

```ruby
def set_scout_context 
	ScoutApm::Context.add_user(email: current_user.email) if current_user.is_a?(User)
end
```

### Example: adding the monthly spend as context

Add the following line to the `ApplicationController#set_scout_context` method defined above:

```ruby
ScoutApm::Context.add(monthly_spend: current_org.monthly_spend) if current_org
```

## Environments

It typically makes sense to treat each environment (production, staging, etc) as a separate application within Scout and ignore the development and test environments.

Here's an example `scout_apm.yml` configuration to achieve this:

```yaml
common: &defaults
  name: <%= "YOUR_APP_NAME (#{Rails.env})" %>
  key: YOUR_KEY
  log_level: debug
  monitor: true

production:
  <<: *defaults

development:
  <<: *defaults
  monitor: false
   
test:
  <<: *defaults
  monitor: false

staging:
  <<: *defaults
```
