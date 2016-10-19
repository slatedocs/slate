# Getting Started

## Setting up the SDK

Once the Foxtrot Android SDK is installed, you're ready to set it up.

You’ll need to do three things:

1. Get an Android `context` (any context should be fine)
2. Grant runtime permissions
3. Set up Foxtrot with your API key

The Foxtrot Android SDK will automatically request these permissions: 

- `android.permission.ACCESS_FINE_LOCATION`
- `android.permission.INTERNET`
- `android.permission.ACCESS_NETWORK_STATE`,
- `android.permission.WAKE_LOCK`.

<aside class="notice">
There should be no need to explicitly add these permissions to your AndroidManifest.xml file. The Android manifest merger will detect these requirements from the Foxtrot SDK and add them to your bundle automatically.
</aside>

If your app is targeting Android Marshmallow or above, you will need to request run-time permission from the user to ACCESS_FINE_LOCATION. Here's an example Activity asking the user for permission and initializing the Foxtrot SDK:

```java
public class SetupFoxtrotSDKActivity extends AppCompatActivity {

  private static final int REQUEST_CODE_ASK_PERMISSIONS = 1;
  private static final int REQUEST_CODE_SET_PERMISSIONS_APP_SETTINGS = 2;
  private static final List<String> REQUIRED_PERMISSIONS = Arrays.asList(permission.ACCESS_FINE_LOCATION);

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    askUserForPermissionAndSetupFoxtrotSDK();
  }

  private void askUserForPermissionAndSetupFoxtrotSDK() {
    if (VERSION.SDK_INT >= VERSION_CODES.M) {
      askUserForPermissionAndSetupFoxtrotSDKAfterMarshmallow();
    } else {
      askUserForPermissionAndSetupFoxtrotSDKBeforeMarshmallow();
    }
  }

  @Override
  public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
    switch (requestCode) {
      case REQUEST_CODE_ASK_PERMISSIONS:
        if (isAllPermissionsGranted(grantResults)) {
          setupFoxtrotSDKAndStartApp();
        } else {
          final List<String> missingPermissions = Arrays.asList(permissions);
          if (shouldShowRequestPermissionRationale(missingPermissions)) {
            // Handle case when user select "Cancel". We will pop up a dialog explaining why we need the permission
            showUserRationaleAndRequestPermission(missingPermissions);
          } else {
            // User selected "Never ask again" so we can't request for permission anymore. User will need to go to the
            // app settings menu to grant permission. In order for the Foxtrot SDK to work optimally, we will need these permissions.
            showUserRationaleAndRedirectToAppSettings(missingPermissions);
          }
        }
        break;
      case REQUEST_CODE_SET_PERMISSIONS_APP_SETTINGS:
        askUserForPermissionAndSetupFoxtrotSDK();
        break;
      default:
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }
  }

  private void showUserRationaleAndRequestPermission(final List<String> missingPermissions) {
    String prompt = createPermissionPromptMessage(missingPermissions);
    showMessageOKCancel(prompt,
                        new DialogInterface.OnClickListener() {
                          @TargetApi(VERSION_CODES.M)
                          @Override
                          public void onClick(DialogInterface dialog, int which) {
                            requestPermissions(missingPermissions.toArray(new String[missingPermissions.size()]), REQUEST_CODE_ASK_PERMISSIONS);
                          }
                        },
                        new DialogInterface.OnClickListener() {
                          @Override
                          public void onClick(DialogInterface dialog, int which) {
                            // Keep asking
                            askUserForPermissionAndSetupFoxtrotSDK();
                          }
                        });
  }

  private void showUserRationaleAndRedirectToAppSettings(final List<String> missingPermissions) {
    String prompt = createPermissionPromptMessage(missingPermissions);
    showMessageOKCancel(prompt,
                        new DialogInterface.OnClickListener() {
                          @TargetApi(VERSION_CODES.M)
                          @Override
                          public void onClick(DialogInterface dialog, int which) {
                            // Redirect user to app settings to manually grant the permission
                            Intent appSettingsIntent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:" + getPackageName()));
                            appSettingsIntent.addCategory(Intent.CATEGORY_DEFAULT);
                            appSettingsIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            startActivityForResult(appSettingsIntent, REQUEST_CODE_SET_PERMISSIONS_APP_SETTINGS);
                          }
                        },
                        new DialogInterface.OnClickListener() {
                          @Override
                          public void onClick(DialogInterface dialog, int which) {
                            // Keep asking
                            askUserForPermissionAndSetupFoxtrotSDK();
                          }
                        });
  }

  private void askUserForPermissionAndSetupFoxtrotSDKBeforeMarshmallow() {
    // Android versions before Marshmallow grant permissions during app install time so we don't need to grant permission again
    setupFoxtrotSDKAndStartApp();
  }

  @TargetApi(VERSION_CODES.M)
  private void askUserForPermissionAndSetupFoxtrotSDKAfterMarshmallow() {
    // Marshmallow requires certain permissions to be granted at run-time
    final List<String> missingPermissions = getMissingPermissions(REQUIRED_PERMISSIONS);
    if (!missingPermissions.isEmpty()) {
      requestPermissions(missingPermissions.toArray(new String[missingPermissions.size()]), REQUEST_CODE_ASK_PERMISSIONS);
    } else {
      setupFoxtrotSDKAndStartApp();
    }
  }

  private boolean areAllPermissionsGranted(int[] grantResults) {
    for (int grantResult: grantResults) {
      if (grantResult != PackageManager.PERMISSION_GRANTED) {
        return false;
      }
    }
    return true;
  }

  private void setupFoxtrotSDKAndStartApp() throws SecurityException {
    Context context = getApplicationContext();
    String apiKey = "YOUR_API_KEY";
    FoxtrotSDK.setup(context, apiKey);
  }

  private List<String> getMissingPermissions(List<String> permissionsRequired) {
    List<String> missingPermissions = new LinkedList<String>();
    for (String permission: permissionsRequired) {
      if (ActivityCompat.checkSelfPermission(this, permission) != PackageManager.PERMISSION_GRANTED) {
        missingPermissions.add(permission);
      }
    }
    return missingPermissions;
  }

  private boolean shouldShowRequestPermissionRationale(List<String> missingPermissions) {
    for (String permission: missingPermissions) {
      if (ActivityCompat.shouldShowRequestPermissionRationale(this, permission)) {
        return true;
      }
    }
    return false;
  }

  private String createPermissionPromptMessage(List<String> missingPermissions) {
    StringBuilder builder = new StringBuilder();
    if (!missingPermissions.isEmpty()) {
      // Having a more user-friendly message is encouraged :)
      builder.append(String.format("You need to grant access to %s", missingPermissions.get(0)));
      for (int i = 1; i < missingPermissions.size(); ++i) {
        builder.append(String.format(", %s", missingPermissions.get(i)));
      }
    }
    return builder.toString();
  }

  private void showMessageOKCancel(String message, DialogInterface.OnClickListener okListener, DialogInterface.OnClickListener cancelListener) {
    new AlertDialog.Builder(SetupFoxtrotSDKActivity.this)
        .setMessage(message)
        .setPositiveButton("OK", okListener)
        .setNegativeButton("Cancel", cancelListener)
        .create()
        .show();
  }

}
```

