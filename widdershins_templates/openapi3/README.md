## Swagger / OpenAPI 2 and OpenAPI 3 template parameters

Note that properties of OpenAPI objects will be in OpenAPI 3.0 form, as
Swagger / OpenAPI 2.0 definitions are converted automatically.

### Code templates

* `method` - the HTTP method of the operation (in lower-case)
* `methodUpper` - the HTTP method of the operation (in upper-case)
* `url` - the full URL of the operation (including protocol and host)
* `consumes[]` - an array of MIME-types the operation consumes
* `produces[]` - an array of MIME-types the operation produces
* `operation` - the current operation object
* `operationId` - the current operation id
* `opName` - the operationId if set, otherwise the method + path
* `tags[]` - the full list of tags applying to the operation
* `security` - the security definitions applying to the operation
* `resource` - the current tag/path object
* `parameters[]` - an array of parameters for the operation (see below)
* `queryString` - an example queryString, urlEncoded
* `requiredQueryString` - an example queryString for `required:true` parameters
* `queryParameters[]` - a subset of `parameters` that are `in:query`
* `requiredParameters[]` - a subset of `queryParameters` that are `required:true`
* `headerParameters[]` - a subset of `parameters` that are `in:header`
* `allHeaders[]` - a concatenation of `headerParameters` and pseudo-parameters `Accept` and `Content-Type`, and optionally `Authorization` (the latter has an `isAuth` boolean property set true so it can be omitted in templates if desired

### Parameter template

* `parameters[]` - an array of [parameters](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#parameterObject), including the following pseudo-properties
    * `shortDesc` - a truncated version of the parameter description
    * `safeType` - a computed version of the parameter type, including Body and schema names
    * `originalType` - the original type of the parameter
    * `exampleValues` - an object containing examples for use in code-templates
        * `json` - example values in JSON compatible syntax
        * `object` - example values in raw object form (unquoted strings etc)
	* `depth` - a zero-based indicator of the depth of expanded request body parameters
* `enums[]` - an array of (parameter)name/value pairs

### Responses template

* `responses[]` - an array of [responses](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#responseObject), including `status` and `meaning` properties

### Authentication template

* `authenticationStr` - a simple string of methods (and scopes where appropriate)
* `securityDefinitions[]` - an array of applicable [securityDefinitions](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#securityRequirementObject)

### Schema Property template

* `schemaProperties[]` - an array of
	* `name`
	* `type`
	* `required`
	* `description`
* `enums[]` - an array of (schema property)name/value pairs

### Common to all templates

* `openapi` - the top-level OpenAPI / Swagger document
* `header` - the front-matter of the Slate/Shins markdown document
* `host` - the (computed) host of the API
* `protocol` - the default/first protocol of the API
* `baseUrl` - the (computed) baseUrl of the API (including protocol and host)
