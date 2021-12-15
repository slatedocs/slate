# Data Pipeline


Data Pipeline is a process whereby a data product pipeline deployment method is defined. Usually the deployment script contains the logic of the individual steps as well as the code chaining the steps together.

Data Pipeline Object's purpose is enabling building, deploying, and running the data product’s code, and storing and giving access to data and metadata. This priciple has been adopted from Data Mesh.

> Example of Data Pipeline component usage:

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

