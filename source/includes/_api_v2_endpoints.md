## Endpoints

Method			|	Path 											|	Resource 			| Description
------------|---------------------------|---------------|------------------------------
GET 				|/ping											| Ping					| Simple endpoint to check API health
GET					|/forms											|	Form					|
GET 				|/forms/{id}								|	Form					|
GET					|/webhooks									|	Webhook				|
POST				|/webhooks									|	Webhook 			|
GET					|/webhooks/{id}							| Webhook				|
PUT					|/webhooks/{id}							| Webhook				|
DELETE			|/webhooks/{id}							|	Webhook				|
GET					|/webhooks/{id}	/logs				| Webhook Log		|
GET					|/webhooks/{webhookID}/logs/{id}						| Webhook Log		|
POST				|/webhooks/{webhookID}/resend/{logID}/			| Webhook Log		|
GET					|/search/orders/{id}				|	Order					|
GET					|/search/orders							|	Order					| Required params: product
GET					|/search/transactions/{id}	| Transaction		|
GET					|/search/transactions				| Transaction		|	Required params: product
GET					|/search/registrants/{id}		| Registrant		|
GET					|/search/registrants				| Registrant		|	Required params: product
GET					|/search/tickets/{id}				| Ticket				|
GET					|/search/tickets						| Ticket				|
GET					|/search/subscriptions/{id}	| Subscription	|
GET					|/search/subscriptions			| Subscription	|	Required params: product
GET					|/coupons/global						| Coupon				|	Required params: product
GET					|/coupons/form/{formID}			|	Coupon				|
GET					|/coupons/{couponID}				|	Coupon				|

[//]: # (PUT 				|/forms/{id}						|	Form					|)
[//]: # (DELETE			|/forms/{id} 						|	Form 					|)
[//]: # (POST 			|/forms									|	Form					|)
