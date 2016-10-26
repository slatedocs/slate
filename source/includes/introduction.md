# Introduction

Foxtrot helps distributors execute better last-mile deliveries. Today's top-tier last-mile delivery software still relies on static and historic data and attempts to solve the traveling salesman problem to optimality. We take a different approach. Our belief is that realtime data streams and realtime algorithms will lead to agility and ultimately increased efficiency. We use traffic & weather information, in-house route-optimization algorithms, and machine learning to boost our customers' fleet efficiency & delivery success.

The [Foxtrot](https://foxtrot.io/) Android SDK allows you to leverage Foxtrot's agile routing platform in your already existing driver application with little effort. Follow the steps below to get up and running as quickly as possible, and please reach out to [support@foxtrot.io](mailto:support@foxtrot.io) at any time with implementation questions! Also feel free to refer to the [Foxtrot Javadoc](https://foxtrotsystems.github.io/android-sdk-javadoc) as well.

## Prerequisites
1. The Foxtrot Android SDK is supported on Android API level 21 and above.
2. The Foxtrot Android SDK requires [Google Play Services](https://play.google.com/store/apps/details?id=com.google.android.gms) for best results.
3. You will need one or more Foxtrot API keys to identify your organization (one API key per distribution center).

## Getting Access

The Foxtrot SDK is hosted on [Bintray](https://bintray.com). You will need to create a free Bintray account to access the SDK package. Once you have an account, reach out to us at [support@foxtrot.io](mailto:support@foxtrot.io) to get access to the SDK.

## Installation

### 1. Setup Bintray configuration
Add the Foxtrot Maven repository to the `repositories` section of your build.gradle file. To obtain your Bintray API key, navigate to the edit profile page on the Bintray website and select the API Key section.


```groovy
repositories {
	...
    maven {
        url  "http://foxtrotsystems.bintray.com/maven"
        credentials {
            username 'your-bintray-user'
            password 'your-bintray-api-key'
        }
    }
}
```

### 2. Add the Foxtrot Android SDK as a dependency in your build.gradle

```groovy
dependencies {
    ...
    compile "io.foxtrot:android-sdk:0.1.0"
}
```
