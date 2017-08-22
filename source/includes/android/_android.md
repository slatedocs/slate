# Android SDK

## Service Constants 

These constants can used to construct message bundled that are then relayed to the Emotion AI service to send and retrieve data.

One example of a call to the service would be to send credentials in order to authorize a user. See <a href = "#submit-credentials-to-service-for-authorisation">"Submit Credentials to service for authorisation"</a> for an example in how these bundles are constructed.


### Enable Scan
`public static final String ENABLE_SCAN = "enable-scan"`

This passes a message of enabling scan for the devices to the SDK service

### Device List
`public static final String DEVICE_LIST = "device-list"`

This is used to get list of scan devices

### Request
`public static final String REQUEST = "send-request"`

This is used to get request data

### Request Filter
`public static final String REQUEST_FILTER = "request-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for the request which is made to the SDK service

### Device filter
`public static final String DEVICE_FILTER = "device-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for the connected device

### Value Filter
`public static final String VALUE_FILTER = "value-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for receiving the heart rate value

### Login Filter
`public static final String LOGIN_FILTER = "login-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for the user login

### GPS Filter
`public static final String GPS_FILTER = "gps-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for receiving the gps values

### Acelerometer Filter
`public static final String ACC_FILTER = "acc-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for receiving the accelerometer values

### Extra Data
`public static final String EXTRA_DATA = "extra-data"`

This is used to bundle up extra data to the intents

### Device Name
`public static final String DEVICE_NAME = "device-name"`

This is used to get the connected device name

### Device Address
`public static final String DEVICE_ADDRESS = "device-address"`

This is used to get the connected device address

### User Name
`public static final String USER_NAME = "user-name"`

This is used to pass the username for authentication to the SDK service, only authenticated users are able to use the SDK service

### Password
`public static final String PASSWORD = "password"`

This is used to pass the password for authentication to the SDK service

### Wear HR Value
`public static final String WEAR_HR_VALUE = "wear-hr-value"`

This is used to pass the Heart Rate value captured using java Wear to the SDK service

### Text Message
`public static final String TEXT_MESSAGE = "text-message"`

This is used to pass Text/Emoji value to the SDK service

### X Value
`public static final String X_VALUE = "x-value"`

This is used to pass the captured accelerometer x value

### Y Value
`public static final String Y_VALUE = "y-value"`

This is used to pass the captured accelerometer y value

### Z Value
`public static final String Z_VALUE = "z-value"`

This is used to pass the captured accelerometer z value

### Speed Value
`public static final String SPEED_VALUE = "speed-value"`

This is used to pass the captured gps speed value

### Latitude Value
`public static final String LATITUDE_VALUE = "latitude-value"`

This is used to pass the captured gps latitude value

### Longitude Value
`public static final String LONGITUDE_VALUE = "longtitude-value"`

This is used to pass the captured gps longitude value

### Altitude Value
`public static final String ALTITUDE_VALUE = "altitude-value"`

This is used to pass the captured gps altitude value

### Bearing Value
`public static final String BEARING_VALUE = "bearing-value"`

This is used to pass the captured gps bearing value

### Accuracy Value
`public static final String ACCURACY_VALUE = "accuracy-value"`

This is used to pass the captured gps accuracy value

### Acceleration Capture
`public static final String ACCELERATION_CAPTURE = "acceleration-capture"`

This is used to enable/disable capturing of accelerometer data which is sent to the API

### GPS Capture
`public static final String GPS_CAPTURE = "gps-capture"`

This is used to enable/disable capturing of gps data which is sent to the API

### HR Capture
`public static final String HR_CAPTURE = "heartrate-capture"`

This is used to enable/disable capturing of heart rate data which is sent to the API

### Input Capture
`public static final String INPUT_CAPTURE = "input-capture"`

This is used to enable/disable capturing of text/emoji data which is sent to the API

### HR Data Rate
`public static final String HEARTRATE_DATA_RATE = "heartrate_data_rate"`

This is used to pass the interval rate (in milliseconds) for the heart rate data to be sent to the API

### Accelerometer Data Rate
`public static final String ACCELEROMETER_DATA_RATE = "accelerometer_data_rate"`

This is used to pass the interval rate (in milliseconds) for the accelerometer data to be sent to the API

### GPS Data Rate
`public static final String GPS_DATA_RATE = "gps_data_rate"`

This is used to pass the interval rate (in milliseconds) for the gps data to be sent to the API

### Input Tags Data Rate
`public static final String INPUT_TAGS_DATA_RATE = "input_tags_data_rate"`

