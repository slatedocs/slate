---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to Kurir API! You can use our API to access Kurir API endpoints, which can get information for Kurir App like sender, items, receiver etc. You can view code examples in the dark area to the right.

This example API documentation page was created with [Slate](https://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> In the meantime there is no authentication yet.

# Items

## Create Item

```shell
curl --request POST \
  --url http://localhost:3000/api/item/create \
  --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  --form name=string \
  --form deadline=string \
  --form price=integer \
  --form value=integer \
  --form note=string \
  --form weight=integer
```

> If the curl above succeed then it will return json with structure like this:

```json
[{
  "msg": "berhasil menambah item baru", 
  "ok": true    
}]
```
> If the curl above fails then it will return json with a structure like this:

```json
[{
  "msg": "gagal create item", 
  "ok": false    
}]
```

## Create Pickup Address for Item

```shell
curl --request PUT \
  --url http://localhost:3000/api/item/custom-address/:itemId/
```

> If the curl above succeed then it will return json with structure like this:

```json
[{
  "msg": "berhasil ubah jadi punya custom pickup address", 
  "ok": true    
}]
```

# Sender

## Create Sender

```shell
curl --request POST \
  --url http://localhost:3000/api/item/sender/create \
  --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  --form name=string \
  --form email=string \
  --form password=string 
```

> If the curl above succeed then it will return json with structure like this:

```json
[{
  "msg": "berhasil membuat sender baru", 
  "ok": true    
}]
```

# Receiver

## Create Receiver

```shell
curl --request POST \
  --url http://localhost:3000/api/item/sender/receiver \
  --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  --form name=string \
  --form address=string \
  --form phone=string 
```

> If the curl above succeed then it will return json with structure like this:

```json
[{
  "msg": "berhasil menambah receiver baru", 
  "ok": true    
}]
```

> If the curl above fails then it will return json with a structure like this:

```json
[{
  "msg": "gagal create receiver", 
  "ok": false    
}]