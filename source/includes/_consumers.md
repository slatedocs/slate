# Consumer API

The Consumer API is a RESTful API which uses JSON formatted data for its requests and responses. It used by mobile device applications to communicate with the Yoyo Wallet platform.

##Authentication

As a mobile app developer your app users will need to have a Yoyo Wallet consumer account.  

Consumer registration and authentication follow the same process.  This is a two factor authentication process to verify you are the owner of the mobile phone.

### 1. Request a passcode

First you must request a passcode.  The passcode is a unique 5 digit number that will be sent to your mobile device.


> You POST a request to the API containing the consumers phone number and email address.

```json
{
	"email": "tommy.tester@example.com",
	"phone": "441234567890"
}
```

```shell
curl 'https://api.yoyoplayground.net/v1/consumer-passcodes' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  --data-binary $'{"email": "tommy.tester@example.com", "phone": "441234567890"}'
```

```swift
import UIKit
import Yoyo

class ViewController: UIViewController, LoginViewControllerDelegate {

	func login() {
		let loginViewController = Yoyo.loginViewController
		loginViewController.loginDelegate = self
		presentViewController(loginViewController, animated: true, completion: nil)
	}

	// MARK: LoginViewControllerDelegate
	func loginViewController(loginViewController: LoginViewController, didFinishWithResult result: LoginResult) {
		dismissViewControllerAnimated(true, completion: nil)

		switch result {
		case .Success:
			print("Logged in successfully")
		case .Failed:
			print("Something went wrong")
		case .Cancelled:
			print("User cancelled Login")
		}
	}
}
```

```java
// Use our YoyoLoginActivity and LoginManager classes to handle registration and login
// First add the activity to your AndroidManifest
<activity	android:name="com.yoyowallet.yoyo.login.YoyoLoginActivity" />

public class MyActivity extends Activity implements YoyoCallback<SessionData>{

	// When you want to start the login process call:
	private void login(){
		Intent intent = YoyoLoginActivity.createLoginActivityIntent(mContext);
		startActivityForResult(intent, LoginManager.REQUEST_CODE);
	}

	// In order to handle callbacks, you need the following
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		LoginManager.register(this);
	}

	@Override
	protected void onDestroy() {
		LoginManager.unregister(this);
		super.onDestroy();
	}

	@Override
	public void onSuccess(SessionData sessiondata) {
		// The user has successfully logged in
	}

	@Override
	public void onCancel() {
		// user has closed the login activity
	}

	@Override
	public void onError(YoyoException exception, SessionData noData) {
 		// an error occurred -> you may display an error
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		LoginManager.onActivityResult(requestCode, resultCode, data);
	}
}
```

> The above command returns JSON structured like this. The "id" field is your passcode "id":

```json
{
  "data": {
   "id": "dc05a248-8172-11e5-aa5b-0abe262b2ce9",
   "phone": "441234567890",
   "account_id": "$account_id",
   "email": "tommy.tester@example.com",
   "expires_at": "2015-11-02 15:33:22.227997813 +0000 UTC"
  },
  "metadata": {}
 }
```


`POST https://api.yoyoplayground/v1/consumer-passcodes`


This request will either create a new consumer account on the Yoyo Wallet platform, or allow an existing consumer to authenticate.

#### Request Data

Parameter | Type |Description
--------- |  ---- |-----------
email | string |Consumer's email address (optional)
phone | string | Consumer's mobile phone number


If the request contains a valid email address and phone number an SMS message will be sent the the user to help authenticate them.

The response returned contains a "id" field.  This is the identifier of your "passcode" which will be used in your 2 factor authentication request.

#### Response Data

Parameter | Type |Description
--------- | ---- | -----------
id | string | passcode id
phone | string | Consumer's mobile phone number
account_id | string | This is your Yoyo Wallet account Id
email | string | Consumer's email address
expires_at | string | This is the time the passcode will expire. Normally passcodes are valid for 30 minutes.



### 2. Create consumer session (verify passcode)

Once you have received an SMS message with your passcode you can perform the second API call to create a consumer session.

> You POST a request to the API verifying the passcode and generating a session token.

