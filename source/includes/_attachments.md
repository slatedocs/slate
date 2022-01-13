# Attachments

## GET attachments for an entity
```shell
curl -H "Content-Type:application/json" \
-H "PTToken: YOUR_TOKEN" \
https://api.practitest.com/api/v2/projects/4566/attachments.json?entity=issue&entity-id=34222

```


```json
{
  "data": [
  {
    "id":"14635",
    "type":"attachments",
    "attributes":{
      "name":"Screen_Shot_2020-05-25_at_15.32.46.png",
      "size":66220
      }
   }]
}

```


This endpoint retrieves all Attachments for a specific entity .

### HTTP Request
`GET [BASE_URL]/api/v2/projects/:project-id/attachments.json?entity=ENTITY&entity-id=ENTITY_ID`


### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
entity | The entity type: can be one of the following:  requirement, test, testset, instance, step, step-run, issue |
entity-id | the entity id |



## Show attachments for an entity
```shell
curl -H "PTToken: YOUR_TOKEN" \
-L https://api.practitest.com/api/v2/projects/4508/attachments/14635 --output downloaded.jpg

```

This will enables to download the attachment for local reporting.

### HTTP Request
`GET [BASE_URL]/api/v2/projects/:project-id/attachments/:attachment-id`

### Query Parameters

Parameters* | Description |
--------- | ------- |
attachment-id | The id that was retrieved from index method |

### Output
The output returns an html with redirect so it requires `-L` option (in curl)

<aside class="notice">
This endpoint is not a json request, and without the "Content-Type:application/json" in the header. Usually it requires an output stream. See the curl example.
</aside>



## Create an attachment
```shell
# create an attachment
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/attachments.json \
-d '{"entity": "issue", "entity-id": 23232, "data": { "type": "attachments",  "files": { "data": [ { filename: "test_data.csv", content_encoded: "whatever encoded data here.." } ] }  }}'

```

<aside class="notice">
  Available for Ultimate accounts only
</aside>


This endpoint creates attachment to an entity.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/attachments.json`

### Parameters


Parameters | Description | required? |
--------- | ------- |------- |
entity-id | The id of the entity which the attachment relates to | true
entity | Any of: requirement, test, testset, instance, step, step-run, issue | true
data/files/data | attachments array (filename, and content_encoded) | true

* attachments array includes a json hash, with these attributes: filename, and content_encoded


### PAT Support
Supported - if the user has the permissions to edit the entity.



## Delete a specific attachment
```shell
# create an attachment
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/attachments/2322.json \

```

<aside class="notice">
  Available for Ultimate accounts only
</aside>


This endpoint creates attachment to an entity.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/attachments/2322.json`
