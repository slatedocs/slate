# Accounts

## Register

This endpoint will register a new user.

```shell
# HTTP REQUEST BODY

{ 
  "firstname":"john", 
  "lastname":"doe", 
  "email":"john@company.com", 
  "password":"P@ssw0rd", 
  "confirmpassword":"P@ssw0rd" 
}
```

### HTTP REQUEST

`POST api/Account/Register`

Parameter | Description 
-------------- | -------------- 
firstname | **required** <i>- 3 to 25 characters long</i> <br> first name of the user
lastname | **required** <i>- 3 to 25 characters long</i> <br> last name of the user
email | **required** <i>- 10 to 65 characters long</i> <br> email of the user 
password | **required** <i>- 8 to 16 characters long</i> <br> password required to authorize login
confirmpassword | **required** <i>- 8 to 16 characters long</i> <br> retype password required to authorize login

### HTTP RESPONSE

<aside class="success">
201 Created
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Activate

This endpoint will activate the registered user with Quotebox.

```shell
# HTTP REQUEST BODY

{ 
  "activationkey":"168051210061074152175 ... "
}
```

### HTTP REQUEST

`POST api/Account/Activate`

Parameter | Description 
-------------- | -------------- 
activationkey | **required** <br> hash key to activate an account, obtained via activation link sent to registered email

### HTTP RESPONSE

<aside class="success">
200 OK 
</aside>

<aside class="warning">
400 Badrequest { validation related errors }
</aside>

## Login

Quotebox requires authorization for access to certain features such as creating a new quote, etc.

Following request would get a token to authorize all such requests as far as the session of the token does not expire.

<aside class="notice">
Ensure the user is activated with Quotebox
</aside>

```shell
# HTTP REQUEST BODY

grant_type=password&username=john@company.com&password=P@ssw0rd
```

### HTTP Request

`POST http://127.0.0.1:81/token`

`Content-Type: application/x-www-form-urlencoded`

### HTTP RESPONSE

<aside class="success">
200 OK - Token: some_hash_token (to be parsed from header of the response)
</aside>

<aside class="warning">
400 Badrequest {"error":"invalid_grant","error_description":"The user name or password is incorrect."}
</aside>

## Logout

This endpoint will logout the the user and dipose any temporary resources being consumed

### HTTP Request

`POST api/Account/Logout`

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest  - { validation related errors }
</aside>

## Change password

This endpoint will change the password for a user.

```shell
# HTTP REQUEST BODY

{
	"currentpassword":"P@ssw0rd",
	"newpassowrd":"Qu0t3P@ssw0rd",
	"confirmnewpassword":"Qu0t3P@ssw0rd"
}
```

<aside class="notice">
Ensure the user is activated with Quotebox
</aside>

Parameter | Description 
-------------- | -------------- 
currentpassword | **required** <i>- 8 to 16 characters long </i> <br> current password
newpassword | **required** <i>- 8 to 16 characters long </i> <br> new password
confirmnewpassword | **required** <i>- 8 to 16 characters long </i> <br> retype new password to verify

### HTTP REQUEST

`POST api/Account/ChangePassword`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest  - { validation related errors }
</aside>

## Request to reset password

This endpoint will send a password reset link to registered email.

> Request to reset password should return the following JSON

```shell
# HTTP RESPONSE

{ 
	"isvalid": "true if request was proceed successfully, else false" 
}
```

### HTTP REQUEST

`POST api/Account/ResetPasswordRequest`

Parameter | Description 
-------------- | -------------- 
email | **required** <i>- 10 to 65 characters long</i> <br> email of the user 

### HTTP RESPONSE

<aside class="success">
200 OK - with following object
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>

## Reset password

This endpoint will reset the password for an associated account.

```shell
# HTTP REQUEST BODY

{
	"email":"john@company.com",
	"key":"22709123021321406816612413409400414401113123816700325 ... ",
	"newpassword":"Qu0t3P@ssw0rd",
	"confirmnewpassword":"Qu0t3P@ssw0rd"
}
```

