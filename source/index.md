---
title: Sense360 API Reference

language_tabs:
  - swift: Swift
  - objective_c: Objective-C

toc_footers:
  - <a id="sign" href='https://docs.google.com/a/sense360.com/forms/d/1EJwLR8GC0JAqeH5F1FIWKVZJ527qdQZ7GiWirS0mDxc/viewform?usp=send_form'>Sign Up for a Developer Key!</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Sense360 allows you to quickly build functions around actions that your users take in the physical world. You can build triggers based on where a user is, what they are doing, or what is happening around them. **You can do all this in the background, even if your app is closed.** Adding these real-world triggers to your app can take months if you try to achieve high accuracy, low battery drain, and maximum user privacy. We make the process quick and painless.

Eventually, we aim to have a trigger for any action a user can take, whether it be "running", "driving", "waking up", "eating", "watching tv", "playing basketball", "watching basketball", etc.

**Sign up for a developer key** by clicking the green link on the left. 

Have fun creating!

# API Components

The following are the main components of building with Sense360

[Triggers](#triggers): The real-world event that you want to listen for (can be a place, action, or contextual element). Example triggers are “has arrived at airport”, “has exited work”, or “is 100 miles from home”

[Recipes](#recipes):  A collection of elements (including the Trigger) that defines **when** you want to listen for the trigger, and **what** you want to happen when the trigger is fired. Recipes gives you the flexibility to do whatever you want upon a Trigger event and are constructed of the following:

* **Unique Id (required)**: A unique identifier amongst all recipes within your app. Examples: "ID-1234" or "EnteredWork".

* **Delegate (required)**: The method that is called when the trigger is fired.

* **Trigger (required)**: The real-world event that you want to listen for.

* **Window (optional)**: The period of time during which you want to listen for the trigger. Examples: 9am to 12pm and 4pm - 11pm.
  
* **Cooldown (optional)**: The amount of time to wait before the same trigger can fire again. Examples: 8 hours, 1 week.

# Quick Start

[Link to Quick Start]

# Triggers

Triggers define the conditions under which your app should be notified. There are 3 types of places that you can be notified about. 3 types of Triggers are supported:

- [Place of Interest (POI)](#place-of-interest-(poi)) - Examples are: Restaurant, Shopping Mall, etc.
- [Personal Place](#personal-place) - Examples are: Home/Work.
- [Custom Geofence](#custom-geofence) - These can be any latitude/longitude point with a radius.


<aside class="notice"> IMPORTANT: A trigger on its own does nothing. You must build your triggers, and then add it to a Recipe in order to utilize the trigger. 
</aside>

## Place of Interest (POI)

Gives you the ability to be notified when a user enters or exits a particular POI type.

```swift
// Will notify you when the user enters an Airport
let airportTrigger: Trigger? = FireTrigger.whenEntersPoi(.Airport)
```

```objective_c
// Will notify you when the user enters an Airport
Trigger *restaurantTrigger = [FireTrigger whenEntersPoi:PoiTypeRestaurant errorPtr:nil];
```

Supported POI types:

Category | Transitions | |
--------- | ------- |------- |
Airport | .whenEnters(.Airport) | .whenExits(.Airport)
Bar | .whenEnters(.Bar) | .whenExits(.Bar)
Restaurant | .whenEnters(.Restaurant) | .whenExits(.Restaurant)
Mall | .whenEnters(.Mall) | .whenExits(.Mall)
Cafe | .whenEnters(.Cafe) | .whenExits(.Cafe)
Gym | .whenEnters(.Gym) | .whenExits(.Gym)

### Caveats
- Each trigger can only detect a single POI type.
- The sdk will not trigger immediately on entrance or exit because it needs to be sure of the action.

## Personal Place

Gives you the ability to be notified when a user enters or exits their home or work. You can also be notified if the user is far awar from their home or work.

```swift
// Will notify you when the user enters their Home
let homeTrigger: Trigger? = FireTrigger.whenEntersPersonalizedPlace(PersonalizedPlaceType.Home)
```

```objective_c
// Will notify you when the user enters their Home
Trigger *homeTrigger = [FireTrigger whenEntersPersonalizedPlace:PersonalizedPlaceTypeHome errorPtr:nil];
```


The currently supported personalized location categories are:

Category | Transitions | |
--------- | ------- |------- |
Home | .whenEnters(.Home) | .whenExits(.Home)
Work | .whenEnters(.Work) | .whenExits(.Work)

### Caveats
- The SDK takes roughly a week to determine a user's home or work. After the SDK identifies the users home or work, it can then start detecting it.
- The SDK will continually try to update the user's home every few days.
- Due to the sensitivity of this data, neither developers nor us will ever see the raw data or store a users home or office location. The computation happens on the device itself and stays there to ensure your users privacy.

## Custom Geofence

A custom geofence allows you specify a region to monitor for entrance and exit.

```swift
let hq = CustomGeofence(latitude: 37.124, longitude: -127.456, radius: 20, customIdentifier: "Sense 360 Headquarters")
let lunchSpot = CustomGeofence(latitude: 37.124, longitude: -127.456, radius: 35, customIdentifier: "A&B Bar and Grill")
let geofenceTrigger: Trigger? = FireTrigger.whenEntersGeofences([hq, lunchSpot])
```

```objective_c
CustomGeofence *hq = [[CustomGeofence alloc] initWithLatitude:37.124 longitude:-127.456 radius:20 customIdentifier:@"Sense 360 Headquarters"];
CustomGeofence *lunchSpot = [[CustomGeofence alloc] initWithLatitude:37.124 longitude:-127.456 radius:35 customIdentifier:@"A&B Bar and Grill"];
NSArray *geofences = [[NSArray alloc] initWithObjects:hq,lunchSpot,nil];
[FireTrigger whenEntersGeofences: geofences errorPtr:nil];
```

All custom geofence triggers must specify the following parameters

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
location | Location | true | location
radius | Int | true | radius of geofence
customIdentifier | String | true | unique identifier for your geofence

Type | Transitions | |
--------- | ------- |------- |
CustomGeofence | .whenEntersGeofence() | .whenExitsGeofence()

### Caveats

- You can specify at most 1000 geofences to monitor
- Geofences must have a radius of at least 20m

## Error handling

```swift
let errorPtr = SenseSdkErrorPointer.create()
if let restaurantTrigger = FireTrigger.whenEntersPoi(.Restaurant, errorPtr: errorPtr) {
  // continue //
} else {
  NSLog(errorPtr.error!.message)
}
```

```objective_c
SenseSdkErrorPointer *errorPtr = [SenseSdkErrorPointer create];
Trigger *restaurantTrigger = [FireTrigger whenEntersPoi:PoiTypeRestaurant errorPtr:errorPtr];
if(restaurantTrigger != nil) {
  // continue //
} else {
    NSLog(@"%@", errorPtr.error.message);
}
```
In the event that there is an error when setting up a trigger, a nil will be returned with the error message stored within the corresponding SenseSdkErrorPointer.


# Recipes

The Recipe is the container that encases your trigger, and various other settings.  Recipes are registered globally within your application with a call to the [SenseSdk](#sensesdk).  Below are the inputs that make up a Recipe:

```swift
let recipe = Recipe(name: "My Recipe", trigger: someTrigger)
```

```objective_c
Recipe *recipe = [[Recipe alloc] initWithName: @"My Recipe" 
                                      trigger: someTrigger
                                   timeWindow: [TimeWindow allDay]
                                     cooldown: [Cooldown defaultCooldown]];
```

Parameter | Required | Default
--------- | -------  | --------
uniqueId (String)| true |
[trigger](#triggers) | true |
[window](#window)| false | 0-23 hours
[cool down](#cooldown) | false | 1 minute


## Time Window

A time window specifies which hours of the day a trigger is allowed to fire.

```swift
// This will only allow a trigger to fire between the hours of 5pm and 10pm (in the users local time)
let recipe = Recipe(
  name: "My Recipe", 
  trigger: someTrigger,
  window: TimeWindow.create(fromHour: 17, toHour: 22))
```

```objective_c
Recipe *recipe = [[Recipe alloc] initWithName: @"My Recipe"
                                      trigger: someTrigger
                                   timeWindow: [TimeWindow createFromHour:17 toHour:22 errorPtr:nil]
                                     cooldown: [Cooldown defaultCooldown]];

```

Parameter | Type | Range | Required | Description
--------- | ------- |------- | ----------- | -----------
fromHour | Int | 0-23 | true | Window start time (user's local time)
toHour | Int | 0-23 | true | Window end time (user's local time)

### Caveats

- The transition must occur between the times specified. For example, if a user enters at 5am, and the window was set for 6am - 7am, the trigger WILL NOT fire, even if the user is still within the specified geofence at 6am.

## Cooldown

The amount of time after a trigger fires, to wait before the same trigger can fire again.

```swift
// Wait 2 days after the trigger fires
let recipe = Recipe(
  name: "My Recipe", 
  trigger: someTrigger, 
  cooldown: Cooldown.create(oncePer: 2, frequency: .Days)!
```

```objective_c
// Wait 2 days after the trigger fires
Recipe *recipe = [[Recipe alloc] initWithName: @"My Recipe"
                                      trigger: someTrigger
                                   timeWindow: [TimeWindow allDay]
                                     cooldown: [Cooldown createWithOncePer:2 frequency:CooldownTimeUnitDays errorPtr:nil]];


```

Unit | Signature 
--------- | ------- |
Minutes|Cooldown.create(oncePer: 1, frequency: .Minutes)!
Hours|Cooldown.create(oncePer: 1, frequency: .Hours)!
Days|Cooldown.create(oncePer: 1, frequency: .Days)!


# SenseSdk

The SenseSdk is the main entry point into the Sdk. It allows you to register and unregister recipes.

```swift
// Registering a recipe and delegate
let success = SenseSdk.register(recipe: restaurantRecipe, delegate: self, errorPtr: nil)
```

```objective_c
// Registering a recipe and delegate
Boolean success = [SenseSdk registerWithRecipe:recipe delegate:callback errorPtr:nil];
```

Function | Parameters | Description
--------- | ------- |------- 
register | Recipe, TriggerFiredDelegate | Starts the recipe and registers the delegate to be called when the trigger fires.
unregister | Recipe | Stops and removes the recipe from SenseSdk.
findRecipe | String | Finds and returns a recipe by name.
getAllRecipes | | Returns all registered recipes.

## Acting when a recipe fires

Acting on triggers are done by implementing the RecipeFiredDelegate protocol.  The protocol has one method with one argument that contains the information on why and when the recipe fired.

```swift
class MyCallback : RecipeFiredDelegate {
  func recipeFired(args: RecipeFiredArgs) {
      NSLog("Recipe \(args.recipe.name) fired at \(args.timestamp).")
      for trigger in args.triggersFired {
          for place in trigger.places {
              NSLog(place.description)
          }
      }
  }
}
```

```objective_c
@interface MyCallback : NSObject<RecipeFiredDelegate>

@implementation MyCallback {
  - (void)recipeFired:(RecipeFiredArgs*) args {
      NSLog(@"Recipe %@ fired at %@.", [[args recipe] name], [args timestamp]);
      for (TriggerFiredArgs* trigger in [args triggersFired]) {
          for (NSObject <NSCoding, Place>* place in [trigger places]) {
              NSLog(@"%@", [place description]);
          }
      }
  }
}
```


**RecipeFiredDelegate**

Property | Type | Description
--------- | ------- |------- 
timestamp | NSDate | The time at which the recipe was fired
recipe | Recipe | The recipe itself
triggersFired | [TriggerFiredArgs] | The pertinent infromation on the triggers that fired
confidenceLevel | ConfidenceLevel | The combined confidence levels of all triggers within the recipe


**TriggerFiredArgs**

Property | Type | Description
--------- | ------- |-------
timestamp | NSDate | The time at which this trigger fired
places | [Place] | The places that caused this trigger to fired
confidenceLevel | ConfidenceLevel | The confidence that the corresponding action actually occurred



## Confidence Levels

When a trigger is fired, it brings along one of three confidence levels.

1. High
2. Medium
3. Low

# Thanks for using Sense360

### *To sign up for a developer key, click the green link on the left side of this page!*