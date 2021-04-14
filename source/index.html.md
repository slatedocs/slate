---
title: Full API Documentation (Version 2) - PractiTest

description: See all available PractiTest’s API requests, sorted into sections with different methods, instructions and code examples for every request.

language_tabs:
  - curl examples - see 'Code examples' to your left


toc_footers:
  - <a href='https://www.practitest.com/help/account/account-api-tokens/' target="_blank">How to get an API Token</a>
  - <a href='https://discuss.practitest.com/c/api' target="_blank">API &nbsp;Users Group</a>
  - <a href='https://discuss.practitest.com/t/faq-section/240' target="_blank">API &nbsp;FAQ</a>


includes:
  - authentication
  - pagination
  - projects
  - groups
  - users
  - attachments
  - project_fields
  - custom_fields
  - requirements
  - requirement_traceability
  - tests
  - test_traceability
  - steps
  - sets
  - instances
  - runs
  - step_runs
  - issues
  - issue_traceability
  - errors

search: true
---

<!--
- kittens_example

-->

# PractiTest API V2

## Welcome to the PractiTest's REST API V2!

The REST API is designed for developers who want to integrate PractiTest into their application, synchronize issue trackers or develop any other tool integration with PractiTest.
The API also enables organizations to update their automated test results into PractiTest.

We have language bindings in Shell, Ruby, Python, Java and C#! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## JSON API
All along this api we've embraced <a href="http://jsonapi.org/" target="blank">JSON API</a> standards, for share conventions and to save you (and us) precious time.

## API rate limit

PT has active policies that limit the number of API calls that can be made per minute by each account.  

If an account performs more than 30 API calls in a single minute you will get an error indicating this issue.  The error will stop any further calls from reaching the server during that minute, but once the minute passes, you will be able to continue sending calls, there is nothing else that needs to be done (other than solving the the problem of multiple / parallel API calls ).

The idea behind this policy is to help users detect possible issues where the API is being implemented incorrectly, as well as to limit potential disruptions to our service due to this type of incorrect API implementations.

If you have any reason to believe that you need a higher rate limit, please contact our support.

## Base URL
Sometimes you may see in the description of resource [BASE_URL]. The reason is that this is dynamic and may change, depends on which datacenter you're working on.

If your account is hosted in US servers (url is https://prod.practitest.com), then the BASE_URL should be: https://api.practitest.com
For EU servers, the BASE_URL is: https://eu1-prod.practitest.app/

## Assigned To
You can assign an entity to a User or to a Group using the assigned-to-id and assigned-to-type.
When you want to assign an entity to a Group, you need to make sure "Assign to Group" is enabled in your Project General Settings.

assigned-to-id and assigned-to-type are not required. If only assigned-to-id is passed, then type will be considered as user.
So when assign to a group is desired, "assigned-to-type: group" must be passed.


# Code examples
We put popular languages code examples under Github. Please feel free to view, and pull request if you have any updates:
<a href="https://github.com/PractiTest/pt-api-examples/" target="blank">PractiTest Api Code Examples in Github</a>.

## Python

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/get_request.py" target="blank">GET example</a> for retrieving all projects

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/post_request.py" target="blank">POST example</a> for creating a new instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/put_request.py" target="blank">PUT example</a> for updating a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/delete_request.py" target="blank">DELETE example</a> for deleting a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/create_run_attachments_v2.py" target="blank">POST example (with attachments) for Python version 2</a> for uploading test results to PractiTest with files

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/create_run_attachments_v3.py" target="blank">POST example (with attachments) for Python version 3</a> for uploading test results to PractiTest with files




## Ruby

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/ruby/get_request.rb" target="blank">GET example</a> for retrieving all projects

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/ruby/post_request.rb" target="blank">POST example</a> for creating a new instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/ruby/put_request.rb" target="blank">PUT example</a> for updating a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/ruby/delete_request.rb" target="blank">DELETE example</a> for deleting a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/ruby/runs.rb" target="blank">POST example (with attachments)</a> for uploading test results to PractiTest with files

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/ruby/selenium_example.rb" target="blank">Selenium example with POST request </a> for uploading test results to PractiTest with steps



## Java

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/java/src/main/java/com/practitest/examples/GetWithResponse.java" target="blank">GET example</a> for retrieving all projects

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/java/src/main/java/com/practitest/examples/PostRequest.java" target="blank">POST example</a> for creating a new instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/java/src/main/java/com/practitest/examples/PutRequest.java" target="blank">PUT example</a> for updating a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/java/src/main/java/com/practitest/examples/DeleteRequest.java" target="blank">DELETE example</a> for deleting a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/java/src/main/java/com/practitest/examples/RunWithAttachments.java" target="blank">POST example (with attachments)</a> for uploading test results to PractiTest with files


## C sharp (.Net)

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/csharp/get_request.cs/" target="blank">GET example</a> for retrieving all projects
will be added soon.

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/csharp/post_request.cs" target="blank">POST example</a> for creating a new instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/csharp/put_request.cs" target="blank">PUT example</a> for updating a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/csharp/delete_request.cs" target="blank">DELETE example</a> for deleting a specific instance

<a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/csharp/create_run_attachments.cs" target="blank">POST example (with attachments)</a> for uploading test results to PractiTest with files
