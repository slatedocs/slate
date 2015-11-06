# Authentication

Every request to the API must be an authenticated request.  When you join the Yoyo Wallet platform you will be given an access_key and a secret_key.  These keys are used to authenticate your requests to the platform.

Requests to the platform API are authenticated using basic auth.

To authenticate a request, send an “AUTHORIZATION” header of form:

Basic base64({ACCESS_KEY}:{SECRET_KEY})

`Authorization: <base64 encoded {ACCESS_KEY}:{SECRET_KEY}>`

<aside class="notice">
You must replace <code>{ACCESS_KEY}_{SECRET_KEY}</code> with your real API credentials.
</aside>

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request

curl 'https://api.yoyoplayground.net/v1/accounts/{ACCOUNT_ID}' \
  -u {ACCESS_KEY}:{SECRET_KEY}
```

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {

  Yoyo.APIKey = "YOUR_API_KEY"
  Yoyo.APISecret = "YOUR_API_SECRET"
  Yoyo.accountID = "YOUR_ACCOUNT_ID"

  return true
}
```


```java
  // Initialise the SDK in your Application#onCreate()
  @Override
	public void onCreate() {
		super.onCreate();
		Yoyo.with(this,  new YoyoAuthConfig(getString(R.string.yoyo_key), getString(R.string.yoyo_secret)));
  }

  // In your AndroidManifest
  <meta-data
    	android:name="com.yoyowallet.yoyo.AccountId"
    	android:value="@string/yoyo_account_id" />
```

> Make sure to replace `{ACCESS_KEY}` and `{SECRET_KEY}` with your real API credentials.
