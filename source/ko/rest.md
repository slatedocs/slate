ReST API 가이드
===============

## Introduction

PallyCon Cloud 서비스 사이트에 직접 접근하여 데이터를 조회하고 수정할 수 있도록 PallyCon Service에서는 API를 제공하고 있습니다. PallyCon Service에서 제공하는 API는 RESTful architecture로 구성됩니다. 

HTTP Protocol의 표준규격을 이용하기 때문에 풍부한 레퍼런스와 툴을 이용할 수 있습니다. 

- http://wikipedia.org/wiki/REST
- http://wikipedia.org/wiki/HTTP
- http://www.getpostman.com

### Who should use 'REST_API' ?

PallyCon Service를 사용하는 업체는 계정 정보, 사용 정보, 연동 정보 설정 등 다양한 작업을 PallyCon CP Admin에 접근하여 확인할 수 있습니다. 하지만, PallyCon CP Admin의 접근 없이 업체 자신의 사이트에서 PallyCon Service에서 제공하는 API를 통해 직접 조회할 수 있습니다.

또는, PallyCon Service를 하나의 업체가 여러 하위 업체에게 공급하는 서비스 구조에서 이 API를 이용하여 하위 업체에 대한 정보를 직접 조회하여 하위 업체에게 정보를 보여 줄 수도 있습니다. 하지만, 업체를 추가하거나 삭제하는 등의 관리는 PallyCon CP Admin을 통해서만 가능합니다.  




## HTTPs Protocol

### REQUEST DATA

업체가 PallyCon Cloud Service Site에 내용을 조회하기 위하여 요청 데이터를 생성합니다. 

_Format_

- **API Server URL:** https://tokyo.pallycon.com/api
- **Method:** GET (조회), PUT (업데이트)
-  **GET 방식에서는 URI Query 형태로 입력, PUT에서는 Payload(Body)에 JSON String으로 입력**
- **UTF-8 Encoding**사용
- **HTTP Header의 authorization 필드 설정:** [basic authentication]를 사용하여 **Site ID와 Site Key를 입력**  

_Site ID와 Site Key 입력 형태_: **SiteID:SiteKey**를 Base64로 인코딩 



### RESPONSE DATA
요청 데이터에 대한 응답은 [HTTP status code]에 의하여 분류됩니다. PallyCon Cloud Service Site에서는 요청 데이터에 대하여 몇가지 처리가 되어 있습니다. 

|Status Code	|Description	|
|:--------------|:--------------|
|200			|요청데이터에 대하여 정상적으로 처리되었을 경우에 발생되는 코드
|400			|JSON 문법에 어긋났을 경우에 발생되는 코드
|401			|HTTP Header에 authorization 필드에 올바른 계정정보를 입력하지 않거나 권한이 없는 경우에 발생되는 코드
|404			|리턴할 값이 없거나, URI나 JSON에 들어있는 Parameter가 틀렸을 경우에 발생되는 코드
|405			|지원하지 않는 Method인 경우에 발생되는 코드


_Format_

- **JSON String**
- **UTF-8 Encoding** 사용

_JSON String_
: 응답 데이터 중 전달할 정보가 있을 때 사용하는 문법입니다. 








[basic authentication]: http://wikipedia.org/wiki/Basic_access_authentication
[HTTP status code]: http://wikipedia.org/wiki/HTTP_status_code



## Standards 

조회하고자 하는 데이터 종류에 따라 URI Path를 구분하여 요청 데이터와 응답 데이터에 대한 규격을 설명합니다. 

요청 데이터를 전달할 때의 Method가 GET방식일 경우에는 URI Query 형태로 데이터를 설정해야 하고, PUT방식일 경우에는 Payload에 JSON 형태로 데이터를 설정해야 합니다. 
<aside class="notice">요청 데이터에서의 Parameter는 생략이 가능합니다. 하지만 Parameter를 사용하게 되면 반드시 값을 넣으셔야 합니다. (빈값을 허용하지 않습니다.)</aside>
 
### ACCOUNTS **(~/account)**
Site ID 정보에 대한 조회나 업데이트입니다.  

#### Site ID 정보 조회
##### Request Data
**GET 방식:** HTTP Header의 authorization필드의 Site ID에 대한 정보를 조회합니다. 

