ReST API Guide
==============


## Introduction

PallyCon Service provides APIs that allow you to directly access the PallyCon Cloud Service Site to see and modify data. The APIs provided by PallyCon Service have the RESTful architecture. 

You can use rich references and tools because they use the HTTP protocol standards. 

- http://wikipedia.org/wiki/REST
- http://wikipedia.org/wiki/HTTP
- http://www.getpostman.com

 
### Who should use 'REST_API'?

Vendors using PallyCon Service can access PallyCon CP Admin to perform various tasks such as setting account information, use information, and interconnection setting. However, vendors can also directly see the information through the API provided by PallyCon Service from their own site without accessing PallyCon CP Admin.

Or, in a service structure where one vendor supplies PallyCon Service to multiple subordinate vendors, you can use this API to directly access information about subordinate vendors and show the information to them. However, you can only manage vendors such as adding or deleting them through PallyCon CP Admin.  







## HTTPs Protocol 

 
### REQUEST DATA

Vendors create request data to see contents in PallyCon Cloud Service Site. 

_Format_

- API Server URL: https://tokyo.pallycon.com/api
- Method: _Get (see), PUT (update)_
-  _In GET method, data are entered as **URI Query**. In PUT method, data are entered as **JSON String** in Payload(Body)._
- *UTF-8 Encoding* is used.
-  Setting the authorization field of HTTP Header: *Enter Site ID and Site Key* using [basic authentication].

_Site ID and Site Key input format_: **'SiteID:SiteKey'** is encoded with Base64.


 
### RESPONSE DATA
The response data to the request data are classified by [HTTP status code]. PallyCon Cloud Service Site processes the request data in a few ways. 

|Status Code	|Description	|
|:--------------|:--------------|
|200			|This code is generated when the request data has been normally processed.
|400			|This code is generated when the JSON syntax is violated.
|401			|This code is generated when the correct account information is not entered in the authorization field of HTTP Header or there is no permission.
|404			|This code is generated when there is no value to return, or a parameter in URI or JSON is incorrect.
|405			|This code is generated when the method is not supported.


_Format_

- **JSON String**
- **UTF-8 Encoding** is used.

_JSON String_
: This syntax is used when there is information to send in the response data. 



[basic authentication]: http://wikipedia.org/wiki/Basic_access_authentication
[HTTP status code]: http://wikipedia.org/wiki/HTTP_status_code




## Standards

This document describes the standards for request data and response data with different URI paths depending on the queried data type. 

If GET method is used for sending request data, data must be set in URI Query format. If PUT method is used, data must be set in JSON format in Payload. 
<aside class="notice"> Parameter can be omitted in the request data. However, if you use Parameter, you must enter a value. (**Empty value is not allowed.**)</aside>


### ACCOUNTS **(~/account)**
Query or update the Site ID information.  

#### Request Data
**GET method:** Query the Site ID information in the authorization field of HTTP Header. 
`https://tokyo.pallycon.com/api/my/account`

- NO URI Query 

**PUT method:** Update the Site ID information in the authorization field of HTTP Header with the JSON information in Payload. 

```json
{
"service_url":"http://test.test.com", 
"cid_issue_url":"http://test.test.com",
"content_usage_info_url":"http://test.test.com",
"pc_limit":2, 
"pd_limit":1
}
```

_service_url_
: Service URL, Web player authorization URL

_cid_issue_url_
: Content ID issue page address

_content_usage_info_url_
: Address of the page for showing content use information

_pc_limit, pd_limit_
: Number of PCs and devices that users can register





####Response Data
**Result of the query for Site ID: _HTTP Status Code + JSON_**

```json
{
	"site_id":"DKE2", 
	"service_use":"U",
	"service_url":"www.PallyCon.com", 
	"reg_date":"201408282156",
	"pack_key":"keidh2345erdfg32efs",
	"site_key":"keidh2345erdfg32efs",
	"web_player_key":"keidh2345erdfg32efs",
	"cid_issue_url":"http://test.test.com",
	"content_usage_info_url":"http://test.test.com",
	"pc_limit":8,
	"pd_limit":3
}
```
_site_id_
: A four-character ID for identifying a site 

_service_use_
: Whether or not to activate a service  

- **U**: using 
- **F**: free 
- **S**: stopped

_service_url_
: Service URL and name

_reg_date_
: Creation date. GMT standard (+0), in the format **yyyyMMddHHmmss**

_pack_key, site_key, web_player_key_
: Passwords to be entered in Packager, Gateway, and Web Player, respectively



 
### DRM Content **(~/pack?~)**

Query the DRM content in PallyCon Cloud Service Site. 


#### Request Data
**GET Method:** Verify the Site ID in the authorization field of HTTP Header, and query the DRM content corresponding to the URI Query in the PallyCon Cloud Service Site.  

`https://tokyo.pallycon.com/api/my/pack?page=1&size=2&from=201409071209&to=201409081522&cid=3k12&file_name=sky&sorting=reg_date` 

_page, size_
: Page number and the number of columns to show once. The default value is ‘1’ for page and ‘20’ for size. The maximum size is 100. The defaults are set if Parameter is not used. 

_from, to_
: This is the query range, and the format is GMT standard (+0) 'yyyyMMddHHmmss'.
 If only from or to parameter is used, the query range is unlimited from or to the given time. 

_cid, file_name_
: CID(32-byte) or file name to search

_sorting_
: The default is ‘reg_date’. ‘cid’ or ‘file_name' can be used as well.




#### Response Data
**Query result of DRM contents: _HTTP Status Code + JSON_**

