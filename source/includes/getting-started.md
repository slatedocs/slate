# Getting Started

## Setting up the SDK

Once you’ve brought the Foxtrot Android SDK into your project, the first thing you’ll want to do is set it up.
You’ll need two things:

1. an Android `context` (any context should be fine)
2. your Foxtrot API key

```java
Context context = activity.getApplicationContext();
String apiKey = "YOUR_API_KEY";
FoxtrotSDK.setup(context, apiKey);
```

Great job, now you’ve set up the Foxtrot SDK singleton… give yourself a high five!
From now on, when you call the FoxtrotSDK you’ll need to access the singleton by calling:

```java
FoxtrotSDK.getInstance().SOME_METHOD()
```

## Logging In

Once your driver has logged into your app using your existing login flow, you'll need to log them into Foxtrot as a [Driver](#driver).

Logging in is an asynchronous process requiring a [LoginCallback](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/controllers/auth/LoginCallback.html) to be registered to the `FoxtrotSDK` object in order for you can respond to any issues that may arise.

Here is a sample `Activity` that implements the login process.

```java
public class SampleLoginActivity extends AppCompatActivity {

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

Now that you’ve set Foxtrot up, you’ll want to register an object that conforms to our [ErrorStateListener](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/state/ErrorStateListener.html) interface so you know if anything goes wrong. Here’s how to create a simple listener:

```java
public class YourErrorStateListener extends ErrorStateListener {
  private final Handler handler;

  private YourErrorStateListener(Handler handler) {
    this.handler = handler;
  }

  public static ErrorStateListener create(Handler handler) {
    return new YourErrorStateListener(handler);
  }

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

You can register as many error state listeners as you’d like and they’ll all receive the current state of the SDK whenever they’re registered. This makes it incredibly easy to simply and powerfully handle any issues that may arise while developing, or while your users are using your app.

## Importing a Route

Assuming you’ve had no problems so far, now you can import one or more [Route](#route) objects into Foxtrot. Foxtrot will cache these objects for you so you don't need to import them again after the app restarts.

<aside class="notice">
We’ll sort routes based on their start times, treating whichever route starts earlier as the first one.
</aside>

Here is some sample code to add a route:

```java
Delivery delivery = Delivery.builder()
                            .setProduct("Kittens")
                            .setQuantity(1.0)
                            .build();
List<Delivery> deliveries = Collections.singletonList(delivery);

DateTime routeStartTime = new DateTime(0L, DateTimeZone.UTC);
// Construct time constraint to delivery 1 kitty between 1 and 2 UTC
TimeWindow timeWindow = TimeWindow.builder()
                                  .setStart(routeStartTime.plusHours(1))
                                  .setEnd(routeStartTime.plusHours(2))
                                  .build();
// There may be more
List<TimeWindow> timeWindows = Collections.singletonList(timeWindow);

Location location = Location.create(37.7749, -122.4194);
Waypoint waypoint = Waypoint.builder()
                            .setLocation(location)
                            .setAddress("123 Fake St")
                            .setName("Whole Foods")
                            .setCustomerId("UNIQUE_CUSTOMER_ID")
                            .setDeliveries(deliveries)
                            .setTimeWindows(timeWindows)
                            .setServiceTimeInSeconds(600L) // 10 minutes
                            .build();
// There may be more
List<Waypoint> routeWaypoints = Collections.singletonList(waypoint);

Route route = Route.builder()
                      .setName("Sample Route")
                      .setStartTime(new DateTime(1467053939000L, DateTimeZone.UTC))
                      .setWaypoints(routeWaypoints)
                      .build();

```

Now that we’ve created a Route, it can be imported like this:

```java
//You can add multiple routes too if that's what you need
FoxtrotSDK.getInstance().addRoute(route);
```

Now let’s register a [RouteStateListener](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/state/RouteStateListener.html) so we know when the route changes! This uses the same pattern as the LoginStateListener. Here’s how to implement one:

```java
public class YourRouteStateListener extends RouteStateListener {
  private final Handler handler;

  private YourRouteStateListener(Handler handler) {
    this.handler = handler;
  }

  public static RouteStateListener create(Handler handler) {
    return new YourRouteStateListener(handler);
  }

  public <T extends OptimizedRoute> void onRouteChanged(@Nonnull T route) {
    // whenever the state of the route changes this method is called 
  }  

  public void onAllRoutesFinished() { 
    //when all the routes have been finished this method is triggered, letting you know the day is over
  }

  @Nonnull 
  @Override 
  public Handler getHandler() { 
    return handler; 
  }
}
```

Now we take our RouteStateListener and register it to Foxtrot:

```java
Handler anotherHandler = new Handler(Looper.getMainLooper);
RouteStateListener myRouteStateListener = YourRouteStateListener.create(anotherHandler);
FoxtrotSDK.getInstance().registerRouteStateListener(myRouteStateListener);
```


At this point, our RouteStateListener should get an onRouteChanged event with the route we just imported. Anytime the state of the route changes we’ll also call this method.

Great, we’ve got a route! What’s next?

## Making a Delivery Attempt

As your user works on their route, they'll be attempting to make deliveries.
In order to finish the route, we need to make DeliveryAttempts.
A [DeliveryAttempt](#deliveryattempt) belongs to a [Delivery](#delivery).
A DeliveryAttempt needs a [DeliveryStatus](#deliverystatus), where the possible values are Success, Failure, and Reattempt.
A DeliveryAttempt may also optionally contain notes if you’d like to include additional information.

Here’s how to create and add a successful DeliveryAttempt, using the Route we created previously:

```java
DeliveryAttempt successfulAttempt = DeliveryAttempt.builder()
        .setStatus(DeliveryStatus.SUCCESSFUL)
        .setNotes("Delivered the cookies") // notes are optional
        .build();
FoxtrotSDK.getInstance().addDeliveryAttempt("SOME_DELIVERY_ID", successfulAttempt);
```

##Undoing a Delivery Attempt

If the user makes a mistake, you might want to provide the ability to undo a [DeliveryAttempt](#deliveryattempt). If that's the case, here's how:

```java
FoxtrotSDK.getInstance().undoDeliveryAttempt("A_DELIVERY_ID");
```

This will automatically find the most recent [DeliveryAttempt](#deliveryattempt) on that [Delivery](#delivery) and undo it.

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

When all the routes that Foxtrot has have been finished, our [RouteStateListener](https://foxtrotsystems.github.io/android-sdk-javadoc/io/foxtrot/android/sdk/state/RouteStateListener.html) will call onAllRoutesFinished() and you'll have the opportunity to respond to that event.
