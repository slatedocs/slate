## How To

####Bodhi Cloud API Tutorials

##### Overview

These tutorials are designed to show a user how to log in, see all the users in a namespace, create a type, delete that type, and perform queries using the Bodhi Cloud APIs.  

##### Getting Started
*Prerequisites*: You will need your login credentials which are provided by your Hot Schedules representative.  

Logging in to the Bodhi API Documentation is the firs step in accessing and reviewing the Bodhi APIs as well as the various data types provided by default.  This set of tutorials are designed to show you how to login to the API Documentation, how to view, query and access the APIs and data types, and how to create new types.

The Bodhi Cloud API Documentation is a rich set of documentation geared towards REST API developers. The documetation is designed to both show the Bodhi's built-in types as well as shows your own custom types as well.  These simple tutorials are geared twoards showing how to use the documentation.  

##### How To

**How Do I Login to the Bodhi Cloud API Documentation?**

* Go to [https://api.bodhi.space/apidocs/index.html](https://api.bodhi.space/apidocs/index.html)
* Login using the credentials provided to you from your Hot Schedules Representative:

![CloudAPI_LogginIn](/images/CloudAPI_LoggingIn.png?raw=true "Logging in to the Bodhi API Documentation")

Logging in to the Bodhi API Documentation

*Note:* Once you are logged in with a valid username and password, you will see your Namespace auto-fill. 

**How to access users in your namespace**

Once Logged In to the Bodhi Cloud Documentation, you can test out the REST APIs directly in your Namespace.  This tutorial will show you how to acess the users in your namespace and see what access rights each user has.  In order to see all the users of your Namespace, you should be logged in as an administrator.  

The following steps will show allow you to see the users in your Namespace and see what profile each user is assigned:
* Pre-requistes: Ensure you have logged in to your Namespace, see How Do I Login to the Bodhi Cloud API Documentation (above)
* Scroll down to the User type 
![CloudAPI_ClickUser](/images/CloudAPI_ClickUser.png?raw=true "Scroll to User, Click User")

Scroll to User, Click User

* Scroll to /Users
* Click Get /Users to expose the REST APIs available for that type
![CloudAPI_ClickGetUsers](/images/CloudAPI_ClickGetUsers.png?raw=true "Click GET /User")

Scroll to User, Click User

* Click Try it out!
![CloudAPI_ClickGetUsersTryItOut](/images/CloudAPI_ClickUsersTryItOut.png?raw=true "Click Try it out!")

Click Try it out!

* Scroll through the JSON output and note various users assigned to your namespace NOTE: The same output can be obtained just for your login using the Me type and click Get /me, you will see all information about your username and access
* Each user will have similar JSON as noted below, depending on their access, they may or may not have a <namespace>.admin profile.

```
"params": [
      "User",
      {
        "sys_created_at": "2015-02-20T21:19:11+0000",
        "profiles": [
          "<your namespace>.admin",
          "base.user",
          "base.user__system"
        ],
        "authorizations": [
          {
            "namespace": "<your namespace>",
            "read": true
          }
        ],
        "usertype": "person",
        "sys_id": "6cae6b8a-acd9-4a15-874e-73e933cd51af",
        "password": "$2a$12$fLpPr1dWs5ULE1He5m1dwOy3wQK8q3yqWvo/VUvNo37l.ZP51pP..",
        "sys_version": 2,
        "sys_modified_at": "2015-02-20T21:19:11+0000",
        "sys_modified_by": "system",
        "sys_namespace": "system",
        "email": "<your email>",
        "sys_created_by": "system",
        "username": "<your username>",
        "sys_type_version": 2
```