`https://tokyo.pallycon.com/api/my/account`

- NO URI Query 

##### Response Data
**Site ID에 대한 정보 조회에 대한 결과: _HTTP Status Code + JSON_**

```json
{
	"site_id":"DKE2", 
	"service_use":"U",
	"service_url":"www.PallyCon.com", 
	"reg_date":"201408282156",
	"pack_key":"keidh2345erdfg32efs",
	"site_key":"keidh2345erdfg32efs",
	"cid_issue_url":"http://test.test.com",
	"content_usage_Rights_info_url":"http://test.test.com"
}
```

_site_id_
: 사이트를 구분하는 ID, 알파벳과 숫자로 이루어진 4글자

_service_use_
: 서비스 활성화 여부. 

- **U**: using 
- **F**: free 
- **S**: stopped

_service_url_
: 서비스 URL과 이름

_reg_date_
: 생성일자. GMT 표준(+0), 규격은**yyyyMMddHHmmss**

_pack_key, site_key
: 각 각 패키저, 게이트웨이에 입력해야 할 비밀번호


#### Site ID 정보 업데이트 
##### Request Data
**PUT 방식:** HTTP Header의 authorization필드의 Site ID에 대한 정보를 Payload에 있는 JSON에 대한 정보로 업데이트하게 됩니다. 

```json
{
	"service_url":"http://test.test.com", 
	"cid_issue_url":"http://test.test.com",
	"content_usage_Rights_info_url":"http://test.test.com"
}
```

_service_url_
: 서비스 URL, Web player 인증 URL

_cid_issue_url_
: Content ID 발급 페이지 주소

_content_usage_Rights_info_url_
: 콘텐츠 사용 권한 정보를 조회하는 페이지 주소





##### Response Data
Site ID에 JSON 정보로 업데이트에 대한 결과는 'HTTP Status Code'로 확인이 가능합니다. 



 
### DRM Content **(~/pack?~)**

PallyCon Cloud 서비스 사이트에 가지고 있는 DRM Content에 대한 정보를 조회합니다. 

#### DRM Content 정보 조회

##### Request Data
**GET 방식: **  HTTP Header의 authorization필드의 Site ID를 인증한 후, URI Query 해당하는 DRM 콘텐츠의 정보를 PallyCon Cloud Service Site에서 조회합니다.  

`https://tokyo.pallycon.com/api/my/pack?page=1&size=2&from=201409071209&to=201409081522&cid=3k12&file_name=sky&sorting=reg_date`

_page, size_
: 페이지 번호와 한번에 보여줄 컬럼의 수. default로 page : ‘1’, size : ‘20’, size는 최대 100으로 제한됩니다. Parameter를 사용하지 않을 경우, default 로 설정됩니다. 

_from, to_
: 조회 범위이고,  규격은 **GMT 표준(+0)**으로 ‘yyyyMMddHHmmss’  
from, to 둘 중 하나의 Parameter만 사용하게 될 경우, 하나의 시간을 기준으로 무제한 시간으로 조회됩니다. 

_cid, file_name_
: 검색할 CID(32byte) 혹은 file name

_sorting_
: default는 ‘reg_date’. ‘cid’, ‘file_name'도 가능.




##### Response Data
**DRM 콘텐츠 정보 조회 결과: _HTTP Status Code + JSON_**

```json
{
	"count":"",
	"data":[
		{
			"file_name":"fileName.mp4.ncg",
			"cid":"def3dfa",
			"cek":"erewer23sdfzchy",
			"reg_date":"201408282158"
		}
	]
}
```

_count_
: 검색 대상의 전체 수

_data_
: count와 함께 쓰이는 Parameter로, 실제로 요청한 데이터가 data 안에 배열로 들어가있습니다. 

_file_name_
: content’s file name

_cid_
: content’s ID(32 byte)

_cek_
: content’s key

_reg_date_
: 생성일자. **GMT 표준(+0)**으로, 규격은**yyyyMMddHHmmss**



 
### Issued License Info **(~/license?~)**

PallyCon Cloud Service Site에서 발급된 License에 대한 정보를 조회합니다. 

#### 발급된 License 정보 조회