Great job! You’ve set up the Foxtrot SDK singleton. From now on, when you call the FoxtrotSDK you’ll need to access the singleton by calling:

```java
FoxtrotSDK.getInstance().SOME_METHOD()
```

## Logging In

Once a driver has logged into the app using your existing login flow, you'll need to log them in to Foxtrot as a [Driver](#driver).

Logging in is an asynchronous process requiring a [LoginCallback](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/controllers/auth/LoginCallback.html) to be registered to the `FoxtrotSDK` object. This allows your application to respond to any issues that may arise.

Here is a sample `Activity` that implements the login process.

```java
public class SampleLoginActivity extends Activity {

  private final Handler handler = new Handler(getMainLooper());

  private final LoginCallback loginCallback = new LoginCallback() {
    @Nonnull
    @Override
    public Handler getHandler() {
      // Handler object to post the callback
      return handler;
    }

    @Override
    public void onSuccess() {
      super.onSuccess();
      // Make sure to unregister after you finish
      FoxtrotSDK.getInstance().unregisterLoginCallback(this);
      // Proceed to next activity
    }

    @Override
    public void onError(LoginError loginError) {
      super.onError(loginError);
      switch (loginError) {
        case NETWORK_ERROR:
          // try again later
          break;
        case INVALID_API_KEY:
          // contact your administrator for a valid api key
          break;
        default:
          break;
      }
    }
  };

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    FoxtrotSDK foxtrotSDK = FoxtrotSDK.getInstance();
    // Make sure to register your callback before logging in
    foxtrotSDK.registerLoginCallback(loginCallback);
    // Create a Driver object
    Driver driver = Driver.builder()
                          .setId("id")
                          .setName("name")
                          .build();
    foxtrotSDK.login(driver);
  }

  @Override
  protected void onDestroy() {
    super.onDestroy();
    // Make sure to unregister your callback
    FoxtrotSDK.getInstance().unregisterLoginCallback(loginCallback);
  }

}
```

