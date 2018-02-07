# Assets

## LIST All Assets accessible to a user

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://accesstype.com/api/v1/subscribers/<provider>/<identity>/assets.json

{
   "assets":[
     {
       "id":5,
       "asset_category_id":1,
       "metadata":{},
       "title":"public",
       "type":"site"
     }
   ]
}

```
