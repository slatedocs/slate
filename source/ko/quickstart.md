Quick Start 가이드
==========


Introduction
===========

Quick Start는 **PallyCon 서비스와 연동되는 모든 페이지(게이트웨이, Gateway)를 제공**합니다 .

Quick Start를 통해, Service Provider는 

- PallyCon 서비스를 적용하기 전에 먼저 체험할 수 있도록, **30분 이내로 빠르게 구축할 수 있는 환경**을 제공받을 수 있습니다.
- PallyCon 서비스를 상용으로 구축하기 위해서, **쉽게 BM(Business Model)을 적용할 수 있는 환경**을 제공받을 수 있습니다. 


--------
## Quick Start 서비스의 범위
Quick Start 서비스의 범위를 설명하여 이해하기 위해, 먼저 Service Provider와 Service Site, PallyCon 서비스와 게이트웨이(Gateway)를 먼저 아셔야 합니다. 

### Service Provider와 Service Site
Service Provider는 서비스를 구축하고 제공하는 주체입니다. Service Site는 Service Provider가 사용자(User)에게 제공하려는 BM(Business Model)이 포함된 서비스입니다. 

<img src="http://drive.google.com/uc?export=download&id=0B1b4FYUmU3f5WFJnbDRCekFyZms&authuser=0" width="700" height="280">

