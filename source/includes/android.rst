.. _devices/android:

.. This section will be included in devices.rst.
   Please: don't remove the next line.
   start_read_more_include

Android SDK
===========
Send information from your Android device to Ubidots.

After doing this tutorial you should be able to communicate with our API using our Android Library within your Android application.

We have developed an example app, the *Android GPS Tracker*: 

.. image:: /_static/getting_started/geopoint/android_app.png    
    :align: center
    :target: https://play.google.com/store/apps/details?id=com.ubidots.ubidots

`You can find the source code of the Android GPS Tracker in our Github page <https://github.com/ubidots/ubidots-android-gps-tracker>`_.

Introduction
^^^^^^^^^^^^
Android is an Open-Source operating system created by Android, Inc. and bought by Google in 2005. It's the most used operating system in mobile devices thanks to its availability for third party manufacturers to include it on their devices free of charge.

Components
^^^^^^^^^^
To accomplish this tutorial, you'll need:

* An `Android device <https://developer.android.com/design/devices.html>`_, preferably with Android 4.0 or higher
* Android Studio

Setting up Android Studio
^^^^^^^^^^^^^^^^^^^^^^^^^
* `Download Android Studio <https://developer.android.com/sdk/installing/studio.html>`_ from Android Developers
* If you're using Windows, just install it. If you're using Linux, just double-click on "studio.sh" or open it via Terminal *./studio.sh*. And if you're using OS X, just drag & drop *"Android Studio.app"* to the Applications folder.

Preparing your Ubidots account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
**First first:** Create a Datasource called *"Android Phone" (or whatever you like)* and then add variables and widgets.

1. As a `logged in user <http://app.ubidots.com/accounts/signin/>`_ navigate to the sources tab.

.. figure:: /_static/devices/sources.png
     :name: sources
     :scale: 40%
     :align: center
     :alt: Ubidots Sources

2. Create the Datasource by clicking the on the orange button located in the upper right corner of the screen.

.. figure:: /_static/devices/new-source.png
     :name: new-source
     :scale: 40%
     :align: center
     :alt: Ubidots New Source

3. Select the *Generic* option.

.. figure:: /_static/devices/android-generic-source.png
     :name: android-generic-source
     :scale: 40%
     :align: center
     :alt: Ubidots Generic Source

4. We just need to fill the data and click on the *Create* button.

.. figure:: /_static/devices/android-naming-source.png
     :name: android-naming-source
     :scale: 40%
     :align: center
     :alt: Ubidots Naming Source

5. Click on the created Datasource and then on *"Add new variable"*. As we are going to send our battery level, we will create a variable named *batteryLevel*.

.. figure:: /_static/devices/android-creation-variable.png
     :name: android-creation-variable
     :scale: 40%
     :align: center
     :alt: Ubidots Creation Variable

6. Take note of the variable ID as we are going to need it later for our application to work.

.. figure:: /_static/devices/android-id-variable.png
     :name: android-id-variable
     :scale: 40%
     :align: center
     :alt: Ubidots Getting Id Variable

7. Create a token under *"My profile"* tab. We'll need it to access all the posibilities that our API have.

.. figure:: /_static/devices/android-profile-tab.png
     :name: android-profile-tab
     :scale: 40%
     :align: center
     :alt: Ubidots Profile Tab

8. Add the widget to your `dashboard <http://app.ubidots.com/ubi/insights/#/list>`_ by clicking the orange button with the "+" symbol inside.

* We are going to add to widgets: The first showing our battery level in a line chart.

.. figure:: /_static/devices/android-linechart-dashboard.png
     :name: android-linechart-dashboard
     :scale: 40%
     :align: center
     :alt: Ubidots Dashboard Linechart

* And the second showing the last value of our battery

.. figure:: /_static/devices/android-lastvalue-dashboard.png
     :name: android-lastvalue-dashboard
     :scale: 40%
     :align: center
     :alt: Ubidots Dashboard Last Value

Coding and pushing data from our Android phone
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
**Second goal:** Create our application to send data from it to Ubidots!

1. Remember I told you to download and install Android Studio? Well, now it's time to open it. A window will popup and you'll click on the *"New project"* button.

.. figure:: /_static/devices/android-new-project-studio.png
     :name: android-new-project-studio
     :scale: 40%
     :align: center
     :alt: Android Studio New Project

