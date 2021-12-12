# Data Pipeline

Data Pipeline is a process whereby a data product pipeline deployment method is defined.

> Example of Data Pipeline component usage:

```javascript
   
  "dataPipeline": {
    "packageManager": "helm",
    "scriptType": "yaml",
    "status": "dev",
    "DeploymentScriptURL": "http://192.168.10.1/test/runDataPipeline.yml"
    "DeploymentDocumentationURL": "http://192.168.10.1/test/docs/DocsDataPipeline.html"
  }
  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
  | packageManager | string | any | A name of the package manager or tool |
  | scriptType | string  | any |  Type of script language|
  | status | string  | Options for unit are: dev, test, prod. | a phase of deployment. |
  | DeploymentScriptURL | URL | Valid URL  | 	The URL of the deployment script. |
  | DeploymentDocumentationURL | URL | Valid URL  | 	The URL of the deployment documentation |