### HTTP REQUEST

`POST api/Account/ResetPassword`

Parameter | Description 
-------------- | -------------- 
email | **required** <i>- 10 to 65 characters long</i> <br> email of the user
key | **required** <br>  key to request password (available from link sent via email to the registered email)
newpassword | **required** <i>- 8 to 16 characters long </i> <br> new password
confirmnewpassword | **required** <i>- 8 to 16 characters long </i> <br> retype new password to verify

### HTTP RESPONSE

<aside class="success">
200 OK 
</aside>

<aside class="warning">
400 Badrequest - { validation related errors }
</aside>


## Update account settings

This endpoint will update settings associated with an account

```shell
# HTTP REQUEST BODY

{
	"quoteapperance":
	{
		"hideitemcodefromcustomer":true,
		"showalldetails":true,
		"company":{
					"companyname":"GloboMantics",
					"logouri":"http://user/profile/logo.png",
					"phone":"012345678"
				  }
	},
	"quotedefaults":
	{
		"expireunacceptedquotesafter":9,
		"printpdfsize":"A4",
		"quotecurrency":"INR",
		"quotetax":"12.4",
		"nextquotereferencenumber":5
	},
	"quoteaccountcode":
	{
		"name":"Sales",
		"code":"200",
		"taxrateid":"53734c354ac4891304f1429f"
	},
	"taxrates":		
	{
		"description":"Electronic CST",
		"value":"5.5"
	},
	"accountdetails": 
	{
		"accountname":"GloboMantics Corp",
		"country":"India",
		"timezone":"+5:30 GMT",
		"subdomain":"globoindia",
		"customdomain":"quotes.globomantics.in"
	},
	"billingdetails": 
	{
		"activeplanid":"SOLO",
		"activeplanname":"solo plan",
		"billingcontactid":"53734c354ba4123304f1429f",
		"billingcontactname":"John Doe"
	},
	"paymentdetails": 
	{
		"cardnumber":"1234-1234-1234-1234",
		"cardname":"John Doe",
		"cardcvc":000,
		"cardexpirationmonth":12,
		"cardexpirationyear":30,
		"cardtype":"visa"
	},
	"emailsetup":	
	{
		"alternateemail":"john@subdomain.com",
		"emailcopyofaccepted":"boss@company.com, someone@else.com"
	},
	"emailnotifications": 
	{
		"newquotesentbody":"Hi, {recipient_name}, following is the quote as per your inquiry with us.",
		"quoteacceptancebody":"Dear {recipient_name}, thank you for accepting the quote {quote_ref_no} - {quote_title}",
		"newquotesentsubject":"{quote_ref_no} - {quote_title} from {user_name} - {user_company}",
		"quoteacceptancesubject":"Accepted: {quote_ref_no}-{quote_title} {date time}"
	},
	"notificationsettings": 
	{
		"notificationlist": 
		[
			{
				"description":"You have a new quote",
				"action":"newquote",
				"sendemail":true,
				"sendsms":false,
				"inapp":true
			},
			{
				"description":"{quote_ref_no}-{quote_title} accepted",
				"action":"acceptednotify",
				"sendemail":true,
				"sendsms":true,
				"inapp":true
			}
		]
	}
}
```

### HTTP REQUEST

`POST api/Account/UpdateAccountSettings`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

Parameter | Description 
-------------- | -------------- 
quoteapperance | **optional** <br> model for apperance related preferences associated with an account
quotedefaults | **optional** <br> model for default preferences associated with an account
quoteaccountcode | **optional** <br> model for account code related preferences associated with an account
taxrates | **optional** <br> model for tax rate related preferences associated with an account
accountdetails | **optional** <br> model for details associated with an account
billingdetails | **optional** <br> model for billing related preferences associated with an account
paymentdetails | **optional** <br> model for payment related preferences associated with an account
emailsetup | **optional** <br> model for email related preferences associated with an account
emailnotifications | **optional** <br>  model for notifications via email related preferences associated with an account
notificationsettings | **optional** <br>  model for notification related preferences associated with an account

