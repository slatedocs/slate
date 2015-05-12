---
title: Sense360 API Reference

language_tabs:
  - Swift

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

* **Unique Id (required)**: A unique identifier amongst all recipes within your app.

* **Delegate (required)**: The method that is called when the trigger is fired.

* **Trigger (required)**: See above. 

* **Window (optional)**: The period of time during which you want to listen for the trigger.
  
* **Cooldown (optional)**: The amount of time after a trigger fires, to wait before the same trigger can fire again.

# Quick Start

The fastest setup to get up and running.

```swift

import SenseSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SenseApiDelegate {
    // ...
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Setup
        SenseApi.apiKey = "your-api-key-here"
                
        let trigger = BusinessCategoryTriggerBuilder()
                        .set(place: BusinessCategory.Airport)
                        .hasEntered()
                        .build()
                        
        let recipe = Recipe(trigger: trigger, name: "airportRecipe")
        SenseApi.register(recipe: recipe, delegate: self)
        
        return true
    }
    
    func onTriggerFired(args: TriggerFiredArgs) {
      NSLog("Triggered \(args.recipe.trigger.customIdentifier) at time \(args.timestamp)")
    }
    // ...

    // Save State
    func applicationWillTerminate(application: UIApplication) {
      SenseApi.saveState()
    }
}
```

### Scenario

The following example shows how to setup to be notified when a user arrives at an airport.

<br><br>

### Setup
1. Register with `SenseApi` with API key in `didFinishLaunchingWithOptions` method.
2. Define a trigger and recipe.
3. Register the recipe.

<br><br><br><br>

###Implement Callback

1. Implement `SenseApiDelegate` in `UIApplicationDelegate` to receive callback when trigger is satisfied.

<br><br>

###Save state

1. Saving the state ensures that your triggers will function properly even if a user terminates the app.

# Triggers

<aside class="notice"> IMPORTANT: A trigger on its own does nothing. You must build your triggers, and then add it to a Recipe in order to utilize the trigger. 
</aside>

Triggers define the real-world events you want to listen for, and you must first build the Trigger. 

### TriggerBuilders

There are 3 types of TriggerBuilders that correspond to 3 place types:

