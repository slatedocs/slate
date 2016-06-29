
## Prerequisites
1. Android API Level 19 or above
2. A Foxtrot API key

## Getting access

The Foxtrot SDK is hosted on [Bintray](https://bintray.com). You will need a Bintray account to access the SDK package. Once you have an account, Foxtrot will need to grant you access to the SDK.

## Installation
### 1. Setup Bintray configuration
```
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
Add the Foxtrot Maven repository to the `repositories` section of your build.gradle file. To obtain your Bintray API key, edit your Bintray profile and select the API Key section.



### 2. Add the Foxtrot Android SDK as a dependency in your build.gradle

```
dependencies {
    ...
    compile "io.foxtrot:android-sdk:0.0.1-SNAPSHOT"
}
```
