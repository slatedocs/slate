# NodeJS Agent

Scout's NodeJS agent supports many popular libraries to instrument middleware, request times, SQL queries, and more.
The base package is called `@scout_apm/scout-apm`. See our install instructions for more details.

Source code and issues can be found on our [`@scout_apm/scout-apm`](https://github.com/scoutapp/scout_apm_node) GitHub repository.

<h2 id="nodejs-requirements">Requirements</h2>

`@scout_apm/scout-apm` requires:

* [NodeJS](https://nodejs.org/)
* A POSIX operating system, such as Linux or macOS.

<h2 id="nodejs-instrumented-libraries">Instrumented Libraries</h2>

Scout provides instrumentation for:

- [Express](https://expressjs.com)
- [Postgres](https://www.postgresql.org/) (via [`pg`](https://www.npmjs.com/package/pg))
- [MySQL](https://www.mysql.com/) (via [`mysql`](https://www.npmjs.com/package/mysql) and [`mysql2`](https://www.npmjs.com/package/mysql2))
- [Pug](https://pugjs.org)
- [Mustache](https://github.com/janl/mustache.js)
- [EJS](https://www.npmjs.com/package/ejs)

<h3 id="nodejs-some-configuration-required">Some configuration required</h3>

The libraries below require a small number of configuration updates. Click on
the respective library for instructions.

* [Express](#express)

You can instrument your own code or other libraries via [custom instrumentation](#nodejs-custom-instrumentation).
You can suggest additional libraries you'd like Scout to instrument [on GitHub](https://github.com/scoutapp/scout_apm_node/issues).

## Express

Scout supports Express 4.x+.

<table class="help install install_nodejs">
  <tbody>
    <tr>
      <td>
        <span class="step">1</span>
      </td>
      <td style="padding-top: 15px">
        <p>Install the <code>@scout_apm/scout-apm</code> package:</p>
        <pre style="width:500px">
$ yarn add @scout_apm/scout-apm
        </pre>
      </td>
    </tr>
    <tr>
      <td>
        <span class="step">2</span>
      </td>
      <td style="padding-top: 15px">
        <p>Configure Scout via ENV variables:</p>
<pre style="width:500px">
export SCOUT_MONITOR=true
export SCOUT_KEY="[AVAILABLE IN THE SCOUT UI]"
export SCOUT_NAME="A FRIENDLY NAME FOR YOUR APP"
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

<h3 id="nodejs-middleware">Middleware</h3>

Scout's Express middleware can be used by adding it to your application:

```javascript
const express = require("express");
const scout = require("@scout_apm/scout-apm");

// Initialize your express application
const app = express();

// Enable the app-wide scout middleware
app.use(scout.expressMiddleware({
  config: {
    monitor: true, // enable monitoring
    name: "<application name>",
    key: "<scout key>",
  },
}));
```

<h2 id="nodejs-troubleshooting">Troubleshooting</h2>

Not seeing data? [Email support@scoutapm.com](mailto:support@scoutapm.com?subject=New%20Support%20Ticket%20%5bYour%20App%5d&body=Scout%20Link%20to%20your%20app:%20%0A%0dNodeJS%20Version:%20%0A%0dFramework:%20%0A%0dScout%20logs:%20%0A%0d) with:

* A link to your app within Scout (if applicable)
* Your NodeJS version
* The name of the framework and version you are trying to instrument, e.g. Express 4.17.0
* <a href="#nodejs-logging">Scout logs</a>

We typically respond within a couple of hours during the business day.

<h2 id="nodejs-configuration">Configuration Reference</h2>

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
      <td><a href="#nodejs-deploy-tracking-config">See docs</a></td>
      <td>No</td>
    </tr>

    <tr>
      <th>SCOUT_LOG_LEVEL</th>
      <td>Override the SCOUT log level. Can only be used to quiet the agent,
      will not override the underlying logger's level</td>
      <td></td>
      <td>No</td>
    </tr>

    <tr>
      <th>SCOUT_SCM_SUBDIRECTORY</th>
      <td>The relative path from the base of your Git repo to the directory which contains your application code.</td>
      <td></td>
      <td>No</td>
    </tr>

    <tr>
      <th>
        SCOUT_CORE_AGENT_DIR
      </th>
      <td>
        Path to create the directory which will store the <a href="#core-agent">Core Agent</a>.
      </td>
      <td>
        <code>/tmp/scout_apm_core</code>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        SCOUT_CORE_AGENT_DOWNLOAD
      </th>
      <td>
        Whether to download the <a href="#core-agent">Core Agent</a> automatically, if needed.
      </td>
      <td>
        <code>True</code>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        SCOUT_CORE_AGENT_LAUNCH
      </th>
      <td>
        Whether to start the <a href="#core-agent">Core Agent</a> automatically, if needed.
      </td>
      <td>
        <code>True</code>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        SCOUT_CORE_AGENT_PERMISSIONS
      </th>
      <td>
        The permission bits to set when creating the directory of the <a href="#core-agent">Core Agent</a>.
      </td>
      <td>
        <code>700</code>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        SCOUT_CORE_AGENT_TRIPLE
      </th>
      <td>
        If you are running a MUSL based Linux (such as ArchLinux), you may need
        to explicitly specify the platform triple. E.g.
        <code>x86_64-unknown-linux-musl</code>
      </td>
      <td>
        Auto detected
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        SCOUT_CORE_AGENT_LOG_LEVEL
      </th>
      <td>
        The log level of the core agent process. This should be one of:
        <code>"trace"</code>, <code>"debug"</code>, <code>"info"</code>,
        <code>"warn"</code>, <code>"error"</code>.
        <br>
        <br>
        This does not affect the log level of the NodeJS library. To change that,
        directly configure <code>logging</code> as per <a href="#nodejs-logging">the documentation</a>.
      </td>
      <td>
        <code>"info"</code>
      </td>
      <td>
        No
      </td>
    </tr>
    <tr>
      <th>
        SCOUT_CORE_AGENT_LOG_FILE
      </th>
      <td>
        The log file for the core agent process
      </td>
      <td>
        <code>"/path/to/your/log/file"</code>
      </td>
      <td>
        No
      </td>
    </tr>

  </tbody>

</table>


<h2 id="nodejs-environments">Environments</h2>

It typically makes sense to treat each environment (production, staging, etc)
as a separate application within Scout and ignore the development and test
environments. Configure a unique app name for each environment as Scout
aggregates data by the app name.

For example, `app-staging` might be used to represent a Staging environment where as `app-production` would represent a Production environment.

<h2 id="nodejs-logging">Logging</h2>

Scout logs internal activity via a configured logging function with the signature `(msg: string, level: LogLevel) => void`.

<h3 id="nodejs-logging-express-middleware">Express middleware logging</h3>

To enable agent logging with the `express` middleware, your middleware should be set up like the following:

```javascript
const express = require("express");
const scout = require("@scout_apm/scout-apm");

// Enable the app-wide scout middleware
app.use(scout.expressMiddleware({
  config: {
    allowShutdown: true, // allow shutting down spawned scout-agent processes from this program
    monitor: true, // enable monitoring
    name: "<application name>",
    key: "<scout key>",
  },
  logFn: scout.consoleLogFn,
}));
```

If you are using [`winston`](https://www.npmjs.com/package/winston) you may build a `logFn` by passing a `winston.Logger` to the exported `scout.buildWinstonLogger` helper function:

```javascript
  logFn: scout.buildWinstonLogger(yourLogger),
```

If a `winston.Logger` instance is provided, Scout's logging defaults to the same log level as the instance, otherwise it defaults to `ERROR`. You may set the logging to a stricter level to quiet the agent's logging via the `logLevel` in the `config` sub-object (or `SCOUT_LOG_LEVEL` via ENV). The underlying LoggerInterface's level will take precedence if it is tighter than the `logLevel` configuration.

<h2 id="nodejs-custom-instrumentation">Custom Instrumentation</h2>

You can extend Scout to trace transactions outside our officially supported libraries (e.g. Cron jobs and other web frameworks) and time the execution of sections of code that falls outside our provided instrumentation.

Asynchronous functionality can be marked as a transaction with code similar to the following:

```javascript
scout.transaction("transaction-name", (finishTransaction) => {
   yourAsyncFunction()
   .then(() => finishTransaction())
   .catch(err => {
    // error handling code goes here
    finishTransaction();
   });
});
```

For Asynchronous functionality in a callback-passing style:

```javascript
scout.transaction("transaction-name", (finishTransaction) => {
   yourCallbackStyleAsyncFunction((err) => {
    if (err) {
      // error handling code goes here
      return;
    }

    finishTransaction();
   });
});
```

Synchronous functionality can be marked as transactions with code similar to the following:

```javascript
scout.transactionSync("sync-transaction-name", () => {
  yourSyncFunction();
});
```

<h3 id="nodejs-transactions-timing">Transactions & Timing</h3>

Scout’s instrumentation is divided into 2 areas:

1. __Transactions__: these wrap around an entire flow of work, like a web
   request or Cron job. The Scout Web UI groups data under transactions.
2. __Timing__: these measure small pieces of code that occur inside of a
   transaction, like an HTTP request to an outside service, or a database call.
   This is displayed within a transaction trace in the UI.

<h3 id="nodejs-instrumenting-transactions">Instrumenting Transactions</h3>

A transaction groups a sequence of work under in the Scout UI. These are used
to generate transaction traces. For example, you may create a transaction that
wraps around the entire execution of a NodeJS script that is ran as a Cron Job.

The Express integration does this all for you. You only will need to manually instrument transactions in special cases. [Contact us at support@scoutapm.com](mailto:support@scoutapm.com?subject=Custom%20Integration%20Assistance%20%5bYour%20App%5d) for help.

<h4 id="nodejs-transaction-limits">Limits</h4>

We limit the number of unique transactions that can be instrumented. Tracking
too many uniquely named transactions can impact the performance of the UI. Do not
dynamically generate transaction names in your instrumentation as this can quickly
exceed our rate limits. Use [context](#nodejs-custom-context) to add
high-dimensionality information instead.

<h4 id="nodejs-web-or-background">Web or Background transactions?</h4>

Scout distinguishes between two types of transactions:

* `WebTransaction`: For transactions that impact the user-facing experience.
  Time spent in these transactions will appear on your app overboard dashboard
  and appear in the "Web" area of the UI.
* `BackgroundTransaction`: For transactions that don't have an impact on the
  user-facing experience (example: cron jobs). These will be available in the
  "Background Jobs" area of the UI.

```javascript
scout.transaction("GET /users", () => { ... your code ... });
```

<h3 id="nodejs-timing-blocks">Timing functions and blocks of code</h3>

In existing transactions, both automatically created with Express instruments,
and also manually created, you can time sections of code that are interesting
to your application.

Traces that allocate significant amount of time to `Controller` or `Job` layers
are good candidates to add custom instrumentation. This indicates a significant
amount of time is falling outside our default instrumentation.

Asynchronous functionality may be instrumented with code similar to the following:

```javascript
// NOTE: The transaction is *implicit* inside of express route handlers, if you are using the express middleware
scout.transaction("transaction-name", (finishTransaction) => {
  // Start the first instrumentation
  const first = scout.instrument("instrument-name", (finishInstrument) => {
    // instrument code
    return yourAsyncFunction()
        .then(() => finishInstrument());
  });

  // Start the second instrumentation
  scout.instrument("instrument-name", (finishInstrument) => {
    // instrument code
    return yourAsyncFunction()
        .then(() => finishInstrument());
  });

  // Finish the transaction once all instrumentations are recorded
  Promise.all([first, second])
    .then(() => finishTransaction());
});
```

For Asynchronous functionality in a callback-passing style:

```javascript
// NOTE: The transaction is *implicit* inside of express route handlers, if you are using the express middleware
scout.transaction("transaction-name", (finishTransaction) => {
  // Start the first instrumentation
  const first = scout.instrument("first-instrumentation", (finishFirst) => {
    // instrument code
    yourCallbackStyleAsyncFunction((err) => {
      if (err) {
        // error handling code here
        return;
      }

      finishFirst();

      // Start a second instrumentation
      const second = scout.instrument("second-instrumentation", (finishSecond) => {
        // instrument code
        yourCallbackStyleAsyncFunction((err) => {
          if (err) {
            // error handling code here
            return;
          }

          finishSecond();
          finishTransaction();
        });
      });

    });
  });
});
```

Synchronous functionality can be instrumented with code similar to the following:

```javascript
// NOTE: The transaction is *implicit* inside of express route handlers, if you are using the express middleware
scout.transactionSync("sync-transaction-name", (finishTransaction) => {
  scout.instrumentSync("first-instrumentation", () => {
    yourSyncFunction();
  });

  scout.instrumentSync("second-instrumentation", () => {
    yourSyncFunction();
  });
});
```

<h4 id="nodejs-span-limits">Limits</h4>

We limit the number of metrics that can be instrumented. Tracking too many
unique metrics can impact the performance of our UI. Do not dynamically
generate metric types in your instrumentation as this can quickly exceed our
rate limits.

For high-cardinality details, use context.

<h4 id="nodejs-span-getting-started">Getting Started</h4>

With existing code like:

```
// A handler that handles GET /
const handler = (req, res) => {
    // Functionality here
};
```

The express middleware automatically wraps the request with a transaction/instrumentation like the following:

```
// At top, with other imports
const express = require("express");
const scout = require("@scout_apm/scout-apm");

// Enable the app-wide scout middleware
app.use(scout.expressMiddleware({ ... }));

// Pseudo-code for the replaced handler
scout.transaction("Controller/GET /", finishTransaction => { // transaction name format is `<kind>/<name>`
  scout.instrument("Controller/GET /", finishSpan => { // instrumentation name format is `<kind>/<name>`
    // the handler code
  });
});
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

<h2 id="nodejs-custom-context">Custom Context</h2>

[Context](#context) lets you see the key attributes of requests. For example,
you can add custom context to answer critical questions like:

* Which plan was the customer who had a slow request on?
* How many users are impacted by slow requests?
* How many trial customers are impacted by slow requests?
* How much of an impact are slow requests having on our highest paying customers?

It's simple to add [custom context](#context) to your app:

```javascript
// Express only: Add context inside a handler function
app.get("/", (req, req) => {
  req.scout.request.addContext("Key", "Value");
})

// or if you have access to a request instance:
request.addContext("Key", "Value");
```



<h3 id="nodejs-context-key-restrictions">Context Key Restrictions</h3>

The Context `key` must be a `String` with only printable characters. Custom
context keys may contain alphanumeric characters, dashes, and underscores.
Spaces are not allowed.

Attempts to add invalid context will be ignored.

<h3 id="nodejs-context-value-types">Context Value Types</h3>

Context values can be any json-serializable type. Examples:

* `"1.1.1.1"`
* `"free"`
* `100`

<h2 id="nodejs-upgrade">Updating to the Newest Version</h2>

```sh
yarn upgrade @scout_apm/scout-apm
```

The package changelog is [available here](https://github.com/scoutapp/scout_apm_node/blob/master/CHANGELOG.md).

<h2 id="nodejs-deploy-tracking-config">Deploy Tracking Config</h2>

Scout can [track deploys](#deploy-tracking), making it easier to correlate specific deploys to changes in performance.

To ensure scout tracks your deploy, please provide the `SCOUT_REVISION_SHA` environment variable. You may also set the `revisionSHA` on a `ScountConfiguration` object instance:

```javascript
const config = scout.buildScoutConfiguration({
    monitor: true,
    key: "<app key>",
    name: "<app name>",
    revisionSHA: "<sha>",
});
```
