## C# Library

A .Net client library for the [Bandwidth Application Platform](http://bandwidth.com/products/application-platform?utm_medium=social&utm_source=github&utm_campaign=dtolb&utm_content=_)

The current version is v3.0, released ## August, 2016. Version 2.14 is available  [here](https://github.com/bandwidthcom/csharp-bandwidth/tree/v2.14).

[![github](images/github_logo.png)](https://github.com/bandwidthcom/csharp-bandwidth/tree/v3-preview)

[Full API Reference](http://bwdemos.com/csharp-bandwidth/html/R_Project_API.htm)

### Installing the SDK

`Bandwidth.Net` is available on Nuget (Nuget 3.0+ is required):

	Install-Package Bandwidth.Net

### Supported Versions
`Bandwidth.Net` should work on all levels of .Net Framework 4.5+.

| Version                           | Support Level |
|:----------------------------------|:--------------|
| <4.5                              | Unsupported   |
| 4.5                               | Supported     |
| 4.6                               | Supported     |
| .Net Core (netstandard1.6)        | Supported     |
| PCL (Profile111)                  | Supported     |
| Xamarin (IOS, Android, MonoTouch) | Supported     |


### Client initialization

All interaction with the API is done through a class `Client`. The `Client` constructor takes an next options:

| Argument    | Description           | Default value                       | Required |
|:------------|:----------------------|:------------------------------------|:---------|
| `userId`    | Your user ID          | none                                | Yes      |
| `apiToken`  | Your API token        | none                                | Yes      |
| `apiSecret` | Your API secret       | none                                | Yes      |
| `baseUrl`   | The Bandwidth API URL | `https://api.catapult.inetwork.com` | No       |

To initialize the `Client` instance, provide your API credentials which can be found on your account page in [the portal](https://catapult.inetwork.com/pages/catapult.jsf).

```csharp
using Bandwidth.Net;

var client = new Client(
	"YOUR_USER_ID", // <-- note, this is not the same as the username you used to login to the portal
	"YOUR_API_TOKEN",
	"YOUR_API_SECRET"
);
```

Your `client` object is now ready to use the API.

#### Lazy evalutions

This library uses lazy evalutions in next cases:
    - Object creation,
    - Get list of objects

#### Object Creation

When you create a bridge, call, message, etc. you will receive instance of `ILazyInstance<>` as result. It allow you to get `Id` of created object and created object on demand via property `Instance`.

```csharp
var application = await client.Application.CreateAsync(new CreateApplicationData {Name = "MyFirstApp"});

Console.WriteLine(application.Id); //will return Id of created application

Console.WriteLine(application.Instance.Name); //will make request to Catapult API to get application data

Console.WriteLine(application.Instance.Name); //will use cached application's data

```

#### Get list of objects

Executing of methods which returns collections of objects will not execute Catapult API request immediately. THis request will be executed only when you try enumerate items of the collection.

```csharp
var calls = client.Call.List(); // will not execute any requests to Catapult API here

foreach(var call in calls) // a request to Catapult API will be executed here
{
    Console.WriteLine(call.From);
}

// or

var list = calls.ToList(); // a request to Catapult API will be executed here

```

### Send a SMS

```csharp
var message = await client.Message.SendAsync(new MessageData {
	From = "+12345678901", // This must be a Bandwidth number on your account
	To   = "+12345678902",
	Text = "Hello world."
});
Console.WriteLine($"Message Id is {message.Id}");
```

### Make a call

```csharp
var call = await client.Call.CreateAsync(new CreateCallData {
	From = "+12345678901", // This must be a Bandwidth number on your account
	To   = "+12345678902"
});
Console.WriteLine($"Call Id is {call.Id}");
```
### Providing feedback

For current discussions on 3.0 please see the [3.0 issues section on GitHub](https://github.com/bandwidthcom/csharp-bandwidth/labels/3.0). To start a new topic on 3.0, please open an issue and use the `3.0` tag. Your feedback is greatly appreciated!