This is used to pass the interval rate (in milliseconds) for the text/emoji data to be sent to the API

### Device Disconnected
`public static final String DEVICE_DISCONNECTED = "com.example.bluetooth.le.ACTION_GATT_DISCONNECTED"`

This is used to pass a message from the SDK service in case of any device disconnection

### API Response
`public static final String API_RESPONSE = "api-response"`

This is used to pass message from the SDK service for the API response

### Toast Message
`public static final String TOAST_MESSAGE = "toast-message"`

This is used to pass informative toast message from the SDK service

### API Base URL
`public static final String API_BASEURL = "api-baseurl"`

This is used to pass the base url for API to the SDK service which is used for setting up communication with the API

### Auth Token
`public static final String AUTH_TOKEN = "auth-token"`

This is used to pass the authentication token for API to the SDK service which is used for setting up communication with the API

### User Pool Id
`public static final String USER_POOL_ID = "user-poolid"`

This is used to pass the user pool id to the SDK service which is used for user authentication

### Client Id
`public static final String CLIENT_ID = "client-id"`

This is used to pass the client id to the SDK service which is used for user authentication

### Connect
`public static final int CONNECT = 101`

This is used to connect to the selected device from the list of the devices

### Bind Service
`public static final int BIND_SERVICE = 103`

This is used for binding to the service

### Unbind Service
`public static final int UNBIND_SERVICE = 104`

This is used for unbinding from the service

### Scan
`public static final int SCAN = 105`

This is used internally in the SDK service to filter scan for devices

### Devices
`public static final int DEVICES = 106`

This is used to filter for devices

### Send
`public static final int SEND = 108`

This is sued to filter send from the front end

### Connecting
`public static final int CONNECTING = 109`

This is used to filter connecting from the front end

### Start Service
`public static final int START_SERVICE = 111`

This is used to start the service

### Cancel Capture
`public static final int CANCEL_CAPTURE = 112`

This is used to cancel sending of the captured data to the API

### Start Capture
`public static final int START_CAPTURE = 113`

This is used to start sending of the captured data to the API

### Enable Storing
`public static final int ENABLE_STORING = 114`

This is used to enable storing of the captured data locally on the device

### Disable Storing
`public static final int DISABLE_STORING = 115`

This is used to disable storing of the captured data locally on the device

### Enable HR Timer
`public static final int ENABLE_HRTIMER = 116`

This is used to enable the timer for sending the heart rate data to the API

### Disable HR Timer
`public static final int DISABLE_HRTIMER = 117`

This is used to disable the timer for sending the heart rate data to the API

### Enable Accelerometer Timer
`public static final int ENABLE_ACCTIMER = 118`

This is used to enable the timer for sending the accelerometer data to the API

### Disable Accelerometer Timer
`public static final int DISABLE_ACCTIMER = 119`

This is used to disable the timer for sending the accelerometer data to the API

### Enable GPS Timer
`public static final int ENABLE_GPSTIMER = 120`

This is used to enable the timer for sending the gps data to the API

### Disable GPS Timer
`public static final int DISABLE_GPSTIMER = 121`

This is used to disable the timer for sending the gps data to the API

### Enable Input Timer
`public static final int ENABLE_INPUTTIMER = 122`

This is used to enable the timer for sending the text/emoji data to the API

### Disable Input Timer
`public static final int DISABLE_INPUTTIMER = 123`

This is used to enable the timer for sending the text/emoji data to the API

### Login
`public static final int LOGIN = 124`

This is used to pass a login message to the SDK service

### Input Text
`public static final int INPUT_TEXT = 125`

This is used to filter/pass text & emoji message to the SDK service



## Example Methods

## Initiate connection to service
 
`private final ServiceConnection mConnection = new ServiceConnection()`

Connection made to the service. Once bound to the service, the binder object is passed through to messenger to set it up


```java
    private final ServiceConnection mConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            mIsBound = true;
            mServiceMessenger = new Messenger(binder);
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {

        }
    };
```

## Submit Credentials to service for authorisation 

`void submit()`

Sets up the credential bundle to be sent to the SDK service this needs to be sent first to the SDK service as only authenticated users can use the service



```java
    void submit() {
        Bundle bundle = new Bundle();
        bundle.putString(USER_NAME, "username");
        bundle.putString(PASSWORD, "password");
        bundle.putString(USER_POOL_ID, "userPoolId");
        bundle.putString(CLIENT_ID, "clientId");
        bundle.putString(API_BASEURL, "apiBaseUrl");
        bundle.putString(AUTH_TOKEN, "authToken");
        sendToService(bundle, LOGIN);
    }
```

