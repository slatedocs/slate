# Android SDK

## Initiate connection to service
 
`private final ServiceConnection mConnection = new ServiceConnection()`

Connection made to the service. Once bound to the service, the binder object is passed through to messenger to set it up

> Please find examples in the Java tab

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

> Please find examples in the Java tab

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

> Please find examples in the Java tab

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

## Create new Broadcast Receiever object
 
`private BroadcastReceiver mMessageReceiver = new BroadcastReceiver()`

Broadcast receiver with the list of registered filters

> Please find examples in the Java tab

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

> Please find examples in the Java tab


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

> Please find examples in the Java tab

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

> Please find examples in the Java tab

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

> Please find examples in the Java tab


```java
    private void stopCaptureSetUp() {
        Toast.makeText(this, "Stopped capturing", Toast.LENGTH_SHORT).show();
        sendToService(getCaptureBundle(), ServiceConstants.CANCEL_CAPTURE);
    }
```
