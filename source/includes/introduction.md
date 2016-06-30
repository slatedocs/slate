# Introduction

Foxtrot helps distributors execute better last-mile deliveries. Today's top-tier last-mile delivery software still relies on static and historic data and attempts to solve the traveling salesman problem to optimality. We take a different approach. Our belief is that real time data streams and real-time algorithms will lead to agility and ultimately increased efficiency. We use traffic & weather information, in-house route-optimization algorithms and machine learning to boost our customers' fleet's efficiency & delivery success.

The [Foxtrot](https://foxtrot.io/) Android SDK allows you to leverage Foxtrot's agile routing platform in your already existing driver application.

Feel free to refer to the [Foxtrot Javadoc](https://foxtrotsystems.github.io/android-sdk-javadoc) as well.

## Prerequisites
1. The Foxtrot Android SDK is supported on Android API level 19 and above.
2. You will need a Foxtrot API key to identify your organization.

## Getting access

The Foxtrot SDK is hosted on [Bintray](https://bintray.com). You will need a Bintray account to access the SDK package. Once you have an account, Foxtrot will need to grant you access to the SDK.

## Installation

### 1. Setup Bintray configuration
Add the Foxtrot Maven repository to the `repositories` section of your build.gradle file. To obtain your Bintray API key, edit your Bintray profile and select the API Key section.


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
    compile "io.foxtrot:android-sdk:0.0.1-SNAPSHOT"
}
```
