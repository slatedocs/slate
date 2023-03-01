# FAQs

## API and Bulk Disbursement

**What are bank maintenance schedules? Will partners be informed?**

Banks often have regular maintenance schedules which differ from one bank to another. These regular maintenance schedules prevent the execution of transactions to the respective recipient bank during the set period of time. To ensure your convenience, we will queue any transaction requests submitted during the maintenance hours and automatically disburse them once the maintenance is over.

**What are the amount limits for disbursements?**

_e-wallet:_ Since each e-wallet provide limits to the amount each user can hold at a time, disbursements made to e-wallet accounts have their respective limits.

| Wallet | Account Type  | Maximum Amount |
| ------ | ------------- | -------------- |
| OVO    | OVO Club      | Rp 2.000.000   |
| OVO    | OVO Premier   | Rp 10.000.000  |
| DANA   | DANA Verified | Rp 2.000.000   |
| DANA   | DANA Premium  | Rp 10.000.000  |
| GoPay  | Unverified    | Rp 2.000.000   |
| GoPay  | Verified      | Rp 10.000.000  |

**What are the minimum Amount for disbursements?**

_e-wallet:_ Since each e-wallet provide limits to the amount each user can hold at a time, disbursements made to e-wallet accounts have their respective limits.

| Wallet  | Minimum Amount |
| ------- | -------------- |
| OVO     | Rp 10.000      |
| DANA    | Rp 10.000      |
| GoPay   | Rp 10.000      |
| Linkaja | Rp 10.000      |

**Is there a cut-off time?**

No, we are available 24/7 including holidays.

**Is there a maximum transaction volume and transaction amount in a day?**

There are no daily limits of how many bulk campaigns can be created and executed. There is also no limit to the number of total transactions per disbursement campaign.

**How many recipient emails can I send the transaction notification to?**

You can send up to 5 emails per transactions with a limit of 255 characters total. For each transaction, simply list out the email recipients.

**What are the supported banks for the disbursement products?**

We support transactions to 100+ banks in Indonesia. Please refer to the bank codes [here](https://api-docs.oyindonesia.com/#disbursement-bank-codes) when using our disbursement products. (Please note that we currently do not support disbursements to Virtual Accounts.)

**Can I specify the "notes" to be reflected in the beneficiary bank account statement?**

Yes. However, we only support notes for these 7 banks: BCA, BNI, BRI, CIMB, DBS, Mandiri, and Permata. However, please note that should there arise unexpected difficulties with the connection to these aforementioned banks, our failover system will not be able to support these notes to be reflected in the beneficiary bank account statement.

**Will the funds accepted from the API VA Aggregator and Payment Link and Invoice products be readily available for disbursement uses?**

Yes. The funds accepted from the API VA Aggregator and Payment Link and Invoice products will be automatically reflected in your OY! balance in real-time, allowing you to use these funds directly for disbursement purposes.

**[Bulk Disbursement Specific] What if the recipient name on the xlsx or CSV file is different from the bank account name? What is the phone number used for?**

As long as the bank account number is valid and not dormant, the transaction will still be executed.

The name and phone number are visible only to the partner and is used for the partner’s own documentation. The name and phone number listed are not used by OY or sent to the recipient.

**[API Disbursement Specific] Are the disbursements performed in real-time?**

Yes. Disbursements executed through our API Disbursement are all performed in real-time.

## API VA Aggregator

**What are the supported banks?**

We currently have 11 available banks for our API VA Aggregator. Please refer to the bank codes [here](https://api-docs.oyindonesia.com/#va-aggregator-bank-code).

**Is the amount received in realtime?**

Yes, all the amount received are in realtime and will be immediately available in your OY! balance.

## Payment Link/Invoice

**What are the possible payment methods for users?**
We support payments via bank transfers, credit card, debit card, and QR code from the following:

* Bank Transfer via Virtual Account: BCA, BNI, BRI, CIMB Niaga, Mandiri, Permata Bank.

* Bank Transfer via Unique Code: BCA

* Credit Card/Debit Card: VISA, Mastercard

* E-Wallet: ShopeePay, DANA, LinkAja, OVO

* QR Code: QRIS

**What are closed and open amounts? What happens when the amount paid by the user is different from the declared amount in the created Payment Links?**

A closed amount is a configuration so that the payment link or invoice can only be paid if the actual declared amount is paid. The user will not be able to pay any amount other than the declared amount.

An opened amount is a configuration so that the payment link or invoice can be paid up to the declared amount (or any, if amount is not declared). If the user pays an amount that is different from the declared amount, the payment link will remain active. The payment link will only reflect a completed status when the full amount is paid in total.


## Payment Routing
**What is the difference between Bank Transfer via Virtual Account and Bank Transfer via Unique Code?**
Bank Transfer via Virtual Account (VA) will generate specific account number destination for each transaction. You can create an open amount or closed amount transaction using VA. Detail explanation of VA can be seen [here](https://docs.oyindonesia.com/#va-aggregator-accepting-payments). You can create VA Transactions via [API Payment Routing](https://docs.oyindonesia.com/#va-aggregator-accepting-payments) or [VA Aggregator](https://docs.oyindonesia.com/#va-aggregator-accepting-payments) 

Bank Transfer via Unique Code generates unique code for each transaction but the account number destination will always be the same. The total amount paid is subtracted by the unique code. For example, your end user wants to paid a transaction of Rp 100.000 and get Rp 100 as the unique code. The payment uses subtraction approach, so your end user will pay a total of Rp 99.900 to complete the payments. Unique Code also have limitations compared to VA, where you can only create unique code transaction during the operational hours (3 AM - 8.30 PM GMT+7). You can create  Unique Code Transaction only via [API Payment Routing](https://docs.oyindonesia.com/#va-aggregator-accepting-payments)