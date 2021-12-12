# Data Pipeline

Data Pipeline is a process whereby a data product pipeline deployment method is defined.

> Example of Data Pipeline component usage:

```javascript
   
  "DataPipeline": {
    "packageManager": "helm",
    "scriptType": "yaml",
    "status": "dev",
    "URL": "http://192.168.10.1/test/runpipeline.yml"
  }
  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
  | packageManager | string | any | Name of the package manager that allows developers to deploy the data product and data pipeline, e.g. Helm for Kubernetes |
  |scriptType | string  | any |  Data serialization language that is used for writing configuration files, e.g. yaml|
  | status | string  | Options for unit are: dev, test, prod. | .... |
  | URL | URL | Valid URL  | 	The URL of the deployment script. |
