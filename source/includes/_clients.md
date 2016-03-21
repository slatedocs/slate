# Clients

## Add Client

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "success": true,
    "client-id": 1
}
```

Adds a new client and associates it with your account.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span> 50 characters max.
company-url | <span class="label label-required">Required</span> 150 characters max
business-category-id | <span class="label label-required">Required</span> See here for a full list of valid business codes.
reference-number | An arbitrary unique reference you can use to identify a client. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.

## Update Client

<span class="label label-info">Account Method</span>

Update an existing client. Only supply values you want to update. The rest will be left unchanged.

> Success (200 OK)

```json
{
    "success": true,
    "client-id": 1
}
```

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>	
name | 50 characters max
company-url | 150 characters max
business-category-id | See here for a full list of valid business codes
reference-number | An arbitrary unique reference you can use to identify a client. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.

## Delete Client

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "success": true
}
```

Delete an existing client. If there are reports associated with this client then the association is removed but the reports are not deleted. Warning: This action cannot be undone.

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>

## Get Client

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "success": true,
    "client": {
        "client-id":1,
        "company-name": "BrightLocal",
        "status": "client",
        "client-reference": "BrightLocal-1",
        "business-category-id": 650
    }
}
```

Get extended details for a specific client.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/:id`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>

## Search Clients

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "success": true,
    "clients":  [
        {
            "client-id": 1,
            "company-name": "BrightLocal",
            "status": "client",
            "client-reference": "BrightLocal-1",
            "business-category-id": 650
        },
        {
            "client-id": 2,
            "company-name": "BrightLocal 2",
            "status": "client",
            "client-reference": "BrightLocal-2",
            "business-category-id": 650
        }
    ]
}
```

Search for clients matching a specified search string.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
q | <span class="label label-required">Required</span>