2. Choose any name you want for the application. I will call it **UbidotsApp** (I don't have a lot of imagination for names, sorry!).

.. figure:: /_static/devices/android-naming-project-studio.png
     :name: android-naming-project-studio
     :scale: 40%
     :align: center
     :alt: Android Studio Naming Project

3. I also recommended you to have an Android phone (or emulator) with Android 4.0 or higher. For this tutorial I will use the API 14 of Android, that targets all the phones using Android 4.0 or higher. You can also use our API in older versions of Android, but you'll have to learn how to use `support libraries <http://developer.android.com/tools/support-library/index.html>`_

.. figure:: /_static/devices/android-api-choose-studio.png
     :name: android-api-choose-studio
     :scale: 40%
     :align: center
     :alt: Android Studio API Choosing

4. We will use a Blank Activity for this project. I know it's more recommended to use Fragments, but this is going to be just for learning.

.. figure:: /_static/devices/android-activity-choose-studio.png
     :name: android-activity-choose-studio
     :scale: 40%
     :align: center
     :alt: Android Studio Activity Choosing

Android Studio will begin to create our project. It may take some time to finish that.

When it finishes, it will show us a screen like this.

.. figure:: /_static/devices/android-main-screen-studio.png
     :name: android-main-screen-studio
     :scale: 40%
     :align: center
     :alt: Android Studio Main Screen

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

.. figure:: /_static/devices/android-gradle-studio.png
     :name: android-gradle-studio
     :scale: 40%
     :align: center
     :alt: Android Studio Gradle

We will add the next two lines inside the *dependencies*  brackets::
    
    compile 'com.ubidots:ubidots-java:1.6.4'
    compile 'com.google.code.gson:gson:2.3'

And it should look like this:

.. figure:: /_static/devices/android-dependencies-studio.png
     :name: android-dependencies-studio
     :scale: 40%
     :align: center
     :alt: Android Studio Dependencies Gradle

Now we should sync Gradle, so it can download the libraries and add them to our application.

.. figure:: /_static/devices/android-sync-studio.png
     :name: android-sync-studio
     :scale: 40%
     :align: center
     :alt: Android Studio Sync Gradle

Remember that we are going to send this information (or read it) using Internet. Android won't let the application access to Internet without the consent of the user. So we shall ask the user for permission to use Internet. Open *AndroidManifest.xml* and add this line before the *<application …>* tag.::

    <uses-permission android:name="android.permission.INTERNET" />

.. figure:: /_static/devices/android-manifest-studio.png
     :name: android-manifest-studio
     :scale: 40%
     :align: center
     :alt: Android Studio Manifest Permission

At this time of the tutorial we have already modified the View, we have added new dependencies to our project and have asked the user for permission to use the Internet. What's missing? Oh, yes! Modify the controller so it fits our bussiness logic.

Search *MyActivity* and then double-click on it.

.. figure:: /_static/devices/android-activity-studio.png
     :name: android-activity-studio
     :scale: 40%
     :align: center
     :alt: Android Studio MyActivity

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

**Important**

You can see that we created a nested class called *ApiUbidots*, this class extends *AsyncTask*. *AsyncTask* is an Android class created to do asynchronous operations. Extending this class is mandatory for all the operations that needs to connect to the Internet. We are doing some GET and POST requests, so... we should use it.

Now you can execute your code and launch it on your phone (or emulator). If you don't know how to build and run the project you just made, just check out `this guide from Android Developers <https://developer.android.com/tools/building/building-studio.html>`_. The result of the project will look like this.

.. figure:: /_static/devices/android-screen-emulator.png
     :name: android-screen-emulator
     :scale: 40%
     :align: center
     :alt: Android Studio Emulator Screen

And this is how the widgets in your dashboard should look, too.

.. figure:: /_static/devices/android-widgets-dashboard.png
     :name: android-widgets-dashboard
     :scale: 40%
     :align: center
     :alt: Ubidots Widgets Dashboard

There it is! You created your first Android application using Ubidots! This is just the beginning, start reading the `documentation <https://github.com/ubidots/ubidots-java>`_ and create more exciting things.

More projects...
^^^^^^^^^^^^^^^^

Check out other cool projects using Ubidots:

* `Sending motion sensor data to the cloud with a Raspberry Pi <http://blog.ubidots.com/building-a-people-counter-with-raspberry-pi-and-ubidots>`_
* :ref:`Measuring your Internet connection with an OpenWrt router <examples/lua_openwrt>`
    
Do you have more project ideas? Create a Ubidots account and make them happen!

.. raw:: html

    <!--HubSpot Call-to-Action Code -->
    <span class="hs-cta-wrapper" id="hs-cta-wrapper-4d061d77-8df2-4af7-9195-0e3a4fbfe2a1">
        <span class="hs-cta-node hs-cta-4d061d77-8df2-4af7-9195-0e3a4fbfe2a1" id="hs-cta-4d061d77-8df2-4af7-9195-0e3a4fbfe2a1">
            <!--[if lte IE 8]><div id="hs-cta-ie-element"></div><![endif]-->
            <a href="http://cta-redirect.hubspot.com/cta/redirect/329717/4d061d77-8df2-4af7-9195-0e3a4fbfe2a1"><img class="hs-cta-img" id="hs-cta-img-4d061d77-8df2-4af7-9195-0e3a4fbfe2a1" style="border-width:0px;" src="https://no-cache.hubspot.com/cta/default/329717/4d061d77-8df2-4af7-9195-0e3a4fbfe2a1.png" /></a>
        </span>
        <script charset="utf-8" src="https://js.hscta.net/cta/current.js"></script>
            <script type="text/javascript">
                hbspt.cta.load(329717, '4d061d77-8df2-4af7-9195-0e3a4fbfe2a1');
            </script>
    </span>
    <!-- end HubSpot Call-to-Action Code -->