```json
{
  "device_id": "e73e3d3b-a95d-4d3c-b9ee-de5492540582+a0b11fa0-57f9-43fc-a541-f868994cf7bb",
  "device_timestamp": 1446368400,
  "passcode_code": "18442",
  "passcode_id": "dc05a248-8172-11e5-aa5b-0abe262b2ce9"
}
```

```shell
curl 'https://api.yoyoplayground.net/v1/consumer-sessions' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  --data-binary $'{"device_id": "e73e3d3b-a95d-4d3c-b9ee-de5492540582+a0b11fa0-57f9-43fc-a541-f868994cf7bb", \
  "device_timestamp": 1446368400, \
  "passcode_code": "18442", \
  "passcode_id": "dc05a248-8172-11e5-aa5b-0abe262b2ce9"}'
```

```swift
	iOS SDK Code TBD
```

> The above command returns JSON structured like this. The "id" field is your passcode "id":

```json

  "data": {
   "consumer_id": "9ae50d73-3bb4-4b55-b258-f93f4f027fb9",
   "otp_seed": "N2U3MmQ4Y2Q3YmE4NGQ4MDg2OTAzYzNhZGMzYmIxMGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
   "token": "296be3889bdf40d9bb9570ff4bf2660f",
   "barcode_token": "144648288416"
  },
  "metadata": {}
 }
```


`POST https://api.yoyoplayground/v1/consumer-sessions`

#### Request Data

Parameter | Type |Description
--------- | ---- | -----------
device_id | string |unique identfier for your mobile device
device_timestamp | int64 | current time on your device as a unix timestamp
passcode_code | string | the value from the SMS message sent to your device
passcode_id | string | the id of the passcode response in the previous request


#### Response Data

Parameter | Type | Description
--------- | ---- | -----------
consumer_id | string | unique identfier for the consumer
otp_seed | string | seed value needed to calculate the one-time-password
token | string | the session token to represent the consumer
barcode_token | string | embedded in a barcode to identify a session.


### 3. Using the consumer's session token

Once you have a valid sesion token you will need to include it in all subsequent requests to interact as that consumer.
Sessions tokens are passed to the API in an HTTP header called 'HTTP_YOYO_TOKEN'

If you make a request without a valid access token your request will be rejected.

```json
{
  "message": "No session found with token xxx",
  "description": "",
  "errors": []
}
```

## Wallet

### Adding a card

> You POST a request to the API containing the consumers card details.

```json
{
	"bin": "123456",
	"number": "123456789012345678",
	"exp_month": 12,
	"exp_year": 2018,
	"cvv": 999,
	"postcode": "N1 7ER"
}
```

```shell
curl 'https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/cards/' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  --data-binary $'{	"bin": "123456", "number": "123456789012345678", "exp_month": 12, "exp_year": 2018, "cvv": 999, "postcode": "N1 7ER" }'
```

```swift
	iOS SDK Code TBD
```

```java
// Use our YoyoAddCardActivity and CardManager classes to handle registration and login
// First add the activity to your AndroidManifest
<activity	android:name="com.yoyowallet.yoyo.login.YoyoAddCardActivity" />

public class MyActivity extends Activity implements YoyoCallback<SessionData>{

	// When you want to start the add card process call:
	private void addCard(){
		Intent intent = YoyoAddCardActivity.createAddCardActivityIntent(MainActivity.this);
		startActivityForResult(intent, CardManager.REQUEST_CODE);
	}

	// In order to handle callbacks, you need the following
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		CardManager.register(this);
	}

	@Override
	protected void onDestroy() {
		CardManager.unregister(this);
		super.onDestroy();
	}

	@Override
	public void onSuccess(Card card) {
		// The user has successfully added the provided card to their account
	}

	@Override
	public void onCancel() {
		// user has closed the addCard activity
	}

	@Override
	public void onError(YoyoException exception, Card noData) {
 		// an error occurred -> you may display an error
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		CardManager.onActivityResult(requestCode, resultCode, data);
	}
}
```

<aside class="warning">
Note - in our playground environment we are connected to the Stripe sandbox, so make sure you use <a href='https://stripe.com/docs/testing'>Stripe's test card numbers</a>
</aside>

> The above command returns JSON structured like this. The "id" field is your card "id":

