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

# Template Project

Swift and Objective-C projects are available at <a href='https://github.com/Sense360/Sense360IOSStarter'>https://github.com/Sense360/Sense360IOSStarter</a>.

# Download

You can download the stand alone framework <a href='https://www.dropbox.com/s/few391levfy93aj/SenseSdk.framework.zip?dl=0'>here</a>.

# API Components

The following are the main components of building with Sense360

[Triggers](#triggers): The real-world event that you want to listen for (can be a place, action, or contextual element). Example triggers are “has arrived at airport”, “has exited work”, or “is 100 miles from home”

[Recipes](#recipes):  A collection of elements (including the Trigger) that defines **when** you want to listen for the trigger, and **what** you want to happen when the trigger is fired. Recipes gives you the flexibility to do whatever you want upon a Trigger event and are constructed of the following:

* **Unique Id (required)**: A unique identifier amongst all recipes within your app. Examples: "ID-1234" or "EnteredWork".

* **Delegate (required)**: The method that is called when the trigger is fired.

* **Trigger (required)**: The real-world event that you want to listen for.

* **Window (optional)**: The period of time during which you want to listen for the trigger. Examples: 9am to 12pm and 4pm - 11pm.
  
* **Cooldown (optional)**: The amount of time to wait before the same trigger can fire again. Examples: 8 hours, 1 week.

# Triggers

Triggers define the conditions under which your app should be notified.  There are 3 categories of places that you can be notified about.  These categories are:

- [Place of Interest](#place-of-interest) - Examples are: Restaurant, Shopping Mall, etc.
- [Personal Place](#personal-place) - Examples are: Home/Work.
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

Supported POI types:

Category | Transitions | |
--------- | ------- |------- |
Airport | .whenEntersPoi(.Airport) | .whenExitsPoi(.Airport)
Bar | .whenEntersPoi(.Bar) | .whenExitsPoi(.Bar)
Restaurant | .whenEntersPoi(.Restaurant) | .whenExitsPoi(.Restaurant)
Mall | .whenEntersPoi(.Mall) | .whenExitsPoi(.Mall)
Cafe | .whenEntersPoi(.Cafe) | .whenExitsPoi(.Cafe)
Gym | .whenEntersPoi(.Gym) | .whenExitsPoi(.Gym)

### Caveats
- Each trigger can only detect a single POI type.
- The sdk will not trigger immediately on entrance or exit because it needs to be sure of the user's presence.

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

Category | Transitions | | | 
--------- | ------- |------- | ---- | ----
Home | .whenEntersPersonalizedPlace(.Home) | .whenExitsPersonalizedPlace(.Home) | whenExitsPersonalizedPlace(.Home, kilometers: 10)
Work | .whenEntersPersonalizedPlace(.Work) | .whenExitsPersonalizedPlace(.Work) | whenExitsPersonalizedPlace(.Work, kilometers: 10)

### Caveats
- The SDK takes roughly a week to determine a user's home or work. After the SDK identifies the users home or work, it can then start detecting the users presence there.
- The SDK will continually try to update the user's home every few days.
- Due to the sensitivity of this data, neither developers nor us will ever see the raw data or store a users home or office location. The computation happens on the device itself and stays there to ensure your users privacy.
- The sdk will not trigger immediately on entrance or exit because it needs to be sure of the user's presence.

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

Type | Transitions | | |
--------- | ------- |------- | ---- |
CustomGeofence | .whenEntersGeofences() | .whenExitsGeofences() | .whenExitsGeofences([CustomGeofence], kilometers: 10)

### Caveats

- You can specify at most 1000 geofences to monitor
- Geofences must have a radius of at least 30m
- The SDK will not trigger immediately on entrance or exit because it needs to be sure of the user's presence.

## Handling Trigger Creation Errors

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
// Basic trigger. No time restriction. No cooldown. (can fire at most every minute)
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
[cool down](#cooldown) | false | 5 minutes


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

The SenseSdk is the main entry point into the Sdk. It allows you to register and unregister recipes.

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
register | [Recipe](#recipes), [RecipeFiredDelegate](#recipefireddelegate), [SenseSdkErrorPointer](#sensesdkerrorpointer) | Starts the recipe and registers the delegate to be called when the trigger fires.
unregister | String | Stops and removes the recipe from SenseSdk by name.
findRecipe | String | Finds and returns a recipe by name.

<aside class="notice"> Your application key will be validated regulary every few days.
</aside>

## SenseSdkErrorPointer

This class is used to communicate any errors on a registration of a recipe with the [SenseSdk](#sensesdk).

Containing Class | Property | Description
--------- | ------- |------- | ---------
SenseSdkError | message | The error message

# After a trigger fires

Acting on triggers is done by implementing the RecipeFiredDelegate protocol. In order to implement the protocol, you must define the recipeFired method, which has one parameter of type RecipeFiredArgs. 

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

<aside class="warning"> When we call your recipe delegate method, your code will have 10 seconds to run before iOS will shutdown the app
</aside>

## RecipeFiredArgs


Property | Type | Description
--------- | ------- |------- 
timestamp | NSDate | The time at which the recipe was fired
recipe | [Recipe](#recipes) | The recipe itself
triggersFired | [[TriggerFiredArgs](#triggerfiredargs)] | The pertinent infromation on the triggers that fired. Will hold a single value per trigger.
confidenceLevel | [ConfidenceLevel](#confidence-levels) | The combined confidence levels of all triggers within the recipe


## TriggerFiredArgs

Property | Type | Description
--------- | ------- |-------
timestamp | NSDate | The time at which this trigger fired
places | [[Place](#places)] | The places that caused this trigger to fired
confidenceLevel | [ConfidenceLevel](#confidence-levels) | The confidence that the corresponding action actually occurred

## Places

### CustomGeofence

Property | Type | Description
--------- | ------- |-------
customIdentifier | String | A unique string which identifies the custom geofence (provided by you)
location | Location | The latitude and longitude of the center
radius | Double | The radius of the geofence

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

# Conditional Elements
A trigger is often just one half of the puzzle.  Your specific case may require a trigger to fire only when your user satisfies some other criteria, like how far they are from their home.  A conditional element allows you to do just that.

Several conditions may be applied when creating any type of trigger through the FireTrigger class.  All conditions applied to a trigger MUST be satisfied in order for the entire recipe to fire.

<aside class="notice"> The only conditional element supported as of today is fartherThan, but closerThan and many more will be coming soon.
</aside>

```swift
FireTrigger.whenEntersPoi(.Airport, conditions: conditions)
```

```objective_c
[FireTrigger whenEntersPoi:PoiTypeAirport conditions:conditions errorPtr:nil];
```

## Farther Than Condition
The farther than condition ensures that the trigger will only fire if the user is farther than X kilometers from either a personalized place or a list of custom geofences.

One use could be that you your app should suggest a hotel to stay at when your user enters an airport and is farther than 150 kilometers from their home.

### Caveats:

- If you specify multiple geofences within a single condition, the user must be farther than ALL of the locations in order to trigger the callback.
- If you need to create a fartherThan condition where user only needs to be [x] distance from one of multiple locations, you will need to create an individual Recipe PLUS Conditional Element per geofence.

<aside class="warning"> Note: you cannot use the fartherThan condition with POI Place Types.
</aside>

```swift
let condition = UsersLocation.isFartherThanPersonalizedPlace(.Home, kilometers: 150)
```

```objective_c
ConditionalElement* condition = [UsersLocation 
                     isFartherThanPersonalizedPlace:PersonalizedPlaceTypeHome
                                         kilometers:[NSNumber numberWithInt:150]
                                           errorPtr:nil];
```

# Testing

Testing in the real world is time consuming, so we provide a way to easily trigger your Recipe to fire.

```swift
//Create a fake restaurant
let place = PoiPlace(latitude: 34.111, longitude: -118.111, radius: 50, name: "Big Restaurant", id: "id1", types: [.Restaurant])

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

# Thanks for using Sense360
<div style="height:120px;"></div>