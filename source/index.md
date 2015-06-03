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
let airportTrigger = Trigger.whenEnters(.Airport).trigger!
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
let homeTrigger = Trigger.whenEnters(.Home).trigger!
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
let hq = CustomGeofence(latitude: 37.124, longitude: -127.456, radiusMeters: 20, customIdentifier: "Sense 360 Headquarters")
let lunchSpot = CustomGeofence(latitude: 37.124, longitude: -127.456, radiusMeters: 35, customIdentifier: "A&B Bar and Grill")

let trigger = Trigger.whenEnters([hq, lunchSpot]).trigger!
```

All custom geofence triggers must specify the following parameters

Parameter | Type | Required | Description
--------- | ------- |------- | -----------
location | Location | true | location
radiusMeters | Int | true | radius of geofence
customIdentifier | String | true | unique name for place

Type | Transitions | |
--------- | ------- |------- |
CustomGeofence | .whenEnters() | .whenExits()

### Caveats

- You can specify at most 1000 geofences to monitor
- Geofences must have a radius of at least 20m

## Trigger Build Result Definition:

```swift
let result = Trigger.whenEnters(.Home)
if let homeTrigger = result.trigger {
    NSLog("It worked!")
} else {
    for error in result.errors {
        NSLog("Error: \(error.type.message)")
    }
}
```
The Trigger class returns either the trigger or a list of errors. The properties are:

TriggerBuildResult Type | Name | Description
--------- | ------- |------- | -----------
SenseTrigger?|trigger|The final trigger when there are no errors.
[TriggerError]|errors|The errors that took place during the build.


# Recipes

The Recipe is the container that encases your trigger, and various other settings.  Recipes are registered globally within your application with a call to the [SenseSdk](#sensesdk).  Below are the inputs that make up a Recipe:

```swift
let recipe = Recipe(name: "My Recipe", trigger: someTrigger)
```

Parameter | Required | Default
--------- | -------  | --------
uniqueId (String)| true |
[trigger](#triggers) | true |
[window](#window)| false | 0-23 hours
[cool down](#cooldown) | false | 1 minute


## Window

A window specifies which hours of the day a trigger is allowed to fire.

```swift
// This will only allow a trigger to fire between the hours of 5pm and 10pm (in the users local time)
let recipe = Recipe(
  name: "My Recipe", 
  trigger: someTrigger,
  window: TimeWindow(fromHour: 17, toHour: 22))
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

Unit | Signature 
--------- | ------- |
Minutes|Cooldown.create(oncePer: 1, frequency: .Minutes)!
Hours|Cooldown.create(oncePer: 1, frequency: .Hours)!
Days|Cooldown.create(oncePer: 1, frequency: .Days)!


## Compound Triggers
```swift
let trigger = CompoundTriggerBuilder()
	.with(airportTrigger, and: homeTrigger)
	.build()
```
You have the ability to combine triggers to create a compound trigger:

In two of the examples above, both airportTrigger and homeTrigger were defined.  By then ANDing the two, you get a trigger that listens for when a user is at an airport AND 100+ kilometers from home (i.e. traveling):


# SenseSdk

The SenseSdk is the main entry point into the Sdk. It allows you to register and unregister recipes.

```swift
// Registering a recipe and delegate
let results = SenseSdk.register(recipe: myRecipe, delegate: myDelegate)
if results.successful {
  NSLog("recipe registration successful")
} else if let errors = results.errors {
    NSLog("Registration unsucessful, see errors below")
    for error in errors {
      NSLog("message: \(error.message)")
    }
}
```

Function | Parameters | Description
--------- | ------- |------- 
register | Recipe, TriggerFiredDelegate | Starts the recipe and registers the delegate to be called when the trigger fires.
unregister | Recipe | Stops and removes the recipe from SenseSdk.
findRecipe | String | Finds and returns a recipe by name.
getAllRecipes | | Returns all registered recipes.

## TriggerFiredDelegate

The TriggerFiredDelegate is a protocol that should be implemented by the class which will be notified when a trigger is fired.

```swift
class MyClass : TriggerFiredDelegate {
    func onTriggerFired(args: TriggerFiredArgs) {
        NSLog("\(places.count) places fired on \(timestamp), with a confidence level of: \(args.confidenceLevel)")
    }
}
```

Response Arg | Type | Description
--------- | ------- |------- 
timestamp | NSDate | Time the trigger fired
recipe | Recipe | The registered recipe that triggered
places | [Place] | The list of places that were entered or exited
confidenceLevel | ConfidenceLevel | The confidence that the action actually occurred.


## Confidence Levels

When a trigger is fired, it brings along one of three confidence levels.

1. High
2. Medium
3. Low

# Thanks for using Sense360

### *To sign up for a developer key, click the green link on the left side of this page!*