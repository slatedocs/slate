---
title: Arbiter Documentation

language_tabs:
  - python
  - csharp

toc_footers:
  - <a href='https://www.arbiter.me/dashboard/' target='_blank'>Login to your Developer Dashboard</a>

search: true
---


# Overview

## Core Classes

Arbiter has 3 core classes that you will interact with as you develop your game. Before writing any code, spend 2 minutes getting familiar with these classes.

### Jackpot

Arbiter `Jackpots` are similar to a pot at a poker table. Your server will create a new jackpot for each betting interaction between the players in your game. Once a jackpot has been created, your players will have to opportunity to buy-in to the jackpot. After your players have finished battling it out in your game, your server will report who won. Arbiter will then charge the transacaction fee release the remaining funds in the jackpot to the winner.

### User

Your players' devices interact directly with our server. The first time a player's device connects with Arbiter, we create an anonymous `User` and return a unique ID for that user. This ID is what you will use to make requests on that user's behalf in the future from your server. By default, all users are playing anonymously. At any point, they can create login credentials for their account to log back in with those credentials using our Login API.

### Wallet

Each Arbiter `User` is given an Arbiter `Wallet`. This request will occur directly between your players' device and the Arbiter server. The user can then deposit to this wallet using a Credit Card, PayPal, or with Bitcoin. At any point, a user can make a withdraw from their Arbiter Wallet back to any Debit Card, PayPal account, or Bitcoin address.


## HTTP API Best Practices

The Arbiter API follows RESTful patterns, returns consistent JSON structures in every response, and relies on basic HTTP built in features. As long as you are familiar with the HTTP features below, the API should behave pretty straight forward.

## HTTP Status Codes

Our API uses the built in HTTP Status Code to help you track down an issue if the API is not responding with a success.

Code | Description
---- | ----
`200` OK | The requested action was successful.
`400` Bad Request | A required parameter was missing in your request data.
`401` Unauthorized | Missing or invalid access token in your Authorization Header.
`402` Request Failed | All parameters were included, but at least one did not pass validation.
`404` Not Found | Incorrect url or ID in a url.
`500` Server Error | Something went wrong on our end. We get notified every single time you see this and are looking into what caused the problem.

## HTTP Methods

Our API relies on the built in HTTP verbs `GET` and `POST` for handling object detail requests versus object creates or updates.

### GET

Requesting existing resources.

[HTTP Request Methods](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)

### POST

Performing resource updates and actions.

[HTTP Request Methods](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)

## Response Objects

```python
# Example response from https://www.arbiter.me/api/v1/wallet/
{
    'success': true,
    'wallet': {
        'deposit_address': '1Mdx1V81LJeyZk6yBizRny6KXxyMTXHGpw',
        'balance': '0'
    }
}
```

All APIs return json with the following keys:

Key | Type |  Description
------- | ------- | -------
success | Boolean | Whether or not the requested action was performed.
OBJECT_NAME | dictionary | A dictionary containing the relavant object being queried or edited. This key will be the name of object type (ie: user, wallet, jackpot, etc).
errors | array | An array of errors (if any errors occurred).

## Authentication

```python
# Example of an request with Authorization Header
import requests

# User tokens are included in Initialize and User Details API
USER_TOKEN = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'
# Game API Keys are available in your Developer Dashboard
GAME_API_KEY = 'd6416b1e9be84c53b07524e37f94499d'

headers = {'Authorization': 'Token ' + USER_TOKEN + '::' + GAME_API_KEY}
r = requests.post('https://www.arbiter.me/api/v1/user/details', headers=headers)
```

All requests are authenticated using the HTTP Authorization Header

