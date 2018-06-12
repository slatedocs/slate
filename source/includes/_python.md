# Python Agent

<aside class="notice">Python Monitoring is in our tech preview program.</aside>

Scout's Python agent auto-instruments Django and Flask applications, SQL queries, and more. Source code and issues can be found on the [scout_apm_python](https://github.com/scoutapp/scout_apm_python) GitHub repository.

<h2 id="python-requirements">Requirements</h2>

* Python 3.4+ (request Python 2.7 support via [this GitHub issue](https://github.com/scoutapp/scout_apm_python/issues/45))
* Django 1.10+ (request Django 1.8 and 1.9 support via [this GitHub issue](https://github.com/scoutapp/scout_apm_python/issues/26))
* Flask 0.10+
* Celery 3.1+



<h2 id="python-install">Installation</h2>

Tailored instructions are provided within our user interface. 

### Django Installation

General instructions for a Django app:

<table class="help install install_ruby">
  <tbody>
    <tr>
      <td>
        <span class="step">1</span>
      </td>
      <td style="padding-top: 15px">
        <p>Install the <code>scout-apm</code> package:</p>
<pre style="width:500px">
pip install scout-apm
</pre>
      </td>
    </tr>
    <tr>
      <td>
        <span class="step">2</span>
      </td>
      <td style="padding-top: 15px">
        <p>Configure Scout in your <code>settings.py</code> file:</p>
<pre style="width:500px">
# settings.py
INSTALLED_APPS = (
  'scout_apm.django', # should be listed first
  # ... other apps ...
)

# Scout settings
SCOUT_MONITOR = True
SCOUT_KEY     = "[AVAILABLE IN THE SCOUT UI]"
SCOUT_NAME    = "A FRIENDLY NAME FOR YOUR APP"
</pre>

<p>If you wish to configure Scout via environment variables, use <code>SCOUT_MONITOR</code>, <code>SCOUT_NAME</code> and <code>SCOUT_KEY</code> instead of providing these settings in <code>settings.py</code>.</p>

<p>
If you've installed Scout via the Heroku Addon, the provisioning process automatically sets <code>SCOUT_MONITOR</code> and <code>SCOUT_KEY</code> via <a href="https://devcenter.heroku.com/articles/config-vars">config vars</a>. Only <code>SCOUT_NAME</code> is required.
</p>
      </td>
    </tr>
    <tr>
      <td><span class="step">3</span></td>
      <td style="padding-top: 15px"><p>Deploy.</p></td>
    </tr>
  </tbody>
</table>

### Flask Installation

General instructions for a Flask app:

<table class="help install install_ruby">
  <tbody>
    <tr>
      <td>
        <span class="step">1</span>
      </td>
      <td style="padding-top: 15px">
        <p>Install the <code>scout-apm</code> package:</p>
<pre style="width:500px">
pip install scout-apm
</pre>
      </td>
    </tr>
    <tr>
      <td>
        <span class="step">2</span>
      </td>
      <td style="padding-top: 15px">
        <p>Configure Scout inside your Flask app:</p>

<p>These instructions assume the app uses <code>SQLAlchemy</code>. If that isn't the case, remove the referencing lines.</p>

<pre style="width:500px">
from scout_apm.flask import ScoutApm
from scout_apm.flask.sqlalchemy import instrument_sqlalchemy

# Setup a flask 'app' as normal

## Attaches ScoutApm to the Flask App
ScoutApm(app)

## Instrument the SQLAlchemy handle
instrument_sqlalchemy(db)

# Scout settings
app.config['SCOUT_MONITOR'] = True
app.config['SCOUT_KEY']     = "[AVAILABLE IN THE SCOUT UI]"
app.config['SCOUT_NAME']    = "A FRIENDLY NAME FOR YOUR APP"
</pre>

<p>If you wish to configure Scout via environment variables, use <code>SCOUT_MONITOR</code>, <code>SCOUT_NAME</code> and <code>SCOUT_KEY</code>.</p>

<p>
If you've installed Scout via the Heroku Addon, the provisioning process automatically sets <code>SCOUT_MONITOR</code> and <code>SCOUT_KEY</code> via <a href="https://devcenter.heroku.com/articles/config-vars">config vars</a>. Only <code>SCOUT_NAME</code> is required.
</p>
      </td>
    </tr>
    <tr>
      <td><span class="step">3</span></td>
      <td style="padding-top: 15px"><p>Deploy.</p></td>
    </tr>
  </tbody>
</table>

It takes approximatively five minutes for your data to first appear within the Scout UI.

<h2 id="python-troubleshooting">Troubleshooting</h2>

Not seeing data? Email support@scoutapp.com with:

* A link to your app within Scout (if applicable)
* Your Python version
* Your Django or Flask version

We typically respond within a couple of hours during the business day.

<h2 id="python-instrumented-libraries">Instrumented Libraries</h2>

Scout auto-instruments the following Python libraries:

* Django
  * Middleware
  * Templates (compiling & rendering)
  * Template blocks
  * SQL queries
* Flask
* [Celery](#celery)

More to come - suggest others in the [scout_apm_python](https://github.com/scoutapp/scout_apm_python) GitHub repo.  

## Celery

Add the following to instrument Celery workers:

<pre class="terminal" style="width: initial">
<span>import scout_apm.celery</span>
from celery import Celery

app = Celery('tasks', backend='redis://localhost', broker='redis://localhost')
<span>scout_apm.celery.install()</span>
</pre>

Tasks will appear in the "Background Jobs" area of the Scout UI.

<h2 id="python-configuration">Configuration Reference</h2>

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
        SCOUT_KEY
      </th>
      <td>
        The organization API key.
      </td>
      <td>       
      </td>
      <td>
        Yes
      </td>
    </tr>
    <tr>
      <th>
        SCOUT_NAME
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
        SCOUT_MONITOR
      </th>
      <td>
        Whether monitoring data should be reported.
      </td>
      <td>
        <code>false</code>       
      </td>
      <td>
        Yes
      </td>
    </tr>
  </tbody>
</table>

<h3 id="python-env-vars">Environment Variables</h3>

You can also configure Scout APM via environment variables. _Environment variables override settings provided in your `settings.py` file._

Environment variables use the same configuration names. For example, to set the organization key via environment variables:

```
export SCOUT_KEY=YOURKEY
```

<h2 id="python-environments">Environments</h2>

It typically makes sense to treat each environment (production, staging, etc) as a separate application within Scout and ignore the development and test environments. Configure a unique app name for each environment as Scout aggregates data by the app name.

A common approach is to set a `SCOUT_NAME` environment variable that includes the app environment:

```
export SCOUT_NAME="YOUR_APP_NAME (Staging)"
```

This will override the `SCOUT_NAME` value provided in your `settings.py` file.


<h2 id="python-logging">Logging</h2>

### Django Logging

To log Scout agent output in your Django application, copy the following into your `settings.py` file:

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'stdout': {
            'format': '%(asctime)s %(levelname)s %(message)s',
            'datefmt': '%Y-%m-%dT%H:%M:%S%z',
        },
    },
    'handlers': {
        'stdout': {
            'class': 'logging.StreamHandler',
            'formatter': 'stdout',
        },
        'scout_apm': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'scout_apm_debug.log',
        },
    },
    'root': {
        'handlers': ['stdout'],
        'level': os.environ.get('LOG_LEVEL', 'DEBUG'),
    },
    'loggers': {
        'scout_apm': {
            'handlers': ['scout_apm'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

### Flask Logging

Add the following your Flask app:

```python
dictConfig({
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'stdout': {
            'format': '%(asctime)s %(levelname)s %(message)s',
            'datefmt': '%Y-%m-%dT%H:%M:%S%z',
        },
    },
    'handlers': {
        'stdout': {
            'class': 'logging.StreamHandler',
            'formatter': 'stdout',
        },
        'scout_apm': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'scout_apm_debug.log',
        },
    },
    'root': {
        'handlers': ['stdout'],
        'level': os.environ.get('LOG_LEVEL', 'DEBUG'),
    },
    'loggers': {
        'scout_apm': {
            'handlers': ['scout_apm'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
})
```

If `LOGGING` is already defined, merge the above into the existing Dictionary.

<h2 id="python-custom-instrumentation">Custom Instrumentation</h2>

Traces that allocate significant amount of time to `View`, `Job`, or `Template` are good candidates to add custom instrumentation. This indicates a significant amount of time is falling outside our default instrumentation.

### Limits

We limit the number of metrics that can be instrumented. Tracking too many unique metrics can impact the performance of our UI. Do not dynamically generate metric types in your instrumentation (ie `with scout_apm.api.instrument("Computation_for_user_"+user.email)`) as this can quickly exceed our rate limits. 

For high-cardinality details, use tags: `with scout_apm.api.instrument("Computation", tags={ 'user': user.email})`.

### Getting Started

Import the API module:

```python
import scout_apm.api

# or to not use the whole prefix on each call:
import instrument from scout_apm.api
```

```python
scout_apm.api.instrument(name, tags={}, kind="Custom")
```

* `name` - A semi-detailed version of what the section of code is. It should be static between different invocations of the method. Individual details like `user id`, or counts or other data points can be added as tags. Names like `retreive_from_api` or `GET` are good names.
* `kind` - A high level area of the application. This defaults to `Custom`. Your whole application should have a very low number of unique strings here. In our built-in instruments, this is things like `Template` and `SQL`. For custom instrumentation, it can be strings like `MongoDB` or `HTTP` or similar. This should not change based on input or state of the application.
* `tags` - A dictionary of key/value pairs. Key should be a string, but value can be any json-able structure. High-cardinalilty fields like `user id` are permitted.

### As a Context Manager

Wrap a section of code in a unique "span" of work.

The yielded object can be used to add additional tags individually.

```python
def foo():
  with scout_apm.api.instrument("Computation 1") as instrument:
    instrument.tag("record_count", 100)
    # Work

  with scout_apm.api.instrument("Computation 2", tags={ 'filtered_record_count': 50 } ) ) as instrument:  
    # Work
```

### As a decorator

Wraps a whole function in a custom trace. This uses the same API as the ContextManager style.

```python
@scout_apm.api.instrument("Computation")
def bar():
  # Work
```

<h2 id="python-custom-context">Custom Context</h2>

[Context](#context) lets you see the forest from the trees. For example, you can add custom context to answer critical questions like:

* How many users are impacted by slow requests?
* How many trial customers are impacted by slow requests?
* How much of an impact are slow requests having on our highest paying customers?

It's simple to add [custom context](#context) to your app:

```python
# ScoutApm.Context.add(key,value)
ScoutApm.Context.add("user_email",request.user.email)
```

### Context Key Restrictions

The Context `key` must be a `String` with only printable characters. Custom context keys may contain alphanumeric characters, dashes, and underscores. Spaces are not allowed.

Attempts to add invalid context will be ignored.

### Context Value Types

Context values can be any json-serializable type. Examples:

* `"1.1.1.1"`
* `"free"`
* `100`

<h2 id="python-upgrade">Updating to the Newest Version</h2>

```python
pip install scout-apm --upgrade
```

The package changelog is [available here](https://github.com/scoutapp/scout_apm_python/blob/master/CHANGELOG.md).  
