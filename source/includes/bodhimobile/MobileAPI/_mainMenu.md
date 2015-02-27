## Main Menu Module

This module used for working with application main menu. Developer can add and remove custom menu items from it.

### Tasks

  * `menuItem` object
  * `updateTitle` function
  * `addCustomItem` function
  * `removeCustomItem` function
  * `removeAllCustomItems` function
  * `showMenu` function
  * `bounceMenu` function
  * `mainMenu.customItemSelected` event

### Objects

#### menuItem

```javascript
var menuItem = {id: "1",  
        title: "Favorites",  
        icon: "http://server.com/path_to_icon"};
```

##### Discussion

This Object contains information about custom menu item.

##### Keys

  * `id` optional

The property with a String value. The identifier of the custom menu item.

  * `title` required

The property with a String value. The title of the custom menu item.

  * `icon` optional

The property with a String value. The icon URL of the custom menu item.

### Functions

#### updateTitle

```javascript
mainMenu.updateTitle( "Test Application", function () {  
    alert("Title updated");  
}, function (error) {  
    alert("code: " \+ error.code + "\nmessage: " \+ error.message);  
});
```

`mainMenu.updateTitle( title, successCallback, errorCallback )`

##### Discussion

Updates title for the items group in main menu.

##### Arguments

  * `title` required

A String Value. New title for the items group in main menu.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always null.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### addCustomItem

```javascript
var menuItem = {title: "Favorites", icon: "http://server.com/path_to_icon"};

mainMenu.addCustomItem( item, function(info) {  
    alert("Item added with id: "+info.item.id);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`mainMenu.addCustomItem( item, successCallback, errorCallback )`

##### Discussion

Adds new application custom item to the main menu.

##### Arguments

  * `item` required

`menuItem` object. Contains information about new custom menu item. If `id` is not specified it will be generated in application.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `item` \- The menuItem object. (Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### removeCustomItem

```javascript
var item = { id: "1" };  
mainMenu.removeCustomItem( item, function(info) {  
    alert("Item removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`mainMenu.removeCustomItem( item, successCallback, errorCallback )`

##### Discussion

Deletes exist item from the main menu.

##### Arguments

  * `item` required

`menuItem` object. Contains information about the custom menu item. Must contain `id`. Other fields ignored.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `item` \- The menuItem object. (Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### removeAllCustomItems

```javascript
mainMenu.removeAllCustomItem( function(info) {  
    alert("All Items removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`mainMenu.removeAllCustomItems( successCallback, errorCallback )`

##### Discussion

Deletes all items for the current application from the main menu.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### showMenu

```javascript
mainMenu.showMenu( function(info) {  
    alert("Menu showed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`mainMenu.showMenu( successCallback, errorCallback )`

##### Discussion

Opens the main menu.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### bounceMenu

```javascript
mainMenu.bounceMenu( function(info) {  
    alert("Menu bounced.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`mainMenu.bounceMenu( successCallback, errorCallback )`

##### Discussion

Bounces the main menu.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

### Events

#### mainMenu.customItemSelected

##### Discussion

Event received when user selected application custom item in the main menu.

##### Callback Arguments

  * `item` \- The `menuItem` object. (Object)