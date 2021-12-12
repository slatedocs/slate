# Data Pipeline

Data Pipeline is the process whereby a data product is technically deployed or access to the API documentation (e.g. Open Api Specification - OAS) is defined. 


> Example of Data Pipeline component usage:

```javascript
   
  "Pipeline": {
    "packageManager": "kubernet",
    "scriptType": "yaml",
    "status": "dev",
    "url": "http://192.168.10.1/test/runpipeline.yml"
  },
  "apiDoc": {
     "docType": "oas",
    "url": "http://192.168.10.1/test/petstore"
  }
  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
|  ^x- | any  |  | Allows pipelines to the Open Data Product Schema. The field name MUST begin with x-, for example, x-internal-id. The value can be null, a primitive, an array or an object. Can have any valid JSON format value. |