[More on HTTP Headers](http://en.wikipedia.org/wiki/List_of_HTTP_header_fields)

## Laws and Regulations

Every developer we have talked with starts off with the same question, **'Isn't gambling online illegal in the US?'**

When we first started working on Arbiter, we noticed a few complicated and/or vague laws around defining what is or is not gambling. These laws differ state by state and are constantly evolving. The caveat that all online betting platforms for games have caught onto is, **'A game where the outcome is determined predominately by skill is not considered gambling in most states.'**

We have built a unique piece of technology capable of defining the amount of skill involved in the outcomes of your games. We can put a number to how predominately skill is determining the outcome of your game. We follow that up with how much skill is required by each state to not be considered gambling. Before a player can ever deposit funds into an Arbiter wallet, we verify the user's local regulation does not conflict with your game's amount of skill vs chance in the outcome. **You can make your game and distribute it to your standard distribution channels. We'll make decisions based on your game's predominance rating and the local regulation of each player to get your games in front of the maximum number of players with no manual effort on your end.**

# Getting Started

Before digging into the details below, spend 2 minutes reading the [Core Classes](/?python#core-classes) section. It will get you familiar with the core classes you will be interacting with.

## Configure Your Game

[Create an Arbiter developer account](https://www.arbiter.me/developer-registration/) to configure your game and save  your API Key.

Configuring your game
In your dashboard, click the 'Register new game' button in the games tab.

### Game Configuration Form

Field  | Description
--------- | -----------
Name | A label for your game.
Rake amount | The percentage of each player payout you want to charge. Valid range is 0 through 99. `payout = balance - your rake % - Arbiter fee (5%)`.

Once you have saved the configuration form, an API key will be generated for your game upon completing registration. Store this on your server for making authenticated calls. See TODO for more on how this key will be used.

# User API

## Initialize

```python
import requests

r = requests.get('https://www.arbiter.me/api/v1/user/initialize')

r.json()
{
    'success': true,
    'user': {
        'id': 'd8b50f95c8a24f24a7c64c9d3d5dde5f',
        'token': '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb',
        'claim_account_url': 'https://www.arbiter.me/api/v1/user/40628a4750f74b7a9e1827812e7af815/f80819ef573f699c2723b0c15f1c24bf704ae8a5ef5363083434831bed36c518',
        'is_verified': false,
        'username': 'anonymous'
    }
}
```

The initialize call should be made at the beginning of every user's session in your game. Arbiter creates an anonymous session with the user. The session is managed through the `token` returned in the first response.

Future requests made for this user require the `token` in the request headers. Store the user.id and user.token in your database or locally on the device for future requests.

### HTTP Request

`GET https://www.arbiter.me/api/v1/user/initialize`

### Returned User Object

Key | Type | Description
---- | ---- | ----
id | string | Unique Arbiter ID for this user. Save this in your DB for requests involving this users
token | string | Authentication token for this user. Save this in your DB and keep it private. This will be included in request headers in future requests to authenticate a request made on behalf of this user.
is_verified | boolean | Whether or not this user has agreed to Arbiter's Terms of Service.
username | string | Display name of this user. If they have not created an account using the claim_url, this will be anonymous
claim_account_url | string | A unique URL for this user to claim their Arbiter Account. Once they have claimed their account, they can login to their [Player Dashboard](https://www.arbiter.me/dashboard/). They can also use their account credentials to login to an Arbiter enabled game and have access to their existing wallet created in a previous session.

## Agree to Terms of Service

```python
import requests

# id and token returned from the /user/initialize call
user_id = 'd8b50f95c8a24f24a7c64c9d3d5dde5f'
user_token = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'

# Game API Key from your developer dashboard
api_key = 'd6416b1e9be84c53b07524e37f94499d'

url = 'https://www.arbiter.me/api/v1/user/' + user_id + '/verify'
headers = {
    'Authorization': 'Token ' + user_token + '::' + api_key
}
r = requests.post(url)

r.json()
{
    success: True
}
```

Before a user can participate in a wager, we need to confirm that the user is over 18, their local jurisdiction allows skill based betting online, and they need to agree to the [Arbiter Terms of Service](https://www.arbiter.me/terms/). Display the exact text below with a confirmation button that posts to the the confirmation API.

<aside class='notice'>
    By clicking the confirmation button below, you agreeing to the [Arbiter Terms of Service](https://www.arbiter.me/terms/) and confirming that you are at least 18 years of age.
</aside>

### HTTP Request

`POST https://www.arbiter.me/api/v1/user/<USER ID>/verify`

### Returns

Key | Type | Description
---- | ---- | ----
success | boolean | Whether or not the user's account was successfully verified

## User details

```python
import requests

# id and token returned from the user/initialize or user/login call
# IMPORTANT: Keep your users' tokens private
user_id = 'd8b50f95c8a24f24a7c64c9d3d5dde5f'
user_token = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'

# game API Key from your developer dashboard
api_key = 'd6416b1e9be84c53b07524e37f94499d'

headers = {
    'Authorization': 'Token ' + user_token + '::' + api_key
}
url = 'https://www.arbiter.me/api/v1/user/' + user_id

r = requests.get(url, headers=headers)

r.json()
{
    'success': true,
    'user': {
        'id': 'd8b50f95c8a24f24a7c64c9d3d5dde5f',
        'is_verified': true,
        'username': 'anonymous',
        'token': '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'
    },
    'wallet': {
        'deposit_address': '1JbbREwe8Vb9DAVzB2zWtNYvKDYLyjyV3C',
        'deposit_address_qr_code': 'https://chart.googleapis.com/chart?cht=qr&chl=bitcoin%3A1JbbREwe8Vb9DAVzB2zWtNYvKDYLyjyV3C&choe=UTF-8&chs=300x300',
        'withdraw_address': null,
        'balance': '50',
        'pending_balance': '623'
    }
}

```

Returns details for a user.

### HTTP Request

`GET https://www.arbiter.me/api/v1/user/<USER ID>`

### Returns a User's details

Key | Type | Description
---- | ---- | ----
id | string | Unique ID for this user. Save this ID with the user in your database.
token | string | Access token used for authentication. Store this in your database with the user and keep it secret.
is_verified | boolean | Whether or not the user has agreed to Arbiter's Terms of Service
username | string | If the user has set their username. Defaults to `anonymous`

<aside class='warning'>
    Be sure to keep your users' tokens secret. They are used for authentication and should be treated like a password.
</aside>

# Wallet API

## Wallet details

```python
import requests

# id and token returned from the user/initialize or user/login call
# IMPORTANT: Keep your users' tokens private
user_id = 'd8b50f95c8a24f24a7c64c9d3d5dde5f'
user_token = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'

# game API Key from your developer dashboard
api_key = 'd6416b1e9be84c53b07524e37f94499d'

headers = {
    'Authorization': 'Token ' + user_token + '::' + api_key
}
url = 'https://www.arbiter.me/api/v1/wallet/' + user_id

r = requests.get(url, headers=headers)

r.json()
{
    'success': true,
    'wallet': {
        'deposit_address': '1JbbREwe8Vb9DAVzB2zWtNYvKDYLyjyV3C',
        'deposit_address_qr_code': 'https://chart.googleapis.com/chart?cht=qr&chl=bitcoin%3A1JbbREwe8Vb9DAVzB2zWtNYvKDYLyjyV3C&choe=UTF-8&chs=300x300',
        'withdraw_address': null,
        'balance': '50',
        'pending_balance': '623'
    }
}
```

### HTTP Request

`GET https://www.arbiter.me/api/v1/wallet/<USER ID>`

### Returns a user's Wallet details

Key | Type | Description
---- | ---- | ----
balance | integer | The amount of Arbiter credits this user has available to bet with.
pending_balance | integer | The amount of Arbiter credits that are currently pending confirmation.
deposit_address | string | Bitcoin deposit address for the user to deposit bitcoin in exchance for Arbiter credits.
deposit_address_qr_code | url | Image URL to a QR code for depositing Bitcoin.
withdraw_address | string | If the user has cashed out to a Bitcoin address in the past, we include this value to autopopulate their cash out form

## Deposit

You have a few options to choose from for how you want to let your users deposit funds into their wallets. Once you have decided how you want your players to deposit funds, we have 3 different payment options to choose from

### In game using Bitcoin

Once you have queried a user's wallet, display the `wallet.deposit_address` or the `wallet.deposit_address_qr_code` to the user. Then the user can use any Bitcoin wallet app to deposit Bitcoin to their address. We suggest either polling or including a refresh button for the user to trigger wallet queries after placing a deposit.

<aside>
Bitcoin is exchanged at time of deposit and withdraw at [Coinbase's Exchange Rates](https://coinbase.com/charts). We instantly accept $0.50 worth of Bitcoin into the user's wallet at time of deposit. The remaining deposit is moved into the user's `pending_balance`. We wait for 2 confirmations from the Bitcoin network before moving the `pending_balance` into the user's `balance`.
</aside>

### In game using Credit Card

Documentation coming soon...

### In game using PayPal

Documentation coming soon...

### Link them to their web dashboard

If you don't want to deal with implementing the Deposit API, you can link the user to their [Web Dashboard](https://www.arbiter.me/dashboard/wallet/). However, they will need to create account credentials using the [Claim Account API] in order to login in to their web dashboard.

## Cash Out

Docuementation coming soon...

# Winner Take All API

Creates a new Winner Take All Jackpot. The format for a Winner Take All Jackpot is similar to a single hand of poker.

1. Your server requests a  new Jackpot.
2. Users buy into the Jackpot using the Add User API.
3. Let players play your game.
4. Report the winner of the game user the Report Score API.
5. Arbiter will calculate the transactions fees and release the winnings

## Jackpot Create

```python
import requests

# id and token returned from the user/initialize or user/login call
# IMPORTANT: Keep your users' tokens private
user_id = 'd8b50f95c8a24f24a7c64c9d3d5dde5f'
user_token = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'

# game API Key from your developer dashboard
api_key = 'd6416b1e9be84c53b07524e37f94499d'

# Include the user_token requesting the jackpot
headers = {
    'Authorization': 'Token ' + user_token + '::' + api_key
}
url = 'https://www.arbiter.me/api/v1/winner-take-all/create'
payload = {
    'buy_in': 100  # Bet size in Arbiter Credits
}
r = requests.post(url, data=payload, headers=headers)

r.json()
{
    'success': True
    'jackpot': {
        'id': '7b62cac5dd164104955468ff80ee6d26'
        'buy_in': '100',
        'balance': '100',
        'bettors': ['d8b50f95c8a24f24a7c64c9d3d5dde5f'],
    }
}
```

### HTTP Request

`POST https://www.arbiter.me/api/v1/winner-take-all/create`

### Request Parameters

Key | Type | Description
--- | --- | ---
buy_in | integer | The buy in (aka bet size) in Arbiter credits for this jackpot.

### Returns the jackpot's state

Key | Type | Description
---- | ---- | ----
id | string | Unique identifier for this jackpot.
buy_in | string | The buy in (aka bet size) in Arbiter credits for this jackpot.
balance | string | The current balance of this jackpot.
bettors | array | The User IDs of users who have successfully placed a bet in this jackpot.

## Jackpot Details

```python
import requests

# id and token returned from the user/initialize or user/login call
# IMPORTANT: Keep your users' tokens private
user_id = 'd8b50f95c8a24f24a7c64c9d3d5dde5f'
user_token = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'

# game API Key from your developer dashboard
api_key = 'd6416b1e9be84c53b07524e37f94499d'

# Include the user_token requesting the jackpot
headers = {
    'Authorization': 'Token ' + user_token + '::' + api_key
}
url = 'https://www.arbiter.me/api/v1/winner-take-all/<JACKPOT_ID>'
r = requests.post(url, headers=headers)

r.json()
{
    'success': True
    'jackpot': {
        'id': '7b62cac5dd164104955468ff80ee6d26'
        'buy_in': '100',
        'balance': '100',
        'bettors': ['d8b50f95c8a24f24a7c64c9d3d5dde5f']
    }
}
```

### HTTP Request

`GET https://www.arbiter.me/api/v1/winner-take-all/<JACKPOT_ID>`

### Returns the jackpot's state

Key | Type | Description
---- | ---- | ----
id | string | Unique identifier for this jackpot.
buy_in | string | The buy in (aka bet size) in Arbiter credits for this jackpot.
balance | string | The current balance of this jackpot.
bettors | array | The User IDs of users who have successfully placed a bet in this jackpot.

## Add User

> Before adding a user, create a jackpot using the Jackpot Create API and save the Jackpot ID

```python
import requests

# id and token returned from the user/initialize or user/login call
# IMPORTANT: Keep your users' tokens private
user_id = 'efc4654a2b9844589a8d77d09628afbf'
user_token = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'

# game API Key from your developer dashboard
api_key = 'd6416b1e9be84c53b07524e37f94499d'

# Include the user_token requesting the jackpot
headers = {
    'Authorization': 'Token ' + user_token + '::' + api_key
}
url = 'https://www.arbiter.me/api/v1/winner-take-all/<JACKPOT_ID>/add-user/' + user_id
r = requests.post(url, headers=headers)

r.json()
{
    'success': True
    'jackpot': {
        'id': '7b62cac5dd164104955468ff80ee6d26'
        'buy_in': '100',
        'balance': '200',
        'bettors': ['d8b50f95c8a24f24a7c64c9d3d5dde5f', 'efc4654a2b9844589a8d77d09628afbf'],
    }
}
```

Transfers the Jackpot's buy_in amount from the specified user's wallet to the specified jackpot. If no errors occur, then the user will be added to the `bettors` array and the `jackpot.balance` will be updated.

### HTTP Request

`POST https://www.arbiter.me/api/v1/winner-take-all/<JACKPOT_ID>/add-user/<USER_ID>`

### Returns the Jackpot State

Key | Type | Description
--- | --- | ---
id | string | Unique identifier for this jackpot.
buy_in | string | The buy in (aka bet size) in Arbiter credits for this jackpot.
balance | string | The current balance of this jackpot.
bettors | array | The User IDs of users who have successfully placed a bet in this jackpot.

## Report Score

> Before reporting a score, create a jackpot using the Jackpot Create API add the user using the Add User API

```python
import requests

# id and token returned from the user/initialize or user/login call
# IMPORTANT: Keep your users' tokens private
user_id = 'efc4654a2b9844589a8d77d09628afbf'
user_token = '3d2fcd21dcd22ae1d64b799c486a959aeee42fbb'

# game API Key from your developer dashboard
api_key = 'd6416b1e9be84c53b07524e37f94499d'

# Include the user_token requesting the jackpot
headers = {
    'Authorization': 'Token ' + user_token + '::' + api_key
}
url = 'https://www.arbiter.me/api/v1/winner-take-all/<JACKPOT_ID>/report-score/' + user_id
payload={
    'score': '101'
}
r = requests.post(url, data=payload, headers=headers)

# If all users have reported a score, the jackpot will automatically payout
r.json()
{
    'success': True
    'jackpot': {
        'id': '7b62cac5dd164104955468ff80ee6d26'
        'buy_in': '100',
        'balance': '0',
        'bettors': ['d8b50f95c8a24f24a7c64c9d3d5dde5f', 'efc4654a2b9844589a8d77d09628afbf'],
    }
}
```

Once a user has finished playing your game, report their score to Arbiter. Once all the bettors have reported their scores, Arbiter will compare the scores set the winner to the user with the highest score. Once a winner has been set, Arbiter will automatically calculate the transaction fees and pay transfer the remainder of the jackpot balance to the winning user's wallet.

### HTTP Request

`POST https://www.arbiter.me/api/v1/winner-take-all/<JACKPOT_ID>/report-score/<USER_ID>`

### Request Parameters

Key | Type | Description
--- | --- | ---
score | integer | The score of the user for this jackpot.

### Returns the Jackpot State

Key | Type | Description
--- | --- | ---
id | string | Unique identifier for this jackpot.
buy_in | string | The buy in (aka bet size) in Arbiter credits for this jackpot.
balance | string | The current balance of this jackpot. If all users have reported their score, this will be 0.
bettors | array | The User IDs of users who have successfully placed a bet in this jackpot.

# Unity SDK

[Download the SDK](https://github.com/andyzinsser/arbiter-ios-sdk-example)

## Initialize

```csharp
Arbiter.Initialize( GAME_API_KEY, CallbackFunction );
```

## Agree to Terms of Service

```csharp
Arbiter.VerifyUser();
```

## Query User

## Query Wallet

```csharp
Arbiter.QueryWallet();
```

## Deposit
## Request Jackpot
## Place Bet
## Report Score
## Query Jackpot
## Cash Out

