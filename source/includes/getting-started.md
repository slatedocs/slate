# Getting Started

## Setting up the SDK

Once you’ve brought the Foxtrot Android SDK into your project, the first thing you’ll want to do is set it up.
You’ll need two things: a context (any context should be fine), and an API key that lets Foxtrot identify your organization.

Don’t have an API key? get one [right here](http://foxtrot.io/gimme_an_api_key).

```java
Context mContext = GIVE ME A CONTEXT;
String mApiKey = "YOUR_API_KEY";
FoxtrotSDK.setup(mContext, mApiKey);
```

Great job, now you’ve set up the Foxtrot SDK singleton… give yourself a high five!
From now on, when you call the FoxtrotSDK you’ll need to access the singleton by calling 

```java
FoxtrotSDK.getInstance().SOME_METHOD()
```

## Registering an error listener

Now that you’ve set foxtrot up, you’ll want to register an object that conforms to our ErrorStateListener interface so you know if anything goes wrong.
Here’s how to create a simple listener:

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
Handler someHandler = ...;
ErrorStateListener myErrorStateListener = YourErrorStateListener.create(someHandler);
FoxtrotSDK.getInstance().registerErrorStateListener(myErrorStateListener);
```

You can register as many error state listeners as you’d like and they’ll all receive the current state of the SDK whenever they’re registered. This makes it incredibly easy to simply and powerfully handle any issues that may arise while developing, or while your users are using your app.

## Logging in

At this point your driver has logged into your app, and Foxtrot needs some of that information. Here’s how to get it to us!

Logging in is a very important process, so it has it’s own callback so you can respond to any issues that may arise. It looks a lot like the ErrorStateListener we just implemented, but instead of reporting the state of the app it reports any events as they happen when going through login. Here’s how to create a simple one:

```java
public class YourLoginCallback extends LoginCallback {
  private final Handler handler;

  private YourLoginCallback(Handler handler) {
    this.handler = handler;
  }

  public LoginCallback create(Handler handler) {
    return new YourLoginCallback(handler);
  }

  public void onSuccess() {
    // driver has successfully logged in, do whatever you need to! 
  }  

  public void onError(LoginError loginError) {
    // there was an error, please respond to it accordingly 
  }

  @Nonnull 
  @Override 
  public Handler getHandler() { 
    return handler; 
  }
}
```

Next you’ll need to create a driver using the information you have on hand, it should look something like this:

```java
String mDriverId = "A_DRIVER_ID";
String mDriverName = "Hulk Hogan"; // this argument is optional
Driver myDriver = Driver.builder().setId(mDriverId).setName(mDriverName).build();
```

Finally, we’re going to register that loginCallback and log the driver in:

```java
Handler someHandler = new Handler(Looper.getMainLooper());
LoginCallback loginCallback = YourLoginCallback.create(someHandler);
FoxtrotSDK.getInstance().registerLoginCallback(loginCallback);
FoxtrotSDK.getInstance().login(myDriver);
```

...then once your loginCallback has onSuccess() called you’re ready to import a route!

## Importing a route

You’re almost there! Assuming you’ve had no problems so far, now you’ll need to construct a route and import it into the SDK.

But first, let’s register a listener so we know when the route changes! This uses the same pattern as the ErrorStateListener. Here’s how to implement one:

```java
public class YourRouteStateListener extends RouteStateListener {
  private final Handler handler;

  private YourRouteStateListener(Handler handler) {
    this.handler = handler;
  }

  public RouteStateListener create(Handler handler) {
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
Handler anotherHandler = Handler();
RouteStateListener myRouteStateListener = YourRouteStateListener.create(anotherHandler);
FoxtrotSDK.getInstance().registerRouteStateListener(myRouteStateListener);
```

Great, we’re ready to create a route for importing! Here’s how they work:

A Route needs a start time and a set of waypoints. 
    - It also may optionally have a name.
A Waypoint needs an ID, a Location, and a list of Deliveries. 
    - It may also optionally contain a name, an address, an estimate of how long it takes to service this waypoint in seconds, and a list of TimeWindow objects.
A Delivery needs a product;
    - It may also optionally contain the amount of the product being delivered.
A Location needs a latitude and a longitude.
A TimeWindow needs a start and an end. The start of a TimeWindow cannot be before the startTime of the route, and the end cannot be before the start.

Here’s a very simple Route:

```java
Delivery aDelivery = Delivery.builder()
        .setProduct("Kittens")
        .build();
Location aWaypointLocation = Location.create(37.7749, -122.4194);

List<Delivery> deliveries = ImmutableList.of(aDelivery); 
List<TimeWindow> timeWindows = Collections.emptyList(); 
Waypoint someWaypoint = Waypoint.builder() 
        .setLocation(aWaypointLocation) 
        .setAddress("123 Fake St") 
        .setName("Whole Foods") 
        .setCustomerId("UNIQUE_CUSTOMER_ID") 
        .setDeliveries(deliveries) 
        .setTimeWindows(timeWindows) 
        .setServiceTimeInSeconds(600L) // 10 minutes 
        .build();
List<Waypoint> routeWaypoints = ImmutableList.of(someWaypoint);
Route theRoute = Route.builder()
        .setName("Sample Route")
        .setStartTime(new DateTime(1467053939000, DateTimeZone.UTC))
        .setWaypoints(routeWaypoints)
        .build();
```

Now that we’ve created a Route object and registered a RouteEventListener we are ready to import!
Here’s how:

```java
FoxtrotSDK.getInstance().addRoute(theRoute);
```

At this point, our RouteStateListener should get an onRouteChanged event with the route we just imported. Anytime the state of the route changes we’ll also call this method.

Great, we’ve got a route! What’s next?

## Making a Delivery attempt

In order to finish the route, we need to make DeliveryAttempts. 
A DeliveryAttempt belongs to a Delivery. 
A DeliveryAttempt needs a DeliveryStatus, where the possible values are Success, Failure, and Reattempt.
    - it may also optionally contain notes if you’d like to include additional information.

Here’s how to create and add one, using the Route we created previously:

```java
DeliveryAttempt successfulAttempt = DeliveryAttempt.builder()
                            .setStatus(DeliveryStatus.SUCCESSFUL)
                            .setNotes("Delivered the cookies") // notes are optional
                            .build();
FoxtrotSDK.getInstance().addDeliveryAttempt("SOME_DELIVERY_ID", successfulAttempt);
```