Service Provider는  [PallyCon Admin](http://admin.pallycon.com/#/main/dashboard)에서 여러개의 Service Site를 생성할 수 있습니다. 각 Service Site마다 PallyCon 서비스를 구축하여야 사용자에게 DRM 서비스를 제공할 수 있습니다. 

### PallyCon 서비스와 게이트웨이(Gateway)
PallyCon 서비스는 다음과 같은 구조로 되어 있습니다. 

- **Cloud Server**: INKA ENTWORKS에서 운영하는 서버로 PallyCon Admin 등 모든 PallyCon 서비스 사이트를 포함하고 있습니다. 이 서버는 PallyCon 서비스에서 제공하는 클라이언트가 DRM 콘텐츠를 생성하거나 사용하기 위한 필요한 정보를 생성 또는 전달합니다. 이 정보는 Service Site의 BM(Business Model)이 반영된 정보입니다. 그렇기 때문에 Cloud Server에서는 이 정보를 서버에서 독자적으로 생성할 수 없습니다. 이 정보를 얻기 위해 서버에서는 Service Site에게 요청을 합니다. **이 정보를 얻지 못할 경우, PallyCon 서비스는 동작하지 않습니다.**
- **Packager**: 원본 콘텐츠를 DRM 콘텐츠로 변환하는데 사용하는 클라이언트입니다. 
- **Content Player**: DRM 콘텐츠를 사용하기 위한 클라이언트입니다. **DRM 콘텐츠의 사용을 위해 Cloud Server 외에 Service Site의 연동 페이지가 필요**합니다. 

이와 같이 PallyCon 서비스는 Service Site의 정책(BM: Business Model)이 반영되지 않을 경우, 동작할 수 없습니다. PallyCon 서비스에서는 Service Site의 정책을 반영하기 위해 연동되는 모듈을 **'게이트웨이(Gateway)'**라고 부릅니다. 

<img src="http://drive.google.com/uc?export=download&id=0B1b4FYUmU3f5RENQYlhhYy1OYms&authuser=0" width="720" height="360">

게이트웨이가 적용되면 PallyCon 서비스가 동작할 수 있게 됩니다. 



### Quick Start 서비스 
Quick Start 서비스는 **Service Provider에서 개발해야 하는 게이트웨이를 샘플(Quick Start Sample)로 제공**합니다. 샘플은 PHP, JSP, ASP의 형태로 제공되기 때문에 Service Provider에서 원하는 플랫폼으로 다운로드 받아 사용하실 수 있습니다. 그와 함께, PallyCon 서비스의 체험을 위해 **Packager를 제공**합니다. 

<img src="http://drive.google.com/uc?export=download&id=0B1b4FYUmU3f5VTFUU095Y2tBMmc&authuser=0" width="320" height="360">

Quick Start 샘플은 Service Site의 BM을 적용하는 부분을 분리되어 주석처리되어 있습니다. 그리고 PallyCon 서비스의 동작을 위해 Service Site의 BM을 적용한 후에 결정되는 **결과값을 기본값으로 설정**되어 있습니다. 
기본값은 Config 페이지에 Service Site의 BM이 설정되지 않은 임시로 입력된 값이거나, 샘플 소스내에 별도의 처리없이 성공으로 설정된 값입니다 .




----------

-----------

Quick Start 
=========

Quick Start는 아래의 링크에서 플랫폼별로 다운로드 받으실 수 있습니다.

<i class="icon-folder-open"></i> [PHP 버전 다운로드](http://www.pallycon.com/developer/)
<i class="icon-folder-open"></i> [ASP 버전 다운로드](http://www.pallycon.com/developer/)
<i class="icon-folder-open"></i> [JSP 버전 다운로드](http://www.pallycon.com/developer/)



----------------------------------------
## Quick Start 구조

다운로드 받으신 파일의 압축을 풉니다. 언집(Un-zip)된 폴더안에는 다음과 같은 폴더와 파일이 있습니다. 

- **gateway** : 게이트웨이(Gateway) 소스가 있는 폴더입니다. 
- **CloudApplicationPackager.zip**: DRM 콘텐츠를 생성하는 Packager 프로그램입니다. 
- **readme.txt**: 각 플랫폼별 구축 환경과 게이트웨이 상세 폴더 구조 및 파일에 대한 설명을 하고 있는 파일입니다. 그리고 PallyCon 서비스 체험을 위한 Quick Start 적용 방법에 대한 상세 설명을 포함하고 있습니다. 

> **NOTE:** Packager의 사용법은 다음 챕터에서 설명됩니다. 


----------------------------------------
## 게이트웨이(gateway 폴더 내)의 주요 파일 설명

게이트웨이의 주요 파일들은 다음과 같습니다. (확장자 미표시)

<img src="http://drive.google.com/uc?export=download&id=0B1b4FYUmU3f5enZNNUI5aGZXaEU&authuser=0" width="220" height="260">

- **Config**: PallyCon 서비스 체험을 위해 **Service Site의 BM이 적용되어야 하는 값을 임시로 설정해야 하는 페이지**입니다. 그리고 통신에 암호화를 적용하기 위한 AES256 KEY값을 설정하는 페이지입니다. 
- **CIDIssue**: DRM 콘텐츠 생성에 필요한 **콘텐츠 아이디(Content ID)를 발급하는 페이지**입니다. 
- **ContentUsageRightsInfo**: DRM 콘텐츠를 사용하기 위한 **콘텐츠 사용 권한 정보를 생성하는 페이지**입니다.
- **ServiceManager**: **Contents Player와 직접 연동하는 페이지**입니다. Contents Player는 DRM 콘텐츠를 사용하는데 필요한 기능들이 있습니다. 이 기능들이 정상적으로 동작하기 위해서는 Service Site의 BM이 적용되어야 하며, 적용된 정보들을 Contents Player로 전달되어야 합니다. 
- **ServicePage**: **DRM 콘텐츠를 다운로드 혹은 스트리밍 재생을 위해 표시하는 페이지**입니다. Contents Player를 호출하며, 사용될 콘텐츠의 정보를 전달합니다. 

주요 파일들은 PallyCon 서비스와 연동됩니다. 


<img src="http://drive.google.com/uc?export=download&id=0B1b4FYUmU3f5Z0hTMGN3RjFkY3M&authuser=0" width="470" height="360">

PallyCon 서비스 연동 I(PallyCon Service Linkage I): DRM 콘텐츠 생성 
: Packager에서 DRM 콘텐츠를 생성하는데 필요한 **콘텐츠 아이디(Content ID)를 Cloud Server로 요청**합니다. Cloud Server에서는 등록된 Service Site의 정보 중 Content ID Issue 페이지의 주소를 추출합니다. **Cloud Server는 이 페이지 주소로 콘텐츠 아이디를 요청**합니다. 
Cloud Server로 요청한 아이디가 전달되면 **Packager가 사용할 수 있는 형태로 가공하여 Packager로 전달**합니다. 

PallyCon 서비스 연동 II(PallyCon Service Linkage II): DRM 콘텐츠 사용
: DRM 콘텐츠를 사용하기 위한 첫번째 과정은 **Service Site에서 사용할 콘텐츠 정보 생성하고  Contents Player를 호출하여 이 정보를 전달**하는 것입니다. 
콘텐츠 정보를 전달받은 Contents Player에서는 콘텐츠를 사용하기 위한 권한 정보(기간 정보, 횟수 등)를 가지고 있는 **라이선스를 Cloud Server로 요청**합니다. Cloud Server에서는 등록된 Service Site의 정보 중 Content Usage Info 페이지 주소를 추출합니다. **Cloud Server는 이 페이지 주소로 라이선스 생성에 필요한 콘텐츠 사용권한 정보(Content Usage Rights Info)를 요청**합니다. 
Cloud Server로 요청된 정보가 전달되면, 이 정보를 이용하여 **라이선스를 생성합니다. 그 다음, 이 라이선스를 Contents Player로 전달**합니다. 
그 외에 **Contents Player는 DRM 콘텐츠 사용에 필요한 다양한 기능**을 가지고 있습니다. 이 기능들은 **Service Manager 페이지와 연동되면서 구동**됩니다. 


--------------------------------
## Quick Start 활용 


Quick Start는 PallyCon 서비스의 빠른 체험과 상용 서비스의 빠른 구축 및 오류 없는 서비스를 제공하도록 지원하는 것입니다. 

### 활용 I: PallyCon 서비스의 빠른 체험을 위한 활용
각 플랫폼별 Quick Start 활용 방법은 **'readme.txt'에 상세하게 설명**되어 있습니다. 30분 내에 PallyCon 서비스의 체험을 시작한다는 목적이기 때문에 구축과정은 매우 간단합니다. 

요약하면 다음과 같습니다. 

<img src="http://drive.google.com/uc?export=download&id=0B1b4FYUmU3f5OUd3SS1rSjBUdlU&authuser=0" width="410" height="260">

- **Config 파일의 설정되어야 하는 값을 입력**
- **CIDIssue 페이지와 ContentUsageRightsInfo 페이지의 주소를 PallyCon Admin([PallyCon Admin > Setting > Contnet ID Issue URL / Content Usage Info URL](http://admin.pallycon.com/#/main/settings))에 입력**


### 활용 II: 상용 서비스 구축을 위한 활용
Quick Start는 약간의 작업을 통해, 상용 서비스에 필요한 게이트웨이를 구축할 수 있습니다. 필요한 작업은 다음과 같습니다. 

<img src="http://drive.google.com/uc?export=download&id=0B1b4FYUmU3f5Y1NtZGJCb0xYTTQ&authuser=0" width="750" height="340">

Service Site 개발
: Service Site는 DRM 콘텐츠를 다운로드 혹은 스트리밍 재생을 위해 표시하는 페이지입니다. 그렇기 때문에, **Service Provider에서 원하는 형태로 새롭게 페이지가 개발**되어야 합니다. Quick Start에서 제공하는 Service Site는 Contents Player로 전달하는 정보를 참고하는 용도로 활용할 수 있습니다. 

게이트웨이 주요 파일에 Service Site의 BM 적용
: **Service Site를 제외한 모든 주요 파일에 Service Site의 BM을 적용**해야 합니다. 주요 파일의 소스에는 동작별로 구분되어 있습니다. 그리고 각 구분된 소스에 상세한 주석이 달려 있습니다. 그렇기 때문에, Service Provider에서 BM을 적용해야 하는 부분을 쉽게 찾을 수 있습니다. 
BM을 적용하는데 주의해야할 점은 두가지입니다. 첫번째는 **BM을 적용하는 데 사용될 값들이 설정되어 있으니 그 값들을 수정하거나 제거하지 않아야 하는 것**입니다. 두번째는 BM을 적용한 후 결과값을 설정하는 부분이 Config 파일에 설정된 값으로 사용되고 있습니다. 이 값을 반드시 **BM 적용 후의 결과값으로 수정**해 주셔야 합니다. 
그 다음, **CIDIssue 페이지와 ContentUsageRightsInfo 페이지를 PallyCon Admin([PallyCon Admin > Setting > Contnet ID Issue URL / Content Usage Info URL](http://admin.pallycon.com/#/main/settings))에 등록**을 해주셔야 합니다. 

Config 파일 제거 또는 수정 
: Config 파일에는 PallyCon 서비스의 체험을 위해 Service Site의 BM에 적용되는 값을 임시로 설정된 값들이 있습니다. 상용 서비스에는 **Config에 설정된 값 중 AES256_KEY 값을 제외한 모든 값을 제거**하셔야 합니다. AES256_KEY 값은 반드시 필요한 값이기 때문에 다른 부분에 정의하시고 Config 파일을 제거하는 것을 추천합니다. 





------------------

-------------------



PallyCon 서비스 체험을 위한 Packager 사용법
==============

Quick Start를 이용해 게이트웨이의 구축이 끝나면, PallyCon 서비스 체험을 위한 준비가 완료됩니다.  PallyCon 서비스 체험은 **DRM 콘텐츠를 생성(Packaging)**하는 것부터 시작하며, 이 작업은 Packager에서 이루어집니다. 

PallyCon 서비스에서의 Packager는 Application 타입과 CLI(Command Line Interface) 타입으로 제공하고 있습니다. 
PallyCon 체험을 위해 Quick Start에서 제공되는 Packager는 Application 타입입니다. Application Packager를 이용하여 DRM 콘텐츠를 생성하는 과정은 다음과 같습니다. 이 과정에서는 생성된 DRM 콘텐츠의 사용 준비 위해 Config 페이지에 설정하는 과정을 포함합니다. 

###Step1: Packager 실행
 1. 첨부된 CloudApplicationPackager.zip 파일 압축을 풉니다.
 2. PallyCon_Packager.exe 파일을 실행시킵니다.

###Step2: Packager 세팅
 PallyCon Admin에서 확인이 가능한 Site ID 와 Packager Key를 입력합니다.

<img src="./Dev_Guide_Images/Packaging_Setting - Packaging.png" width="390" height="400">

###Step3: Packaging
 테스트 할 MP4파일 3개를 선택 후 start packaging 버튼을 클릭하여 파일을 Packaging 합니다. (_8번 버튼 클릭_)
 
  <img src="./Dev_Guide_Images/Packaging_CloudApplicationPackager_Main.png" width="840" height="580">
  
###Step4. Packaging 완료된 콘텐츠 파일 세팅
Packaging이 완료되면 원본콘텐츠(MP4)는 DRM콘텐츠(NCG)로 변환됩니다. 

 1. DRM 콘텐츠의 경로를 Config 파일의 설정값으로 입력합니다. 
 2. 해당 콘텐츠 파일명을 Config 파일의 설정값으로 입력합니다.




--------------

--------------



PallyCon 서비스 체험을 위한 Contents Player 사용법
===========

DRM 콘텐츠의 사용 준비가 끝나면, Contents Player를 통해 사용할 수 있습니다. Contents Player는 서비스 중인 최신 버전을 사용합니다. 
이 챕터에서는 Contents Player의 사용방법에 대해 설명합니다 그리고 PallyCon 서비스의 사용 내역을 확인하는 방법을 설명합니다. 


-------------------------------
##PallyCon Mobile Player 설치하기 

PallyCon Mobile Player는 앱 스토어나 구글 플레이를 통해 설치할 수 있습니다. 

[App Store](http://)
[Google Play](http://)





-----------------------------

##MOBILE Player: 스트리밍, 다운로드, 로컬 재생하기

PallyCon Mobile Player는 Service Site에서 호출하여 사용하는 방법으로 구동됩니다. 

###스트리밍
Mobile Web sample 페이지에서 Play 버튼을 터치하면 PallyCon Mobile Player를 호출하여  스트리밍을 시작합니다. 

###다운로드
Mobile Web sample 페이지에서 Download 버튼을 터치하면 PallyCon Mobile Player를 호출하여 다운로드를 시작합니다. 

###로컬 재생
다운로드된 DRM 콘텐츠는 리스트에서 확인할 수 있습니다. 리스트에서 원하는 콘텐츠를 터치하면, 로컬 재생을 시작합니다. 




----------------------------
## 사용 내역 조회하기 

PallyCon 서비스를 체험하면서 사용한 서비스에 대한 내역을 [PallyCon Admin](http://admin.pallycon.com/#/main/dashboard)에서 조회할 수 있습니다. 조회 가능한 내용은 DRM 콘텐츠 생성 내역(Packaging 이력), License 발급 내역 등에 대한 내용입니다. 




------------

-----------




Revision History
============
이 테이블은 Quick Start 가이드의 수정사항에 대한 기록입니다.

|Date| Detail|
|:----|:-----|
|2015.05.21|PHP, ASP, JSP 샘플 추가 및 전체 내용 수정|
|2014.08.28|Quick Guide 제작|
|----|-----|
