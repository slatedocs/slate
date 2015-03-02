## Globalization Module

Obtains information and performs operations specific to the user's locale and timezone.

### Tasks

  * `getPreferredLanguage` function
  * `getLocaleName` function
  * `dateToString` function
  * `stringToDate` function
  * `getDatePattern` function
  * `getDateNames` function
  * `isDayLightSavingsTime` function
  * `getFirstDayOfWeek` function
  * `numberToString` function
  * `stringToNumber` function
  * `getNumberPattern` function
  * `getCurrencyPattern` function

### Functions

#### getPreferredLanguage

```javascript
globalization.getPreferredLanguage( function(info) {  
    alert("language: " + info.value);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.getPreferredLanguage( successCallback, errorCallback )`

##### Discussion

Returns the language identifier string to the `succesCallback` with a properties object as a parameter. That object should have a value property with a String value.  

If there is an error getting the language, then the `errorCallback` executes.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getLocaleName

```javascript
globalization.getLocaleName( function(info) {  
    alert("locale: " + info.value);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.getLocaleName( successCallback, errorCallback )`

##### Discussion

Returns the locale identifier string to the `succesCallback` with a properties object as a parameter. That object should have a value property with a String value.  

If there is an error getting the locale, then the `errorCallback` executes.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### dateToString

```javascript
globalization.dateToString( new Date(), {formatLength:"short", selector:"date and time"},  
function(info) {  
    alert("date: " + info.value);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.dateToString( date, options, successCallback, errorCallback )`

##### Discussion

Returns the formatted date String via a value property accessible from the object passed as a parameter to the `succesCallback`.  

If there is an error formatting the date, then the `errorCallback` executes

##### Arguments

  * `date` required

Date. This parameter should be of type Date.

  * `options` optional

Object with key-value. Supported keys:

    * `formatLength`

Variants: short, medium, long, full

    * `selector`

Variants: date, time, date and time

  * `succesCallback` optional

Success callback. Called when function finished without errors

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### stringToDate

```javascript
globalization.stringToDate( "4/06/2014", {selector:"date"},  function(info) {  
    alert("month:" + info.month + " day:" + date.day + " year:" + date.year);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.stringToDate( dateString, options, successCallback, errorCallback )`

##### Discussion

Parses a date formatted as a string, according to the client's user preferences and calendar using the time zone of the client, and returns the corresponding date object.

##### Arguments

  * `dateString` required

Date. This parameter should be of type String.

  * `options` optional

Object with key-value. Supported keys:

    * `formatLength`

Variants: short, medium, long, full

    * `selector`

Variants: date, time, date and time

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `year` \- The four digit year. (Number)

    * `month` \- The month from (0-11). (Number)
    
    * `day` \- The day from (1-31). (Number)
    
    * `hour` \- The hour from (0-23). (Number)
    
    * `minute` \- The minute from (0-59). (Number)
    
    * `second` \- The second from (0-59). (Number)
    
    * `millisecond` \- The milliseconds (from 0-999), not available on all platforms. (Number)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getDatePattern

```javascript
globalization.getDatePattern( {formatLength:"short", selector:"date and time"},  
function(info) {  
    alert("pattern: " + info.pattern);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.getDatePattern( options, successCallback, errorCallback )`

##### Discussion

Returns a pattern string to format and parse dates according to the client's user preferences.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `formatLength`

Variants: short, medium, long, full

    * `selector`

