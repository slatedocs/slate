---
title: Sense360 API Reference

language_tabs:
  - swift: Swift
  - objective_c: Objective-C

toc_footers:
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Sense360 allows you to quickly build functions around actions that your users take in the physical world. You can build triggers based on where a user is, what they are doing, or what is happening around them. **You can do all this in the background, even if your app is closed.** Adding these real-world triggers to your app can take months if you try to achieve high accuracy, low battery drain, and maximum user privacy. We make the process quick and painless.

Eventually, we aim to have a trigger for any action a user can take, whether it be "running", "driving", "waking up", "eating", "watching tv", "playing basketball", "watching basketball", etc.

**Sign up for a developer key** by clicking the "Request API Key" on the top right

Have fun creating!

# Requirements

- Must be using Xcode 6.3+. (We do not support Xcode 7.0-beta yet)
- Deployment target must be iOS 8.0+

# Template Project

A Swift starter project can be found at: <a href='https://github.com/Sense360/Sense360StarterSwift' onclick= "clickedDownloadGithubProjectSwift()">https://github.com/Sense360/Sense360StarterSwift</a>

The same project but for objective-c can be found at: <a href='https://github.com/Sense360/Sense360StarterObjC' onclick= "clickedDownloadGithubProjectObjC()">https://github.com/Sense360/Sense360StarterObjC</a>

# Download

