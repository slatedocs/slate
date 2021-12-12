# Specification extensions

While the Open Data Product Specification tries to accommodate most use cases, additional data can be added to extend the specification at certain points.

The extensions properties are implemented as patterned fields that are always prefixed by "x-". The extensions may or may not be supported by the available tooling, but those may be extended as well to add requested support (if tools are internal or open-sourced).



> Example of extension usage:

```javascript
   "Product": {
      "name":"Pets of the year",
      "productID":"123456are",
      "description":"",
      "x-internal-id":"foobar123"
}

```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
|  ^x- | any  |  | Allows extensions to the Open Data Product Schema. The field name MUST begin with x-, for example, x-internal-id. The value can be null, a primitive, an array or an object. Can have any valid JSON format value. |