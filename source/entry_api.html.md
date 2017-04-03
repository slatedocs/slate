---
title: go~mus Entry API Documentation

toc_footers:
  - <a href='https://gomus.de'>go~mus</a>
  - <a href='https://github.com/tripit/slate'>Documentation powered by Slate</a>

includes:
  - errors

search: true
---

# Preparation

Before you can use the go~mus Entry API you will have to register an API account with an API key. 
Please talk to your contact person in order to get access.

See [detailed documentation on Public API](/public_api.html) for information on how to request the basic data 
for events, tours and tickets.


# Barcodes

We track tickets, events and tours by using barcodes. The barcodes encode unique codes. 
These codes can be used track entry and exit events.
 
Barcodes may be encoded as Code128 or Code39. Additionally barcodes may also be encoded in 2D as a QR-Code. 


## Status API

The status of a barcode can be queried as follows:


`GET https://demo.gomus.de/api/v3/barcodes/:barcode`

```shell
curl "https://demo.gomus.de/api/v3/barcodes/:barcode"
```

If everything is ok and the barcode is still valid a 200 OK is returned.

> Additionally the JSON may contain a message:


```json
{
    "message": "Eintritte: 1"
}
```


If the barcode was already used or is for some other reason invalid then an error gets returned.
The HTTP status code will be 422 Unprocessable Entity.


> The JSON if an error occured:

```json
{
    "error": "Barcode wurde schon eingelöst am 13.03.2017"
}
```

    
## Entry API - Voiding the barcode

To do an actual entry and possibly void the barcode an PUT needs to be sent.

`PUT https://demo.gomus.de/api/v3/barcodes/:barcode`

```shell
curl -XPUT "https://demo.gomus.de/api/v3/barcodes/:barcode"
```


This will return the same responses as the Status API above. 
HTTP 200 OK for success and HTTP 422 Unprocessable Entity in case of error.

The barcode will be voided in the process.


In practice it is common to call the Status API first and then void the barcode.


## Exit API - Tracking exits 

This API is for tracking exits

`PUT https://demo.gomus.de/api/v3/barcodes/:barcode/exit`

```shell
curl -XPUT "https://demo.gomus.de/api/v3/barcodes/:barcode/exit"
```


This will return responses in the same structure as the Status API above. 
HTTP 200 OK for success and HTTP 422 Unprocessable Entity in case of error. 




## Additional Parameters

The following parameters can be used to set additional infos:

- location : string - where did the entry or exit happen


You can transmit these parameters in the URL. For example:

```
PUT https://demo.gomus.de/api/v3/barcodes/:barcode/exit?location=Haupthaus
```


# Best practices

## Turnstiles

When using turnstiles it is best practice to only void the barcode if the visitor actually goes through.
In some cases the visitor may scan his ticket barcode but then not walk through. 
He should be able to re-scan his ticket barcode and then walk through.  

