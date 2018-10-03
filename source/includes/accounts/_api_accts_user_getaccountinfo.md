## GetAccountInfo

**Category:** User<br />
**Permissions:** Operator, Trading, AccountReadOnly<br />
**Call Type:** Synchronous

Returns detailed information about one specific account and existing on a specific Order Management System.

### Request

```json
{
    "omsId":0,
    "accountId":0,
    "accountHandle":""
}
```

| Key           | Value                                                        |
| ------------- | ------------------------------------------------------------ |
| omsId         | **integer.** The ID of the Order Management System on which the account exists. |
| accountId     | **integer.** The ID of the account on the Order Management System for which information will be returned. |
| accountHandle | **string.** *accountHandle* is a unique user-assigned name that is checked at create time by the Order Management System. Alternate to Account ID. |

### Response

```json
{
    "omsid":0,
    "accountId":0,
    "accountName":"",
    "accountHandle":"",
    "firmId":"",
    "firmName":"",
    "accountType": {
     	"Options": [
      	"Asset", // 0 
      	"Liability", // 1
      	"ProfitLoss" // 2
    	] 
 	 },
    "feeGroupID":0,
    "parentID":0,
    "riskType": {
     	"Options": [
     	 "Unknown", // 0
     	 "Normal", // 1
     	 "NoRiskCheck", // 2
      	 "NoTrading" // 3
    	] 
  	},
    "verificationLevel":0,
    "feeProductType": {
     	"Options": [
      	"BaseProduct", // 0
      	"SingleProduct" // 1
    	] 
  	},
    "feeProduct":0,
    "refererId":0,
    "loyaltyProductId":0,
    "loyaltyEnabled":false,
    "marginEnabled":false,
    "liabilityAccountId":0,
    "lendingAccountId":0,
    "profitLossAccountId":0
}

```

| Key                 | Value                                                        |
| ------------------- | ------------------------------------------------------------ |
| omsId               | **integer.** The ID of the Order Management System on which the account resides. |
| accountId           | **integer.** The ID of the account for which information was requested. |
| accountName         | **string.** A non-unique name for the account assigned by the user. |
| accountHandle       | **string.** *accountHandle* is a unique user-assigned name that is checked at create time by the Order Management System to assure its uniqueness. |
| firmId              | **string.** An arbitrary identifier assigned by a trading venue operator to a trading firm as part of the initial company, user, and account set up process. For example, Smith Financial Partners might have the ID SMFP. |
| firmName            | **string.** A longer, non-unique version of the trading firm’s name; for example, Smith Financial Partners. |
| accountType         | **integer.** The type of the account for which information is being returned. One of:<br />Asset (0)<br />Liability (1)<br />ProfitLoss (2)<br /><br />Responses for this string/value pair for Market Participants are almost exclusively Asset. |
| feeGroupID          | **integer.** Defines account attributes relating to how fees are calculated and assessed. Set by trading venue operator. |
| parentID            | **integer.** Reserved for future development.                |
| riskType            | **integer.** One of:<br />Unkown (0) (an error condition)<br />Normal (1)<br />NoRiskCheck (2)<br />NoTrading (3)<br /><br />Returns Normal for virtually all market participants. Other types indicate account configurations assignable by the trading venue operator. |
| verificationLevel   | **integer.** Verification level limits the amounts of deposits and withdrawals. It is defined by and set by the trading venue operator for each account and is part of the KYC ("Know Your Customer") process, which may be automated or manual. An account can earn a higher Verification Level over time. |
| feeProductType      | **string.** One of:<br />BaseProduct<br />SingleProduct<br /><br />Trading fees may be charged by a trading venue operator. (Withdrawal fees may also be charged, but that is a separate setting dependent on product and instrument.) This value shows whether fees for this account’s trades are charged in the product being traded (BaseProduct, for example BitCoin) or whether the account has a preferred fee-paying product (SingleProduct, for example USD) to use in all cases and regardless of product being traded. |
| feeProduct          | **integer.** The ID of the preferred fee product, if any. Defaults to 0. |
| refererId           | **integer.** Captures the ID of the entity who referred this account to the trading venue, usually captured for marketing purposes. |
| loyaltyProductId    | **integer.** The Loyalty Token is a parallel fee structure that replaces the general set of transaction fees. An exchange can promote activity on a specific cryptocurrency token by offering discounted transaction fees denominated in that token to customers who choose that fee structure. This key is the ID of the loyalty product chosen by the Exchange. There can be one Loyalty Token per OMS. |
| loyaltyEnabled      | **Boolean.** If *true*, this account has accepted the Loyalty Token fee structure. If *false*, the account has not accepted it. The default setting is *false*. |
| marginEnabled       | **Boolean.** If *true*, this account can trade on margin. If *false*, the account cannot trade on margin. The default is *false.* |
| liabilityAccountId  | **integer.** The ID of the liability account associated with the account named in the *accountId* key. A liability account is necessary for this account to trade on margin. Used internally. |
| lendingAccountId    | **integer.** The ID of the lending account associated with the account named in the *accountId* key. A lending account is necessary for this account to trade on margin. Used internally. |
| profitLossAccountId | **integer.** The ID of the profit-and-loss account associated with the account named in the *accountId* key. A profit-and-loss account is necessary for this account to trade on margin. Used internally. |
|                     |                                                              |


