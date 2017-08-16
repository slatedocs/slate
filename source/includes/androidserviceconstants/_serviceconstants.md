# Android SDK Service Constants 

## `public static final String ENABLE_SCAN = "enable-scan"`

This passes a message of enabling scan for the devices to the SDK service

## `public static final String DEVICE_LIST = "device-list"`

This is used to get list of scan devices

## `public static final String REQUEST = "send-request"`

This is used to get request data

## `public static final String REQUEST_FILTER = "request-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for the request which is made to the SDK service

## `public static final String DEVICE_FILTER = "device-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for the connected device

## `public static final String VALUE_FILTER = "value-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for receiving the heart rate value

## `public static final String LOGIN_FILTER = "login-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for the user login

## `public static final String GPS_FILTER = "gps-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for receiving the gps values

## `public static final String ACC_FILTER = "acc-filter"`

This is used to pass a message from the SDK service which is used as an intent filter at the front end for receiving the accelerometer values

## `public static final String EXTRA_DATA = "extra-data"`

This is used to bundle up extra data to the intents

## `public static final String DEVICE_NAME = "device-name"`

This is used to get the connected device name

## `public static final String DEVICE_ADDRESS = "device-address"`

This is used to get the connected device address

## `public static final String USER_NAME = "user-name"`

This is used to pass the username for authentication to the SDK service, only authenticated users are able to use the SDK service

## `public static final String PASSWORD = "password"`

This is used to pass the password for authentication to the SDK service

## `public static final String WEAR_HR_VALUE = "wear-hr-value"`

This is used to pass the Heart Rate value captured using Android Wear to the SDK service

## `public static final String TEXT_MESSAGE = "text-message"`

This is used to pass Text/Emoji value to the SDK service

## `public static final String X_VALUE = "x-value"`

This is used to pass the captured accelerometer x value

## `public static final String Y_VALUE = "y-value"`

This is used to pass the captured accelerometer y value

## `public static final String Z_VALUE = "z-value"`

This is used to pass the captured accelerometer z value

## `public static final String SPEED_VALUE = "speed-value"`

This is used to pass the captured gps speed value

## `public static final String LATITUDE_VALUE = "latitude-value"`

This is used to pass the captured gps latitude value

## `public static final String LONGITUDE_VALUE = "longtitude-value"`

This is used to pass the captured gps longitude value

## `public static final String ALTITUDE_VALUE = "altitude-value"`

This is used to pass the captured gps altitude value

## `public static final String BEARING_VALUE = "bearing-value"`

This is used to pass the captured gps bearing value

## `public static final String ACCURACY_VALUE = "accuracy-value"`

This is used to pass the captured gps accuracy value

## `public static final String ACCELERATION_CAPTURE = "acceleration-capture"`

This is used to enable/disable capturing of accelerometer data which is sent to the API

## `public static final String GPS_CAPTURE = "gps-capture"`

This is used to enable/disable capturing of gps data which is sent to the API

## `public static final String HR_CAPTURE = "heartrate-capture"`

This is used to enable/disable capturing of heart rate data which is sent to the API

## `public static final String INPUT_CAPTURE = "input-capture"`

This is used to enable/disable capturing of text/emoji data which is sent to the API

## `public static final String HEARTRATE_DATA_RATE = "heartrate_data_rate"`

This is used to pass the interval rate (in milliseconds) for the heart rate data to be sent to the API

## `public static final String ACCELEROMETER_DATA_RATE = "accelerometer_data_rate"`

This is used to pass the interval rate (in milliseconds) for the accelerometer data to be sent to the API

## `public static final String GPS_DATA_RATE = "gps_data_rate"`

This is used to pass the interval rate (in milliseconds) for the gps data to be sent to the API

## `public static final String INPUT_TAGS_DATA_RATE = "input_tags_data_rate"`

This is used to pass the interval rate (in milliseconds) for the text/emoji data to be sent to the API

## `public static final String DEVICE_DISCONNECTED = "com.example.bluetooth.le.ACTION_GATT_DISCONNECTED"`

This is used to pass a message from the SDK service in case of any device disconnection

## `public static final String API_RESPONSE = "api-response"`

This is used to pass message from the SDK service for the API response

## `public static final String TOAST_MESSAGE = "toast-message"`

This is used to pass informative toast message from the SDK service

## `public static final String API_BASEURL = "api-baseurl"`

This is used to pass the base url for API to the SDK service which is used for setting up communication with the API

## `public static final String AUTH_TOKEN = "auth-token"`

This is used to pass the authentication token for API to the SDK service which is used for setting up communication with the API

## `public static final String USER_POOL_ID = "user-poolid"`

This is used to pass the user pool id to the SDK service which is used for user authentication

## `public static final String CLIENT_ID = "client-id"`

This is used to pass the client id to the SDK service which is used for user authentication

## `public static final int CONNECT = 101`

This is used to connect to the selected device from the list of the devices

## `public static final int BIND_SERVICE = 103`

This is used for binding to the service

## `public static final int UNBIND_SERVICE = 104`

This is used for unbinding from the service

## `public static final int SCAN = 105`

This is used internally in the SDK service to filter scan for devices

## `public static final int DEVICES = 106`

This is used to filter for devices

## `public static final int SEND = 108`

This is sued to filter send from the front end

## `public static final int CONNECTING = 109`

This is used to filter connecting from the front end

## `public static final int START_SERVICE = 111`

This is used to start the service

## `public static final int CANCEL_CAPTURE = 112`

This is used to cancel sending of the captured data to the API

## `public static final int START_CAPTURE = 113`

This is used to start sending of the captured data to the API

## `public static final int ENABLE_STORING = 114`

This is used to enable storing of the captured data locally on the device

## `public static final int DISABLE_STORING = 115`

This is used to disable storing of the captured data locally on the device

## `public static final int ENABLE_HRTIMER = 116`

This is used to enable the timer for sending the heart rate data to the API

## `public static final int DISABLE_HRTIMER = 117`

This is used to disable the timer for sending the heart rate data to the API

## `public static final int ENABLE_ACCTIMER = 118`

This is used to enable the timer for sending the accelerometer data to the API

## `public static final int DISABLE_ACCTIMER = 119`

This is used to disable the timer for sending the accelerometer data to the API

## `public static final int ENABLE_GPSTIMER = 120`

This is used to enable the timer for sending the gps data to the API

## `public static final int DISABLE_GPSTIMER = 121`

This is used to disable the timer for sending the gps data to the API

## `public static final int ENABLE_INPUTTIMER = 122`

This is used to enable the timer for sending the text/emoji data to the API

## `public static final int DISABLE_INPUTTIMER = 123`

This is used to enable the timer for sending the text/emoji data to the API

## `public static final int LOGIN = 124`

This is used to pass a login message to the SDK service

## `public static final int INPUT_TEXT = 125`

This is used to filter/pass text & emoji message to the SDK service
