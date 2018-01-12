---
title: Bird.i – Docs

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  #- javascript

toc_footers:
  - <a target="_blank" href='http://login.hibirdi.com/register.html'>Sign Up for an API Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Bird.i API documentation. Here we have documented all the features available in our API's and shown some examples on how it can be used.

The API can be accessed through HTTP ReST style endpoints, we also have a JavaScript bindings, with more to follow! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

The [Best Image] (#best-image) API is the Image API which will give the best satellite images for a location.

To get started, [sign up for an API Key](http://login.hibirdi.com/register.html). Then you can access the API and follow this document.


## Tiles

The Bird.i Image API returns lists of images which are known as **Tiles**. Multiple **Tiles** make up an image. To view these **tiles** as an image you will need to handle this when displaying them.


# Authentication

> To authorize, use the API token in every API call:


```shell
# With HTTP / ReST, you can just pass the correct token
# with each request to ensure your requests are authenticated

curl service.hibirdi.com/view/location/token/{token}
```
<!--
```javascript
<script type="text/javascript" id="birdiImageViewAPI"
src="https://api.hibirdi.com/imageView/birdiImageViewAPI.js?TOKEN={token}">
```
-->

> Make sure to replace `token` with your token.

Bird.i Image Service uses API keys to allow access to the API. Each API call is authenticated individually with your API key ('token').
You can obtain an API key at our [developer portal](http://login.hibirdi.com/register.html).


<aside class="notice">
You must replace <code>{token}</code> with your API key.
</aside>

# Best Image

All the following API endpoints always return what we perceive as the _best_
available image. This means the clearest and in most cases the freshest.

Each 'image' is made up of tiles, and the API always returns lists of tiles to
make up an image.

## Get tiles at location

```shell
curl https://service.hibirdi.com/view/location/{location}/token/{token}
```
<!---
```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```
-->
> Make sure to replace `token` with your token and `location` with lattitude
longitude as a comma separated double.

> The above command returns JSON structured like this:

```json
{
   "offset" : {
      "x" : 169,
      "y" : 197
   },
   "copyright" : "Image &copy; 2018 DigitalGlobe, Inc.",
   "lines" : [
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/16/20452/31992/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104518Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=4eefcbe0a7197aa944d895c400e0c5ab1e29e885d6e9b80a1fbadb6eb1468ec9"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/16/20452/31993/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104518Z&X-Amz-SignedHeaders=host&X-Amz-Expires=59&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=e8e23b272466521e9604a73339b199277c8fea0af9b2779f3928e9f61f5880aa"
            }
         ]
      },
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/16/20453/31992/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104518Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=4b83b65f8d8bdee22d128db6e5681539ce461b50b11d4e92edbdb025a316b00a"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/16/20453/31993/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104518Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=25a4efee00bd0ce4a2ee944fda72bdd88d5f7b9e25b06c631600685861e678ea"
            }
         ]
      }
   ],
   "date" : "11 November 2017 - 11:38"
}
```

This endpoint returns a list of tiles for a given location and some metadata.

### HTTP Request

`GET /view/location/{location}/token/{token}`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
location | none | Latitude and longitude as a comma separated double like: `55.860640,-4.258786`. **The lat and long must only be to 6 decimal places**
token | none | Your API token.

<aside class="warning">
<strong>The lat and long must only be to 6 decimal places</strong>
</aside>

## Get tiles at location and zoom

```shell
curl https://service.hibirdi.com/view/location/{location}/zoom/{zoom}/token/{token}
```
<!--
```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```
-->

> Make sure to replace `token` with your token and `location` with latitude
longitude as a comma separated double. Replace `zoom` with zoom level value between
16 and 19

> The above command returns JSON structured like this:

```json
{
   "lines" : [
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163621/255940/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=d4d21d31734dde7b7d8b3efcf5ef07454253d565df67b7594c54b5fd692a3339"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163621/255941/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=bd9cde26ff0c01d87c2aafa2d3ec29b2fc54cdfa6f6645c80817d104bdfcfb19"
            }
         ]
      },
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163622/255940/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=59&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=eff37dd3f38afd160fad102d51f1b6df9f2e73363ed0727331a493c05174fd0f"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163622/255941/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=59&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=77d05222ba71870bc0c1452a1fdda5723b900f2154a841ce11f88ef73236a7fe"
            }
         ]
      }
   ],
   "copyright" : "Image &copy; 2018 DigitalGlobe, Inc.",
   "offset" : {
      "y" : 297,
      "x" : 329
   },
   "date" : "11 November 2017 - 11:38"
}
```


This endpoint takes `location` and `zoom` level and returns a list of tiles for a
given location and some metadata.


### HTTP Request

`GET https://service.hibirdi.com/view/location/{location}/zoom/{zoom}/token/{token}`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
location | none | Latitude and longitude as a comma separated double like: `55.860640,-4.258786` **The lat and long must only be to 6 decimal places**
zoom | none | Zoom level (between 16 and 19 inclusively) format: integer
token | none | Your API token.

<aside class="warning">
<strong>The lat and long must only be to 6 decimal places</strong>
</aside>






## Get tiles at location and size


```shell
curl https://service.hibirdi.com/view/location/{location}/size/{size}/token/{token}
```
<!--
```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```
-->
> Make sure to replace `token` with your token and `location` with latitude
longitude as a comma separated double.

> The above command returns JSON structured like this:

```json
{
   "lines" : [
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163621/255940/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=d4d21d31734dde7b7d8b3efcf5ef07454253d565df67b7594c54b5fd692a3339"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163621/255941/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=bd9cde26ff0c01d87c2aafa2d3ec29b2fc54cdfa6f6645c80817d104bdfcfb19"
            }
         ]
      },
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163622/255940/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=59&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=eff37dd3f38afd160fad102d51f1b6df9f2e73363ed0727331a493c05174fd0f"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163622/255941/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=59&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=77d05222ba71870bc0c1452a1fdda5723b900f2154a841ce11f88ef73236a7fe"
            }
         ]
      }
   ],
   "copyright" : "Image &copy; 2018 DigitalGlobe, Inc.",
   "offset" : {
      "y" : 297,
      "x" : 329
   },
   "date" : "11 November 2017 - 11:38"
}
```


This endpoint takes `location` and overall image `size` and returns a list of tiles
for that location and some metadata. The number of tiles returned will depend
on the overall image `size` specified.


### HTTP Request

`GET https://service.hibirdi.com/view/location/{location}/size/{size}/token/{token}`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
location | none | Latitude and longitude as a comma separated double like: `55.860640,-4.258786` **The lat and long must only be to 6 decimal places**
size | none | Size in pixels of the display area (between 256 and 1024 inclusively). (Overall image size when tiles are combined)
token | none | Your API token.

<aside class="warning">
<strong>The lat and long must only be to 6 decimal places</strong>
</aside>

## Get tiles at location, size, zoom


```shell
curl https://service.hibirdi.com/view/location/{location}/zoom/{zoom}/size/{size}/token/{token}
```
<!---
```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```
-->
> Make sure to replace `token` with your token and `location` with latitude
longitude as a comma separated double.

> The above command returns JSON structured like this:

```json
{
   "lines" : [
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163621/255940/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=d4d21d31734dde7b7d8b3efcf5ef07454253d565df67b7594c54b5fd692a3339"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163621/255941/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=bd9cde26ff0c01d87c2aafa2d3ec29b2fc54cdfa6f6645c80817d104bdfcfb19"
            }
         ]
      },
      {
         "images" : [
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163622/255940/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=59&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=eff37dd3f38afd160fad102d51f1b6df9f2e73363ed0727331a493c05174fd0f"
            },
            {
               "image" : "https://hibirdi-image-bucket.s3-eu-west-1.amazonaws.com/19/163622/255941/digitalglobe/tile.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20180103T104704Z&X-Amz-SignedHeaders=host&X-Amz-Expires=59&X-Amz-Credential=AKIAI7OQUZOXYRAWE3RQ%2F20180103%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=77d05222ba71870bc0c1452a1fdda5723b900f2154a841ce11f88ef73236a7fe"
            }
         ]
      }
   ],
   "copyright" : "Image &copy; 2018 DigitalGlobe, Inc.",
   "offset" : {
      "y" : 297,
      "x" : 329
   },
   "date" : "11 November 2017 - 11:38"
}
```


This endpoint takes `location`, `zoom` and overall image `size` and returns a list of tiles
for that location and some metadata. The number of tiles returned will depend
on the overall image `size` specified.


### HTTP Request

`GET https://service.hibirdi.com/view/location/{location}/zoom/{zoom}/size/{size}/token/{token}`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
location | none | Latitude and longitude as a comma separated double like: `55.860640,-4.258786` **The lat and long must only be to 6 decimal places**
size | none | Size in pixels of the display area (between 256 and 1024 inclusively). (Overall image size when tiles are combined)
zoom | none | Zoom level (between 16 and 19 inclusively) format: integer
token | none | Your API token.

<aside class="warning">
<strong>The lat and long must only be to 6 decimal places</strong>
</aside>
