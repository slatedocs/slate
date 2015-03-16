How Do I Create A New Type 
========
### Overview 
The Bodhi Cloud API is extensible meaning that if you find you need to store your data in a way that the Bodhi APIs do not provide, you can create as many new types as per your requirements and needs.  Bodhi's base and systems types can also be changed and extended depending on your requirements and needs.  These are powerful features with a rich tool set to easily add or extend types for your namespace.  


### Getting Started
The goal of this tutorial is to show how to use the 4 Methods/Tools that Bodhi provides to extend your namespace to store your data in ways that fit your business needs.  

#### Prerequisites
In order to be able to complete this tutorial for all 4 tools, you will need to be an admin user of your namespace which is provided by your Hot Schedules representative.  You  will be given your credentials (username and password) which is assigned to a particular namespace which is where you will make the changes to the Hot Schedules types.  Please login to each of the tools prior to starting the section.


### How To Create a new type using Bodhi API Documentation
The Bodhi API Documentation is a full featured interactive set of documentation that also allows the user to Create, Update, and Delete using the REST APIs for each type.  This tutorial is intended to both allow the user to get familiar with how the Bodhi API Documentation as well as the minimum requirements to create a type, view that type through the Bodhi API Documentation and finally delete that type through the Bodhi API Documentation.  

1.Go to [https://api.bodhi.space/apidocs/index.html](https://api.bodhi.space/apidocs/index.html)

2.Login using the credentials provided to you from your Hot Schedules Representative and click Explore.  *NOTE:* See [How Do I login to the Bodhi Cloud API Documentation](http://docs.bodhi.space/#bodhi-cloud-api-tutorials) for more details on logging in.

3.Onced logged in, scroll down through the apidocs and click on Type: 

![CloudAPI_ClickType](/images/CloudAPI_ClickType.png?raw=true "")

_Creating a new type, Click Type_

4.Click Post /resource/Types:

![CloudAPI_ClickPost](/images/CloudAPI_ClickPost.png?raw=true "") 

_Creating a new type, Click Post_

5.Click inside the Model Schema box and it will automatically populate the Value box:

![CloudAPI_ClickModelSchema](/images/CloudAPI_ClickModelSchema.png?raw=true "")

_Creating a new type, Click Model Schema box_


6.Click the Model to show all the parameters to this API and remove all the optional parameters.  

![CloudAPI_ClickPost](/images/CloudAPI_ClickModel.png?raw=true "")

_Creating a new type, Click Model_

```
Type {
embedded (boolean, optional),
regex (string, optional),
package (string, optional),
name (string),
indexes (object, optional),
documentation (Array[Link, optional),
interface (object, optional),
immutable (boolean, optional),
version (string),
properties (object),
extensible (boolean, optional),
views (object, optional),
metadata (boolean, optional),
storage_name (string),
extension_types (object, optional),
events (object, optional),
encapsulated (boolean, optional),
namespace (string)
}
```

7.This will leave you with the following:

```
{
  "name": "<some random string>",
  "version": "<some random string>",
  "properties": null,
  "storage_name": "<some random string>",
  "namespace": "<some random string>"
}
```
8.Change the Random String as follows:

```
{
  "name": "MyNewType",
  "version": "0.1",
  "properties": {},
  "storage_name": "NewNewType",
  "namespace": "<Your Namespace>"
}
```
_Note: Your Namespace is the name of the namespace that your HotSchedules representative provided you and autofills when you Login to the [Bodhi Cloud API docs](https://api.bodhi.space/apidocs/index.html)

![CloudAPI_ClickPost](/images/CloudAPI_NamespaceAutofills.png?raw=true "")

_Creating a new type, Namespace Auto Fills_

9.Once you have the new type defined as you want it by adding attributes to the json object of the properties.  For this tutorial, I am going add the following properties/attribute to the MyNewType Object:


```
{
  "name": "MyNewType",
  "version": "0.1",
  "properties": {},
  "storage_name": "NewNewType",
  "namespace": "<Your Namespace>"
}
or 
{
  "name": "MyNewType",
  "properties": {
      "store_id": {
         "type": "String",
         "isNotBlank": true,
         "trim": true
      },
      "employment_period": {
          "type": "DatePeriod"
       },
      "store_number":{
           "type": "Integer"
      },
   },
  "storage_name": "MyNewType",
  "namespace": "<Your Namespace>"
}
```
_NOTE: Make sure you replace Your Namespace and the brackets before clicking Try it out!_

10.Click Try it out!
Once you have the properties object as you want it with it's JSON attributes and properties, yhou can click Try it out!  This will actually create the new type and you can add data to it immediately.

![CloudAPI_ClickTypePostTryitout](/images/CloudAPI_ClickTypePostTryitout.png?raw=true "")

_Creating a new type, Click Try it out!_

You should see a Response Code 201 like this:
![CloudAPI_ResponseCode201](/images/CloudAPI_ResponseCode201.png?raw=true "")

_Creating a new type, Response Code 201_

11.Click on your new type
Types are stored alphabetically in the Cloud API Documentation so if you scroll up or down from Type, you will see your new type show up in the Cloud API Documentation and you can then post data to your new type, modify by doing a Put operations or any other rest api function you wish to use.

![CloudAPI_ClickMyNewType](/images/CloudAPI_ClickMyNewType.png?raw=true "")

_Creating a new type, Click MyNewType_
