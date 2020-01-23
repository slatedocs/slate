### Releases


<!-------------------- LIST RELEASES -------------------->

#### List releases

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/releases"

# The above command returns JSON structured like this:
```
```json
{
  "data": [
    {
      "name": "alavoie",
      "info": {
        "first_deployed": "2020-01-18T09:33:57.147149-05:00",
        "last_deployed": "2020-01-20T10:01:41.76109-05:00",
        "deleted": "",
        "description": "Upgrade complete",
        "status": "deployed",
        "notes": "Thanks for installing the MasterPortal API!\n\nIf you run \n$ kubectl get pods\n\nYou should see that the master-portal-api pods have an error. Don't panic! You have to unseal\nthe Vault and assign a token so the proxy and api can both communicate with this.\n\nTo do this you must run the command on any vault pod the delongs to the deployment.\n\n$ kubectl exec -it <VAULT_POD_NAME> vault operator init\n\nIMPORTANT: SAVE THE KEYS AND THE ROOT TOKEN IN A SAFE PLACE.\n\nNow you must unseal all your Vaults! This is a bit tedious.\n\n$ kubectl exec -it <VAULT_POD_NAME> vault operator unseal <KEY_NAME>\n\nYou must do this x3 (by default) with every Vault pod in the deployment with\na different key that you copied from the output above.\n\nOnce you've done this you should see your vault pods with Running 1/1.\n\nNow another manual step!\nYou must edit both the config maps for traefik and master-portal-api. \n\nRun: \n\n$ kubectl edit cm alavoie-traefik \n\nAnd replace the proxyPolicyToken with your vault token.\n\n$ $ kubectl edit cm alavoie-master-portal\n\nAnd replace the vaultToken value with your vault token.\n\nNow the last step! You need to manually delete all your master-portal and traefik pods\nthat are currently running in order for the config maps to reload.\n\nIf you run \n\n$ kubectl get pods \n\nYou should now see everything is running smoothly! It may take a bit of time before \neverything is running."
      },
      "chart": {
        "insecureServer": false,
        "metadata": {
          "name": "master-portal",
          "description": "A Helm chart for the MasterPortal application.",
          "sources": [
            "https://github.com/cloudops/master-portal-helm",
            "https://github.com/cloudops/master-portal-api",
            "https://github.com/cloudops/master-portal-proxy"
          ],
          "version": "0.4.0"
        }
      },
      "version": 2,
      "namespace": "default"
    },
    {
      "name": "my-aerospike",
      "info": {
        "first_deployed": "2020-01-20T09:35:02.267449-05:00",
        "last_deployed": "2020-01-20T09:35:02.267449-05:00",
        "deleted": "",
        "description": "Install complete",
        "status": "deployed",
        "notes": "The Aerospike can be accessed via port 3000 on the following DNS name from within your cluster:\n\n  my-aerospike.default.svc.cluster.local\n\nYou can connect to aeropike in your local machine using port-forwarding:\n\n  export POD_NAME=$(kubectl get pods --namespace default -l \"app=aerospike,release=my-aerospike\" -o jsonpath=\"{.items[0].metadata.name}\")\n  kubectl  --namespace default port-forward $POD_NAME 3000:3000\n"
      },
      "chart": {
        "insecureServer": false,
        "metadata": {
          "name": "aerospike",
          "description": "A Helm chart for Aerospike in Kubernetes",
          "home": "http://aerospike.com",
          "keywords": [
            "aerospike",
            "big-data"
          ],
          "maintainers": [
            {
              "name": "kavehmz",
              "email": "kavehmz@gmail.com"
            },
            {
              "name": "okgolove",
              "email": "okgolove@markeloff.net"
            }
          ],
          "sources": [
            "https://github.com/aerospike/aerospike-server"
          ],
          "icon": "https://s3-us-west-1.amazonaws.com/aerospike-fd/wp-content/uploads/2016/06/Aerospike_square_logo.png",
          "appVersion": "v4.5.0.5",
          "version": "0.3.2"
        }
      },
      "version": 1,
      "namespace": "default"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases</code>

Or

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases?namespace=default</code>



Retrieve a list of all releases in a given [environment](#administration-environments)

	 
Optional | &nbsp;
------- | -----------
`namespace` <br/>*string* | The namespace to list the release. This needs the exact value.  


Attributes | &nbsp;
------- | -----------
`name` <br/>*string* | The name of the release.  
`info` <br/>*object* | The information about the release
`info.first_deployed` <br/>*string* | The annotations of the pod
`info.last_deployed` <br/>*string* | The date of creation of the pod as a string
`info.deleted` <br/>*string* | The labels associated to the pod and there associated values
`info.description` <br/>*string* | The name of the pod
`info.status` <br/>*string* | The status of the release. Possible values are unknown, deployed, uninstalled, superseded, failed, uninstalling, pending-install, pending-upgrade, pending-rollback
`info.notes` <br/>*string* | The notes linked to the release
`chart`<br/>*object* | The information related to the chart of used in the release
`chart.version` <br/>*string* | The version of the chart
`chart.insecureServer` <br/>*boolean* | If the connection to the chart is insecure
`chart.metadata` <br/>*object* | The metadata associated to the chart
`chart.metadata.name` <br/>*string* | The name of the chart
`chart.metadata.description` <br/>*string* | The description of the chart
`chart.metadata.sources` <br/>*list* | The list of source of the charts
`chart.metadata.version` <br/>*string* | The version of the chart
`chart.metadata.keywords` <br/>*list* | The list of keywords linked to the chart
`chart.metadata.maintainers` <br/>*list* | The list of the maintainer contact information
`chart.metadata.icon` <br/>*object* | The icon for the chart
`chart.metadata.appVersion` <br/>*object* | The version of the application
`version`<br/>*string* | The revision of the release
`namespace`<br/>*string* | The namespace to which the release is deployed

The information is not totally returned in the list. We filter out the manifest portion. We also filter ou  returning the files and the templates of the charts details. This information will be present in the get request for an individual release.



