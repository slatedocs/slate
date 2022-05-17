# CloudStack plugin

The CloudStack plugin provides endpoints for carrying out operations on CloudMC compute and networking entities. While each operation has its own validation and required fields, all operations need to specify the service code and environment in which they should be carried out. The following example URL describes how to specify this information for all entities.

<code>https://cloudmc_endpoint/api/v1/services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/:entity_type</code>

<aside class="notice">
An easy way to remember the structure of API endpoints is that going from left to right, the scope gets progressively more specific. First service, then environment of that service, then entity type, then operation on that entity type, etc.
</aside>