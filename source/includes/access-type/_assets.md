# Assets

## LIST All Assets accessible to a user

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/assets.json

{
   "assets":[
      {
         "type":"site"
      },
      {
         "type":"site"
      },
   ]
}

```