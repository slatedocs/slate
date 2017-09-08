# Summary Guide

## API Control: Setting Server Request Rate

### iOS

 * After instantiating the SDK Manager, call the method `sdkManager?.api.setServerRequestRate(requestRateInSeconds)`. The parameter requestRateInSeconds is an integer value.

### Android

When using the `sendToService` method ensure that you send the integer parameters **DATA_RATE_SAMPLE** and **DATA_RATE_SEND** as part of your bundle.


## API Control: Getting the Server Request Rate

### iOS

* After instantiating the SDK Manager, call the method `sdkManager?.api.getServerRequestRate()`.

### Android

* There is currently no functionality to return the the current data rate in the Android SDK.


## API Control: Listen for API events

### iOS

* After instantiating the SDK Manager, call the method sdkManager?.api.assignListener(self) to register an apiListener.

### Android

### Use a Broadcast Receiver

 * A *BroadcastReceiver* ‘listens’ for (receives and handles) *Broadcast Intents*, sent by the *Service*.
 * The *BroadcastReceiver* is essential as it manages messages sent from the **sdk-release**, within the front-end application.
 * The *BroadcastReceiver* makes use of *Filters*, that determine which events the application should ‘listen’ for.
 * The over-ridden method *.onReceive* takes two arguments: *Context* and *Intent*. The *Intent* parameter has an associated action that specifies how the
 *BroadcastReceiver* should behave.
 * Table 1 outlines the filters included in the *Service* and the *Intent Extras* they return.

### Table 1

|Action|Description|IntentExtras|
|------|-----------|------------|
|**BLE_DEVICE_FILTER**|Filters for BLE devices|ArrayList<BluetoothDevice>|
|**VALUE_FILTER**|Filters for heart rate value|String|
|**GPS_FILTER**|Filters for GPS values|Bundle|
|**ACC_FILTER**|Filters for acceleration values|Bundle|
|**DEVICE_DISCONNECTED**|Filters for a device disconnected value|null|
|**API_RESPONSE**|Filters for responses from the API|String|
|**TOAST_MESSAGE**|Filters for messages from the Service|String|
|**CONNECTION_FILTER**|Filters for connection BLE messages|String|
|**BLUETOOTH_CONNECTION_FILTER**|Filters for bluetooth connection messages|String|
|**BLUETOOTH_DEVICE_FILTER**|Filters for bluetooth devices|ArrayList<BluetoothDevice>|
|**GSR_FILTER**|Filters for GSR values|String|
|**ACC_FAILED_REGISTERED**|Filters for acceleration failure from unsupported devices|null|
|**HELLO_FILTER**|Filters for hello message|String|

## Setting up the Broadcast Receiver

  * Code Snippet 1 contains all necessary code that will allow you to setup a *BroadcastReceiver*.

  > Code Snippet 1

  ```java
    private BroadcastReceiver mMessageReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            switch (action){
                case HELLO_FILTER:
                    Toast.makeText(MainActivity.this, intent.getStringExtra(EXTRA_DATA), Toast.LENGTH_LONG).show();
                    break;
                case GPS_FILTER:
                    Bundle gpsBundle = intent.getBundleExtra(EXTRA_DATA);
                    break;
                case ACC_FILTER:
                    Bundle accBundle = intent.getBundleExtra(EXTRA_DATA);
                    isAcc = true;
                    break;
                case VALUE_FILTER:
                    String hrValue = intent.getStringExtra(EXTRA_DATA);
                    break;
                case GSR_FILTER:
                    String gsrValue = intent.getStringExtra(EXTRA_DATA);
                    break;
                case API_RESPONSE:
                    String apiResponse = intent.getStringExtra(EXTRA_DATA);
                    break;
                case TOAST_MESSAGE:
                    String toastMessage = intent.getStringExtra(EXTRA_DATA);
                    break;
            }
        }
    };
  ```

 * The *BroadcastReceiver* must be registered in order to receive *Intents* from a *Service*.
 * The *registerReceiver* method, takes two arguments: *BroadcastReceiver* and *IntentFilter*.
 * We have included our own method that returns an *IntentFilter:* `getUpdateIntentFilter()` (this method is displayed within Code Snippet 3).
 * This method should be called immediately on starting the application, therefore, it is placed within the `.onResume()` method, as shown in Code Snippet 2.

> Code Snippet 5

```java
 @Override
    protected void onResume() {
        super.onResume();
        registerReceiver(mMessageReceiver, getUpdateIntentFilter());
    }
```

> Code Snippet 3

