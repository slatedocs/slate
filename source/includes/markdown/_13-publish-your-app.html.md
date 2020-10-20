<hr class="full-line">
<section class="full-section">
<section>

# Developer Sandbox

<span class="description">
An Asana developer sandbox consists of a temporary Asana domain with limited users. It is essentially a standard Asana account where you can test premium features during development.
</span>

#### Developer Sandboxes are intended for:
* Developers building or maintaining a 3rd-party integration with Asana (submit your completed integration to get listed on our apps page)
* Existing premium Asana customers that require a separate environment to perform risk-free testing on the API 

To request a developer sandbox, please fill out **[this form](https://form-beta.asana.com?hash=b9bca5d2a3ff59b9a7f82d29086e2d9bcd0df6fd306aa81bd96a63405d5948db&id=1113032351814260)**.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>
</select>



<hr>
<section>
# API Explorer

<span class="description">
The Asana API Explorer is a tool to easily make API requests in your browser and quickly test various routes, fields, and parameters. 

The explorer is not meant to be an exhaustive tool with every endpoint in the API (try [Postman](/docs/using-postman) if you want a tool with complete coverage). Instead, the explorer is designed to be a simple tool to help developers quickly access the API and see examples of requests and responses fetching real Asana data.  
</span>

#### Follow these steps to get started:

1. Go to the API Explorer site: <a href="https://developers.asana.com/explorer" target="_blank">https://developers.asana.com/explorer</a>

2. Click the large button that says “Click to authorize API Explorer”. This will use your Asana credentials to provide cookie authentication for the requests you make in the explorer. Because the explorer is using your Asana account, it only allows read requests (i.e. `GET` only) to protect against unintentionally changing your Asana data.

3. Choose the resource you wish to query from the drop-down. 

4. In the next drop-down, choose your desired route for that resource. 

5. Under "Include Fields," You have the option to select only the fields you would like to include in the response (more about [I/O options](/docs/input-output-options)). 

6. The default response limit is 10. You can increase it up to 100.

7. Add the required “Attribute parameters”. Note that task and project gids are in URLs when viewing those resources in the Asana web product (e.g. when viewing a task in a project: https<nolink>://app.asana.com/0/'project-gid'/'task-gid'). 

8. In subsequent requests, you may have a pagination token (see the [pagination docs](/docs/pagination) for more on this) to paste into the “Offset” field.

9. You have the option to include additional parameters in your request.

10. Click “Submit” to send your request to the API. You will receive a JSON pretty-formatted response.   


<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>
</section>


<hr>
<section>
# Submit your App

<span class="description">
Have you built a web application that you want to share with the Asana community? Submit [this form](https://www.asana.com/apps/submit) to get your app listed in the [Asana apps directory](https://www.asana.com/apps).
</span>

### Recommendations and resources for app developers:

* We strongly recommend that you use [OAuth 2.0](/docs/oauth) for your app. Apps that don’t use Auth 2.0 will likely not be approved for listing in our directory.

* Be aware of the [OWASP Top 10 Web App Security Risks](https://owasp.org/www-project-top-ten/) when developing your app. 

* If you are new to app security, we recommend reading [The Web Application Hacker's Handbook](https://www.amazon.com/The-Web-Application-Hackers-Handbook/dp/1118026470).

* Use end-to-end encryption. Use a trusted site to test your TLS security (such as: https://www.ssllabs.com/ssltest/).

* Join the [Asana developer community](https://forum.asana.com/c/developersAPI). This is the best resource to get technical questions answered as well as get notified about new API features, deprecations, and other breaking changes. 

* Once your app is listed, you can answer Asana user questions in the [integrations section of the Asana community](https://forum.asana.com/c/integrations).

### Updating your existing app listing
If you wish to update your existing listing, send an email to api-support at asana.com with the specific changes. 

We expect existing apps to maintain the same level of user experience that they had when accepted to the apps directory.  


<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>
</section>

</section>