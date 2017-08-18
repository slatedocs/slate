# iOS SDK

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
|Type|String|For now all peripherals are of type BLE|

> Example Usage

````swift
     if let peripheralDictionary = sdkManager?.bluetooth.getDeviceList()[index]?["peripheral"] {
        let peripheralToAdd = peripheralDictionary as! CBPeripheral
     }
````