### QUOTE APPERANCE PARAMETERS

Parameter | Description 
-------------- | -------------- 
hideitemcodefromcustomer | **optional** ***- boolean*** <br> true if you want to hide the item code of a line item within a quote sent to your recipient
showalldetails | **optional** ***- boolean*** <br> true if you want to show your business details
company | **optional** <br> company details to be shown within a quote sent to your recipient

### QUOTE DEFAULT PARAMETERS

Parameter | Description 
-------------- | -------------- 
expireunacceptedquotesafter | **required** ***- integer*** <br> number of days after which the unviewed, unopned quotes should be set as expired
nextquotereferencenumber | **optional** <i>- 1 to 10 characters long</i> <br> number from which the next quote would be referred by
quoteprefix | **optional** <i>- 1 to 10 characters long</i> <br> a random word or string to set as prefix to the quote reference number
printpdfpagesize | **required** <br> default page size for the quote to print
quotecurrency | **required** <br> default currency of quote to evaluate in
quotetax | **required** <br> default tax applicable to quote, only the new quotes created after editing this preference

### QUOTE ACCOUNT CODE PARAMETERS

Parameter | Description
-------------- | --------------
name | **required** <i>- 4 to 25 characters long</i> <br> name of the account code 
code | **required** <i>- 1 to 10 characters long</i> <br> code associated with the account code 
description | **optional** <i>- 5 to 25 characters long</i> <br> a short piece of string to describe the account code 
taxrateid | **required** <br> tax rate to be associated with this account code
isarchived | **optional** ***- boolean*** <i>, false by default</i> <br> true if this account code is to be as archived
isdefault | **optional** ***- boolean*** <i>, false by default</i> <br> true if this account code is to be set as default

### TAX RATE PARAMETERS

Parameter | Description
-------------- | --------------
description | **required** <i>- 5 to 25 characters long</i> <br> a short piece of string to describe the tax rate
value | **required** ***- decimal*** <br> value of tax to be applied
isarchived | **optional** ***- boolean*** <i>, false by default</i> <br> true if this tax rate is to be as archived
isdefault |  **optional** ***- boolean*** <i>, false by default</i> <br> true if this tax rate is to be set as default

### ACCOUNT DETAILS PARAMETERS

Parameter | Description
-------------- | --------------
accountname | **required** <i>- 5 to 25 characters long</i> <br> name of the account
country | **required** <i>- 4 to 35 characters long</i> <br> country (location) of the account
timezone | **required** <i>- 5 to 25 characters long</i> <br> default operational time zone of the account
<a href="http://en.wikipedia.org/wiki/Subdomain"> subdomain </a> | **required** <i>- 5 to 25 characters long</i> <br> subdomain for the uri of the account
customdomain | **optional** <i>- 5 to 25 characters long</i> <br> customdomain of the uri to access the account

### BILLING DETAILS PARAMETERS

Parameter | Description
-------------- | -------------- 
activeplanname | **required** <br> name of plan to subscribe with Quotebox
activeplanid | **required** <br> id of plan to subscribe with Quotebox
billingcontactid | **required** <br> id of user intended to be billed for subscriptions with Quotebox
billingcontactname | **optional** <br> name of user to intended to be billied for subscriptions with Quotebox
couponid | **optional** <i>- 3 to 25 characters long </i> <br> coupon id for any special offers available at Quotebox

### PAYMENT CARD DETAILS PARAMETERS

Parameter | Description
-------------- | --------------
cardcvc | **required** <br> 3 digit cvc number of the credit/debit card
cardexpirationmonth | **required** <br> expiration month of the credit/debit card
cardexpirationyear | **required** <br> expiration year of the credit/debit card
cardname | **required** <br> name of card holder
cardnumber | **required** <br> number of credit/debit card
cardtype | **required** <br> type of card

