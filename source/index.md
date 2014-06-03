---
title: API Reference

language_tabs:
  - python

toc_footers:
  - <a href='https://www.arbiter.me/dashboard/' target='_blank'>Login to your Developer Dashboard</a>

includes:
  - errors

search: true
---

# Classes

Arbiter makes it easy for you to have your players betting against each other for Bitcoin in your games safely and legally. Before writing any code, get familiar with the primary classes that you will interact with when building your games.

## Jackpot

Arbiter `Jackpots` are similar to a pot at a poker table. Your server will request new jackpots for each competition between your players in your game. Once a jackpot has been created, your players will have to opportunity to buy-in to the jackpot. After your players have finished battling it out in your game, you tell us who won. Arbiter will release the funds in the jackpot to the winner.


## User

Your players' devices interact directly with our server. The first time a player's device connects with Arbiter, we create an anonymous `User` and return a unique ID for that user. This ID is what you will use to make requests on that user's behalf in the future from your server. By default, all users are playing anonymously. At any point, they can create login credentials for their account to log back in once their session expires.


## Wallet

Each Arbiter `User` is given an Arbiter `Wallet`. This request will occur directly between your players' device and the Arbiter server. When a player requests a wallet, Arbiter returns a deposit address to the user's device. The user can then deposit Bitcoin directly to that address using their prefered Bitcoin wallet. We suggest using Coinbase. Deposits made using Coinbase will register in the user's wallets nearly instantly.

At any point, a user can make a withdraw from their Arbiter Wallet back to any Bitcoin address. Once a user has withdrawn once, we save that address so withdraws in the future are very easy.


# Laws and Regulations

Every developer we have talked with starts off with the same question, **"Isn't gambling online illegal in the US?"**

When we first started working on Arbiter, we noticed a few complicated and/or vague laws around defining what is or is not gambling. These laws differ state by state and are constantly evolving. The caveat that all online betting platforms for games have caught onto is, **"A game where the outcome is determined predominately by skill is not considered gambling in most states."**

We have built a unique piece of technology capable of defining the amount of skill involved in the outcomes of your games. We can put a number to how predominately skill is determining the outcome of your game. We follow that up with how much skill is required by each state to not be considered gambling. Before a player can ever deposit funds into an Arbiter wallet, we verify the user's local regulation does not conflict with your game's amount of skill vs chance in the outcome. **You can make your game and distribute it to your standard distribution channels. We'll make decisions based on your game's predominance rating and the local regulation of each player to get your games in front of the maximum number of players with no manual effort on your end.**

# Getting Started

Before digging into the details below, spend 2 minutes reading the [Classes](/#classes) section. It will get you familiar with the core classes you will be interacting with.

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

# API Reference

## Response Objects


```python

# Example response from https://www.arbiter.me/api/v1/wallet/
{
    "success": true,
    "wallet": {
        "deposit_address": "1Mdx1V81LJeyZk6yBizRny6KXxyMTXHGpw",
        "balance": "0"
    }
}
```

All APIs return json with the following keys:

Key | Type |  Description
------- | ------- | -------
success | Boolean | Whether or not the requested action was performed.
OBJECT | dictionary | A dictionary containing the relavant object being queried or edited. This key will be the name of object type (ie: user, wallet, jackpot, etc).
errors | array | An array of errors (if any errors occurred).

## Initialize

```python
import requests

r = requests.get('https://www.arbiter.me/api/v1/user/initialize')

r.json()
{
    "success": true,
    "user": {
        "id": "d8b50f95c8a24f24a7c64c9d3d5dde5f",
        "token": "3d2fcd21dcd22ae1d64b799c486a959aeee42fbb",
        "claim_account_url": "https://www.arbiter.me/api/v1/user/40628a4750f74b7a9e1827812e7af815/f80819ef573f699c2723b0c15f1c24bf704ae8a5ef5363083434831bed36c518",
        "is_verified": false,
        "username": "anonymous"
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
username | string | Display name of this user. If they have not created an account using the claim_url, this will be `anonymous`
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
headers = {'Authorization': 'Token ' + user_token + '::' + api_key}
r = requests.post(url)

r.json()
{
    success: True
}
```

Before a user can participate in a wager, we need to confirm that the user is over 18, their local jurisdiction allows skill based betting online, and they need to agree to the [Arbiter Terms of Service](https://www.arbiter.me/terms/). Display the exact text below with a confirmation button that posts to the the confirmation API.

<aside class="notice">
    By clicking the confirmation button below, you agreeing to the [Arbiter Terms of Service](https://www.arbiter.me/terms/) and confirming that you are at least 18 years of age.
</aside>

### HTTP Request

`POST https://www.arbiter.me/api/v1/user/<USER ID>/verify`

### Returns

Key | Type | Description
---- | ---- | ----
success | boolean | Whether or not the user's account was successfully verified

## Query User
## Query Wallet
## Deposit
## Request Jackpot
## Place Bet
## Report Score
## Cash Out

# Unity SDK

TODO: Flush out SDK documentation

## Initialize
## Query User
## Query Wallet
## Deposit
## Request Jackpot
## Place Bet
## Report Score
## Query Jackpot
## Cash Out

