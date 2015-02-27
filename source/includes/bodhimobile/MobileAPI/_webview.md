## Web View Module

This module contains methods for working with webview screens.

### Tasks

  * `present` function
  * `dismiss` function
  * `open` function
  * `close` function

### Functions

#### present

```javascript
webview.present( "http://www.google.com" );
```

`webview.present( url )`

##### Discussion

Shows new screen with webview over currently visible.  
Current screen in this case continues working.

Opened page must contains functionality for closing using dismiss method
because iOS don't have hardware back button.

##### Arguments

  * `url` required

A String Value. Url of page which will be opened.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### dismiss

```javascript
webview.dismiss( );
```

`webview.dismiss( )`

##### Discussion

Closes current page if it was opened with present method or from local
notification about iBeacons.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### open

```javascript
webview.open( "http://www.google.com" );
```

`webview.open( url )`

##### Discussion

Push new screen with webview after currently visible.

Opened page must contains functionality for closing using close method because
iOS don't have hardware back button.

##### Arguments

  * `url` required

A String Value. Url of page which will be opened.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### close

```javascript
webview.close( );
```

`webview.close( )`

##### Discussion

Closes current page if it was opened with open method.

##### Return Value

  * [RBCPromise](#kernel-promise) object