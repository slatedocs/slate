# Data Pipeline

Data Pipeline is a process whereby a data product is technically deployed or access to the API documentation (e.g. Open Api Specification - OAS) is available. 


> Example of Data Pipeline component usage:

```javascript
   
  "pipelineDeployment": {
    "packageManager": "kubernet",
    "scriptType": "yaml",
    "status": "dev",
    "url": "http://192.168.10.1/test/runpipeline.yml"
  },
  "apiDoc": {
     "docType": "oas",
     "status": "dev",
    "url": "http://192.168.10.2/test/petstore"
  }
  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
|  ^x- | any  |  | Allows define pipelines to the Open Data Product Specification. The field name MUST begin with x-, for example, x-internal-id. The value can be null, a primitive, an array or an object. Can have any valid JSON format value. |
