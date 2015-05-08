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

Sense360 allows you to quickly build functions around actions that your users take in the physical world. You can build triggers based on where a user is, what they are doing, or what is happening around them. **You can do all this in the background while your app is not in use.** Adding these real-world triggers to your app can take months if you try to achieve high accuracy, low battery drain, and maximum user privacy. We try to make this experience as quick and painless as possible.

# API Components

The following are the main components of building with Sense360

[Triggers](#triggers): The real-world event that you want to listen for (can be a place, action, or contextual element). Example triggers are “has arrived at airport”, “has exited work”, or “is 100 miles from home”

[Recipes](#recipes):  A collection of elements (including the Trigger) that defines **when** you want to listen for the trigger, and **what** you want to happen when the trigger is fired. Recipes gives you the flexibility to do whatever you want upon a Trigger event and are constructed of the following:

* **Name (required)**: A unique name amongst all recipes within your app.

* **Delegate (required)**: The data we pass to you when a trigger is fired.

* **Trigger (required)**: See above. 

* **Window (optional)**: The period of time during which you want to listen for the trigger.
  
* **Frequency Cap (optional)**: The maximum frequency with which you’d like a
specific trigger to fire.

# Quick Start

The fastest setup to get up and running.

```swift
import SenseSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SenseApiDelegate, SenseApiRestoreDelegate {
    // ...
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        SenseApi.apiKey = "your-api-key-here"
        
        // restore any previously running recipes
        SenseApi.restoreState(self)
        
        let recipe = buildRecipe()
        SenseApi.register(recipe: recipe, delegate: self)
        
        return true
    }
    
    func applicationWillTerminate(application: UIApplication) {
      // Save state before the application terminates
      SenseApi.saveState()
    }
    
    // Callback - when recipe can be re-started
    func recipeRestored(args: RecipeRestoreArgs) -> RecipeRestoreResult {
      if args.recipe.name == 'atSoccerFieldTrigger' {
          return RecipeRestoreResult(delegate: self)
        } else {
          return RecipeRestoreResult(delegate: nil)
        }
    }
    
    // Callback - when trigger is satisfied
    func onTriggerFired(args: TriggerFiredArgs) {
      NSLog("Triggered \(args.recipe.trigger.customIdentifier) at time \(args.timestamp)")
    }
    
    // Build Trigger and Recipe
    func buildRecipe -> Recipe {
      let atSoccerFieldTrigger = buildTrigger()
      
      return Recipe(trigger: atFieldTrigger, name: 'atSoccerFieldTrigger')
    }
    
    func buildTrigger() -> Trigger {
      let soccerFieldLocation : Location = Location(lat: 34.0274938, long: -118.3898094)
      let customPlaceField = CustomPlace(location: soccerFieldLocation, radiusMeters: 100, customIdentifier: "Soccer Field")
      
      return CustomPlaceTriggerBuilder()
              .set(places: customPlaceField)
              .hasEntered()
              .build()
    }
    // ...
}
```

### Scenario

The following example shows how to setup to be notified when a user enters within 100m of the latitude/longitude point of 34.0274938,-118.3898094.

<br><br>

### Setup
1. Add SenseSdk import
2. Register with `SenseApi` with API key in `didFinishLaunchingWithOptions` method.
3. Restore state of any previously running triggers when application starts back up. (Will happen if application was terminated)
4. Register any new recipes. (In most situations this would be done elsewhere)
5. Save state when the application will be terminated in `applicationWillTerminate` method.

<br><br><br><br><br><br><br>

###Implement Callbacks

1. Implement `SenseApiRestoreDelegate` in `UIApplicationDelegate` to receive callback when trigger is restored. Attach delegate for trigger.
2. Implement `SenseApiDelegate` in `UIApplicationDelegate` to receive callback when trigger is satisfied.


<br><br><br><br><br><br><br>

### [Define Trigger](#triggers)

A trigger defines a place you care about.

1. Define a location.
2. Give location a radius and name.
3. Define an action type.

### [Define Recipe](#recipes)

A recipe defines the when (Trigger) and to notify your application of an event (delegate).

1. Define a trigger.
2. Provide a unique name.

# Triggers

<aside class="notice"> IMPORTANT: A trigger on its own does nothing. You must build your triggers, and then add it to a Recipe in order to utilize the trigger. 
</aside>

Triggers define the real-world events you want to listen for, and you must first build the Trigger. 

### TriggerBuilders

There are 3 types of TriggerBuilders that correspond to 3 place types:

TriggerBuilder Type | Signature | Description
--------- | ------- |------- | -----------
[Business Place](#business-place) | BusinessCategoryTriggerBuilder() | Business Categories (like *restaurant* or *shopping mall*)
[Personal Place](#personal-place) | PersonalizedTriggerBuilder() | User-specific locations (like *home* or *work*)geofences
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
<aside class="notice"> This type of trigger is custom built on a user by user basis and will only go live one week after a user has joined your service. 

Due to the sensitivity of this data, neither developers nor us will ever see the raw data or store a users home or office location. The computation happens on the device itself and stays there to ensure your users privacy.
</aside>

A personalized location trigger allows you to listen and fire off user-unique locations, such as user home and user office. 

The currently supported personalized location categories are:

Category | Signature | Supported Action Types
--------- | ------- |------- | -----------
Home | .set(place: PersonalizedPlaceType.Home) | hasEntered(), hasExited(), fartherThan()
Work | .set(place: PersonalizedPlaceType.Work) | hasEntered(), hasExited(), fartherThan()

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


<aside class="warning"> You can have no more than [150] custom places included in a single trigger.
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
let recipe = Recipe(name: "My Recipe", trigger: someTrigger)
```
The Recipe is the container that encases your trigger, and various other settings.  Recipes are registered globally within your application with a call to the [SenseApi](#senseapi).  Below are the inputs that make up a Recipe:

Parameter | Required
--------- | ------- 
name | true |
[trigger](#triggers) | true 
[window](#window)| false 
[frequency cap](#frequency-cap) | false 


## Window

Only allow triggers to fire between certain times.

This example would have the trigger only fire between 5:30pm (user’s timezone) to 10:00pm:

`TimeWindow(fromHour: 17, toHour: 22)`

## Frequency Cap

The maximum frequency with which a trigger can fire.

This would allow the trigger to fire only once every 2 days. 

`FrequencyCap(oncePer: 2, timeUnit: FrequencyTimeUnit.Days)`

<aside class="warning">
Frequency can only be set in days.
</aside>



# SenseApi

The SenseApi is the repository that stores all active Recipes within your application:

## Sense Api Functions
```swift
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
saveState | | persists the state of the sdk
restoreState | restoreDelegate | restores the state of the sdk

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


<aside class="notice">
  Currently, a confidence level of Low does not trigger the firing of a trigger.
</aside>


## Save and restoring state
```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  SenseApi.restoreState(restoreDelegate: self)
}

func applicationWillTerminate(application: UIApplication) {
  SenseApi.saveState()
}

func recipeRestored(args: RecipeRestoreArgs) -> RecipeRestoreResult {
  if(args.recipe.name == "Recipe #1") {
    return RecipeRestoreResult(delegate: recipeNumberOneDelegate)
  }
  else if(args.recipe.name == "Recipe #2") {
    return RecipeRestoreResult(delegate: recipeNumberTwoDelegate)
  }
}
```
Your application will not always be running, but you probably want your triggers to.  In order to accomplish this, the SenseApi provides methods that persist your recipes and the state of your triggers when your application is not running.  Since the SenseApiDelegate is not set within the recipe, it is your job to match each your recipes with the correct delegate.  This is done by implementing the SenseApiRestoreDelegate protocol.