## Registering an Error Listener

Now that you’ve set Foxtrot up, you’ll want to register an object that conforms to our [ErrorStateListener](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/state/ErrorStateListener.html) interface so you will know if anything goes wrong. Here’s how to create a simple listener:

```java
public class YourErrorStateListener extends ErrorStateListener {
  private final Handler handler;

  private YourErrorStateListener(Handler handler) {
    this.handler = handler;
  }

  public static ErrorStateListener create(Handler handler) {
    return new YourErrorStateListener(handler);
  

  @Nonnull 
  @Override 
  public Handler getHandler() { 
    return handler; 
  }

  @Override
  public void onErrors(EnumSet<ErrorState> errors) {
    // respond to any errors that may appear 
  } 
  @Override 
  public void onWarnings(EnumSet<WarningState> warnings) {
    // respond to any warnings that may appear 
  }
}
```

And once you’ve implemented your class, here’s how you register it to Foxtrot:

```java
Handler handler = new Handler(Looper.getMainLooper());
ErrorStateListener myErrorStateListener = YourErrorStateListener.create(handler);
FoxtrotSDK.getInstance().registerErrorStateListener(myErrorStateListener);
```

You can register as many error state listeners as you’d like and they’ll all receive the current state of the SDK whenever they’re registered. This makes it easy to handle any issues that may arise during development or while users are using your app.

## Importing a Route