## Latest
You can download the latest framework <a href='https://s3-us-west-1.amazonaws.com/sense360-public-files/SenseSdk.framework.zip' onclick= "clickedDownloadLibraryLink()">here</a> (Version 1.2). Release Notes can be found [here](#version-1.2).

### Previous
- <a href='https://s3-us-west-1.amazonaws.com/sense360-public-files/sdk/SenseSdk.framework1.1.zip'>Download Version 1.1</a>

# Quick Start

To get up running quickly we also have provided a <a href="http://www.sense360.com/getting_started.html">Quick Start Guide</a>.

# API Concepts

The following are the main components of building with Sense360

[Triggers](#triggers): The real-world event that you want to listen for (can be a place, action, or contextual element). Example triggers are “has arrived at airport”, “has exited work”, or “is 100 miles from home”

[Recipes](#recipes):  A collection of elements (including the Trigger) that defines **when** you want to listen for the trigger, and **what** you want to happen when the trigger is fired. Recipes gives you the flexibility to do whatever you want upon a Trigger event and are constructed of the following:

* **Unique Id (required)**: A unique identifier amongst all recipes within your app. Examples: "ID-1234" or "EnteredWork".

* **Delegate (required)**: The method that is called when the trigger is fired.

* **Trigger (required)**: The real-world event that you want to listen for. There can only be one trigger per recipe.

* **Window (optional)**: The period of time during which you want to listen for the trigger. Examples: 9am to 12pm and 4pm - 11pm. There can only be one window per recipe.
  
* **Cooldown (optional)**: The amount of time to wait before the same trigger can fire again. Examples: 8 hours, 1 week. There can only be one cooldown per recipe.

# Triggers

Triggers define the conditions under which your app should be notified.  There are 3 categories of places that you can be notified about.  These categories are:

- [Place of Interest](#place-of-interest) - Examples are: Restaurant, Shopping Mall, etc.
- [Personal Place](#personal-place) - Examples are: Home, Work.
- [Custom Geofence](#custom-geofence) - These can be any latitude/longitude point with a radius.

All triggers are built by the class FireTrigger.  Within there, you will find every function you need to get going.

<aside class="notice"> IMPORTANT: A trigger on its own does nothing. You must build your triggers, and then add it to a Recipe in order to utilize the trigger.
</aside>

## Place of Interest

Gives you the ability to be notified when a user enters or exits a particular POI type.

```swift
// Will notify you when the user enters an Airport
let airportTrigger: Trigger? = FireTrigger.whenEntersPoi(.Airport)
```

```objective_c
// Will notify you when the user enters an Airport
Trigger *restaurantTrigger = [FireTrigger whenEntersPoi:PoiTypeRestaurant conditions:nil errorPtr:nil];
```

It is also possible to fire a trigger when a user enters or exits any of the POI categories specified below.  If you wish to do this, use the "PoiType.All" category.

```swift
// Will notify you when the user enters any category Sense360 supports
let allPoiTypesTrigger: Trigger? = FireTrigger.whenEntersPoi(.All)
```

```objective_c
// Will notify you when the user enters any category Sense360 supports
Trigger *allPoiTypesTrigger = [FireTrigger whenEntersPoi:PoiTypeAll conditions:nil errorPtr:nil];
```

Supported POI types:

Category | Transitions | |
--------- | ------- |------- |
Airport | .whenEntersPoi(.Airport) | .whenExitsPoi(.Airport)
Bar | .whenEntersPoi(.Bar) | .whenExitsPoi(.Bar)
Restaurant | .whenEntersPoi(.Restaurant) | .whenExitsPoi(.Restaurant)
Mall | .whenEntersPoi(.Mall) | .whenExitsPoi(.Mall)
Cafe | .whenEntersPoi(.Cafe) | .whenExitsPoi(.Cafe)
Gym | .whenEntersPoi(.Gym) | .whenExitsPoi(.Gym)
Lodging | .whenEntersPoi(.Lodging) | .whenExitsPoi(.Lodging)
PoliceDepartment | .whenEntersPoi(.PoliceDepartment) | .whenExitsPoi(.PoliceDepartment)
BusStation | .whenEntersPoi(.BusStation) | .whenExitsPoi(.BusStation)
DepartmentStore | .whenEntersPoi(.DepartmentStore) | .whenExitsPoi(.DepartmentStore)
FireStation | .whenEntersPoi(.FireStation) | .whenExitsPoi(.FireStation)
Stadium | .whenEntersPoi(.Stadium) | .whenExitsPoi(.Stadium)
Hospital | .whenEntersPoi(.Hospital) | .whenExitsPoi(.Hospital)
Parking | .whenEntersPoi(.Parking) | .whenExitsPoi(.Parking)
NightClub | .whenEntersPoi(.NightClub) | .whenExitsPoi(.NightClub)
University | .whenEntersPoi(.University) | .whenExitsPoi(.University)


### Caveats
- Besides the "All" category, each trigger can only detect a single POI type.

## Personal Place

Gives you the ability to be notified when a user enters or exits their home or work. You can also be notified if the user is far awar from their home or work.

```swift
// Will notify you when the user enters their Home
let homeTrigger: Trigger? = FireTrigger.whenEntersPersonalizedPlace(.Home)
```

```objective_c
// Will notify you when the user enters their Home
Trigger *homeTrigger = [FireTrigger whenEntersPersonalizedPlace:PersonalizedPlaceTypeHome conditions:nil errorPtr:nil];
```


The currently supported personalized location categories are:

Category | Transitions | |
--------- | ------- |------- |
Home | .whenEntersPersonalizedPlace(.Home) | .whenExitsPersonalizedPlace(.Home)
Work | .whenEntersPersonalizedPlace(.Work) | .whenExitsPersonalizedPlace(.Work)

### Caveats
- The SDK takes roughly a week to determine a user's home or work. After the SDK identifies the users home or work, it can then start detecting the users presence there.
- The SDK will continually try to update the user's home every few days.
- The SDK will not trigger immediately on entrance or exit because it needs to be sure of the user's presence.

<aside class="warning">Due to the sensitivity of this data, neither developers nor Sense360 will ever see the raw data or store a users home or office location. The computation happens on the device itself and stays there to ensure your user's privacy.</aside>

## Custom Geofence

A custom geofence allows you specify a region to monitor for entrance and exit. This geofence will only be registered for this user (not your entire application).

```swift
let hq = CustomGeofence(latitude: 37.124, longitude: -127.456, radius: 50, customIdentifier: "Sense 360 Headquarters")
let lunchSpot = CustomGeofence(latitude: 37.124, longitude: -127.456, radius: 50, customIdentifier: "A&B Bar and Grill")
let geofenceTrigger: Trigger? = FireTrigger.whenEntersGeofences([hq, lunchSpot])
```

```objective_c
CustomGeofence *hq = [[CustomGeofence alloc] initWithLatitude:37.124 longitude:-127.456 radius:50 customIdentifier:@"Sense 360 Headquarters"];
CustomGeofence *lunchSpot = [[CustomGeofence alloc] initWithLatitude:37.124 longitude:-127.456 radius:50 customIdentifier:@"A&B Bar and Grill"];
NSArray *geofences = [[NSArray alloc] initWithObjects:hq,lunchSpot,nil];
[FireTrigger whenEntersGeofences: geofences conditions:nil errorPtr:nil];
```

All custom geofence triggers must specify the following parameters

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
location | Location | true | location
radius | Int | true | radius of geofence
customIdentifier | String | true | unique identifier for your geofence

Type | Transitions | |
--------- | ------- |------- |
CustomGeofence | .whenEntersGeofences() | .whenExitsGeofences()

### Caveats

- You can specify at most 1000 geofences to monitor
- Geofences must have a radius of at least 30m
- The SDK will not trigger immediately on entrance or exit because it needs to be sure of the user's presence.

## Conditional Elements

A conditional element is an extra restriction that you can create for a trigger that must be satisfied. A condition must be paired with a trigger and cannot stand alone.

Several conditions may be applied when creating any type of trigger through the FireTrigger class.  All conditions applied to a trigger MUST be satisfied in order for the entire recipe to fire.

###Activity Condition

Activity conditions are used to check the mode of transportation in which a user either arrives or departs from a specified place.

For example, if you want to be notified when a user enters a restaurant, BUT only when they arrived by car, you would do the following:

```swift
let arrivedByCar = UsersActivity.arrivedBy(.Automotive)!
let restaurantTrigger = FireTrigger.whenEntersPoi(.Restaurant, conditions: [arrivedByCar])
```

```objective_c
ConditionalElement* arrivedByCar = [UsersActivity arrivedBy:ActivityTypeAutomotive errorPtr:nil];
Trigger *restaurantTrigger = [FireTrigger whenEntersPoi:PoiTypeRestaurant conditions: arrivedByCar errorPtr:nil];
```


There are 5 types of activities available:
walking |
running |
automotive |
cycling

### Farther Than Condition

The farther than condition ensures that the trigger will only fire if the user is farther than X kilometers from either a personalized place or a list of custom geofences.

For example, you can trigger when a user enters a restaurant that is farther than 150 kilometers from their home.

```swift
let fartherThanHome = UsersLocation.isFartherThanPersonalizedPlace(.Home, kilometers: 150)!
let restaurantTrigger = FireTrigger.whenEntersPoi(.Restaurant, conditions: [fartherThanHome])
```
```objective_c
ConditionalElement *fartherThanHome = [UsersLocation
                                       isFartherThanPersonalizedPlace:PersonalizedPlaceTypeHome
                                       kilometers:[NSNumber numberWithInt:150]
                                       errorPtr:errorPtr];
NSArray* conditions = [[NSArray alloc] initWithObjects:fartherThanHome, nil];
Trigger *restaurantTrigger = [FireTrigger whenEntersPoi:PoiTypeRestaurant conditions:conditions errorPtr:nil];
```

Category | Transitions |
--------- | ------- |
Home |  whenExitsPersonalizedPlace(.Work, kilometers: 10)
Work | whenExitsPersonalizedPlace(.Work, kilometers: 10)
CustomGeofence | .whenExitsGeofences([CustomGeofence], kilometers: 10)

### Caveats:

- If you specify multiple geofences within a single condition, the user must be farther than ALL of the locations in order to trigger the callback.
- If you need to create a fartherThan condition where user only needs to be [x] distance from one of multiple locations, you will need to create an individual Recipe PLUS Conditional Element per geofence.

<aside class="warning"> Note: you cannot use the fartherThan condition with POI Place Types.
</aside>

## Handling Trigger Creation Errors

When creating triggers an error can be returned instead of a trigger if an invalid trigger has been created.

```swift
let errorPointer = SenseSdkErrorPointer()
let result = FireTrigger.whenEntersPoi(.Airport, errorPtr: errorPointer)
if let airportTrigger = result.trigger {
  NSLog("Success monitoring airport entrance!")
} else {
  NSLog("Error building airport trigger. Msg=" + errorPointer.error!.message)
}
```

```objective_c
SenseSdkErrorPointer *errorPtr = [SenseSdkErrorPointer create];
Trigger *restaurantTrigger = [FireTrigger whenEntersPoi:PoiTypeRestaurant conditions:nil errorPtr:errorPtr];
if(restaurantTrigger != nil) {
  NSLog(@"Success monitoring airport entrance!");
} else {
  NSLog(@"%@", errorPtr.error.message);
}
```

In the event that there is an error when setting up a trigger, a nil will be returned with the error message stored within the corresponding SenseSdkErrorPointer.

# Recipes

The Recipe is the container that encases your trigger, and various other settings.  Recipes are registered globally within your application with a call to the [SenseSdk](#sensesdk).  Below are the inputs that make up a Recipe:

```swift
// Basic trigger. No time restriction. No cooldown. (can fire at most every 5 minutes)
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
[cooldown](#cooldown) | false | 5 minutes


## Time Window

A time window specifies which hours of the day a trigger is allowed to fire.

```swift
// This will only allow a trigger to fire between the hours of
// 5pm and 10pm (in the users local time)
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

#### Params
Parameter | Type | Range | Required | Description
--------- | ------- |------- | ----------- | -----------
fromHour | Int | 0-23 | true | Window start time (user's local time)
toHour | Int | 0-23 | true | Window end time (user's local time)

### Values

Value | Description
--------- | ------- |
allDay | No time restriction on firing |


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

### Values

Unit | Signature 
--------- | ------- |
Minutes|Cooldown.create(oncePer: 5, frequency: .Minutes)!
Hours|Cooldown.create(oncePer: 5, frequency: .Hours)!
Days|Cooldown.create(oncePer: 5, frequency: .Days)!
Default | Cooldown.create(oncePer: 30, frequency: .Minutes)!

### Caveats
- The minimum cooldown time is 5 minutes.

# SenseSdk

The SenseSdk is the main entry point into the SDK. It allows you to register and unregister recipes.

<aside class="warning"> You must call enableSdkWithKey in your AppDelegate's applicationDidFinishLaunching method.
</aside>

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
enableSdkWithKey | String | Enable the SDK with your application key (provided by Sense360)
register | [Recipe](#recipes), [RecipeFiredDelegate](#handling-trigger-firing), [SenseSdkErrorPointer](#sensesdkerrorpointer) | Starts the recipe and registers the delegate to be called when the trigger fires.
unregister | String | Stops and removes the recipe from SenseSdk by name.
findRecipe | String | Finds and returns a recipe by name.

<aside class="notice"> Your application key will be validated regulary every few days.
</aside>

## SenseSdkErrorPointer

This class is used to communicate any errors on a registration of a recipe with the [SenseSdk](#sensesdk).

Containing Class | Property | Description
--------- | ------- |------- | ---------
SenseSdkError | message | The error message

# Handling a Recipe Firing

Acting on recipes is done by implementing the RecipeFiredDelegate protocol. In order to implement the protocol, you must define the recipeFired method, which has one parameter of type RecipeFiredArgs. 

The RecipeFiredArgs contains trigger-specific information which is passed through an array of TriggerFiredArgs. 

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

<aside class="warning"> In the event that your app was not running previously, your code will have 10 seconds to run once we call your recipe delegate method.
After which time, iOS is free to shutdown your app.
</aside>

## RecipeFiredArgs

The details of the recipe when it is fired.

Property | Type | Description
--------- | ------- |------- 
timestamp | NSDate | The time at which the recipe was fired
recipe | [Recipe](#recipes) | The recipe itself
triggersFired | [[TriggerFiredArgs](#triggerfiredargs)] | The pertinent infromation on the triggers that fired. Will hold a single value per trigger.
confidenceLevel | [ConfidenceLevel](#confidence-levels) | The combined confidence levels of all triggers within the recipe


## TriggerFiredArgs

The details of a trigger when it fires.

Property | Type | Description
--------- | ------- |-------
timestamp | NSDate | The time at which this trigger fired
places | [[Place](#places)] | The places that caused this trigger to fired
confidenceLevel | [ConfidenceLevel](#confidence-levels) | The confidence that the corresponding action actually occurred

## Places

Below is a list of the types of places that can be passed back when the Recipe fires. Which one is presented depends on the type of trigger you use.

### CustomGeofence

Property | Type | Description
--------- | ------- |-------
customIdentifier | String | A unique string which identifies the custom geofence (provided by you)
location | Location | The latitude and longitude of the center
radius | Double | The radius of the geofence

### PoiPlace

Property | Type | Description
--------- | ------- |-------
id | String | A unique string which identifies the place (provided by us)
location | Location | The latitude and longitude of the center
radius | Double | The radius of the geofence
types | [[PoiType](#poitype)] | The category of the place


#### PoiType

 |
--------- |
Airport |
Bar |
Restaurant |
Mall |
Cafe |
Gym |
Loding |
PoliceDepartment |
BusStation |
DepartmentStore |
FireStation |
Stadium |
Hospital |
Parking |
NightClub |
University


### PersonalizedPlace
Property | Type | Description
--------- | ------- |-------
location | Location | The latitude and longitude of the center
radius | Double | The radius of the geofence
personalizedPlaceType | [PersonalizedPlaceType](#personalizedplacetype) | The type of place

#### PersonalizedPlaceType

 |
--------- |
Home |
Work |



## Confidence Levels

When a trigger is fired, it brings along one of three confidence levels.

 |
--------- |
High |
Medium |
Low |


## Working with different types of places

You may need to cast a place to the appropriate type once your recipe fires.  The following sample code shows you how to cast to any of the given types above depending on the place type:

```swift
func recipeFired(args: RecipeFiredArgs) {

        NSLog("Recipe \(args.recipe.name) fired at \(args.timestamp). ")

        if args.triggersFired.count > 0 {
            let triggerFired = args.triggersFired[0]
            if triggerFired.places.count > 0 {
                let place = triggerFired.places[0]

                let transitionDesc = args.recipe.trigger.transitionType.description
                switch(place.type) {
                    case .CustomGeofence:
                        if let geofence = place as? CustomGeofence {
                            NSLog("\(transitionDesc) \(geofence.customIdentifier)")
                        }
                        break;
                    case .Personal:
                        if let personal = place as? PersonalizedPlace {
                            NSLog("\(transitionDesc) \(personal.personalizedPlaceType.description)")
                        }
                        break;
                    case .Poi:
                        if let poi = place as? PoiPlace {
                            NSLog("\(transitionDesc) \(poi.types[0].description)")
                        }
                        break;
                }
            }
        }
    }
```

```objective_c
- (void)recipeFired:(RecipeFiredArgs*) args {
    //Your user has entered a restaurant!//
    NSLog(@"Recipe %@ fired at %@.", args.recipe.name, args.timestamp);
    
    NSString *transitionDesc;
    if(args.recipe.trigger.transitionType == TransitionTypeEnter) {
        transitionDesc = @"Enter";
    } else {
        transitionDesc = @"Exit";
    }
    
    if(args.triggersFired.count > 0) {
        TriggerFiredArgs *trigger = (TriggerFiredArgs*) args.triggersFired[0];
        
        NSObject<NSCoding, Place> *place = (NSObject<NSCoding, Place>*)trigger.places[0];
        
        if(place.type == PlaceTypeCustomGeofence) {
            
            CustomGeofence *geofence = (CustomGeofence*)place;
            NSString *notificationBody = [[NSString alloc] initWithFormat: @"%@ %@", transitionDesc, geofence.customIdentifier];
            [NotificationSender send:notificationBody];
            
        } else if(place.type == PlaceTypePersonal) {
            
            PersonalizedPlace *personalizedPlace = (PersonalizedPlace*)place;
            NSString *personalizedPlaceType = [PersonalizedPlace getDescriptionOfPersonalizedPlaceType:(int)personalizedPlace.type];
            NSString *notificationBody = [[NSString alloc] initWithFormat: @"%@ %@", transitionDesc,personalizedPlaceType];
            [NotificationSender send:notificationBody];
            
        } else if(place.type == PlaceTypePoi) {
            
            PoiPlace *poiPlace = (PoiPlace*)place;
            NSString *notificationBody = [[NSString alloc] initWithFormat: @"%@ %@", transitionDesc, poiPlace.description];
            [NotificationSender send:notificationBody];
            
        }
    }
}

```

# Testing

## Testing while at your desk

Testing in the real world is time consuming, so we provide a way to easily fire anyone of your recipes.  This can also be very helpful when unit testing your own code.

The example below shows you how to fire a recipe called "ArrivedAtRestaurant" with a restaurant called "Big Foot's Burgers".

```swift
//Create your fake restaurant
let place = PoiPlace(latitude: 34.111, longitude: -118.111, radius: 50,
  name: "Big Foot's Burgers", id: "id1", types: [.Restaurant])

let errorPointer = SenseSdkErrorPointer.create()
// This method should only be used for testing
SenseSdkTestUtility.fireTrigger(
    fromRecipe: "ArrivedAtRestaurant",
    confidenceLevel: ConfidenceLevel.Medium,
    places: [place],
    errorPtr: errorPointer
)

if errorPointer.error != nil {
    NSLog("Error sending trigger")
}
```

```objective_c
//Create a fake restaurant
PoiPlace* poiPlace = [[PoiPlace alloc] initWithLatitude:34.111
                         longitude:-118.111
                            radius:50
                              name:@"Big Restaurant"
                                id:@"id1"
                              type: PoiTypeRestaurant];
SenseSdkErrorPointer* errorPtr = [SenseSdkErrorPointer create];

// This method should only be used for testing
NSArray* places = [[NSArray alloc] initWithObjects:poiPlace, nil];
[SenseSdkTestUtility fireTriggerFromRecipe:@"ArrivedAtRestaurant"
                           confidenceLevel:ConfidenceLevelMedium
                                    places:places
                                  errorPtr:errorPtr];
if(errorPtr.error != nil) {
    [NotificationSender send:@"Error sending trigger"];
}
```

You will have to create the correct type of place depending on the type of trigger.  For example, if you have you have the case of "Enter Home", then you must make a place of type PersonalizedPlace.  The list of place types with their corresponding types can be found under: [Places](#places)

The example code below will show you how to create a personalized place, and fire a recipe named "ArrivedAtHome".

```swift
// Create a fake home location
let place = PersonalizedPlace(latitude: 34.111, longitude: -118.111, 
  radius: 50, personalizedPlaceType: .Home)

// You can also create a PersonalizedPlace as follows:
// let personalPlace = PersonalizedPlace(location: <Location>,
// radius: <Meters>, personalizedPlaceType: <PersonalizedPlaceType>)
        
let errorPointer = SenseSdkErrorPointer.create()

SenseSdkTestUtility.fireTrigger(
    fromRecipe: "ArrivedAtHome",
    confidenceLevel: ConfidenceLevel.Medium,
    places: [place],
    errorPtr: errorPointer
)

if errorPointer.error != nil {
    NSLog("Error sending trigger")
}
```

```objective_c
//Create a fake home location
PersonalizedPlace* personalizedPlace = [[PersonalizedPlace alloc]                   
                         initWithLatitude:34.111
                                longitude:-118.111
                                   radius:50
                    personalizedPlaceType: PersonalizedPlaceTypeHome];

// You can also create a PersonalizedPlace as follows:
// PersonalizedPlace* personalPlace = [[PersonalizedPlace alloc]
// initWithLocation:<(Location * __nonnull)>
// radius:<(double)>
// personalizedPlaceType:<(enum PersonalizedPlaceType)>]

SenseSdkErrorPointer *errorPtr = [SenseSdkErrorPointer create];

// This method should only be used for testing
NSArray* places = [[NSArray alloc] initWithObjects:personalizedPlace, nil];
[SenseSdkTestUtility fireTriggerFromRecipe:@"ArrivedAtHome"
                           confidenceLevel:ConfidenceLevelMedium
                                    places:places
                                  errorPtr:errorPtr];
if(errorPtr.error != nil) {
    NSLog(@"Error sending trigger");
}
```

The example code below will show you how to test a geofence, and fire a recipe named "ArrivedAtGeofence".

```swift
// Create two test geofences
let geofence1 = CustomGeofence(latitude: 37.124, longitude: -127.456, 
  radius: 50, customIdentifier: "My test geofence 1")
let geofence2 = CustomGeofence(latitude: 37.124, longitude: -127.456, 
  radius: 50, customIdentifier: "My test geofence 2")

let errorPointer = SenseSdkErrorPointer.create()

// This method should only be used for testing
SenseSdkTestUtility.fireTrigger(
    fromRecipe: "ArrivedAtGeofence",
    confidenceLevel: ConfidenceLevel.Medium,
    places: [geofence1, geofence2],
    errorPtr: errorPointer
)

if errorPointer.error != nil {
    NSLog("Error sending trigger")
}
```

```objective_c
// Create a geofence
CustomGeofence *geofence1 = [[CustomGeofence alloc] 
                        initWithLatitude:37.124 
                               longitude:-127.456 
                                  radius:50 
                        customIdentifier:@"My test geofence"];

SenseSdkErrorPointer *errorPtr = [SenseSdkErrorPointer create];

// This method should only be used for testing, and will test with the NSArray *geofences
NSArray* places = [[NSArray alloc] initWithObjects:geofence1, nil];
[SenseSdkTestUtility fireTriggerFromRecipe:@"ArrivedAtGeofence"
                           confidenceLevel:ConfidenceLevelMedium
                                    places:places
                                  errorPtr:errorPtr];
if(errorPtr.error != nil) {
    NSLog(@"Error sending trigger");
}
```

##Real world testing

Please note that when you do real-world testing you need to mimic the action you are testing as closely as possible or the trigger might not fire. In order to avoid false positives, our algorithms will try to ignore actions that do not look like real-world actions.

For example, if you are testing entering a restaurant. Make sure that you are not in or around the restaurant before starting the test and that you are at least 1km away. Drive, walk, or bike to the restaurant and make sure to enter it fully, sit down at a table, and stay at least five minutes. The more your testing reflects the way you would perform that action in the real-world, the more likely it is that our algorithms will pick it up.

Because we're developers too, we understand that any extra insight in how the SDK is working is extremely valuable.  This is why we provided a debug setting that will send you different notifications during your real-world testing.  To give it a try:

1. Open your info.plist. (go to your project and hit the Info tab at the top of the screen)
2. Add the key "sense360:sendDebugNotifications"
3. Set it to a Boolean with a value of YES
4. Make sure that at least one recipe is being registered (very important!)
5. Turn your app on
6. Go at least 1 kilometer away from your location, sit down, and wait for a notification!

# Release Notes

## Version 1.2
 
- Added PoiType.All category to allow you to listen for all the places of interest categories that Sense360 supports
- Added new PoiType categories: Cafe, Gym, Lodging, Police Department, Bus Station, Department Store, Fire Station, Stadium, Hospital, Parking, Nightclub, University
- Added sense360:sendDebugNotifications info plist item to help in debugging (http://www.sense360.com/docs.html#testing-while-at-your-desk)
- Fixed bug when an exit trigger was combined with a time window
- Added more details when a CustomGeofenceTrigger fires
- Improved arrivedBy and departedBy detection
- Added custom GPX files for testing each type of POI Trigger

# Thanks for using Sense360
<div style="height:120px;"></div>