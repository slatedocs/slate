# PHP Agent

Scout's PHP agent supports many popular libraries to instrument middleware, request times, SQL queries, and more.
The base package is called `scoutapp/scout-apm-php`, and Laravel instrumentation
is in the `scoutapp/scout-apm-laravel`. See our install instructions for more details..

Source code and issues can be found on our [scout-apm-php](https://github.com/scoutapp/scout-apm-php) GitHub repository.

<h2 id="php-requirements">Requirements</h2>

`scout-apm-php` requires:

* PHP
* A POSIX operating system, such as Linux or macOS.

<h2 id="php-instrumented-libraries">Instrumented Libraries</h2>

Scout provides instrumentation for Laravel.

### 
<h3 id="php-some-configuration-required">Some configuration required</h3>

The libraries below require a small number of configuration updates. Click on
the respective library for instructions.

* [Laravel](#laravel)
    * Middleware
    * Controllers
    * SQL queries
* PHP Functions (requires scoutapm extension installed)
    * libcurl
    * file\_get\_contents / file\_put\_contents
    * fread / fwrite
    * PDO exec / query / execute

You can instrument your own code or other libraries via [custom instrumentation](#php-custom-instrumentation).
You can suggest additional libraries you'd like Scout to instrument
[on GitHub](https://github.com/scoutapp/scout-apm-php/issues).


## Laravel

Scout supports Laravel 5.5+.

<table class="help install install_ruby">
  <tbody>
    <tr>
      <td>
        <span class="step">1</span>
      </td>
      <td style="padding-top: 15px">
        <p>Install the <code>scoutapp/scout-apm-laravel</code> package:</p>
<pre style="width:500px">
composer require scoutapp/scout-apm-laravel
</pre>
<p>
Note that the <code>scout-apm-php</code> package will automatically be included. It does
not need to be installed directly.
</p>
      </td>
    </tr>
<!--    <tr>
      <td>
        <span class="step">2</span>
      </td>
      <td style="padding-top: 15px">
        <p>Install the <code>scoutapm</code> php extension (optional, recommended):</p>
<pre style="width:500px">
sudo pecl install scoutapm
</pre>
<p>
Several instruments require the native extension to be included, including timing of <code>libcurl</code> and <code>file_get_contents</code>.

For more information, or to compile manually, the <a href="https://github.com/scoutapp/scout-apm-php-ext">README</a> has additional instructions.
</p>
      </td>
    </tr> -->
    <tr>
      <td>
        <span class="step">2</span>
      </td>
      <td style="padding-top: 15px">
        <p>Configure Scout in your <code>.env</code> file:</p>
<pre style="width:500px">
# Scout settings
SCOUT_MONITOR=true
SCOUT_KEY="[AVAILABLE IN THE SCOUT UI]"
SCOUT_NAME="A FRIENDLY NAME FOR YOUR APP"
</pre>

<p>
If you've installed Scout via the Heroku Addon, the provisioning process automatically sets <code>SCOUT_MONITOR</code> and <code>SCOUT_KEY</code> via <a href="https://devcenter.heroku.com/articles/config-vars">config vars</a>. Only <code>SCOUT_NAME</code> is required.
</p>
      </td>
    </tr>
    <tr>
      <td><span class="step">3</span></td>
      <td style="padding-top: 15px">
        <p>Deploy.</p>
        <p>It takes approximatively five minutes for your data to first appear within the Scout UI.</p>
      </td>
    </tr>
  </tbody>
</table>

<h3 id="php-middleware">Middleware</h3>

Scout automatically inserts its middleware into your application on Laravel startup.

It adds one at the very start of the middleware stack, and one at the end,
allowing it to profile your middleware and controllers.


<h2 id="php-troubleshooting">Troubleshooting</h2>

Not seeing data? Email support@scoutapm.com with:

* A link to your app within Scout (if applicable)
* Your PHP version
* The name of the framework and version you are trying to instrument, e.g. Laravel 5.8

We typically respond within a couple of hours during the business day.

<h2 id="php-configuration">Configuration Reference</h2>

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
      <th>SCOUT_KEY</th>
      <td>
        The organization API key.
      </td>
      <td></td>
      <td>Yes</td>
    </tr>
    <tr>
      <th>SCOUT_NAME</th>
      <td>
        Name of the application (ex: 'Photos App').
      </td>
      <td></td>
      <td>Yes</td>
    </tr>
    <tr>
      <th>SCOUT_MONITOR</th>
      <td>
        Whether monitoring data should be reported.
      </td>
      <td><code>false</code></td>
      <td>Yes</td>
    </tr>
    <tr>
      <th>SCOUT_REVISION_SHA</th>
      <td>
        The Git SHA associated with this release.
      </td>
      <td><a href="#php-deploy-tracking-config">See docs</a></td>
      <td>No</td>
    </tr>
  </tbody>
</table>


<h2 id="php-environments">Environments</h2>

It typically makes sense to treat each environment (production, staging, etc)
as a separate application within Scout and ignore the development and test
environments. Configure a unique app name for each environment as Scout
aggregates data by the app name.


<h2 id="php-logging">Logging</h2>

Scout logs internal activity via a configured `Psr\Log\LoggerInterface`. The
Laravel instruments automatically wire up the framework's logger to the
agent's logging.

If required, you can override this by changing the container service `log`.


<h2 id="php-custom-instrumentation">Custom Instrumentation</h2>

You can extend Scout to trace transactions outside our officially supported
libraries (e.g. Cron jobs and other web frameworks) and time the execution of
sections of code that falls outside our provided instrumentation.

<h3 id="php-transactions-timing">Transactions & Timing</h3>

Scout’s instrumentation is divided into 2 areas:

1. __Transactions__: these wrap around an entire flow of work, like a web
   request or Cron job. The Scout Web UI groups data under transactions.
2. __Timing__: these measure small pieces of code that occur inside of a
   transaction, like an HTTP request to an outside service, or a database call.
   This is displayed within a transaction trace in the UI.

<h3 id="php-instrumenting-transactions">Instrumenting Transactions</h3>

A transaction groups a sequence of work under in the Scout UI. These are used
to generate transaction traces. For example, you may create a transaction that
wraps around the entire execution of a PHP script that is ran as a Cron Job.

The Laravel instrumentation does this all for you. You only will need to
manually instrument transactions in special cases. Contact us at
support@scoutapm.com for help.

<h4 id="php-transaction-limits">Limits</h4>

We limit the number of unique transactions that can be instrumented. Tracking
too many uniquely named transactions can impact the performance of the UI. Do not
dynamically generate transaction names in your instrumentation as this can quickly
exceed our rate limits. Use [context](#php-custom-context) to add
high-dimensionality information instead.

<h4 id="php-web-or-background">Web or Background transactions?</h4>

Scout distinguishes between two types of transactions:

* `WebTransaction`: For transactions that impact the user-facing experience.
  Time spent in these transactions will appear on your app overboard dashboard
  and appear in the "Web" area of the UI.
* `BackgroundTransaction`: For transactions that don't have an impact on the
  user-facing experience (example: cron jobs). These will be available in the
  "Background Jobs" area of the UI.

```php
$agent->webTransaction("GET Users", function() { ... your code ... });
$agent->send();
```

<h3 id="php-timing-blocks">Timing functions and blocks of code</h3>

In existing transactions, both automatically created with Laravel instruments,
and also manually created, you can time sections of code that are interesting
to your application.

Traces that allocate significant amount of time to `Controller` or `Job` layers
are good candidates to add custom instrumentation. This indicates a significant
amount of time is falling outside our default instrumentation.

<h4 id="php-span-limits">Limits</h4>

We limit the number of metrics that can be instrumented. Tracking too many
unique metrics can impact the performance of our UI. Do not dynamically
generate metric types in your instrumentation as this can quickly exceed our
rate limits. 

For high-cardinality details, use tags.

<h4 id="php-span-getting-started">Getting Started</h4>

With existing code like:

```
$request = new ServiceRequest();
$request->setApiVersion($version);
```

It is wrapped with instrumentation:

```
// At top, with other imports
use Scoutapm\Laravel\Facades\ScoutApm;

// Replacing the above code
$request = ScoutApm::instrument(
    "Custom", // Kind
    "Building Service Request", // Name
    function ($span) use ($version) {
        $request = new ServiceRequest();
        $request->setApiVersion($version);
        return $request;
    }
);
```

* `kind` - A high level area of the application. This defaults to `Custom`.
  Your whole application should have a very low number of unique strings here.
  In our built-in instruments, this is things like `Template` and `SQL`. For
  custom instrumentation, it can be strings like `MongoDB` or `HTTP` or
  similar. This should not change based on input or state of the application.
* `name` - A semi-detailed version of what the section of code is. It should be
  static between different invocations of the method. Individual details like a
  user ID, or counts or other data points can be added as tags. Names like
  `retreive_from_api` or `GET` are good names.
* `span` - An object that represents instrumenting this section of code. You
  can set tags on it by calling `$span->tag("key", "value")`
* `tags` - A dictionary of key/value pairs. Key should be a string, but value
  can be any json-able structure. High-cardinality fields like a user ID are
  permitted.


<h2 id="php-custom-context">Custom Context</h2>

[Context](#context) lets you see the key attributes of requests. For example,
you can add custom context to answer critical questions like:

* Which plan was the customer who had a slow request on?
* How many users are impacted by slow requests?
* How many trial customers are impacted by slow requests?
* How much of an impact are slow requests having on our highest paying customers?

It's simple to add [custom context](#context) to your app:

```php
use Scoutapm\Laravel\Facades\ScoutApm; // Laravel only: Add near the other use statements

ScoutApm::addContext("Key", "Value");

// or if you have an $agent instance:
$agent->addContext("Key", "Value");
```



<h3 id="php-context-key-restrictions">Context Key Restrictions</h3>

The Context `key` must be a `String` with only printable characters. Custom
context keys may contain alphanumeric characters, dashes, and underscores.
Spaces are not allowed.

Attempts to add invalid context will be ignored.

<h3 id="php-context-value-types">Context Value Types</h3>

Context values can be any json-serializable type. Examples:

* `"1.1.1.1"`
* `"free"`
* `100`

<h2 id="php-upgrade">Updating to the Newest Version</h2>

```sh
composer update scout-apm-laravel
```

The package changelog is [available here](https://github.com/scoutapp/scout-apm-php/blob/master/CHANGELOG.md).

<h2 id="php-deploy-tracking-config">Deploy Tracking Config</h2>

Scout can [track deploys](#deploy-tracking), making it easier to correlate
specific deploys to changes in performance.

Scout identifies deploys via the following approaches:

* Detecting the current git sha (this is automatically detected when `composer install` is run)