Assuming you’ve had no problems so far, now you can import one or more [Route](#route) objects into Foxtrot. Foxtrot will cache these objects for you so you don't need to import them again after the app restarts.

Here is some sample code to add a route:

```java
Delivery delivery = Delivery.builder()
                            .setProduct("Soda")
                            .setQuantity(1.0)
                            .build();
List<Delivery> deliveries = Collections.singletonList(delivery);

DateTime routeStartTime = new DateTime(0L, DateTimeZone.UTC);

// We need to deliver the soda between 1:00 and 2:00 UTC
TimeWindow timeWindow = TimeWindow.builder()
                                  .setStart(routeStartTime.plusHours(1))
                                  .setEnd(routeStartTime.plusHours(2))
                                  .build();
// Foxtrot allows you to specify multiple possible TimeWindows per delivery
List<TimeWindow> timeWindows = Collections.singletonList(timeWindow);

Location location = Location.create(37.7749, -122.4194);
Waypoint waypoint = Waypoint.builder()
                            .setLocation(location)
                            .setAddress("123 Fake St")
                            .setName("Friendly Neighborhood Bakery")
                            .setCustomerId("UNIQUE_CUSTOMER_ID")
                            .setDeliveries(deliveries)
                            .setTimeWindows(timeWindows)
                            .setServiceTimeInSeconds(600L) // 10 minutes
                            .build();
// There may be more
List<Waypoint> routeWaypoints = Collections.singletonList(waypoint);

Warehouse warehouse = Warehouse.builder()
                               .setLocation(Location.create(1.0, 2.0))
                               .setAddress("123 Fake St")
                               .setName("The warehouse")
                               .build();

Route route = Route.builder()
                      .setName("Sample Route")
                      .setStartTime(routeStartTime)
                      .setWarehouse(warehouse)
                      .setWaypoints(routeWaypoints)
                      .build();

```

Now that we’ve created a Route, it can be imported like this:

```java
FoxtrotSDK.getInstance().addRoute(route);
```

Now let's get the [OptimizedRoute](#optimizedroute). You will need to register a [RouteStateListener](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/state/RouteStateListener.html) to get the latest route changes. Once registered, an `OptimizedRoute` will be immediately given to you via the `onRouteChanged()` callback. After registration, the Foxtrot SDK will use the `RouteStateListener` to inform your application of any further changes to the route. Here is a sample `Activity` that uses the `RouteStateListener`.

<aside class="notice">
Foxtrot will optimize the current route whenever driving conditions change, so it's important that you update your UI when onRouteChanged is called. Your application should ensure that the driver is aware of the route changes by playing a sound, displaying a banner, or sending a notification to alert the driver.
</aside>

```java
public class SampleRouteActivity extends Activity {

  private final Handler handler = new Handler(getMainLooper());

  private final RouteStateListener routeStateListener = new RouteStateListener() {
    @Nonnull
    @Override
    public Handler getHandler() {
      return handler;
    }

    @Override
    public void onAllRoutesFinished() {
      super.onAllRoutesFinished();
      // no more routes remaining
    }

    @Override
    public void onRouteChanged(@Nonnull OptimizedRoute route) {
      super.onRouteChanged(route);
      // update view with new route
    }

  };

  @Override
  protected void onStart() {
    super.onStart();
    FoxtrotSDK.getInstance().registerRouteStateListener(routeStateListener);
  }

  @Override
  protected void onStop() {
    super.onStop();
    // Make sure you unregister your listener when the activity is stopped
    FoxtrotSDK.getInstance().unregisterRouteStateListener(routeStateListener);
  }

}
```

<aside class="notice">
If you have imported multiple routes, your listener will only be informed of changes to the active route. When a route is finished, the route with the next-earliest start time will automatically become the new active route.
</aside>

Great, we’ve got a route! What’s next?

## Making a Delivery Attempt

As your user is on-route, they will visiting various waypoints and attempt to make deliveries. You will record their progress by making [DeliveryAttempt](#deliveryattempt)s on the [Waypoint](#waypoint)s. A DeliveryAttempt needs a [DeliveryStatus](#deliverystatus), which is either Success or Failure. A DeliveryAttempt may also optionally contain notes if you’d like to include additional information.

Here’s how to create and add a successful DeliveryAttempt, using the Route we created previously:

```java
DeliveryAttempt successfulAttempt = DeliveryAttempt.builder()
        .setStatus(DeliveryStatus.SUCCESSFUL)
        .setNotes("Delivered the cookies") // notes are optional
        .build();
FoxtrotSDK.getInstance().addDeliveryAttempt("SOME_WAYPOINT_ID", successfulAttempt);
```

## Undoing a Delivery Attempt

If the user makes a mistake, you might want to provide the ability to undo a [DeliveryAttempt](#deliveryattempt). If that's the case, here's how:

```java
FoxtrotSDK.getInstance().undoDeliveryAttempt("A_WAYPOINT_ID");
```

This will automatically find the most recent [DeliveryAttempt](#deliveryattempt) on that [Delivery](#delivery) and undo it.

## Authorizing a Reattempt

If a driver marks an attempt with [DeliveryStatus](#deliverystatus) of `FAILED`, they will not be directed back to that Waypoint unless a reattempt is authorized. Until a reattempt at that Waypoint is authorized, they will not be able to make another [DeliveryAttempt](#deliveryattempt).

If you application decides that the driver should be sent back to that Waypoint, you will need to authorize the re-attempt in Foxtrot:

```java
FoxtrotSDK.getInstance().authorizeDeliveryReattempt("A_WAYPOINT_ID");
```

##Finishing a Route

Once your user has finished making attempts on all their [Waypoints](#waypoint), you may want to allow them to finish their route.
Here's how:

```java
FoxtrotSDK.getInstance().finishRoute("YOUR_ROUTE_ID");
```

If your users run multiple routes throughout the day, it's possible to import more than one [Route](#route) into the Foxtrot SDK. We'll sort them based on the start time of each [Route](#route), treating whichever route starts earlier as the first one.

<aside class="notice">
In order to begin the second Route, you'll need to finish the first one by making the call to finishRoute. The first route will then be marked as 'finished', and you will begin receiving events for the second route.
</aside>

When all the routes have been finished, your [RouteStateListener](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/state/RouteStateListener.html) will receive a call to `onAllRoutesFinished()` and you'll have the opportunity to respond.
