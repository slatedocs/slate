# Data Pipeline

Pipeline component.....


> Example of Pipeline component usage:

```javascript
   
"dataPipeline": {
  "infrastructure":{
    "composer": "helm",
    "format": "yaml",
    "status": "development",
    "scriptURL": "http://192.168.10.1/test/runDataPipeline.yml"
    "documentationURL": "http://192.168.10.1/test/docs/DocsDataPipeline.html"
  },
  "dataAccess"{
    "type": "API",
    "specification":"OAS",
    "format":"JSON",
    "specURL":"https://swagger.com/petstore.json",
    "documentationURL":""
  }
}

  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| composer | string | any | A name of the package manager, composer or tool |
| format | string  | any |  Type of script language|
| status | string  | Options for unit are: announcement, draft, development, testing, acceptance, production, sunset, retired |
| DeploymentScriptURL | URL | Valid URL  | 	The URL of the deployment script. |
| DeploymentDocumentationURL | URL | Valid URL  | 	The URL of the deployment documentation |