Variants: date, time, date and time

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `pattern` \- The date and time pattern to format and parse dates. The patterns follow [Unicode Technical Standard #35](http://unicode.org/reports/tr35/tr35-4.html). (String)

    * `timezone` \- The abbreviated name of the time zone on the client. (String)
    
    * `utc`offset` \- The current difference in seconds between the client's time zone and coordinated universal time. (Number)
    
    * `dst`offset` \- The current daylight saving time offset in seconds between the client's non-daylight saving's time zone and the client's daylight saving's time zone. (Number)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getDateNames

```javascript
globalization.getDateNames( { type: "wide", item: "months" },  function(info) {  
    for (var i = 0; i < info.value.length; i++) {  
        alert("month: " + info.value[i]);  
    }  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.getDateNames( options, successCallback, errorCallback )`

##### Discussion

Returns an array of the names of the months or days of the week, depending on the client's user preferences and calendar.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `type`

Variants: narrow, wide

    * `item`

Variants: months, days

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `value` \- property with an Array of String values. The array features names starting from either the first month in the year or the first day of the week, depending on the option selected.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### isDayLightSavingsTime

```javascript
globalization.isDayLightSavingsTime( new Date(),  function(info) {  
    alert("dst: " + info.dst);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.isDayLightSavingsTime( date, successCallback, errorCallback )`

##### Discussion

Indicates whether daylight savings time is in effect for a given date using
the client's time zone and calendar.

##### Arguments

  * `date`required

Date. This parameter should be of type Date.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `dst` \- property with a Boolean value. A true value indicates that daylight savings time is in effect for the given date, and false indicates that it is not.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getFirstDayOfWeek

```javascript
globalization.getFirstDayOfWeek( function(info) {  
    alert("day: " + info.value);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.getFirstDayOfWeek( successCallback, errorCallback )`

##### Discussion

Returns the first day of the week according to the client's user preferences
and calendar.

##### Arguments

  * `succesCallback`optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `value` \- property with a Number value.

  * `errorCallback`optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### numberToString

```javascript
globalization.numberToString( 3.1415926, {type:"decimal"},  
function(info) {  
    alert("number:" + info.value);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.numberToString( number, options, successCallback, errorCallback )`

##### Discussion

Returns a number formatted as a string according to the client's user preferences.

##### Arguments

  * `number` required

  * `options` optional

Object with key-value. Supported keys:

    * `type`

Variants: decimal, percent, currency

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `value` \- property with a String value.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### stringToNumber

```javascript
globalization.stringToNumber( "3.1415926", {type:"decimal"},  
function(info) {  
    alert("number:" + info.value);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.stringToNumber( string, options, successCallback, errorCallback )`

##### Discussion

Parses a number formatted as a string according to the client's user
preferences and returns the corresponding number.

##### Arguments

  * `string` required

Number. This parameter should be of type String.

  * `options` optional

Object with key-value. Supported keys:

    * `type`

Variants: decimal, percent, currency

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `value` \- property with a Number value.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getNumberPattern

```javascript
globalization.getNumberPattern( {type:"decimal"}, function(info) {  
    alert("pattern: " + info.pattern + "\n" +  
        "symbol: " + info.symbol + "\n" +  
        "fraction: " + info.fraction + "\n" +  
        "rounding: " + info.rounding + "\n" +  
        "positive: " + info.positive + "\n" +  
        "negative: " + info.negative + "\n" +  
        "decimal: " + info.decimal + "\n" +  
        "grouping: " + info.grouping);},  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.getNumberPattern( options, successCallback, errorCallback )`

##### Discussion

Returns a pattern string to format and parse numbers according to the client's
user preferences.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `type`

Variants: decimal, percent, currency

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `pattern` \- The number pattern to format and parse numbers. The patterns follow [Unicode Technical Standard #35](http://unicode.org/reports/tr35/tr35-4.html). (String)

    * `symbol` \- The symbol to use when formatting and parsing, such as a percent or currency symbol. (String)
    
    * `fraction` \- The number of fractional digits to use when parsing and formatting numbers. (Number)
    
    * `rounding` \- The rounding increment to use when parsing and formatting. (Number)
    
    * `positive` \- The symbol to use for positive numbers when parsing and formatting. (String)
    
    * `negative` \- The symbol to use for negative numbers when parsing and formatting. (String)
    
    * `decimal` \- The decimal symbol to use for parsing and formatting. (String)
    
    * `grouping` \- The grouping symbol to use for parsing and formatting. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getCurrencyPattern

```javascript
globalization.getCurrencyPattern( "USD", function(info) {  
    alert("pattern: " + info.pattern + "\n" +  
        "code: " + info.code + "\n" +  
        "fraction: " + info.fraction + "\n" +  
        "rounding: " + info.rounding + "\n" +  
        "decimal: " + info.decimal + "\n" +  
        "grouping: " + info.grouping);},  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`globalization.getCurrencyPattern( currencyCode, successCallback,
errorCallback )`

##### Discussion

Returns a pattern string to format and parse currency values according to the
client's user preferences and ISO 4217 currency code.

##### Arguments

  * `currencyCode` required

The parameter should be a String of one of the ISO 4217 currency codes, for example 'USD'.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `pattern` \- The currency pattern to format and parse currency values. The patterns follow [Unicode Technical Standard #35](http://unicode.org/reports/tr35/tr35-4.html). (String)

    * `code` \- The ISO 4217 currency code for the pattern. (String)

    * `fraction` \- The number of fractional digits to use when parsing and formatting currency. (Number)

    * `rounding` \- The rounding increment to use when parsing and formatting. (Number)
    
    * `decimal` \- The decimal symbol to use for parsing and formatting. (String)
    
    * `grouping` \- The grouping symbol to use for parsing and formatting. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object