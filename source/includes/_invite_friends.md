# Invite APIs
Requires authentication

## Send Invitation

Sends an invitation to a given email.

```APIs
POST https://dev.zoomsymbols.com/api/user/sendInvitation
```

> Parameters

```json
{
			"title": "test",
			"message": "testMessage",
			"to": "dev@zoomsymbols.com"
}
```

> Response

```json
{
    "result": [
        {
            "add_invite_message": ""
        }
    ]
}
```

## Get Invite Message Template

Returns the template for the invite message.

```APIs
GET https://dev.zoomsymbols.com/api/user/getInviteMessageTemplate
```

> Response

```json
{
    result: {
        title: "ZoomSymbols - An awesome financial app!",
        message: "ZoomSymbols - The most comprehensive global financial markets analytics app in the mobile world. We provide multi-asset class analytics with our global coverage of 158+ exchanges, 15 years of full fundamentals, 20+ million economic indicators from 196 countries, 240+ currencies, 28+ key global commodities exchanges and much more. Track global stocks, ETFs, futures, forex, and economic indicators with an in-depth coverage on global symbols including summary view, charts, fundamentals, trend analysis, seasonality, correlations and much more, all available at your fingertips.",
        url: "Checkout at http://zoomsymbols.com",
        dialogTitle: "Invite Friends"
    }
}
```
