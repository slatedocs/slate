# Introduction

The [Foxtrot](https://foxtrot.io/) Android SDK allows you to leverage Foxtrot's powerful route-optimization functionality in your own applications.

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
