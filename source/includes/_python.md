# Python Agent

<aside class="notice">Python Monitoring is in our early access program. <a href="https://docs.google.com/forms/d/e/1FAIpQLSfZtTYaAtbbAveQ5j2wcR5UJeDnH5KUiHc6DwnH1Qjk_OBtYA/viewform" target="_blank">Signup for access</a>.</aside>

Scout's Python agent auto-instruments Django applications, SQL queries, and more.

<h2 id="python-requirements">Requirements</h2>

* Python 2.7 and 3.4+
* Django 1.8+

<h2 id="python-install">Installation</h2>

Tailored instructions are provided within our user interface. General instructions for a Django 1.8+ app:

<table class="help install install_ruby">
  <tbody>
    <tr>
      <td>
        <span class="step">1</span>
      </td>
      <td style="padding-top: 15px">
        <p>Install the <code>scout_apm</code> package:</p>
<pre style="width:500px">
pip install scout_apm
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
  # ... other apps ...
  'scout_apm.django',
)

# Scout settings
SCOUT_MONITOR = True
SCOUT_KEY     = "[AVAILABLE IN THE SCOUT UI]"
SCOUT_NAME    = "[A FRIENDLY NAME FOR YOUR APP]"
</pre>

<p>If you wish to configure Scout via environment variables, use <code>SCOUT_MONITOR</code>, <code>SCOUT_NAME</code> and <code>SCOUT_KEY</code> instead of providing these settings in <code>settings.py</code>.</p>

<p>
If you've installed Scout via the Heroku Addon, the provisioning process automatically sets the required settings via <a href="https://devcenter.heroku.com/articles/config-vars">config vars</a>. A configuration file isn't required.
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
* Your Django version

We typically respond within a couple of hours during the business day.

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

