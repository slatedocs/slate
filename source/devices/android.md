
#Android SDK

Send information from your Android device to Ubidots.

After doing this tutorial you should be able to communicate with our API using our Android Library within your Android application.

We have developed an example app, the *Android GPS Tracker*: 

[![Ups!](../_static/getting_started/geopoint/android_app.png)](https://play.google.com/store/apps/details?id=com.ubidots.ubidots)

[You can find the source code of the Android GPS Tracker in our Github page](https://github.com/ubidots/ubidots-android-gps-tracker)

##Introduction

Android is an Open-Source operating system created by Android, Inc. and bought by Google in 2005. It's the most used operating system in mobile devices thanks to its availability for third party manufacturers to include it on their devices free of charge.

##Components

To accomplish this tutorial, you'll need:

* [An Android device](https://developer.android.com/design/devices.html),preferably with Android 4.0 or higher
* Android Studio

##Setting up Android Studio

* [Download Android Studio](https://developer.android.com/sdk/installing/studio.html) from Android Developers
* If you're using Windows, just install it. If you're using Linux, just double-click on "studio.sh" or open it via Terminal *./studio.sh*. And if you're using OS X, just drag & drop *"Android Studio.app"* to the Applications folder.

##Preparing your Ubidots account

**First first:** Create a Datasource called *"Android Phone" (or whatever you like)* and then add variables and widgets.

1. As a [logged in user](http://app.ubidots.com/accounts/signin/) navigate to the sources tab.
![Ups!](../_static/devices/sources.png)

2. Create the Datasource by clicking the on the orange button located in the upper right corner of the screen.
![Ups!](../_static/devices/new-source.png)

3. Select the *Generic* option.
![Ups!](../_static/devices/android-generic-source.png)

4. We just need to fill the data and click on the *Create* button.
![Ups!](../_static/devices/android-naming-source.png)

5. Click on the created Datasource and then on *"Add new variable"*. As we are going to send our battery level, we will create a variable named *batteryLevel*
![Ups!](../_static/devices/android-creation-variable.png)

6. Take note of the variable ID as we are going to need it later for our application to work.
![Ups!](../_static/devices/android-id-variable.png)

7. Create a token under *"My profile"* tab. We'll need it to access all the posibilities that our API have.
![Ups!](../_static/devices/android-profile-tab.png)
8. Add the widget to your [dashboard](http://app.ubidots.com/ubi/insights/#/list) by clicking the orange button with the "+" symbol inside.

    * We are going to add to widgets: The first showing our battery level in a line chart.
    ![Ups!](../_static/devices/android-linechart-dashboard.png)
     
    * And the second showing the last value of our battery
    ![Ups!](../_static/devices/android-lastvalue-dashboard.png)
    
##Coding and pushing data from our Android phone

**Second goal:** Create our application to send data from it to Ubidots!

1. Remember I told you to download and install Android Studio? Well, now it's time to open it. A window will popup and you'll click on the *"New project"* button.
    ![Ups!](../_static/devices/android-new-project-studio.png)

2. Choose any name you want for the application. I will call it **UbidotsApp** (I don't have a lot of imagination for names, sorry!).
    ![Ups!](../_static/devices/android-naming-project-studio.png)

3. I also recommended you to have an Android phone (or emulator) with Android 4.0 or higher. For this tutorial I will use the API 14 of Android, that targets all the phones using Android 4.0 or higher. You can also use our API in older versions of Android, but you'll have to learn how to use [support libraries](http://developer.android.com/tools/support-library/index.html)
    ![Ups!](../_static/devices/android-api-choose-studio.png)

4. We will use a Blank Activity for this project. I know it's more recommended to use Fragments, but this is going to be just for learning.
    ![Ups!](../_static/devices/android-activity-choose-studio.png)

Android Studio will begin to create our project. It may take some time to finish that.

When it finishes, it will show us a screen like this.
    ![Ups!](../_static/devices/android-main-screen-studio.png)

You see that code? It's XML, we use XML in Android to create our views (what the user will see). Replace all the code created by Android Studio with this::

    <RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:tools="http://schemas.android.com/tools"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:paddingLeft="@dimen/activity_horizontal_margin"
        android:paddingRight="@dimen/activity_horizontal_margin"
        android:paddingTop="@dimen/activity_vertical_margin"
        android:paddingBottom="@dimen/activity_vertical_margin"
        tools:context=".MyActivity">

        <TextView
            android:id="@+id/batteryLevel"
            android:text="XX%"
            android:textSize="50sp"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_centerVertical="true"
            android:layout_centerHorizontal="true" />

    </RelativeLayout>

You just modified the view of our application, hooray! Now, we will import the Java library of Ubidots in our application. We have 2 *"builde.gradle"* files, we will use the first one (the one that is inside the tree of our application).
    ![Ups!](../_static/devices/android-gradle-studio.png)

We will add the next two lines inside the *dependencies*  brackets::
    
    compile 'com.ubidots:ubidots-java:1.6.4'
    compile 'com.google.code.gson:gson:2.3'

And it should look like this:
    ![Ups!](../_static/devices/android-dependencies-studio.png)

Now we should sync Gradle, so it can download the libraries and add them to our application.
    ![Ups!](../_static/devices/android-sync-studio.png)

Remember that we are going to send this information (or read it) using Internet. Android won't let the application access to Internet without the consent of the user. So we shall ask the user for permission to use Internet. Open *AndroidManifest.xml* and add this line before the *<application …>* tag.::

    <uses-permission android:name="android.permission.INTERNET" />
    
![Ups!](../_static/devices/android-manifest-studio.png)

At this time of the tutorial we have already modified the View, we have added new dependencies to our project and have asked the user for permission to use the Internet. What's missing? Oh, yes! Modify the controller so it fits our bussiness logic.

Search *MyActivity* and then double-click on it.

![Ups!](../_static/devices/android-activity-studio.png)

Again, code everywhere! This is Java, it's the main programming language for Android. Here's where everything is handled, this is the heart of your application. Replace everything inside the file with this::

    package edu.self.ubidotsapp;

    import android.app.Activity;
    import android.content.BroadcastReceiver;
    import android.content.Context;
    import android.content.Intent;
    import android.content.IntentFilter;
    import android.os.AsyncTask;
    import android.os.Bundle;
    import android.widget.TextView;

    import com.ubidots.ApiClient;
    import com.ubidots.Variable;

    public class MyActivity extends Activity {
        private static final String BATTERY_LEVEL = "level";
        private TextView mBatteryLevel;
        private BroadcastReceiver mBatteryReceiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                int level = intent.getIntExtra(BATTERY_LEVEL, 0);

                mBatteryLevel.setText(Integer.toString(level) + "%");
                new ApiUbidots().execute(level);
            }
        };

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_my);

            mBatteryLevel = (TextView) findViewById(R.id.batteryLevel);
        }

        @Override
        protected void onStart() {
            super.onStart();
            registerReceiver(mBatteryReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
        }

        @Override
        protected void onStop() {
            unregisterReceiver(mBatteryReceiver);
            super.onStop();
        }

        public class ApiUbidots extends AsyncTask<Integer, Void, Void> {
            private final String API_KEY = "our_api_key";
            private final String VARIABLE_ID = "our_variable_id";

            @Override
            protected Void doInBackground(Integer... params) {
                ApiClient apiClient = new ApiClient(API_KEY);
                Variable batteryLevel = apiClient.getVariable(VARIABLE_ID);

                batteryLevel.saveValue(params[0]);
                return null;
            }
        }
    }

##**Important**

You can see that we created a nested class called *ApiUbidots*, this class extends *AsyncTask*. *AsyncTask* is an Android class created to do asynchronous operations. Extending this class is mandatory for all the operations that needs to connect to the Internet. We are doing some GET and POST requests, so... we should use it.

Now you can execute your code and launch it on your phone (or emulator). If you don't know how to build and run the project you just made, just check out [this guide from Android Developers](https://developer.android.com/tools/building/building-studio.html). The result of the project will look like this.
![Ups!](../_static/devices/android-screen-emulator.png)

And this is how the widgets in your dashboard should look, too.
![Ups!](../_static/devices/android-widgets-dashboard.png)
There it is! You created your first Android application using Ubidots! This is just the beginning, start reading the [documentation](https://github.com/ubidots/ubidots-java) and create more exciting things.

##More projects...

Check out other cool projects using Ubidots:

* [Sending motion sensor data to the cloud with a Raspberry Pi](http://blog.ubidots.com/building-a-people-counter-with-raspberry-pi-and-ubidots)
* :ref:`Measuring your Internet connection with an OpenWrt router <examples/lua_openwrt>`