## Send a data message to the service 
 
`public void sendToService(Bundle bundle, int argValue)`

Send message to the service

 * **Parameters:**
   * `bundle` — any data that needs passed to the service
   * `argValue` — for service handler to switch on



```java
    public void sendToService(Bundle bundle, int argValue) {
        Message message = Message.obtain();
        message.arg1 = argValue;
        message.setData(bundle);
        try {
            mServiceMessenger.send(message);
            Toast.makeText(this, "Requested the service", Toast.LENGTH_SHORT).show();
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }
```

## Create new Broadcast Receiver object
 
`private BroadcastReceiver mMessageReceiver = new BroadcastReceiver()`

Broadcast receiver with the list of registered filters



```java
    private BroadcastReceiver mMessageReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();

            switch (action) {
                case DEVICE_FILTER:
                    ArrayList<BluetoothDevice devices = intent.getParcelableArrayListExtra(EXTRA_DATA);
                    break;
                case VALUE_FILTER:
                    String message = intent.getStringExtra(EXTRA_DATA);
                    Log.d(TAG, "onReceive: " + message);
                    break;
                case GPS_FILTER:
                    Bundle gpsBundle = intent.getBundleExtra(EXTRA_DATA);
                    break;
                case ACC_FILTER:
                    Bundle accBundle = intent.getBundleExtra(EXTRA_DATA);
                    break;
                case DEVICE_DISCONNECTED:
                    Log.d(TAG, "Device disconnected, please re-connect");
                    break;
                case API_RESPONSE:
                    String apiResponse = intent.getStringExtra(EXTRA_DATA);
                    Log.d(TAG, apiResponse);
                    break;
                case TOAST_MESSAGE:
                    String toastMessage = intent.getStringExtra(EXTRA_DATA);
                    break;
                case WEAR_HR_VALUE:
                    String wearMessage = intent.getStringExtra(EXTRA_DATA);
                    break;
            }

        }
    };
```

## Update IntentFilter with new Actions 

`private IntentFilter updateIntentFilter()`

 * **Returns:** an intent filter with a list of actions




```java
    private IntentFilter updateIntentFilter() {
        final IntentFilter intentFilter = new IntentFilter();

        intentFilter.addAction(REQUEST_FILTER);
        intentFilter.addAction(DEVICE_FILTER);
        intentFilter.addAction(VALUE_FILTER);
        intentFilter.addAction(GPS_FILTER);
        intentFilter.addAction(ACC_FILTER);
        intentFilter.addAction(DEVICE_DISCONNECTED);
        intentFilter.addAction(API_RESPONSE);
        intentFilter.addAction(TOAST_MESSAGE);
        intentFilter.addAction(WEAR_HR_VALUE);
        return intentFilter;
    }
```

## Start biometric data capture

`private void startCaptureSetUp()`

Starts capturing of biometric/contextual data



```java
    private void startCaptureSetUp() {
        Toast.makeText(this, "Started capturing", Toast.LENGTH_SHORT).show();
        Log.d(TAG, "Started capturing");
        sendToService(getCaptureBundle(), START_CAPTURE);
    }
```

## Get capture bundle
`private Bundle getCaptureBundle()`

Sets up the bundle data for capture using the service constants

 * **Returns:** capture bundle



```java
    private Bundle getCaptureBundle() {
        Bundle bundle = new Bundle();
        bundle.putBoolean(ACCELERATION_CAPTURE, adapter.accelerationView.getSwitchValue());
        bundle.putBoolean(HR_CAPTURE, true);
        bundle.putBoolean(GPS_CAPTURE, true);
        bundle.putBoolean(INPUT_CAPTURE, true);
        bundle.putLong(HEARTRATE_DATA_RATE, 20000);
        bundle.putLong(ACCELEROMETER_DATA_RATE, 30000);
        bundle.putLong(GPS_DATA_RATE, 20000);
        bundle.putLong(INPUT_TAGS_DATA_RATE, 20000);
        return bundle;
    }
```



## Stop biometric data capture
 `private void stopCaptureSetUp()`

Stops capturing of biometric/contextual data




```java
    private void stopCaptureSetUp() {
        Toast.makeText(this, "Stopped capturing", Toast.LENGTH_SHORT).show();
        sendToService(getCaptureBundle(), ServiceConstants.CANCEL_CAPTURE);
    }
```