```json
{
  "data": {
    "id": "14ab0c2f-b998-4845-815c-ee6328a73ab3",
    "active": true,
    "brand": "Visa",
    "exp_month": 12,
    "exp_year": 2018,
    "is_default": true,
    "last4": "5678",
    "postcode": "N1 7ER"
  },
  "metadata": {}
}
```

`POST https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/cards/`

#### Request Data

Parameter | Type | Description
--------- | ----|  -----------
bin | string | Bank identification number (first 6 digits of card number)
number | string | credit card number
exp_month | integer | expiry month MM
exp_year | integer | expiry year CCYY
cvv | integer | 3 digit card verification value
postcode | string | post code that card is registered at

If the card is successfully added to the consumers wallet you will receive a response like below.

#### Response Data

Parameter | Type | Description
--------- | ---- | -----------
id | string | unique identifier for card
active | boolean | card is active
brand | string | type of card eg. Visa, Mastercard, Amex etc.
exp_month | integer | expiry month MM
exp_year | integer | expiry year CCYY
is_default | boolean | card is default one to use in wallet
last4 | string | last 4 digits of card number
postcode | string | post code that card is registered at

### Removing a card

To delete a card from your wallet, simply send a DELETE request identifying your card, using the consumer's session token.

> You DELETE a request to the API to remove a card

```shell
curl 'https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/cards/' \
  -X "DELETE" \
  -u {ACCESS_KEY}:{SECRET_KEY}  \
  -H 'HTTP_YOYO_TOKEN: {TOKEN}'
```

```swift
	iOS SDK Code TBD
```

```java
	Android SDK Code TBD
```

`DELETE https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/cards/{CARD_ID}`


### Viewing cards


> You GET a request to the API to retrieve your wallet details.


```shell
curl 'https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/cards' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Accept: application/json' \
  -H 'HTTP_YOYO_TOKEN: {TOKEN}'
```

```swift
	iOS SDK Code TBD
```

```java
CardManager.getCards(new YoyoCallback<Cards>() {
	@Override
	public void onError(YoyoException exception, Cards cachedCards) {
			// An error occurred, cached cards will be returned, if any
	}

	@Override
	public void onCancel() {
			// The user backed out of adding a card
	}

	@Override
	public void onSuccess(Cards cards) {
			// Display cards
	}
})
```

> The above command returns JSON structured like this. The "id" field is your passcode "id":

```json
{
  "data": [
  {
    "id": "14ab0c2f-b998-4845-815c-ee6328a73ab3",
    "active": true,
    "brand": "Visa",
    "exp_month": 12,
    "exp_year": 2018,
    "is_default": true,
    "last4": "5678",
    "postcode": "N1 7ER"
  },
    {
    "id": "85960a0f-0ac2-480d-9188-7d5389b5a82c",
    "active": true,
    "brand": "Amex",
    "exp_month": 3,
    "exp_year": 2017,
    "is_default": false,
    "last4": "1234",
    "postcode": "N1 7ER"
  },
  ],
  "metadata": {}
}
```

`GET https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/cards`

#### Request Data

Parameter | Type |Description
--------- | ---- | -----------
consumer_id | string | unique identifer of the consumer


#### Response Data

Same response format as adding a card.

## OTP

```shell
OTP generation is not available via an API call
```

```swift

@IBOutlet var barcodeView: BarcodeView! {
	didSet {
		barcodeView.session = Yoyo.session
	}
}
```

```java
// Add a BarcodeView to your layout
<com.yoyowallet.yoyo.views.BarcodeView
	android:id="@+id/barcode_view"
	android:layout_width="300dp"
	android:layout_height="300dp"/>

BarcodeView  barcodeView = (BarcodeView) findViewById(R.id.barcode_view);
barcodeView.showBarcodePayment();

// If your barcode view is used to display vouchers
barcodeView.showBarcodeVoucher(voucher);
```

An OTP is a One Time Password is a automatically generated code which refreshes every 30 seconds.

<img src="images/otp.png" alt="One time password" style="width: 200px;"/>

Your mobile application will need to generate an OTP to display to the retailer for scanning.  To generate an OTP you need to use the functionality in the SDK code.



## Transactions

When a consumer makes purchases via the Yoyo Wallet platform, they will be recorded as transactions against the consumer's account.