### EMAIL SETUP PARAMETERS

Parameter | Description
-------------- | --------------
emailcopyofaccepted | **optional** <br> command seprated emails to send acknowledgement of accepted quotes
alternateemail | **optional** <br> alternative email to send quotes on behalf of to the recipient

### EMAIL NOTIFICATIONS PARAMETERS

Parameter | Description
-------------- | --------------
newquotesentbody | **required** <br> body of the email for the quote sent via email to the recipient
quoteacceptancebody | **required** <br> body of the email for the acknowledgement of the quote
newquotesentsubject | **required** <br> subject of the email for the quote sent via email to the recipient
quoteacceptancesubject | **required** <br> subject of the email for the acknowledgement of the quote

### NOTIFICATION SETTINGS PARAMETERS

Parameter | Description
-------------- | --------------
notificationlist | **optional** <br> model for list of notification related preferences

### NOTIFICATION LIST OBJECT PARAMETERS

Parameter | Description
-------------- | --------------
description | **optional** <br> short line of text to describe this notification
action | **opttional** <br> action to identify related notification <br><br> ***supported input:*** NewQuote, TeamMemberDiscussion, ClientDiscussion, Expiry, AcceptanceAck, AcceptedNotify, AcceptedOnBehalfAck, Declined, SMSBounce, EmailBounce, NewTeamMember
sendemail | **optional** <i>- default false, set true if need an email to notify </i> <br> indicates if the notification will be sent as an email
sendsms | **optional** <i>- default false, set true if need a sms to notify </i> <br> indicates if the notification will be sent as a sms
inapp | **optional** <i>- default true, set false if in app notification not required </i> <br> indicates if the notification will be shown within Quotebox to the user


### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest  - { validation related errors }
</aside>

## Retrive account settings

This endpoint will get the account settings associated with an account.

```shell
# HTTP REQUEST BODY

{
	"accountsettings": 
	[
		"quoteapperance",
		"taxrates"
	],
	"invoicelistpageno":1
}
```

> Above request should return the following JSON as per the input in Account Settings list

```shell
# HTTP RESPONSE OBJECT

{
	"quoteapperance":
	{
		"hideitemcodefromcustomer":true,
		"showalldetails":true,
		"company":{
					"companyname":"GloboMantics",
					"logouri":"http://user/profile/logo.png",
					"phone":"012345678"
				  }
	},
	"taxrates":		
	{
		"description":"Electronic CST",
		"value":"5.5"
	},
	"invoicehistory": 
	[
		{
			"amountdueincents":200,
			"attemptcount":2,
			"attempted":true,
			"closed":false,
			"currency":"INR",
			"date":"10/06/2014",
			"endingbalanceincents":10,
			"nextpaymentattempt":"08/06/2014",
			"paid":true,
			"periodend":"05/09/2014 10:00 AM",
			"priodstart":"05/09/2013 10:00 AM",
			"subtotalincents":200,
			"totalincents":200
		}
	]
}
```

### HTTP REQUEST

`POST api/Account/RetriveAccountSettings`

<aside class="notice">
Include bearer token in header to authorize: `Authorization: Bearer token_value`
</aside>

### HTTP REQUEST BODY PARAMETERS

Parameter | Description
-------------- | --------------
accountsettings | **optional** <i>- minimum 1 item is required </i> <br> list of enum of account settings <br><br> ***supported input:*** QuoteApperance, QuoteDefaults, AccountCodes, TaxRates, EmailNotifications, EmailSetup, AccountBilling, PaymentInfo, InvoiceHistory, NotificationSettings, AccountDetails 
invoicelistpageno | **optional** <br>  page number of invoice to get, pass 0 if none | 0 | integer |

### HTTP RESPONSE

<aside class="success">
200 OK
</aside>

<aside class="warning">
400 Badrequest  - { validation related errors }
</aside>