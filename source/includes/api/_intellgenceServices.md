# Intelligence Services
Use number intelligence to block traffic from spammers and fraudsters. This feature is in beta. Early access will begin in Q3. Email signup@bandwidth.com to obtain early access.

## Number Intelligence Properties

| PROPERTY        | DESCRIPTION                                                                                                                                                                                                                                                                                         |
|:----------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| number          | The telephone number in E.164 format. `+13334445555`                                                                                                                                                                                                                                                |
| nationalNumber  | The telephone number in a friendly national format, e.g. (555) 555-5555                                                                                                                                                                                                                             |
| carrier         | The company who provides the service for this number.                                                                                                                                                                                                                                               |
| lineType        | The type of service provided on this number. Options include: `landline`, `fixed_voip`, `non_fixed_voip`, `mobile`,`voicemail`, `tollfree`, `premium`, `other`.                                                                                                                                     |
| reputationScore | Measures the risk of the number being associated with spam / fraudulent behavior. Valid values between 1 - 4.                                                                                                                                                                                       |
| riskType        | Type of risk this number is associated with. Types include `spam`, `risk`, `not_applicable`.                                                                                                                                                                                                        |
| riskCategory    | Category of risk associated with the number. Categories include: `not_spam`, `debt_collector` ,`telemarketer`, `political_call`, `phone_survey`, `phishing,extortion`, `irs_scam`, `tax_scam`, `tech_support_scam`, `vacation_scam`, `lucky_winner_scam`, `scam`, `tollfree_pumping`, `other_spam.` |

## GET intelligenceServices

This resource will provide number intelligence data for the number provided.

| `GET` | /v1/users/{user-id}/intelligenceServices/number/{number} |
|-------|----------------------------------------------------------|

### Supported Parameters

| PARAMETER  | DESCRIPTION                             | MANDATORY |
|:-----------|:----------------------------------------|:----------|
| reputation | Includes number reputation information. | no        |

```shell
curl -v -X GET  https://api.catapult.inetwork.com/v1/users/{user-id}/intelligenceServices/number/15554446666?reputation=true \
  -u {token}:{secret} \
  -H "Content-type: application/json" \
```

> The above command returns JSON structured like this:

 ```
[
	{
		"number":"5554446666",
		"nationalNumber":"+15554446666",
		"carrier": "AT&T Wireless",
		"lineType": "Mobile",
		"reputationScore": "4",
		"riskType": "Spam",
		"riskCategory": "Phishing"
	}
]
```