> You GET a request to the API to retrieve your wallet details.


```shell
curl 'https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/transactions' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Accept: application/json' \
  -H 'HTTP_YOYO_TOKEN: {TOKEN}'
```

```swift
import UIKit
import CoreData
import Yoyo

class TransactionsViewController: UITableViewController {

	//MARK: Properties
	var fetchedResultsController: NSFetchedResultsController? {
		didSet {
			_ = try? fetchedResultsController?.performFetch()
			fetchedResultsController?.delegate = self
			tableView.reloadData()
		}
	}

	let dateFormatter: NSDateFormatter = {
		let dateFormatter = NSDateFormatter()
		dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
		dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
		return dateFormatter
	}()

	// MARK: UIViewController Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		guard
			let session = Yoyo.session,
			let dataController = Yoyo.dataController
		else {
			return
		}

		fetchedResultsController = dataController.transactionsFetchedResultsController(session: session)
	}
}

// MARK: UITableViewDataSource
extension TransactionsViewController {

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		guard
			let sectionInfo = fetchedResultsController?.sections?[section]
			else {
				return 0
		}

		return sectionInfo.numberOfObjects
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let object = fetchedResultsController?.objectAtIndexPath(indexPath)

		guard
			let cell = tableView.dequeueReusableCellWithIdentifier("cell"),
			let transaction = object as? Transaction
			else {
				return UITableViewCell()
		}

		cell.textLabel?.text = dateFormatter.stringFromOptionalDate(transaction.creationDate)
		cell.detailTextLabel?.text = transaction.identifier

		return cell
	}
}

// MARK: NSFetchedResultsControllerDelegate
extension TransactionsViewController: NSFetchedResultsControllerDelegate {

	func controllerWillChangeContent(controller: NSFetchedResultsController) {
		tableView?.beginUpdates()
	}

	func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {

		switch type {

		case .Insert:
			if let newIndexPath = newIndexPath {
				tableView?.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
			}

		case .Update:
			if let indexPath = indexPath {
				tableView?.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
			}

		case .Move:
			if let indexPath = indexPath, newIndexPath = newIndexPath {
				tableView?.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
			}

		case .Delete:
			if let indexPath = indexPath {
				tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
			}
		}
	}

	func controllerDidChangeContent(controller: NSFetchedResultsController) {
		tableView?.endUpdates()
	}
}
```

```java
public class MyTransactionsActivity extends Activity {

	// TransactionsView extends RecyclerView and wraps in scroll/cache functionality
	// Use this to fetch a user's transaction history
	TransactionsView mTransactionsView;

	// MyTransactionsAdapter should extend `TransactionsBaseAdapter`, which extends RecyclerView.Adapter
	MyTransactionsAdapter mAdapter;

	@Override
	public void onCreate(Bundle savedInstanceState){
		...
		mTransactionsView = (TransactionsView) v.findViewById(R.id.transactions_list);
		mTransactionsView.layoutManager = new LinearLayoutManager(context, LinearLayoutManager.VERTICAL, false);

		mAdapter = new MyTransactionsAdapter();
		mTransactionsView.setTransactionsAdapter(mAdapter)
		mTransactionsView.setEmptyView(v.findViewById(android.R.id.empty))

		// This begins fetching transactions
		mTransactionsView.loadTransactions()
	}

	@Override
	public void onDestroy(){
		// Call this to clean up memory
		mTransactionsView.onDestroy()
		super.onDestroy()
	}
}
```


> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "amount": 11000,
            "barcode": "4040144423413972679959220",
            "basket": [
                {
                    "amount": 500,
                    "discount": 0,
                    "product_code": "b00zy",
                    "product_description": "LagerPint",
                    "quantity": 2
                },
                {
                    "amount": 100,
                    "discount": 0,
                    "product_code": "w4lk3rz",
                    "product_description": "Crisp Packet",
                    "quantity": 1
                }
            ],
            "consumer_id": "e03f426a-0d45-429f-b0d3-8af64d9b6946",
            "consumer_name": "",
            "created_at": "2015-10-07T16:11:55.192617Z",
            "currency": "GBP",
            "discount": 0,
            "id": "f9637467-b205-4efb-87b0-ef3c68df473f",
            "reference": "",
            "refunds": [],
            "status": "COMPLETED",
            "transaction_key_id": "d3a4c60c-ceb1-4138-936b-0771b9d86f94"
        },
        {
            "amount": 200,
            "barcode": "4040144423289333971137546",
            "basket": [
                {
                    "amount": 200,
                    "discount": 0,
                    "product_code": "n1ck4rn",
                    "product_description": "JD Coke",
                    "quantity": 1
                }
            ],
            "consumer_id": "e03f426a-0d45-429f-b0d3-8af64d9b6946",
            "consumer_name": "",
            "created_at": "2015-10-07T15:53:56.269294Z",
            "currency": "GBP",
            "discount": 0,
            "id": "7ec7762a-fc2e-4462-9914-c1d83bd2fe68",
            "reference": "",
            "refunds": [],
            "status": "DENIED",
            "transaction_key_id": "d3a4c60c-ceb1-4138-936b-0771b9d86f94"
        }
    ],
    "metadata": {
        "has_next": false,
        "has_previous": false
    }
}
```

`GET https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/transactions`

#### Request Data

Parameter | Type |Description
--------- |  ----| -----------
consumer_id | path | unique identifer of the consumer
pagination | query | [see details](#pagination)

#### Response Data

Parameter | Type | Description
--------- |  ---- |-----------
id | string |unique identifier of transaction
account_id | string |unique identifier of platform account
account_name | string |platform account name
amount | integer | transaction amount £1.25 = 125
barcode | string | barcode used for transaction
consumer_id | string | unique identfier for the consumer
consumer_name | string | consumer name
created_at | timestamp | transaction creation time
currency | string | currency code
discount | integer | discount amount £1.25 = 125
reference | string | reference
status | string | transaction status (COMPLETED/DENIED)
transaction_key_id | string | unique identifier of transaction key

#### Basket Data

Basket data is the list of items the consumer purchased during the transaction.  Basket data is an array of Basket items.

Parameter | Type | Description
--------- |  ---- |-----------
amount | integer | basket item amount £1.25 = 125
discount | integer | basket item discount amount £1.25 = 125
product_code | string | unique identifier for product
product_name | string | product name

#### Refund Data

Refund data is when a previous completed transaction is refunded, partially or fully. Refund data is an array of Refund items.

Parameter | Type | Description
--------- |  ---- |-----------
id | string |unique identifier of refund
amount | integer | basket item amount £1.25 = 125
barcode | string | barcode used for transaction
created_at | timestamp | transaction creation time
currency | string | currency code
status | string | transaction status (COMPLETED/DENIED)

## Vouchers

When a consumer earns vouchers on Yoyo Wallet platform, they will be appear in the consumer's account.

> You GET a request to the API to retrieve your wallet details.


```shell
curl 'https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/vouchers' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Accept: application/json' \
  -H 'HTTP_YOYO_TOKEN: {TOKEN}'
```

```swift
import UIKit
import CoreData
import Yoyo

class VouchersViewController: UITableViewController {

	//MARK: Properties
	var fetchedResultsController: NSFetchedResultsController? {
		didSet {
			_ = try? fetchedResultsController?.performFetch()
			fetchedResultsController?.delegate = self
			tableView.reloadData()
		}
	}

	let dateFormatter: NSDateFormatter = {
		let dateFormatter = NSDateFormatter()
		dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
		dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
		return dateFormatter
	}()

	//MARK: UIViewController Lifecycle
	override func viewDidLoad() {

		super.viewDidLoad()

		guard
			let session = Yoyo.session,
			let dataController = Yoyo.dataController
			else {
				return
		}

		fetchedResultsController = dataController.vouchersFetchedResultsController(session: session)
	}
}

// MARK: UITableViewDataSource
extension VouchersViewController {

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		guard
			let sectionInfo = fetchedResultsController?.sections?[section]
			else {
				return 0
		}

		return sectionInfo.numberOfObjects
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let object = fetchedResultsController?.objectAtIndexPath(indexPath)

		guard
			let cell = tableView.dequeueReusableCellWithIdentifier("cell"),
			let voucher = object as? Voucher
			else {
				return UITableViewCell()
		}