```java
  private IntentFilter getUpdateIntentFilter() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(HELLO_FILTER);
        filter.addAction(GPS_FILTER);
        filter.addAction(ACC_FILTER);
        filter.addAction(VALUE_FILTER);
        filter.addAction(GSR_FILTER);
        filter.addAction(API_RESPONSE);
        filter.addAction(TOAST_MESSAGE);
        return filter;
    }
```

 * When the application is destroyed (on application close/force-close), the *BroadcastReceiver* must be unregistered. This is handled via the `.onDestroy()` method.
Code Snippet 4 demonstrates how to achieve this.

> Code Snippet 4

```java
    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (mIsBound){
            unbindService(mConnection);
            mIsBound = false;
            unregisterReceiver(mMessageReceiver);
        }
    }
```

<!-- Accelerometer Control -->
## Accelerometer Control: Start Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.startUpdating()`.

### Android

Use the `sendToService` method the the boolean `ACCELERATION_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Accelerometer Control: Stop Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.stopUpdating()`.

### Android

Use the `sendToService` method the the boolean `ACCELERATION_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Accelerometer Control: Start Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.startRecording()`.

### Android

Use the `sendToService` method the the boolean `ACCELERATION_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Accelerometer Control: Stop Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.stopRecording()`.

### Android

Use the `sendToService` method the the boolean `ACCELERATION_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Accelerometer Control: Start SendingTo API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.startSendingToAPI()`.

### Android

Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle Accelerometer data using the **ACC_Filter** intent If not done already.

Use the `sendToService` method the the boolean `ACCELERATION_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Accelerometer Control: Stop Sending to the API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.stopSendingToAPI()`.

### Android

Use the `sendToService` method the the boolean `ACCELERATION_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Accelerometer Control: Check Update status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.isUpdating()`.

### Android

* It is currently not possible to check the update status in Android.

## Accelerometer Control: Check Recording status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.isRecording()`.

### Android

* It is currently not possible to check the recording status in Android.

## Accelerometer Control: Check API Sending status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.isSendingToAPI()`.

### Android

* It is currently not possible to check the API sending status in Android.

## Accelerometer Control: Assign Listener

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.assignListener(self)`.

### Android

* Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle Accelerometer data using the **ACC_Filter** intent.

## Accelerometer Control: Set Read Frequency

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.accelerometer.setReadFrequency(newIntervalInSeconds)` where the parameter newIntervalInSeconds is an integer value.

### Android

* When sending the **START_CAPTURE** message to the service using the `sendToService` method, Set the rate of capture using the integer variable DATA_RATE_SAMPLE, while the boolean **ACCELERATION_CAPTURE** is **true**.


<!-- Location Control -->
## Location Control: Start Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.startUpdating()`.

### Android

Use the `sendToService` method the the boolean `GPS_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Location Control: Stop Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.stopUpdating()`.

### Android

Use the `sendToService` method the the boolean `GPS_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## location Control: Start Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.startRecording()`.

### Android

Use the `sendToService` method the the boolean `GPS_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Location Control: Stop Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.stopRecording()`.

### Android

Use the `sendToService` method the the boolean `GPS_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Location Control: Start Sending To API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.startSendingToAPI()`.

### Android

Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle location data using the **GPS_Filter** intent If not done already.

Use the `sendToService` method the the boolean `GPS_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Location Control: Stop Sending to the API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.stopSendingToAPI()`.

### Android

Use the `sendToService` method the the boolean `GPS_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Location Control: Check Update status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.isUpdating()`.

### Android

* It is currently not possible to check the update status in Android.

## Location Control: Check Recording status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.isRecording()`.

### Android

* It is currently not possible to check the recording status in Android.

## location Control: Check API Sending status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.isSendingToAPI()`.

### Android

* It is currently not possible to check the API sending status in Android.

## Location Control: Assign Listener

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.assignListener(self)`.

### Android

* Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle location data using the **GPS_Filter** intent.

## Location Control: Set Read Frequency

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.location.setReadFrequency(newIntervalInSeconds)` where the parameter newIntervalInSeconds is an integer value.

### Android

* When sending the **START_CAPTURE** message to the service using the `sendToService` method, Set the rate of capture using the integer variable DATA_RATE_SAMPLE, while the boolean **GPS_CAPTURE** is `true`.

<!-- Tag Control -->
## Tag Control: Start Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.startUpdating()`.

### Android

Use the `sendToService` method the the boolean `INPUT_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Tag Control: Stop Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.stopUpdating()`.

### Android

Use the `sendToService` method the the boolean `INPUT_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Tag Control: Start Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.startRecording()`.

### Android

Use the `sendToService` method the the boolean `INPUT_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Tag Control: Stop Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.stopRecording()`.

### Android

