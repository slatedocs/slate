## Navigation Bar Module

The module is used to Navigation Bar control.  
Developer can showing or hiding Navigation Bar, changing title and right navigation bar item.

### Tasks

  * `show` function
  * `hide` function
  * `setTitle` function
  * `setRightButton` function
  * `navigationBar.rightButtonPressed` event

### Functions

#### show

```javascript
navigationBar.show( {fixed: true}, function(info) {  
    alert("Navigation Bar will be shown");  
}, function (error) {  
    alert("show failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`navigationBar.show( options, successCallback, errorCallback )`

##### Discussion

Shows the Navigation Bar.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `fixed`

A Boolean value. If this flag is set to true then Navigation Bar will be shown and will not disappear due to the actions of the user (swiping or scrolling to up).

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### hide

```javascript
navigationBar.show( {fixed: true}, function(info) {  
    alert("Navigation Bar will be hidden");  
}, function (error) {  
    alert("hide failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`navigationBar.hide( options, successCallback, errorCallback )`

##### Discussion

Hides the Navigation Bar.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `fixed`

A Boolean value. If this flag is set to true then Navigation Bar will be
hidden and will not appear due to the actions of the user (swiping or
scrolling to up).

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### setTitle

```javascript
navigationBar.setTitle( {loading:true, title:"Loading..."}, function(info) {  
    alert("Navigation Title updated.");  
}, function (error) {  
    alert("setTitle failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`navigationBar.setTitle( options, successCallback, errorCallback )`

##### Discussion

Replaces default Navigation Bar Title to specified.  

Can showing loading indicator.  

If `options` not selected set default title.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `title`

A String value. String with title.

    * `loading`

A Boolean value. If this flag is set to true then application will add loading
indicator to the navigation bar.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### setRightButton

```javascript
navigationBar.setRightButton( {title:"Cancel"}, function(info) {  
    alert("Button updated");  
}, function (error) {  
    alert("Failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`navigationBar.setRightButton( options, successCallback, errorCallback )`

##### Discussion

Sets the Navigation Bar right button.  
Can showing loading indicator.  
If no `options` are specified removes the right button.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `title`

A String value. String with button title.

    * `icon`

A String value. String with url of icon.

    * `loading`

A Boolean value. If this flag is set to true then application will show
loading indicator in the space of right button.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

### Events

#### navigationBar.rightButtonPressed

##### Discussion

Event received when user pressed to the right navigation bar button.

##### Callback Arguments

  * No arguments