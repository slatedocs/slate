---
title: PallyCon Books 

toc_footers: 
  - <a href='http://www.pallycon.com'>PallyCon Home</a> 
 
---

Welcome
===========

This site provides information and guides for development using PallyCon products and service.

PallyCon service consists with cloud-based DRM license server, PallyCon Player for DRM content playback, and PallyCon Packager for content encryption. To use PallyCon service, each modules must be integrated with your content service. You can apply DRM without SDK development or server preparation.

![overview](overview_diagram_eng.jpg)


## Guides
You can integrate PallyCon service with your content service site using the below guide documents.

### Quick Start Guide
[Quick Start Guide](#quick-start-guide) Provides test codes, samples and setup guide for a quick trial of PallyCon service. 

### Intergration Guides 
[Intergration Guides](#intergration-overview) Explains overall flow and how-to of the service integration. 

- You must [intergrate packager](#packaging-guide) to your CMS(Content Management System). And learn how to [issue license](#license-issue-guide) with usage rights when end-user plays DRM content. 

- You can intergrate [Pallycon Mobile Player](#mobile-player-guide) with your mobile content service site.

- Also You can manage your Pallycon service via [ReST API](#rest-api-guide)  


## Downloads
For Quick Start, please download the below sample and refer to Quick Start Guide page.
For CMS integration, please download 'Packager' which includes Application and CLI packager for Windows and Linux.

- Quick Start Sample Project [here](http://www.pallycon.com/developer/PallyCon_QuickStartSample.zip)
- Packager [here](http://www.pallycon.com/developer/PallyCon_Packager.zip)


























Quick Start Guide
=================

## Introduction
_Quick Guide_ is a guide about using the samples provided by PallyCon Service. You can see that a simple Web page can call PallyCon Mobile Player to play video streaming or download a video for local play. 

You can download the sample at the following link.

<i class="icon-folder-open"></i> [Sample Download](http://www.pallycon.com/developer/PallyCon_QuickStartSample.zip)


By applying these samples, you can understand which tasks are needed for applying PallyCon Service and how the service is provided. 

 
### Necessary Conditions
In order to install the sample, run it, and perform a service query, you must complete **Service Site Request** after joining. If the service site is successfully requested, you can see the Site ID and Site Key of the service site, Packager Key, and the PC Web Player Key. 

The sample pages are .jsp files. To modify or use these pages, you need Java and Tomcat. 
You must install Java Runtime Environment (JRE) that distributes and supports Java in Java 6 (1.6) and Java 7 (1.7) application and server environment.

You can download Java and Tomcat through the following links.

- Java: http://www.oracle.com/technetwork/java/javase/downloads/index.html
- Tomcat: http://tomcat.apache.org/ 



 
### Opening the Setup Files

**The trial sample pages are structured** as follows:  


|Folders or Files                   |Description|
|----------------------------------|---------------|
|/src/aes/                     |This folder contains aes256 and base64encode source sample files.
|/images       |This folder contains image related files used in the content_list.jsp page.
|/js          |This folder contains jquery related files used in the content_list.jsp page.
|/WEB-INF/classes/aes/     |aes256 class sample, base64encode class sample
|/WEB-INF/lib          |jar file required for sample
|/ServiceSite/aes_ok.jsp           |page file for encrypting parameters with aes256
|/ServiceSite/service_manager.jsp |Service Site page file 
|/ServiceSite/config.jsp           |config file for running the trial
|/ServiceSite/content_list.jsp     |Mobile Web sample page file 
|/CIDIssue_RightsInfo/CIDIssue.jsp         |CID issue page file 
|/CIDIssue_RightsInfo/ContentUsageRightsInfo.jsp |Content Usage Info page (Content Usage Info gateway) file
|/CloudApplicationPackager.zip                     |Packager file for Windows 







## Installation and Contents Preparation 


This document describes the process for developing a sample service using the sample files provided by PallyCon Service. 

 
###  Installing Files and Modifying Contents

####  Step1: Copy the Web page.
 Decompress the sample file and **copy the files in the Webcontents folder to $TOMCAT_HOME/webapp/ROOT/**.
<aside class="notice"> You must have installed bouncycastle JCE to run the StringEncrypter.class among the attached class files. </aside>

####  Step2: Install bouncycastle JCE.
1. Download the latest version corresponding to your JDK version from www.bouncycastle.org/java.html and save it in the jre/lib/ext directory.
<aside class="notice"> jre/lib/ext under bcprov-jdk16-146.jar, $JAVA_HOME </aside>

2. Modify the java.security file in jre/lib/security as follows:  
```java
    security.provider.N = org.bouncycastle.jce.provider.BouncyCastleProvider
```
3. Download the unrestricted policy files from the download site of java.sun.com, and
    replace the local_policy.jar and US_export_policy.jar files in the jre/lib/security directory.

4. Restart tomcat.

####  Step3: Modify the config.jsp file.
##### **aes256 configuration**  
  Decompress the sample file and **copy the files in the Webcontents folder to $TOMCAT_HOME/webapp/ROOT/**.  
<aside class="notice"> You must have installed bouncycastle JCE to run the StringEncrypter.class among the attached class files. </aside>


##### **Content Usage Info Page** 
Set the information for using DRM-applied contents. 
<aside class="notice"> **NOTE**  
PallyCon Player(Mobile, PC) does not support content playback with count-limited license. </aside>

|License Rules|LIMIT|PD_START|PD_END|COUNT|
|-------------|-----|--------|------|-----|
|**Count System**      |Y      |Empty              |Empty                  |Value greater than 0       | 
|**Period System**     |Y      |Date before PD_END |Date after PD_START    |Empty          |
|**Period System+Count System**    |Y      |Date before PD_END |Date after PD_START        |Value greater than 0       |
|**No Limit**      |N      |Empty              |Empty                  |Empty          |
Date: GMT (YYYY-MM-DDThh:mm:ss) 

##### **content_list configuration**
  Set the information required for playing and downloading DRM contents. 
  <aside class="notice">  
  **sSite_ID:** The site ID that has been issued in the PallyCon Admin page.  
  **sSite_Url:** Current server IP and domain.  
  **sContent_Url1:** File name of the first content in the list.  
  **sContent_Url2:** File name of the second content in the list.  
  **sContent_Url3:** File name of the third content in the list.  
  </aside>


####  Step4: Set URL in PallyCon CP Admin.

Set the URL of CIDIssue.jsp to the Content ID Issue Page URL in PallyCon CP Admin, and set the URL of ContentUsageRightsInfo.jsp to the Content Usage Rights Info Page URL. 


<aside class="notice">   
  URL of _CIDIssue.jsp_: http://IP:8080/CIDIssue_RightsInfo/CIDIssue.jsp  
  URL of _ContentUsageRightsInfo.jsp_: http://IP:8080/CIDIssue_RightsInfo/ContentUsageRightsInfo.jsp
</aside>




 
### Packaging and Preparing DRM contents 


You can use Packager to encrypt source contents and package them to an .ncg file.

####  Step1: Run Packager.
 1. Decompress the attached packager.zip file.
 2. Run the NCG_Packager_Cloud.exe file.

####  Step2: Set Packager.
 Enter the Site Key and Packager Key that you can check in PallyCon CP Admin.

![packaging](Packaging_Setting-Packaging.png)

####  Step3: Run packaging.
 Select three MP4 files to test and click the start packaging button to package the files.(_Click Button marked NO.8_)
 
  ![runpack](Packaging_CloudApplicationPackager_Main.png)
 
####  Step4. Set the contents file that has been packaged.
When packaging is completed, the source contents (MP4) are changed to DRM contents (NCG). 

 1. Store the DRM contents in /$TOMCAT_HOME/webapp/ROOT/ServiceSite/cont.
 2. **Change the sContent_url1, 2, and 3 values of config.jsp** using the URL information of the corresponding contents.






## Running 
 
### Install PallyCon Mobile Player

You can install PallyCon Mobile Player through App Store or Google Play. 

[App Store](https://itunes.apple.com/kr/app/pallycon-player/id918473490?mt=8)
[Google Play](https://play.google.com/store/apps/details?id=com.pallycon.smartnetsync.appplayer)




 
### Streaming, Downloading, and Local Playback

You can run PallyCon Mobile Player by calling it from Web browser. 

####  Streaming
When you touch the Play button in the Mobile Web sample page, PallyCon Mobile Player is called and streaming begins. 

####  Download
When you touch the Download button in the Mobile Web sample page, PallyCon Mobile Player is called and download starts. 

####  Local playback
You can see the downloaded DRM content in the list. When you touch a desired content in the list, local playback starts. 

 
###  Checking Details of Use:

On the PallyConCPAdmin page, you can see information about the licenses that were issued during a simple test, as well as the registered devices and packaged contents. 


<aside class="notice">**Important:**  
If you start with Starter, you can issue up to 100 licenses for free. To issue more licenses, you must change to a paid service. 
</aside>

  

## Revision History 
This table describes the revisions of the Quick Guide.

|Date| Detail|
|:----|:-----|
|2014.08.28|Quick Guide was created|




















