# iOS SDK

## Introduction

### SDK Module Command Protocol

Every Sensum SDK module conforms to the module command protocol.
At present these can be switched on and off independently. Every SDK managed object has three states that can be toggled independently:

* Updating: You will get live data updates from the respective managed object. If you have defined a listener for that object it’s update methods will be called by the SDK and you can reflect these and carry out actions in your app.
* Recording: Data updates will be stored only. If you do not turn on updates no data can be recorded as updates will not be read.
* Sending To API: Data updates will be recorded and sent to the Emotion AI service.

> Protocol Code

```swift
import foundation

public protocol SDKModuleCommandProtocol {
    func startUpdating()
    func stopUpdating()
    func startRecording()
    func stopRecording()
    func startSendingToAPI()
    func stopSendingToAPI()
    func isUpdating() -> Bool
    func isRecording() -> Bool
    func isSendingToAPI() -> Bool
}
```

## Authentication

To get started working with the Sensum SDK manager you’re going to need a valid Authentication session. Create an instance of this object and give it valid sign in details

### Initialisation

`var authenticationObj = Authentication()`

Create an instance of the Authentication object, specifying the Cognito User Pool ID, the App Client ID, the API base URL and your API key.
These should all have been provided to you by Sensum when you requested API access.

####Parameters

|Name|Description|
|----|-----------|
|cognitoUserPoolId|This is the user pool ID we have given you to use|
|CognitoClientId|This is the Cognito App Client ID we have given you to use|
|apiBaseURL|This is the base URL of the API, this may change over time hence we allow you to configure this from your app|
|apiKey|This is your unique developer's API access key, contact Sensum to get one if we haven't given you one already|

### Login

'authenticationObj.attemptSignIn()'

Sign in using your Amazon Web Service Cognito account details with a username and password.
This will allows you to create and instantiate the SDK fully and enable sending requests to our emotion AI service.

#### Parameters

|Name|Description|
|----|-----------|
|username|The cognito username you have registered with|
|password|The cognito password you have registered with|

## Bluetooth Command

Below are all available commands relating to Bluetooth in the iOS SDK.

### Initialisation

`var bluetoothCommand = BluetoothCommand()`

### Start Updating

`bluetoothCommand.startUpdating()`

Start the updates of any connected heart rate peripheral 

 ### Stop Updating

 `bluetoothCommand.stopUpdating()`

Stop the updates of any connected heart rate peripheral

 ### Start Recording

 `bluetoothCommand.startRecording()`

Start recording the updates of any connected heart rate peripheral 

### Stop Recording

`bluetoothCommand.stopRecording()`

Stop recording the updates of any connected heart rate peripheral

### Start Sending to Emotion AI Service

`bluetoothCommand.startSendingToAPI()`

Start sending the updates of any connected heart rate peripheral to the Emotion AI service

###Stop Sending to Emotion AI Service

`bluetoothCommand.stopSendingToAPI()`

Stop sending the updates of any connected heart rate peripheral to the Emotion AI service

### Check Module Update Status

`bluetoothCommand.isUpdating()`

Check if module is updating. Returns a boolean value.

### Check Module Recording Status

`bluetoothCommand.isRecording()`

Check if module is recording. Returns a boolean value.

### Check Emotion AI Update Status

`bluetoothCommand.isSendingToAPI()`

Check if module is sending to the Emotion AI Service

### Assign Listener
 
`bluetoothCommand.assignListener()`

Assign a listener to the bluetooth module to receive bluetooth event updates.


#### Parameters
|Parameter|Type|Description|
|---------|----|-----------|
|listener|BluetoothListener|An instance of a class that conforms to the Bluetooth listener extension|

### Start Scan for Devices

`bluetoothCommand.startScanForDevices()`

Start scanning for discoverable peripheral devices

### Connect to peripheral device

`bluetoothCommand.connectTo()`

Connect to a discovered peripheral device. Discovered devices can be acquired from the listOfDevices returned by the getDeviceList() function.

#### Parameters
|Parameter|Type|Description|
|---------|----|-----------|
|peripheralDevice|CBPeripheral|The bluetooth peripheral device you want to connect to|

### Clear List of Discovered Devices

`bluetoothCommand.clearDeviceList()`

Clear the list of devices discovered (equivalent to a refresh)


### Disconnect from Device

`bluetoothCommand.disconnect()`

Disconnect from the currently connected peripheral device

### Get Device List

`bluetoothCommand.getDeviceList()`

Return a list of all discovered peripherals. This list is populated when startScanForDevices() is called.

Returns a list of dictionaries containing bluetooth peripheral information with three fields:

|Field Name|Type|Description|
|----------|----|-----------|
|deviceName|String|returns a String of the device name|
|peripheral|CoreBluetooth CBPeripheral| returns the CoreBluetooth CBPeripheral object (import CoreBluetooth to use this)|
|type|String|For now all peripherals are of type BLE|

> Example Usage

````swift
     if let peripheralDictionary = sdkManager?.bluetooth.getDeviceList()[index]?["peripheral"] {
        let peripheralToAdd = peripheralDictionary as! CBPeripheral
     }
````



