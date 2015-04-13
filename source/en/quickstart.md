

QuickStart Guide
================

## Introduction
_Quick Guide_ is a guide about using the samples provided by PallyCon Service. You can see that a simple Web page can call PallyCon Mobile Player to play video streaming or download a video for local play. 

You can download the sample at the following link.

<i class="icon-folder-open"></i> [Sample Download](http://www.pallycon.com/download/PallyCon_QuickStartSample.zip)


By applying these samples, you can understand which tasks are needed for applying PallyCon Service and how the service is provided. 

 
### Necessary Conditions
In order to install the sample, run it, and perform a service query, you must complete **Service Site Request** after joining. If the service site is successfully requested, you can see the Site ID and Site Key of the service site, Packager Key, and the PC Web Player Key. 

The sample pages are .jsp files. To modify or use these pages, you need Java and Tomcat. 
You must install Java Runtime Environment (JRE) that distributes and supports Java in Java 6 (1.6) and Java 7 (1.7) application and server environment.

You can download Java and Tomcat through the following links.

- Java: http://www.oracle.com/technetwork/java/javase/downloads/index.html
- Tomcat: http://tomcat.apache.org/ 



 
### Opening the Setup Files

PallyCon_QuickStartSample.zip contains the below.

|Folders or Files           |Description        |
|---------------------------------------|---------------------------|
|sample.war               |contains sample source codes
|CloudApplicationPackager.zip           |Cloud Application Packager file


#### Sample.war Structure 

|Folders or Files                   |Description|
|----------------------------------|---------------|
|/src/aes/			           |This folder contains aes256 and base64encode source sample files.
|/images       |This folder contains image related files used in the content_list.jsp page.
|/js          |This folder contains jquery related files used in the content_list.jsp page.
|/WEB-INF/classes/aes/     |aes256 class sample, base64encode class sample
|/WEB-INF/lib          |jar file required for sample
|/ServiceSite/aes_ok.jsp           |page file for encrypting parameters with aes256
|/ServiceSite/service_manager.jsp |Service Site page file 
|/ServiceSite/service_manager_pc.jsp|PC Service Site page file(includes Bookmark, LMS management) 
|/ServiceSite/config.jsp           |config file for running the trial
|/ServiceSite/content_list.jsp     |Mobile Web sample page file 
|/ServiceSite/content_list_pc.jsp   |PC Web sample page file
|/CIDIssue_RightsInfo/CIDIssue.jsp         |CID issue page file 
|/CIDIssue_RightsInfo/ContentUsageRightsInfo.jsp |Content Usage Info page (Content Usage Info gateway) file 

#### CloudApplicationPackager.zip Structure

|Folders or Files                   |Description|
|-----------------------------------|---------------|
|Bin/PallyCon_packager.exe          |Application executable file
|Bin/Setting.ini,images             |Data files for application
|Release_Note.txt                   |Application change logs




## Installation and Contents Preparation 

This document describes the process for developing a sample service using the sample files provided by PallyCon Service. 

 
###  Installing Files and Modifying Contents

#### Step1: Copy the Web page.
 Decompress the sample file and **upload the war file to webserver using Tomcat manager. $TOMCAT_HOME/webapp/ROOT/**. 

#### Step2: Install bouncycastle JCE.
1. Download latest BouncyCastle for matching JDK version of webserver from www.bouncycastle.org/java.html. Store the jar file in jre/lib/ext directory.
ex) bcprov-jdk16-146.jar, $JAVA_HOME jre/lib/ext

2. Add the below declaration in java.security file located in jre/lib/security folder.
security.provider.8 = ........
security.provider.9 = org.bouncycastle.jce.provider.BouncyCastleProvider 

3. Download unrestricted policy files from download page of java.sun.com site. Replace local_policy.jar and US_export_policy.jar files in jre/lib/security folder.

4. Restart tomcat.


#### Step3: Edit config.jsp file
**Editing config.jsp file can affect PC / Mobile services in common.** 

##### aes256 configration (_aes key config_)  
key should be set using Site Key which can be found in PallyCon Admin site. **Use fixed value of Initial Vecor which will be used with Site Key for encryptio and decryption (Initial Vector: _0123456789abcdef_)**

##### Content Usage Info Page (_gateway config_)
Set the information for using DRM-applied contents. Use 'LIMIT', 'PD_START', 'PD_END', 'PD_COUNT' value to set license info. **PallyCon Player(Mobile, PC) does not support content playback with count-limited license.**

|License Rules|LIMIT|PD_START|PD_END|PD_COUNT|
|-------------|-----|--------|------|-----|
|**Count System**    |Y      |Empty          |Empty          |Value greater than 0   | 
|**Period System**   |Y    |Date before PD_END |Date after PD_START  |Empty      |
|**Period System+Count System**  |Y    |Date before PD_END |Date after PD_START    |Value greater than 0   |
|**No Limit**    |N    |Empty          |Empty          |Empty      | 
Date: GMT (YYYY-MM-DDThh:mm:ss)


##### content_list configration

Set the information required for playing and downloading DRM contents. 

- **sSite_ID:** The site ID that has been issued in the PallyCon Admin page.
- **sSite_Url:** Current server IP and domain
- **sContent_Url1:** File name of the first content in the list
- **sContent_Url2:** File name of the second content in the list
- **sContent_Url3:** File name of the third content in the list

Other meta data can be set by editing `sCategory_name`, `sCategory_teacher`, `Content_name1`, `Content_name2`, `Content_name3` values. 

##### Set language
`sLanguage` value is used for setting language. (KR: Korean, EN: English)

 
#### Step4: Set URL in PallyCon CP Admin.

Set the URL of CIDIssue.jsp to the Content ID Issue Page URL in PallyCon CP Admin, and set the URL of ContentUsageRightsInfo.jsp to the Content Usage Rights Info Page URL. 

- URL of CIDIssue.jsp: [http://IP:8080/sample/CIDIssue_RightsInfo/CIDIssue.jsp](http://IP:8080/sample/CIDIssue_RightsInfo/CIDIssue.jsp)
- URL of ContentUsageRightsInfo.jsp: [http://IP:8080/sample/CIDIssue_RightsInfo/ContentUsageRightsInfo.jsp](http://IP:8080/sample/CIDIssue_RightsInfo/ContentUsageRightsInfo.jsp)

 
### Packaging and Preparing DRM contents 


You can use Packager to encrypt source contents and package them to an .ncg file.

#### Step1: Run Packager.
 1. Decompress the attached packager.zip file.
 2. Run the NCG_Packager_Cloud.exe file.

#### Step2: Set Packager.
 Enter the Site Key and Packager Key that you can check in PallyCon CP Admin.

![packaging](Packaging_Setting-Packaging.png) 

#### Step3: Run packaging.
 Select three MP4 files to test and click the start packaging button to package the files.(_Click Button marked NO.8_)

![apppackager](Packaging_CloudApplicationPackager_Main.png) 
 
#### Step4. Set the contents file that has been packaged.
When packaging is completed, the source contents (MP4) are changed to DRM contents (NCG). 

 1. Store the DRM contents in `/$TOMCAT_HOME/webapp/ROOT/ServiceSite/cont`.
 2. **Change the sContent_url1, 2, and 3 values of config.jsp** using the URL information of the corresponding contents.


## Running  
### Install PallyCon Mobile Player

You can install PallyCon Mobile Player through App Store or Google Play. 

<a href="https://itunes.apple.com/kr/app/pallycon-player/id918473490?mt=8"><img src="../images/appstore_logo.png" width="200"></a>
<a href="https://play.google.com/store/apps/details?id=com.inka.pallycon.pallyconplayer"><img src="../images/google_play_logo.png" width="200"></a>

 
### Streaming, Downloading, and Local Playback

You can run PallyCon Mobile Player by calling it from Web browser. 

#### Streaming
When you touch the Play button in the Mobile Web sample page, PallyCon Mobile Player is called and streaming begins. 

#### Download
When you touch the Download button in the Mobile Web sample page, PallyCon Mobile Player is called and download starts. 

#### Local playback
You can see the downloaded DRM content in the list. When you touch a desired content in the list, local playback starts. 


 
### Checking Details of Use:

On the PallyConCPAdmin page, you can see information about the licenses that were issued during a simple test, as well as the registered devices and packaged contents. 

<aside class="success"><b>Important:</b> If you start with Starter, you can issue up to 100 licenses for free. To issue more licenses, you must change to a paid service. </aside>

 


**Revision History**

This table describes the revisions of the Quick Guide.

|Date| Detail|
|:----|:-----|
|2014.08.28|Quick Guide was created|
|2014.12.09|PC Player Guide added|


