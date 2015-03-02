## Contacts Module

This module provides the access to contacts list from address book. Developer can receive contacts, create, update and delete contact item.

### Tasks

  * `contactField` object
  * `contactAddress` object
  * `contactName` object
  * `contactInfo` object
  * `find` function
  * `findById` function
  * `create` function
  * `update` function
  * `delete` function

### Objects

#### contactField

##### Discussion

This object contains information about the field of contact, such as phone number or email.

##### Keys

  * `type` required

A String value. The type of field.

  * `value` required

A String value. The value of field.

#### contactAddress

##### Discussion

This Object contains information about the address record of contact.

#### Keys

  * `type` required

A String value. The type of address.

  * `formatted` optional

A String value. Formatted address.

  * `streetAddress` optional

A String value. The street name.

  * `locality` optional

A String value. The city name.

  * `region` optional

A String value. The region.

  * `postalCode` optional

A String value. The postal code.

  * `country` optional

A String value. The country.

#### contactName

##### Discussion

This Object contains information about the name of contact.

#### Keys

  * `formatted` required

A String value. Formatted dispay name.

  * `familyName` optional

A String value. The last name.

  * `givenName` optional

A String value. The first name.

  * `middleName` optional

A String value. The middle name.

  * `honorificPrefix` optional

A String value. The prefix ("Sir" "Duke" "General").

  * `honorificSuffix` optional

A String value. The suffix ("Jr." "Sr." "III").

#### contactInfo

##### Discussion

This Object contains information about the contact item.

##### Keys

  * `id` required

A String value. The identifier of contact.

  * `raw_id` optional

A String value. Optional identifier of contact. Used in Android.

  * `displayName` required

A String value. Formatted dispay name.

  * `name` required

A `contactName` object. Contains full information about the contact's name.

  * `nickname` optional

A String value. The nickname of contact.

  * `phoneNumbers` optional

Array of `contactField` objects. The list of phone numbers.

  * `emails` optional

Array of `contactField` objects. The list of emails.

  * `addresses` optional

Array of `contactAddress` objects. The list of addresses associated with contact.

  * `birthday` optional

A Date value. The birthday of contact.

### Functions

#### find

```javascript
contacts.find( {}, function(info) {  
    alert("Contacts count: "+info.contacts.length);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`contacts.find( options, successCallback, errorCallback )`

##### Discussion

Returns a list of contacts.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `filter`

A String value. If a filter is specified, then return only contacts with a
name containing the string. By default this property is **null**

    * `limit`

An Interger value. If limit is specified, the return only "limit" contacts. By
default this property is **null**.

    * `offset`

An Interger value. If offset is specified, the return contacts with index
started from "offset". By default this property is **null**.

    * `getTotalCount`

A Boolean value. Returns total count of contacts with specified `filter`. By
default this property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `contacts` \- The list of `contactInfo` objects. (Array of Object)

    * `totalCount` \- The total count of contacts. Returns only if `getTotalCount` is **true** (Boolean)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### findById

```javascript
contacts.findById( "32", function(info) {  
    alert("Found contacts count: "+info.contacts.length);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`contacts.findById( contactId, successCallback, errorCallback )`

##### Discussion

Returns the contact with specified id.

##### Arguments

  * `contactId` required

A String value. The identifier of contact.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `contacts` \- The list of `contactInfo` objects with one element. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### create

```javascript
var contact = {  
  name: {  
    givenName: "Test",  
    familyName: "User"
  },
  emails: [{  
    type: "Work",  
    value: "test@test.com"
  }]
};

contacts.create( contact, function(info) {  
    alert("Contact added with id: "+info.contacts[0].id);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`contacts.create( contact, successCallback, errorCallback )`

##### Discussion

Adds new contact to address book.

##### Arguments

  * `contact` required

contactInfo object. Contains information about new contact.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `contacts` \- The list of `contactInfo` objects with one element. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### update

```javascript
var contact = {  
  id: "35",  
  name: {  
    givenName: "Test1",  
    familyName: "User1"
  },  
  emails: [{  
    type: "Work",  
    value: "test1@test.com"
  }]
};

contacts.update( contact, function(info) {  
    alert("Contact information updated.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`contacts.update( contact, successCallback, errorCallback )`

##### Discussion

Updates information for exist contact in address book.

##### Arguments

  * `contact` required

A `contactInfo` object. Contains updated information for contact. Must contain id and raw_id (if exist).

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### delete

```javascript
var contact = { id: "35" };

contacts.delete( contact, function(info) {  
    alert("Contact removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`contacts.delete( contact, successCallback, errorCallback )`

##### Discussion

Deletes exist contact from address book.

##### Arguments

  * `contact` required

A `contactInfo` object. Contains information for contact. Must contain id and raw_id (if exist). Other fields ignored.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object