Use the `sendToService` method the the boolean `INPUT_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Tag Control: Start Sending To API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.startSendingToAPI()`.

### Android

Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle tag data using the **TOAST_MESSAGE** intent If not done already.

Use the `sendToService` method the the boolean `INPUT_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Tag Control: Stop Sending to the API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.stopSendingToAPI()`.

### Android

Use the `sendToService` method the the boolean `INPUT_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Tag Control: Check Update status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.isUpdating()`.

### Android

* It is currently not possible to check the update status in Android.

## Tag Control: Check Recording status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.isRecording()`.

### Android

* It is currently not possible to check the recording status in Android.

## Tag Control: Check API Sending status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.isSendingToAPI()`.

### Android

* It is currently not possible to check the API sending status in Android.

## Tag Control: Assign Listener

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.assignListener(self)`.

### Android

* Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle tag data using the **TOAST_MESSAGE** intent.

## Tag Control: Create Tag

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.tag.createTag(tag)` where the parameter tag is an String value.

### Android

* When sending the **INPUT_TEXT** message to the service using the `sendToService` method, add the string parameter TEXT_MESSAGE.


<!-- Bluetooth Control -->
## Bluetooth Control: Start Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.startUpdating()`.

### Android

Use the `sendToService` method the the boolean `HR_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Bluetooth Control: Stop Updating

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.stopUpdating()`.

### Android

Use the `sendToService` method the the boolean `HR_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Bluetooth Control: Start Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.startRecording()`.

### Android

Use the `sendToService` method the the boolean `HR_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Bluetooth Control: Stop Recording

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.stopRecording()`.

### Android

Use the `sendToService` method the the boolean `HR_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Bluetooth Control: Start Sending To API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.startSendingToAPI()`.

### Android

Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle bluetooth data using the **BLE_DEVICE_FILTER**, **BLUETOOTH_CONNECTION_FILTER**, **BLUETOOTH_DEVICE_FILTER**, **DEVICE_DISCONNECTED** and **CONNECTION_FILTER** intents if not done already.

Use the `sendToService` method the the boolean `HR_CAPTURE = true` with the constant **START_CAPTURE** to the background service.

## Bluetooth Control: Stop Sending to the API

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.stopSendingToAPI()`.

### Android

Use the `sendToService` method the the boolean `HR_CAPTURE = true` with the constant **CANCEL_CAPTURE** to the background service.

## Bluetooth Control: Check Update status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.isUpdating()`.

### Android

* It is currently not possible to check the update status in Android.

## Bluetooth Control: Check Recording status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.isRecording()`.

### Android

* It is currently not possible to check the recording status in Android.

## Bluetooth Control: Check API Sending status

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.isSendingToAPI()`.

### Android

* It is currently not possible to check the API sending status in Android.

## Bluetooth Control: Assign Listener

### iOS  

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.assignListener(self)`.

### Android

* Create a <a href = "#use-a-broadcast-receiver">Broadcast Receiver</a>, setting it up to handle bluetooth data using the **BLE_DEVICE_FILTER**, **BLUETOOTH_CONNECTION_FILTER**, **BLUETOOTH_DEVICE_FILTER**, **DEVICE_DISCONNECTED** and **CONNECTION_FILTER** intents.

## Bluetooth: Scan for Devices

### iOS

 * After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.startScanForDevices()` A list of device names and addresses will be generated.

### Android

 * Use the `sendToService` method with the constant **BLE_SCAN** or **BLUETOOTH_SCAN**, depending on if the device is compatible with Bluetooth LE or standard, to send the command to the background service.

## Bluetooth: Connect to Device

### iOS

 * After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.connectTo(peripheralDevice)` where peripheralDevice is an object containing the required device's name and address.


### Android
 * Use the `sendToService` method with the constant **CONNECT** or **CONNECT_BLUETOOTH_DEVICE**, depending on if the device is compatible with Bluetooth LE or standard, as well a bundle containg the string variables **DEVICE_NAME** and **DEVICE_ADDRESS** to send the command to the background service.

## Bluetooth: Clear List of Discovered Devices

### iOS
 * After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.clearDeviceList()`.

### Android

There is no equivalent function in the Android SDK. To perform this function perform another scan by using the `sendToService` method with the constant **BLE_SCAN** or **BLUETOOTH_SCAN**, depending on if the device is compatible with Bluetooth LE or standard, to send the command to the background service.

 ## Bluetooth: Disconnect From Device

### iOS

* After instantiating the SDK Manager, call the method `sdkManager?.bluetooth.disconnect()` to disconnect from the currently connected peripheral.

### Android

* There is currently no functionality to disconnect the current bluetooth device in the Android SDK.
