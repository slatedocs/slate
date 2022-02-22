# Asset Access
The Asset Access endpoints allow you to download user assets data with user information from SIERA. You can also upload new asset access, update asset access or delete them from a given instance in SIERA.

## Get user asset access list

```shell
```
> GET /api/v1/assetaccess/{authId}

```shell
curl https://api.sieraglobal.com/api/v1/assetaccess{authId} \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```
> Response (200)

```json

{
  "user": {
    "userName": "CTDE@evoraglobal.com",
    "company": "CTDE",
    "role": "Standard",
    "numberOfAssets": 3,
    "email": "CTDE@evoraglobal.com",
    "image":""
  },
  "assets": [
    {
      "assetName": "Zalophus_MJL",
      "assetFund": "Central London Office Fund",
      "assetType": "44447 Carioca Crossing",
      "assetAccessId": 75922
    },
   
    {
      "assetName": "Mabuya_MEE",
      "assetFund": "Vanquish Properties (UK) LP Fund",
      "assetType": "9896 Hoard Avenue",
      "assetAccessId": 75932
    },
    {
      "assetName": "Grundbesitz_CWE",
      "assetFund": "Grundbesitz Europa",
      "assetType": "07227 Morrow Crossing",
      "assetAccessId": 75939
    }
  ]
}
```

**Summary:** Provides user information along with  list of all assets for which user have access in the API caller's instance in SIERA.
### HTTP Request 
`GET /api/v1/assetaccess{authId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| authId | path | A valid authorizaiton guid of a user stored in SIERA | Yes | **Guid** |

**Response Body**

The response body will include user information along with  list of all assets for which user have access in the API caller's instance in SIERA.

| Attribute | Type and description |
| ---- | ----------- |
| `user` | **custom object**<br/>json object with user information |

| User Attributes | Type and description |
| ---- | ----------- |
| `userName` | **string**<br/>UserName of a user |
| `company` | **string**<br/>company name of a user |
| `role` | **string**<br/>User role name for resource access authorization  |
| `numberOfAssets` | **Integer**<br/>list of assets assigned to user |
| `email` | **string**<br/>User email address |
| `image` | **string**<br/>User image |

| Attribute | Type and description |
| ---- | ----------- |
| `assets` | **custom object**<br/>json  list object with user asset information |

| Assets Attributes | Type and description |
| ---- | ----------- |
| `assetName` | **string**<br/>The name of the asset |
| `assetFund` | **string**<br/>The  fund name of the asset |
| `assetType` | **string**<br/>The type of the asset fund |
| `assetAccessId` | **Integer**<br/>Asset Access Id for this asset |

## Upload a new asset access

```shell
```
> POST /api/v1/assetAccess

```shell
curl POST https://api.sieraglobal.com/api/v1/assetaccess \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  { 
    "propertyId": "7765 ",
    "expiryDate": "2022-02-21T13:21:32.340Z ",
    "authId": "9641DF82-5EB4-43F7-BEC4-6D0B9356E3E3",
  }
  ```
> Response (201)

**Summary:** Uploads a new asset access

### HTTP Request 
`POST /api/v1/assetaccess` 

**Request body**

| Attribute | Type and description |
| ---- | ----------- |
| `propertyId` | **Integer**<br/>assetId |
| `expiryDate` | **Datetime**<br/>Expiry for  an asset access |
| `authId` | **Guid**<br/>User authotizatin id|


**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Created |
| 400 | Validation failure, one or more of the enumerations were not correctly identified |
| 401 | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500 | Server error |

## Update an asset access

```shell
```
> PUT /api/v1/assetaccess/{assetaccessId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/assetaccess/75922 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  { 
    "expiryDate": "2022-02-21T13:21:32.340Z"
  }
```
> Response (200)

**Summary:** Update an existing asset access by assetaccessId

### HTTP Request 
`PUT /api/v1/assetaccess/{assetaccessId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetaccessId | path | The id of the assetaccess to be updated in SIERA | Yes | **integer** |

**Request body**

| Attribute | Type and description |
| ---- | ----------- |
| `expiryDate` | **Datetime**<br/>Expiry datetime for an aaset access |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 400 | Validation failure, one or more of the enumerations were not correctly identified |
| 401 | Not found, the specified assetaccess id does not exist in the caller's instance or was not found |
| 500 | Server error |

## Delete an asset access

```shell
```
> DELETE /api/v1/assetaccess/{assetaccessId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/assetaccess/75922 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```
> Response (200)

**Summary:** Deletes an existing asset access by assetaccessid

### HTTP Request 
`DELETE /api/v1/assetaccess/{assetaccessId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetaccessId | path | The id of the assetaccess to be deleted in SIERA | Yes | **integer** |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 401 | Not found, the specified assetaccess id does not exist in the caller's instance or was not found |
| 500 | Server error |