##### Request Data
**GET 방식: **  HTTP Header의 authorization필드의 Site ID를 인증한 후, URI Query 해당하는 License의 정보를 PallyCon Cloud Service Site에서 조회합니다.  

`https://tokyo.pallycon.com/api/my/license?page=1&size=2&from=201409071209&to=201409081522&status=success&cid=3k12&user_id=dese&device_id=DKEOWK234KE&device_model=iPhone&sorting=reg_date`

_page, size_
: 페이지 번호와 한번에 보여줄 컬럼의 수. default로 page : ‘1’, size : ‘20’, size는 최대 100으로 제한됩니다. Parameter를 사용하지 않을 경우, default 로 설정됩니다. 

_from, to_
: 조회 범위이고,  규격은 GMT 표준(+0)으로 ‘yyyyMMddHHmmss’ 
from, to 둘 중 하나의 Parameter만 사용하게 될 경우, 하나의 시간을 기준으로 무제한 시간으로 조회됩니다. 

_status_
: License 발급 성공여부. ‘success’ 혹은 ‘fail’이 가능. Parameter를 사용하지 않을 경우, 발급 여부와 상관없이 License가 조회됩니다. 

_cid, user_id, device_id_
: 검색할 CID 혹은 User_ID, Device_ID

_sorting_
: default는 ‘reg_date’. ‘cid’, ‘user_id’, ‘device_id’도 가능




##### Response Data
**License 정보 조회 결과: _HTTP Status Code + JSON_**

```json
{
	"count":"144",
	"data":[ 
		{
		"cid":"SDE3",
		"status":"success", 
		"user_id":"test",
		"device_id":"DFEJHKJGYHBJ123",
		"device_model":"iPhone",
	    "ro_start":"201409081522",
	    "ro_end":"201409091522",
	    "ro_cnt":"1",
		"reg_date":"201409081522"
		}
	]
}
```
_count_
: 리턴하는 데이터가 복수일 때, 그 모든 합.

_data_
: count와 함께 쓰이는 Parameter로, 실제로 요청한 데이터가 data 안에 배열로 들어가있습니다. 

_cid_
: 32 byte의 Content ID

_status_
: 라이센스 발급 성공여부. ‘success’ 혹은 ‘fail’

_user_id_
: 사용자 ID

_device_id, device_model_
: 사용자 기기의 ID와 모델명

_ro_start, ro_end_
: 저작권 정보(재생가능한 시작일과 종료일) 규격은 **GMT 표준(+0)**시간으로  ‘yyyyMMddHHmmss’.

_ro_cnt_
: 재생 횟수

_reg_date_
: 생성일자. GMT 표준(+0)으로 작성한다. 규격은 ‘yyyyMMddHHmmss’.


 
### Statistics **(~/statistics?~)**
전반적인 서비스 현황을 조회하기 위해 사용합니다. 

#### Request Data
**GET 방식: **  HTTP Header의 authorization필드의 Site ID를 인증한 후, Site ID의 URI Query 해당하는 서비스  현황 정보를 PallyCon Cloud Service Site에서 조회합니다.  

`https://tokyo.pallycon.com/api/my/statistics?from=201409071209&to=201409081522`

_from, to_
: 조회 범위이고,  규격은 GMT 표준(+0)으로 ‘yyyyMMddHHmmss’ 
from, to 둘 중 하나의 Parameter만 사용하게 될 경우, 하나의 시간을 기준으로 무제한 시간으로 조회됩니다. 

#### Response Data
**서비스 현황 정보 조회 결과: _HTTP Status Code + JSON_**

```json
{
	"license_count":5,
	"device_count":2,
	"user_count":1,
	"pc_count":0,
	"ios_count":1,
	"android_count":1
}
```

_license_count, use_device_count, user_count, pc_count, ios_count, android_count_
: 발급된 License 수, 등록된 기기 대수, 사용자수, PC 수, iOS 기기 수, Android 기기 수




## Revision History 
이 테이블은 REST API 가이드의 수정사항에 대해 설명한 것입니다.

|Date| Detail|
|:----|:-----|
|2014.08.27|REST API Guide 제작|
|2014.09.21|Method에 DELETE 추가 및 Standards의 Device에 등록해제 추가|
|2014.12.15|Method에 DELETE 삭제 및 Standards의 Device에 등록해제 삭제| 


![footer](footer.png)