## Navigation Bar Module

The module is used to Navigation Bar control.  
Developer can showing or hiding Navigation Bar, changing title and right navigation bar item.

### Tasks

  * `show` function
  * `hide` function
  * `setTitle` function
  * `setLeftButton` function
  * `setRightButton` function
  * `setTheme` function
  * `navigationBar.leftButtonPressed` event
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

  * [BodhiMobilePromise](#kernel-promise) object

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

  * [BodhiMobilePromise](#kernel-promise) object

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

  * [BodhiMobilePromise](#kernel-promise) object

#### setLeftButton

```javascript
navigationBar.setLeftButton( {title:"Cancel"}, function(info) {  
    alert("Button updated");  
}, function (error) {  
    alert("Failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`navigationBar.setLeftButton( options, successCallback, errorCallback )`

##### Discussion

Sets the Navigation Bar left button.  
Can showing loading indicator.  
If no `options` are specified removes the left button.

For Android only icon supported for left button (title and loading has no effect)

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

  * [BodhiMobilePromise](#kernel-promise) object

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

  * [BodhiMobilePromise](#kernel-promise) object

#### setTheme

```javascript
	var options = {};

    var bgColor = '#ffffff';

    if (bgColor != "") {

        if (bgColor.indexOf('#') == 0)
            bgColor = bgColor.substring(1);

        var bigint = parseInt(bgColor, 16);

        options.color = {
            r: ((bigint >> 16) & 255),
            g: ((bigint >> 8) & 255),
            b: (bigint & 255)
        }

    }

    var tintColor = '#000000';

    if (tintColor != "") {

        if (tintColor.indexOf('#') == 0)
            tintColor = tintColor.substring(1);

        var bigint = parseInt(tintColor, 16);

        options.tintColor = {
            r: ((bigint >> 16) & 255),
            g: ((bigint >> 8) & 255),
            b: (bigint & 255)
        }

    }

    var logoUrl = 'http://mydomain.com/logo.png';

    if (logoUrl != "") {
        options.logoUrl = logoUrl;
    }

    navigationBar.setTheme(options).fail(handleError);
```

`navigationBar.setTheme( options, successCallback, errorCallback )`

##### Discussion

Sets the Navigation Bar theme.  
If no `options` are specified theme values are set to default.

##### Arguments

  * `options`

Object with key-value. Supported keys:

  * `color` optional

A String value. String with background color.

  * `tintColor` optional

A String value. String with color for text and button icons.

  * `logoUrl`  optional

A String value. String with url for logo image.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object
  

### Events

#### navigationBar.leftButtonPressed

##### Discussion

Event received when user pressed to the left navigation bar button.

##### Callback Arguments

  * No arguments

#### navigationBar.rightButtonPressed

##### Discussion

Event received when user pressed to the right navigation bar button.

##### Callback Arguments

  * No arguments