TriggerBuilder Type | Signature | Description
--------- | ------- |------- | -----------
[Business Place](#business-place) | BusinessCategoryTriggerBuilder() | Business Categories (like *restaurant* or *shopping mall*)
[Personal Place](#personal-place) | PersonalizedTriggerBuilder() | User-specific geofences (like *home* or *work*)
[Custom Place](#custom-place) | CustomPlaceTriggerBuilder() | Custom set of lat/longs + radius 

### Action Types

Each trigger must be accompanied by one of the following action types: 

Action | Signature | Description
--------- | ------- |------- | -----------
Enter | hasEntered() | Triggers when the user enters any of the geofences
Exit | hasExited() | Triggers when the user exits any of the geofences
FartherThan | fartherThan(km: Integer) | Triggers when the user is farther than X km away from any of the geofences


### Trigger Build Result  Definition:

The TriggerBuilder returns either the trigger or a list of errors.  The properties are:

TriggerBuildResult Type | Name | Description
--------- | ------- |------- | -----------
Trigger?|trigger|The final trigger when there are no errors
[TriggerError]?|errors|The errors that took place during the build

## Business Place
```swift
let airportTrigger = BusinessCategoryTriggerBuilder()
	.set(place: BusinessCategory.Airport)
	.hasEntered()
	.build()
```
The business category trigger allows you to determine whether someone is entering or leaving a business type. 

The currently supported use cases are:

Category | Signature | Supported Action Types
--------- | ------- |------- | -----------
Airport | .set(place: BusinessCategory.Airport) | hasEntered(), hasExited()
Bar | .set(place: BusinessCategory.Bar) | hasEntered(), hasExited()
Restaurant | .set(place: BusinessCategory.Restaurant) | hasEntered(), hasExited()
Mall | .set(place: BusinessCategory.Mall) | hasEntered(), hasExited()
Gas Station | .set(place: BusinessCategory.gasStation) | hasEntered(), hasExited()

## Personal Place
```swift
let homeTrigger = PersonalizedTriggerBuilder()
	.set(place: PersonalizedPlaceType.Home)
	.hasEntered()
	.build()
```
A personalized location trigger allows you to listen and fire off user-specific locations, such as a user's home or work. Our SDK automatically learns where these Personal Places are (a process that typicaly takes 1 week).

The currently supported personalized location categories are:

Category | Signature | Supported Action Types
--------- | ------- |------- | -----------
Home | .set(place: PersonalizedPlaceType.Home) | hasEntered(), hasExited(), fartherThan()
Work | .set(place: PersonalizedPlaceType.Work) | hasEntered(), hasExited(), fartherThan()

<aside class="notice"> 
Due to the sensitivity of this data, neither developers nor us will ever see the raw data or store a users home or office location. The computation happens on the device itself and stays there to ensure your users privacy.
</aside>

## Custom Place
```swift
let hq = CustomPlace(latitude: 37.124, longitude: -127.456, radiusMeters: 20,
  customIdentifier: "Sense 360 Headquarters")

let lunchSpot = CustomPlace(latitude: 37.124, longitude: -127.456, radiusMeters: 35,
  customIdentifier: "A&B Bar and Grill")

let trigger = CustomPlaceTriggerBuilder()
  .set(places: hq, lunchSpot)
  .fartherThan(kilometers: Kilometers(1))
  .build()
```
A custom place allows you to determine if someone is inside a geo-fence or a group of geofences that you build. 

All custom place triggers must specify the following parameters

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
location | Location | true | location
radiusMeters | Int | true | radius of geofence
customIdentifier | String | true | unique name for place


<aside class="warning"> You can have no more than [1000] custom places included in a single trigger.
Minimum radius for a CustomPlace is [20 meters]
</aside>

## Compound Triggers
```swift
let trigger = CompoundTriggerBuilder()
	.with(airportTrigger, and: homeTrigger)
	.build()
```
You have the ability to combine triggers to create a compound trigger:

In two of the examples above, both airportTrigger and homeTrigger were defined.  By then ANDing the two, you get a trigger that listens for when a user is at an airport AND 100+ kilometers from home (i.e. traveling):


# Recipes
```swift
let recipe = Recipe(name: "My Recipe", 
  trigger: someTrigger)
```
The Recipe is the container that encases your trigger, and various other settings.  Recipes are registered globally within your application with a call to the [SenseApi](#senseapi).  Below are the inputs that make up a Recipe:

Parameter | Required
--------- | ------- 
uniqueId | true |
[trigger](#triggers) | true 
[window](#window)| false 
[cool down](#cooldown) | false 


## Window

```swift
let recipe = Recipe(name: "My Recipe", 
  trigger: someTrigger, 
  window: TimeWindow(fromHour: 17, toHour: 22))
```

Only allow triggers to fire between certain times. 

Parameter | Type | Range | Required | Description
--------- | ------- |------- | ----------- | -----------
fromHour | Int | 0-24 | true | Window start time (user's local time)
toHour | Int | 0-24 | true | Window end time (user's local time)

This example would have the trigger only fire between 5pm (user’s timezone) to 10pm:

`TimeWindow(fromHour: 17, toHour: 22)`

## Cooldown

```swift
let recipe = Recipe(name: "My Recipe", 
  trigger: someTrigger, 
  cooldown: Cooldown(timespan: Days(2))
```

The amount of time after a trigger fires, to wait before the same trigger can fire again.  

Unit | Signature 
--------- | ------- |
Minutes|Cooldown(timespan: Minutes())
Hours|Cooldown(timespan: Hours())
Days|Cooldown(timespan: Days())

This would allow the trigger to fire only once every 2 days. 

`Cooldown(timespan: Days(2))`


# SenseApi

The SenseApi is the repository that stores all active Recipes within your application:

## Sense Api Functions
```swift
// Registering a recipe and delegate
let results = SenseApi.register(recipe: myRecipe, delegate: myDelegate)
if results.successful {
  NSLog("recipe registration successful")
}
else if let errors = result.errors {
    NSLog("Registration unsucessful, see errors below")
    for error in errors {
      NSLog("message: \(error.message)")
    }
}
```
Function | Parameters | Description
--------- | ------- |------- 
register | recipe, delegate | adds your recipe and delegate to SenseApi, and starts listening for events
unregister | recipe | stops and removes the recipe from SenseApi
findRecipe | name | finds and returns a recipe by name
getAllRecipes | | returns all registered recipes

## SenseApiDelegate
```swift
class MyDelegate : SenseApiDelegate {
    func onTriggerFired(args: TriggerFiredArgs) {
        NSLog("\(places.count) places fired on \(timestamp), with a confidence level of: \(args.confidenceLevel)")
    }
}
```

The SenseApiDelegate registered alongside your trigger in the SenseApi is notified with the following information once your trigger fires:

* A list of Places that the trigger matched
* `TIMESTAMP` when the trigger fired
* The confidence level of the places matched
* The containing recipe


### Confidence Levels

When a trigger is fired, it brings along one of three confidence levels.

1. High
2. Medium
3. Low

# Thanks for using Sense360

### *To sign up for a developer key, click the green link on the left side of this page!*