		cell.textLabel?.text = dateFormatter.stringFromOptionalDate(voucher.creationDate)
		cell.detailTextLabel?.text = voucher.identifier

		return cell
	}
}

// MARK: NSFetchedResultsControllerDelegate
extension VouchersViewController: NSFetchedResultsControllerDelegate {

	func controllerWillChangeContent(controller: NSFetchedResultsController) {
		tableView?.beginUpdates()
	}

	func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {

		switch type {

		case .Insert:
			if let newIndexPath = newIndexPath {
				tableView?.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
			}

		case .Update:
			if let indexPath = indexPath {
				tableView?.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
			}

		case .Move:
			if let indexPath = indexPath, newIndexPath = newIndexPath {
				tableView?.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
			}

		case .Delete:
			if let indexPath = indexPath {
				tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
			}
		}
	}

	func controllerDidChangeContent(controller: NSFetchedResultsController) {
		tableView?.endUpdates()
	}
}
```

```java
public class MyVouchersActivity extends Activity {

	// VouchersView extends RecyclerView and wraps in scroll/cache functionality
	// Use this to fetch a user's transaction history
	VouchersView mVouchersView;

	// MyVouchersAdapter should extend `VouchersBaseAdapter`, which extends RecyclerView.Adapter
	MyVouchersAdapter mAdapter;

	@Override
	public void onCreate(Bundle savedInstanceState){
		...
		mVouchersView = (VouchersView) v.findViewById(R.id.vouchers_list);
		mVouchersView.layoutManager = new LinearLayoutManager(context, LinearLayoutManager.VERTICAL, false);

		mAdapter = new MyVouchersAdapter();
		mVouchersView.setVouchersAdapter(mAdapter)
		mVouchersView.setEmptyView(v.findViewById(android.R.id.empty))

		// This begins fetching vouchers
		mVouchersView.loadVouchers()
	}

	@Override
	public void onDestroy(){
		// Call this to clean up memory
		mVouchersView.onDestroy()
		super.onDestroy()
	}
}

```


> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "account_id": "897328d2-b1fe-4e99-a8e3-0204b4ac106f",
            "campaign_id": "d5h6fvd4-452f-47fc-c525-747g6h5ab67g",
            "code": "1443172134260310",
            "consumer_id": "8a66f9c4-782e-45cc-ab23-047f6f4abf83",
            "created_at": "2015-10-07T16:11:55.192617Z",
            "discount_coverage": "",
            "discount_type": "value",
            "discount_value": 100,
            "start_at": "2015-07-01T00:00:00.0Z",
            "end_at": "2018-12-31T00:00:00.0Z",
            "id": "a00994fc-e105-46d9-8435-5aff536398d1",
            "name": "£1 off JD Coke",
            "redeemed_at": "",
            "redemption_reference": "",
            "updated_at": "2015-10-07T16:11:55.192617Z"
        },
        {
            "account_id": "897328d2-b1fe-4e99-a8e3-0204b4ac106f",
            "campaign_id": "cfhdsvf7-j4ud-86gh-cd56-f8d7g7e58hr6dg",
            "code": "1443172133909833",
            "consumer_id": "8a66f9c4-782e-45cc-ab23-047f6f4abf83",
            "created_at": "2015-10-07T16:11:55.192617Z",
            "discount_coverage": "",
            "discount_type": "percentage",
            "discount_value": 20,
            "start_at": "2015-10-01T00:00:00.0Z",
            "end_at": "2015-12-31T00:00:00.0Z",
            "id": "ef3364a2-413e-4556-8c77-c724549f29bb",
            "name": "20% Off Everything!",
            "redeemed_at": "",
            "redemption_reference": "",
            "updated_at": "2015-10-07T16:11:55.192617Z"
        }
    ],
    "metadata": {}
}
```

`GET https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/vouchers`

#### Request Data

Parameter | Type |Description
--------- |  ----| -----------
consumer_id | path | unique identifer of the consumer

#### Voucher Data

