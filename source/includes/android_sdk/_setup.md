# Android SDK

## Setting Up

The MDLConnect SDK for Android allows you to integrate your Android app with MDLive's video appointment service.

### Step 1 - Setup

Download the Android SDK

### Step 2 -  Add SDK to Project

1) Open your application's build.gradle file and add the library into the dependencies section.

```json

dependencies {
   implementation 'com.mdlive.mdlconnect:1.0.0'
}
```

## Start a Video Appointment
### Initialize user variables

In order to initiate a video call, you will need to pass in the user's token and user id to the framework.

```java

VideoConnectSettings videoConnectSettings = VideoConnectSettings.builder()
               .mdliveApiToken("{API_TOKEN}")
               .userId({SUER_ID})
               .build();

 MdlVideoConnectClient mdlVideoConnectClient = new MdlVideoConnectClient(getApplication());
 mdlVideoConnectClient.initConfig(videoConnectSettings);
 ```

### Start appointment

You can call the following function with the appointment ID to start the video session.

```java

 //{VIDEO_CONTAINER} is the view in wich you want embed the video, you must use a RealtiveLayout view.
 mdlVideoConnectClient.startSession({APPOINTMENT_ID},{VIDEO_CONTAINER});

 ```