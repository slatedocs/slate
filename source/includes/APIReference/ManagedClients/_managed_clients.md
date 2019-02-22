# Managed Clients

## The Managed Client Object

 > **Example**

```json
{ 
  "id":"1146",
  "company_url":"acmedev",
  "company_name":"Acme Dev",
  "active":true,
  "created":"2018-05-31T16:52:50+00:00",
  "last_modified":"2018-08-08T22:23:34+00:00"
}
```

Following is a list of the properties that belong to a managed client object, and a description of each

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of the managed client. |
| **company_url**<br/>read-only | _String_ | URL used by the managed client to sign in to TSheets. |
| **company_name**<br/>read-only | _String_ | Name of the managed client's company. |
| **active**<br/>read-write | _Boolean_ | If false, this client is considered archived. |
| **created**<br/>read-only | _String_ | Date/time when this managed client record was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **last_modified**<br/>read-only | _String_ | Date/time when this managed client record was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |

 