Parameter | Type | Description
--------- |  ---- |-----------
id | string |unique identifier of transaction
account_id | string |unique identifier of platform account
campaign_id | string |unique identifier of campaign
code | string | voucher code
created_at | timestamp | transaction creation time
discount_coverage | string | discount coverage
discount_value | integer | discount value £1.25 = 125
start_at | timestamp | voucher start time
end_at | timestamp | voucher end time
name | string | voucher name
product_group_id | string | unique identfier for the product group
redeemed_at | timestamp | voucher redemption time
redemption_reference | string | redemption reference
updated_at | timestamp | voucher updated time

## Points

When a consumer earns points on Yoyo Wallet platform, they will be appear in the consumer's account.

> You GET a request to the API to retrieve your point balances details.


```shell
curl 'https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/point-balances' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Accept: application/json' \
  -H 'HTTP_YOYO_TOKEN: {TOKEN}'
```

> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "account_id": "897328d2-b1fe-4e99-a8e3-0204b4ac106f",
            "consumer_id": "60252636-24a9-11e5-b345-feff819cdc9f",
            "point_scheme_id": "759b36f4-0c2c-41fa-a8f8-95b89f531339",
            "balance": 20540,
            "created_at": "2015-10-28T12:53:55Z",
            "updated_at": "2015-11-06T16:11:36Z"
        },
        {
            "account_id": "a156079c-2d18-4ada-b8ee-f3b939cdc61e",
            "consumer_id": "60252636-24a9-11e5-b345-feff819cdc9f",
            "point_scheme_id": "c864a3a1-18ca-4f31-b27f-d6e4ab917807",
            "balance": 20540,
            "created_at": "2015-10-28T12:53:55Z",
            "updated_at": "2015-11-06T16:11:36Z"
        }
    ],
    "metadata": {}
}
```

`GET https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/point-balances`

#### Request Data

Parameter | Type |Description
--------- |  ----| -----------
consumer_id | path | unique identifer of the consumer

#### Point Balance Data

Parameter | Type | Description
--------- |  ---- |-----------
account_id | string |unique identifier of platform account
consumer_id | string | unique identifer of the consumer
point_scheme_id | string |unique identifier of point scheme
balance | integer | points balance value
created_at | timestamp | points balance updated time
updated_at | timestamp | points balance created time


> You GET a request to the API to retrieve your point transactions details.


```shell
curl 'https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/point-transactions' \
  -u {ACCESS_KEY}:{SECRET_KEY} \
  -H 'Accept: application/json' \
  -H 'HTTP_YOYO_TOKEN: {TOKEN}'
```

> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "id": "198f40ee-760b-48a5-abec-10a8d004fbcf",
            "account_id": "897328d2-b1fe-4e99-a8e3-0204b4ac106f",
            "consumer_id": "60252636-24a9-11e5-b345-feff819cdc9f",
            "point_scheme_id": "759b36f4-0c2c-41fa-a8f8-95b89f531339",
            "reference": "fcb4fdb5-f266-4b10-8844-b3bb322091d2",
            "amount": 500,
            "created_at": "2015-11-06T16:08:40Z",
            "updated_at": "2015-11-06T16:08:40Z"
        },
        {
            "id": "b87c99db-223a-4e03-a3fb-d10a2adcb041",
            "account_id": "897328d2-b1fe-4e99-a8e3-0204b4ac106f",
            "consumer_id": "60252636-24a9-11e5-b345-feff819cdc9f",
            "point_scheme_id": "759b36f4-0c2c-41fa-a8f8-95b89f531339",
            "reference": "Points manually added via dashboard",
            "amount": 200,
            "created_at": "2015-11-06T16:08:40Z",
            "updated_at": "2015-11-06T16:08:40Z"
            
        }
    ],
    "metadata": {}
}
```

`GET https://api.yoyoplayground.net/v1/consumers/{CONSUMER_ID}/point-transactions`

#### Request Data

Parameter | Type |Description
--------- |  ----| -----------
consumer_id | path | unique identifer of the consumer

#### Point Transaction Data

Parameter | Type | Description
--------- |  ---- |-----------
id | string |unique identifier of point transaction
account_id | string |unique identifier of platform account
consumer_id | string | unique identifer of the consumer
point_scheme_id | string | unique identifier of point scheme
reference | string | reference to purchase / refund that resulted in the point transaction or value manually set via dashboard
amount | integer | points transaction value
created_at | timestamp | points transaction updated time
updated_at | timestamp | points transaction created time
