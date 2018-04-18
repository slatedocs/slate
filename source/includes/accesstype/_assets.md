# Assets

## LIST All Assets accessible to a user

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/assets.json

{
   "assets":[
     {
       "metadata":{},
       "title":"public",
       "type":"site"
     }
   ]
}

```
