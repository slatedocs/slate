# Schemas 

The Schema Object allows the definition of input and output data types. These types can be objects, but also primitives and arrays. For more information about the properties, see [JSON Schema Core](https://tools.ietf.org/html/draft-wright-json-schema-00) and [JSON Schema Validation](https://tools.ietf.org/html/draft-wright-json-schema-validation-00). Unless stated otherwise, the property definitions follow the JSON Schema.

The schemas can be defined as referenced (URL or local file systen path). In the future versions specification it is likely that support for inline schemas is added. This object is intended to be used with API accessed data products. The Schemas contain elements for payload and query separately.

> Example of Schemas object usage:

```javascript
   "Schemas": {
      "group": {
         "name":"",
         "description":"",
         "query":{
            "type":"ref",
            "schemaURL":"https://myschemas.org/objects/query.json",
            "documentation":""
         }
         "responsePayload":{
            "type":"ref",
            "schemaURL":"https://myschemas.org/objects/payload.json",
            "documentation":""
         }
      }
   }

```
### Properties of schemas

The following properties are taken directly from the JSON Schema definition and follow the same specifications:

* title
* multipleOf
* maximum
* exclusiveMaximum
* minimum
* exclusiveMinimum
* maxLength
* minLength
* pattern (This string SHOULD be a valid regular expression, according to the Ecma-262 Edition 5.1 regular expression dialect)
* maxItems
* minItems
* uniqueItems
* maxProperties
* minProperties
* required
* enum

The following properties are taken from the JSON Schema definition but their definitions were adjusted to the Open Data Pooduct Specification.

* type - Value MUST be a string. Multiple types via an array are not supported.
* allOf - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
* oneOf - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
* anyOf - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
* not - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
* items - Value MUST be an object and not an array. Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema. items MUST be present if the type is array.
* properties - Property definitions MUST be a Schema Object and not a standard JSON Schema (inline or referenced).
* additionalProperties - Value can be boolean or object. Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema. Consistent with JSON Schema, additionalProperties defaults to true.
* description - CommonMark syntax MAY be used for rich text representation.
* format - See Data Type Formats for further details. While relying on JSON Schema's defined formats, the Open Data Product Specification offers a few additional predefined formats.
* default - The default value represents what would be assumed by the consumer of the input as the value of the schema if one is not provided. Unlike JSON Schema, the value MUST conform to the defined type for the Schema Object defined at the same level. For example, if type is string, then default can be "foo" but cannot be 1.
