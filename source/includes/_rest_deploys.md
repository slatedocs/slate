# Deploy Endpoints

You can access all deploys for a specific site.

## Get All Deploys

### HTTP Request

`GET /sites/{:site_id}/deploys`

> Example Response

``` json
[
  {
  	"id": "52465f435803544542000001",
  	"premium": false,
  	"claimed": true,
  	"name": "synergy",
  	"custom_domain": "www.example.com",
  	"notification_email": "me@example.com",
  	"url": "http://www.example.com",
  	"deploy_url": "http://52465f435803544542000001.some-site.bitballoon.com",
  	"admin_url": "https://api.netlify.com/sites/synergy",
  	"screenshot_url": null,
  	"created_at": "2013-09-17T05:13:08Z",
  	"updated_at": "2013-09-17T05:13:19Z",
  	"user_id": "51f60d2d5803545326000005",
  	"state": "old"
  }
]
```

## Get a Deploy

`GET /sites/{:site_id}/deploys/{:deploy_id}`

or

`GET /deploys/{:deploy_id}`

> Example Response

``` json
{
  "id":"52465f435803544542000001",
  "premium":false,
  "claimed":true,
  "name":"synergy",
  "custom_domain":"www.example.com",
  "notification_email": "me@example.com",
  "url":"http://www.example.com",
  "deploy_url": "http://52465f435803544542000001.some-site.bitballoon.com",
  "admin_url":"https://api.netlify.com/sites/synergy",
  "screenshot_url":null,
  "created_at":"2013-09-17T05:13:08Z",
  "updated_at":"2013-09-17T05:13:19Z",
  "user_id":"51f60d2d5803545326000005",
  "state": "old"
}
```

## Restore Deploy

Restore an old deploy and make it the live version of the site

### HTTP Request

`POST /sites/{:site_id}/deploys/{:deploy_id}/restore`

or

`POST /deploys/{:deploy_id}/restore`

> Example Response

```json
{
  "id":"52465f435803544542000001",
  "premium":false,
  "claimed":true,
  "name":"synergy",
  "custom_domain":"www.example.com",
  "notification_email":"me@example.com",
  "url":"http://www.example.com",
  "deploy_url": "http://52465f435803544542000001.some-site.bitballoon.com",  
  "admin_url":"https://api.netlify.com/sites/synergy",
  "screenshot_url":null,
  "created_at":"2013-09-17T05:13:08Z",
  "updated_at":"2013-09-17T05:13:19Z",
  "user_id":"51f60d2d5803545326000005",
  "state": "current"
}
```