```json
{
	"count":"",
	"data": 
		[{
			"file_name":"fileName.mp4.ncg",
			"cid":"def3dfa",
			"cek":"erewer23sdfzchy",
			"reg_date":"201408282158"
		}]
}
```

_count_
: Total number of data to be searched

_data_
: Used together with count. The actually requested data are in data as an array. 

_file_name_
: File name of the content

_cid_
: Content ID (32-byte)

_cek_
: Key of the content

_reg_date_
: Creation date. GMT standard (+0), in the format **yyyyMMddHHmmss**


 
### Issued License Info **(~/license?~)**

Query the issued license information in the PallyCon Cloud Service Site. 

#### Request Data
**GET Method:** Verify the Site ID in the authorization field of HTTP Header, and query the License information corresponding to the URI Query in the PallyCon Cloud Service Site.  

`https://tokyo.pallycon.com/api/my/license?page=1&size=2&from=201409071209&to=201409081522&status=success&cid=3k12&user_id=dese&device_id=DKEOWK234KE&device_model=iPhone&sorting=reg_date`

_page, size_
: Page number and the number of columns to show once. The default value is ‘1’ for page and ‘20’ for size. The maximum size is 100. The defaults are set if Parameter is not used. 

_from, to_
: This is the query range, and the format is GMT standard (+0) 'yyyyMMddHHmmss'.
If only from or to parameter is used, the query range is unlimited from or to the given time. 

_status_
: Result of license issuance: ‘success’ or ‘fail’. If Parameter is not used, the License is queried regardless of issuance. 

_cid, user_id, device_id_
: CID(32-byte), User_ID, or Device_ID to be searched

_sorting_
: The default is ‘reg_date’. ‘cid’, ‘user_id’, or ‘device_id’ can be used as well.




#### Response Data
**Query result of License information: _HTTP Status Code + JSON_**

```json
{
	"count":"144",
	"data": 
		[{
			"cid":"SDE3",
			"status":"success", 
			"user_id":"test",
			"device_id":"DFEJHKJGYHBJ123",
			"device_model":"iPhone",
		    "ro_start":"",
		    "ro_end":"",
		    "ro_cnt":"",
			"reg_date":""
		}]
}
```
_count_
: The sum of all data when multiple data are returned.

_data_
: Used together with count. The actually requested data are in data as an array. 

_cid_
: Content ID(32 byte)

_status_
: Result of license issuance: ‘success’ or ‘fail’.

_user_id_
: ID of the user

_device_id, device_model_
: ID and model of the user device

_ro_start, ro_end_
: This is copyright information (start date and end date during which play is possible), and the format is GMT standard (+0) 'yyyyMMddHHmmss'.

_ro_cnt_
: Play count

_reg_date_
: Creation date which is written in GMT standard (+0). The format is ‘yyyyMMddHHmmss’.
 
### Device **(~/device?~)**
Query the device information registered in the PallyCon Cloud Service Site. 

#### Request Data
**GET Method:** Verify the Site ID in the authorization field of HTTP Header, and query the License information corresponding to the URI Query in the PallyCon Cloud Service Site.  

`https://tokyo.pallycon.com/api/my/device?page=1&size=2&from=201409071209&to=201409081522&user_id=dese&device_id=DKEOWK234KE&device_model=iPhone&sorting=reg_date`

_page, size_
: Page number and the number of columns to show once. The default value is ‘1’ for page and ‘20’ for size. The maximum size is 100. The defaults are set if Parameter is not used. 

_from, to_
: This is the query range, and the format is GMT standard (+0) 'yyyyMMddHHmmss'.
If only from or to parameter is used, the query range is unlimited from or to the given time. 

_user_id, device_id, device_model_
: User_ID, Device_ID, or Device_Model to be searched

_sorting_
: The default is ‘reg_date’. ‘'user_id’, ‘device_id’, or ‘device_model’ can be used as well.



#### Response Data
**Query result of the registered device information: _HTTP Status Code + JSON_**

```json
{
	"count":"",
	"data": 
		[{
			"user_id":"",
			"device_id":"",
			"device_model":"",
			"reg_date":""
		}]
}
```
_count_
: The sum of all data when multiple data are returned.

_data_
: Used together with count. The actually requested data are in data as an array.

_user_id_
: ID of the user

_device_id, device_model_
: ID and model of the user device

_reg_date_
: Creation date which is written in GMT standard (+0). The format is ‘yyyyMMddHHmmss’.

 
### Statistics **(~/statistics?~)**
This is used to see the general service status. 

#### Request Data
**GET Method:** Verify the Site ID in the authorization field of HTTP Header, and query the service status information corresponding to the URI Query of the Site ID in the PallyCon Cloud Service Site.  

`https://tokyo.pallycon.com/api/my/statistics?from=201409071209&to=201409081522` 

_from, to_
: This is the query range, and the format is GMT standard (+0) 'yyyyMMddHHmmss'.
If only from or to parameter is used, the query range is unlimited from or to the given time. 

#### Response Data
**Query result of service status information: _HTTP Status Code + JSON_**

```json
{
	"license_count":5,
	"device_count":2,
	"user_count":3,
	"pc_count":4,
	"ios_count":5,
	"android_count":7
}
```

_license_count, use_device_count, user_count, pc_count, ios_count, android_count_
: Number of issued licenses, number of registered devices, number of users, number of PCs, number of iOS devices, and number of Android devices





## Revision History 
This table describes the revisions of the REST API Guide.

|Date| Detail|
|:----|:-----|
|2014.08.27|REST API Guide was created|



![footer](footer.png)


