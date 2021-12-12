# Data Pipeline

Data Pipeline is a process whereby a data product pipeline deployment method is defined.

> Example of Data Pipeline component usage:

```javascript
   
  "DataPipeline": {
    "packageManager": "kubernet",
    "scriptType": "yaml",
    "status": "dev",
    "url": "http://192.168.10.1/test/runpipeline.yml"
  }
  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
|  ^x- | any  |  | Allows define data pipelines to the Open Data Product Specification. The field name MUST begin with x-, for example, x-internal-id. The value can be null, a primitive, an array or an object. Can have any valid JSON format value. |
