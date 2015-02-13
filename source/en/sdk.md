SDK Guide
=========

PallyCon SDK is an SDK to apply DRM service to all types of content using NCG DRM.


## Who should use 'PallyCon SDK'?

**PallyCon SDK is the easiest and simplest DRM solution to apply DRM to the Apps that providers have already had them in service.** 
In addition, **PallyCon SDK is a solution most appropriate for the properties of PallyCon which can apply NCG DRM technology to all contents.**  
 
The providers who should use PallyCon SDK are as follows: 

- A provider who desires to provide DRM Service not for sound source/video contents but for other contents
- A provider who desires to make its own Player not the sound source/video Player provided by PallyCon Service 
- A provider who desires to use PallyCon On-premise Server

PallyCon SDK is compatible with both PallyCon Cloud Service and PallyCon On-premise Server.   
However, PallyCon PC/Mobile Player is compatible only with PallyCon Cloud Service; thus, a provider who desires to use PallyCon On-premise Server must use PallyCon SDK.

| |Video/Music Contents    |Other Contents              |PallyCon Cloud Service  |PallyCon On-premise Server  |
|---|---|---|---|---| 
|PallyCon PC/Mobile Player |Support                 |NOT Support                 | |Support                 | 
|PallyCon SDK              |Support                 |Support                     | |Support | 



 
## Functions that PallyCon SDK provides

The functions that PallyCon SDK provides are as follows:

### A function for convenient development

- provide abstracted functions and application scenarios which can be applied to the current App in service on an easy and simple basis
- provide the function to unpack all the contents to which NCG DRM apply
- provide the function to partially decrypt high-capacity contents for the purpose of more effectively using them

### A function for content security

- provide a variety of security setting function to safely use term contents
- provide the function to restrict external output and screen shot (Android) to protect contents
- provide a variety of functions to secure the use of DRM contents in accordance with license 



 
## PallyCon SDK Specification

PallyCon SDK provides Windows, Android, and iOS SDK. 

The specification for each platform of PallyCon SDK is as follows: 

| |PallyCon Windows SDK  |PallyCon Android SDK  |PallyCon iOS SDK  |
|----------|----------|----------|----------|
|Support Spec.|XP or above (Visual Studio 2008 or above)|2.3 version or above  |iOS 6.0 or above (iPad2, iPhone4 or above)|


 
##PallyCon SDK Application

- STEP1. First make an App where original contents can run without a problem.

- STEP2. Use PallyCon SDK Sample to become familiar with how to apply SDK and use DRM Contents.

- STEP3. Determine DRM Service policy and scenario.

- STEP4. Build License Server, and develop the page necessary to generate DRM Contents and the page necessary to issue license in accordance with the DRM Service policy.

-  STEP5. Add PallyCon SDK to the App.

- STEP6. Apply DRM Service to the App.
