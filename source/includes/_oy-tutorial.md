# OY! Dashboard Tutorial

## Login

To be able to login to Dashboard;

1. Make sure the username and password that you input are correct
2. Click 'Request OTP' button and input the OTP in the PIN Authentication field. The OTP will be sent to the email associated with your username.

![Login OTP](images/Login_OTP.jpg)

![Email OTP](images/email_otp.png)

If you tick the 'Remember this device' option, you are not required to input an OTP when you log back in next time. Hence, point 2 is required only when you login for the first time after you create your account.

## Dashboard Analytics

Analytics feature allows you to get some insights about your earning and spending transaction that happened in OY!. With this feature, you can get information about how much money you have spent and how much money you have earned in a time interval. You can see your transaction growth on daily, weekly, or monthly basis. You also can select the time range. You will get some insights about the trend of your business transaction. Therefore, this feature can help you to generate new business decision to grow your business.

![Dashboard Analytics Image](images/dashboard_analytics_new.png)

* You can select which time granularity and time period you want to see you transaction growth with. 
* The increase and decrease indicator will compare your transaction performance from the time period you select vs the previous period. 
* If you put your cursor in a line point, the number of transaction volume will be displayed.

## User Management

If you have a Super Admin role, you are able to add account for your team members and define the role for them.

These are the following steps to add new users;

1.  Login to Dashboard
2.  Go to Accounts -> User Management

![User Management 1](images/user_management_1.png)

3.  Click the 'Create User' button
4.  Fill in the full name, username, email, phone number (optional), and password

![User Management 2](images/user_management_2.png)

5.  Choose the role that you want to assign your team member(s) to. You can choose one from the following available role:

- Admin: Has access to all menu, create and approve bulk disbursement and request, view active feature report, manage user list.
- Sub Account (Approver): Has access to approve disbursement and request, and view active feature report.
- Sub Account (Maker): Has access to create disbursement and request, and view active feature report

Aside from adding new users, a Super Admin is also able to edit and delete their existing users through clicking edit/delete button on the User List table.

## 2-Factor Authentication

To increase the security of your account, you can set up 2-factor Authentication. Currently, the security method that OY provides is through an authenticator app

These are the following steps to set up the 2-factor authentication;

1. Login to Dashboard
2. Go to Accounts -> Authenticator OTP
3. Download Authenticator App in your smartphone (from Play Store/App Store) or PC (you can download an extension for your browser). Examples of the app: Google Authenticator, Microsoft Authenticator, Authy, etc
4. Scan the barcode displayed on your OY Dashboard with your Authenticator App OR enter the setup key displayed next to it on your Authenticator App
5. Please type in the 6-numerical code displayed on your Authenticator App in the 'Authenticator OTP' on OY Dashboard

## Top Up

Top up is used to add balance to your OY account.

Here's how you can access the top-up menu on your dashboard;

1.  Login to Dashboard.
2.  Go to Transaction Report -> Account Statement.
3.  Click the 'How To Top Up' button.

There are 2 ways in which you can top up your OY account:

- Top Up via Virtual Account
  The Virtual Account number information can be found on 'How to Top Up Balance via VA' tab once you click the 'How To Top Up' button. If you choose to top up via VA, the topped up amount will be credited into your account real-time and you do not need to send any manual confirmation to OY

![VA Topup](images/vatopupnobni.png)

- Manual Top Up via Bank Transfer
  Aside from Virtual Account, you can also transfer the top up money to OY's giro account. If you choose to top up via this method, you need to perform a manual confirmation in order that your money can be credited into your account.

After you have completed the fund transfer to OY! Indonesia, you need to perform the following steps;

1. Click the 'Manual Top Up Confirmation' tab on the top-up menu

![Manual Topup](images/manual_topup.png)

2. Fill in the fields with the following information;

| Field Name            | Description                                                                                                                                                                                                                                                                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Amount                | The amount that you have topped up (as per written in the Bukti Transfer)                                                                                                                                                                                                                                                                                           |
| Beneficiary Bank      | A dropdown where you can choose to which bank you have transferred the top up amount to                                                                                                                                                                                                                                                                             |
| Transfer Receipt      | Click the upload button to upload the Bukti Transfer obtained after you have successfully performed the transfer. Can be in PDF, PNG, or JPEG format, with max. file size 10 MB                                                                                                                                                                                     |
| Transfer Receipt Type | Transfer Receipt with Reference Number --> If your uploaded transfer receipt displays the reference number, you need to choose this option. Transfer Receipt without Reference Number --> If your uploaded transfer receipt doesn't display the reference number, you need to choose this option and fill in the date & timestamp according to your Bukti Transfer. |

3. Click 'Submit Now'
4. You will receive a receipt of your transaction in your email, stating that your transaction is currently being processed

![Topup Confirmation Dashboard](images/topup_confirmation_dashboard.png)

![Topup Confirmation Email](images/topup_confirmation_email.png)

5. You will receive an email confirming whether your top up is success or failed

![Success Failed Confirmation](images/success_failed_confirmation.png)

- Top Up using BCA via Unique Code
  Now, we provide you with a new method for BCA. Top-up using BCA with a unique code allows you to top up your balance in a real-time manner. You do not have to confirm manually as we will automatically detect your top-up and reflect it to your balance.

Steps:

1. Click on “BCA Unique Code” tab.
2. Input the amount you want to top up. Note: The operational hour for this method is every day, from 4 AM to 8 PM. Outside those hours, this method will be closed.
3. The minimum amount that we allow for this method is IDR11,000. It is because we will SUBTRACT your amount with the assigned unique code. Please note that the amount that will be reflected in your balance is the full amount you input in this step, not the amount that has been subtracted with the unique code.
4. Confirm your amount.
5. Transfer the exact nominal that appeared on the screen to the bank account stated on the page.
6. After the transaction is successful, the ORIGINAL AMOUNT will be reflected in your balance.

## Withdrawal

When you want to withdraw, do the following steps:

1.  Go to Transaction Report -> Account Statement
2.  Click Withdraw
3.  Fill in the amount that you want to withdraw

![Withdrawal Top Up](images/withdrawal_topup.png)

4.  Choose your withdrawal type. You can pick one from the following options:

    - Instant with admin fee -> This means that your withdrawal will be processed and arrive into your receiving bank real-time. If the amount to be withdrawn is <= IDR 50 million and the receiving banks are BCA, BRI, BNI, Mandiri, Permata, DBS and CIMB Niaga, you can choose this option. You will be charged an admin fee if you choose this option

    - Manual -> This means that your withdrawal will be processed up to 2 business days. If the amount to be withdrawn is > IDR 50 million OR the receiving banks are not BCA, BRI, BNI, Mandiri, Permata, DBS or CIMB Niaga, you have to choose this option. You will NOT be charged an admin fee if you choose this option.

### Setting Up Auto Withdrawal Process

If you want to set up an **Auto Withdrawal** periodically, go to Settings -> Auto Withdrawal.

![Auto Withdrawal](images/auto_withdrawal.png)

Here's how you can configure the auto withdrawal settings;

| Field Name               | Description                                                                                                                                                                                                                                                                                                                                                       |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Auto Withdrawal Schedule | The schedule of your auto withdrawal. Options available: Daily, Weekly, Bi-Weekly, Monthly                                                                                                                                                                                                                                                                        |
| Start Date               | Start date of your auto withdrawal schedule                                                                                                                                                                                                                                                                                                                       |
| Ends                     | Options available: Never -> if the auto withdrawal will go on for an indefinite time, By Date -> if the auto withdrawal will end on a specific date. If you choose this option, you need to fill in the date on which you plan to end the auto withdrawal process                                                                                                 |
| Amount                   | Amount to be automatically withdrawn. Options available: Maximum amount -> Withdraw the maximum available balance, Specified Amount -> custom specified amount. Note: Maximum Amount is recommended for Auto Withdrawal transactions as withdrawals will not be processed if the specified amount is greater than the OY balance when the withdraw scheduler runs |
| Withdrawal Type          | Options available: 1) Instant, or 2) Manual.                                                                                                                                                                                                                                                                                                                      |
| Email                    | An email we will send the notification to. Use (;) between email to differentiate them (Max. 5 emails can be inputted)                                                                                                                                                                                                                                            |

## Transaction Report - Settlement Report

Settlement Report stores the list of transactions corresponding to payment methods that are not settled on a real-time basis (delayed settlement). For example, if for VA BCA the settlement time is H+2, each new VA BCA transaction performed by your customers will appear on the Settlement Report.

To access the Settlement report;

- Login to Dashboard
- Go to Transaction Report -> Settlement Report

![Settlement Report](images/settlement_report.png)

The Settlement Report consists of the following information;

- Total Amount to be Settled Today: This tells you the sum of amount scheduled to be settled to your account statement balance today
- Total Delayed Settlement Amount: This tells you the sum of amount not yet settled to your account statement. (the settlement status is still not SUCCESS)
- The Settlement Transaction List Table

| Field Name             | Description                                                                                                                                                                                                                        | Example                              |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| Transaction Date       | The date on which your customer performs the transaction                                                                                                                                                                           | 11 May 2021                          |
| Transaction Time       | The time at which your customer performs the transaction                                                                                                                                                                           | 17:44:09                             |
| Transaction ID         | A unique transaction ID given by OY                                                                                                                                                                                                | d4b26687-34b9-43d3-9d08-af440bcbaca7 |
| Partner Transaction ID | A unique transaction ID that is assigned by you for a given transaction                                                                                                                                                            | TXID_001                             |
| Product                | The product associated with a given transaction. This will be filled with VIRTUAL_ACCOUNT if the transaction comes from Virtual Account Aggregator product, or PAYMENT_CHECKOUT if the transaction comes from Payment Link product | VIRTUAL_ACCOUNT                      |
| Payment Method         | The payment method associated with a given transaction. Possible values: VA [Bank Name], CARDS, QRIS, EWALLET SHOPEEPAY                                                                                                            | VA BCA                               |
| Transfer Amount        | The transaction amount (before getting deducted with admin fee                                                                                                                                                                     | +Rp 10.000                           |
| Admin Fee              | The admin fee associated with a given transaction                                                                                                                                                                                  | -Rp 1.000                            |
| Total Amount           | The transaction amount that has been deducted with admin fee                                                                                                                                                                       | +9,000                               |
| Settlement Date        | The scheduled settlement date for a given transaction                                                                                                                                                                              | 12 May 2021                          |
| Settlement Time        | The scheduled settlement timestamp for a given transaction                                                                                                                                                                         | 15:00:00                             |
| Settlement Status      | The settlement status for a given transaction. Possible values: WAITING (if the amount is not yet settled to your account statement balance), SUCCESS (if the amount has been settled to your account statement balance).          | SUCCESS                              |

If the Settlement Status of a transaction is still WAITING, it will not yet appear as a row in your Account Statement report and the amount will not yet be added in your Account Statement balance.

If the Settlement Status of a transaction is already SUCCESS, it will appear as a row in your Account Statement report and the amount will be added in your Account Statement balance.

### Callback for Delayed Settlement (Non-Real Time Settlement)

If your settlement is non-real time, for every transaction whose payment method is settled H+>0, you will receive two callbacks with details as follows:

1. 1st Callback -> To be sent after your customer successfully executes the transaction. For example, if your customer executes the transaction on 11 May 2021 at 14:00:00, that is also when we send the 1st Callback to you. In the 1st callback, the settlement status is set to WAITING (because it is not yet settled to your Account Statement balance)
2. 2nd Callback -> To be sent after the settlement status is changed from WAITING into SUCCESS. For example, if the settlement status is changed into SUCCESS on 12 May 2021 at 15:00:00, that is also when we send the 2nd Callback to you. In the 2nd callback, the settlement status is SUCCESS

### Capability to Export and Filter the Settlement Report

Export: You are able to export/download the settlement report in CSV, PDF, and XLSX.

Filter: You are able to filter the settlement report by transaction date (range), product, payment method, settlement date (range), and settlement status

## Notification

You can enable or disable notification settings for disbursement products if you have a super admin or admin role:

1. Login to dashboard https://business.oyindonesia.com/
2. Go to Settings -> Notification
   ![Notif Disbursement - 1  Initial](https://user-images.githubusercontent.com/79620482/126457509-ca20c24b-9277-4be4-943e-801b79806e65.png)

1. Choose whether or not you want notifications enabled or disabled for Bulk, API, or scheduled disbursements.
   a. Enable Notification: Email notification will be sent for pending, failed and success transactions.
   b. Disable Success Notification: email notification will only be sent for pending and failed transactions.
2. The email field: allows the user to add, remove, and edit email notification receivers in this column, which can hold up to three email addresses.
3. Click ‘Save Changes’

## Multi Account Management

Multi Account Management (Children) is a feature that can help you handle complex relations between entities in your business in the Oy! Dashboard. Please contact our Sales or Account Management if you’re interested to use this feature.  
With this feature you will be able to :

1. Have a detailed report on transactions performed by all of children account
2. Distribute balance between the parent account to children account
3. Use child account balance to disburse funds
4. Free admin fee to disburse between related user

### **Registration & Setup**

**Prerequisites**

- Register an account on the [OY! dashboard](https://business.oyindonesia.com/register?)
- Activate your account through the activation link sent via email
- Upgrade your account
- Upgrade request is approved
- Contact our sales or account manager representatives to enable the feature

### **How To Use**

To properly used Multi Account Management, we required several accounts to be linked together. Each account can be used independently, and each account needs to pass the KYB to be used fully.

**A. Link to Child Account**

1. **For Parent Account**

To add a new child as a parent account please 1) Log in to Dashboard with parent credential 2) Go to Child → List of Children

![As Parent - Subs - 1. Initial.png](../images/As_Parent_Subs_1_Initial(2).png)

1. Click the “+ Add Child”
2. Fill in the username for the child you wished to connect. You can find your username from the menu Accounts → User Profile in the Username section
3. Click Add and then if the account is found in the system you can confirm by clicking Connect in the confirmation window

![Image: As Parent - Subs - 6. Add Child - Type Username](../images/As_Parent_Subs_6_Add_Subsidiary_Type_Username.png) ![Image: As Parent - Subs - 7a. Existing Username - Not Connected with any parent](../images/As_Parent_Subs_Existing_Username_Not_Connected_with_any_parent.png)
After confirming, the request will be sent to the respective account to be accepted

1. **For Child Account**

To receive a request from a parent company, please 1) Log in to dashboard with child credential 2) Go to Transaction Report → Account Statement
![Image: As Child - AccState - 2b. Waiting approval](../images/As_Child_AccState_2b_Waiting_approval.png)

1. Click the “Check All request” button that can be found near the top right corner of the page
2. You will see the incoming request to be the parent account for your account, then you can choose which account is the correct account for the parent by click Accept in the respective account and confirmation window

![Image: As Child - AccState - 4b. 2 Requests to connect.png](../images/As_Child_AccState_4b_2_Requests_to_connect.png)![Image: As Child - AccState - 4e. Confirmation to connect](../images/As_Child_AccState_4e_Confirmation_to_connect.png)

3. After successfully received the parent request to connect, you will find your parent information near the top right corner of your page, and you are now connected as a parent-child account

![Image: As Child - AccState - 4h. Success add new head company](../images/As_Child_AccState_4h_Success_add_new_head_company.png)

**B. Topup money to a child account**

After having a working parent-child account, you can transfer money to the child account by accessing the menu Children → List of Children
1. Find the account that you wished to top-up
2. Click the “+ Top Up” button
3. Fill in the amount you wish to top-up
4. Click the “Top Up Now” button to proceed
5. You can also do Top Up by transfer to one of the VA provided (see “How to Top Up Balance via VA”

![Image: As Parent - Subs - 5a. Top Up.png](../images/As_Parent_Subs_5a_Top_Up.png)

**C. Disburse Money using child balance**

In Multi Account Management, you will be able to do disbursement using your children account on their behalf. To do this you could

1. Access the Bulk Disbursement menu and clicking on “+ Create Disbursement” button
2. Select your child balance as a source of fund to do disbursement by selecting “My Subsdiary Balance” and choose the appropriate account.
3. After choosing the balance you could proceed to do disbursement just like regular disbursement

![Image: Choose SoF - 2. Choose SoF subsidiary.png](../images/Choose_SoF_2_Choose_SoF_subsidiary.png) ![Image: Choose SoF - 4. Type or search sub.png](../images/Choose_SoF_4_Type_or_search_sub.png)

**D. Create a payment link on behalf of a child account**

With this feature, you will be able to accept payment from your users through Payment Link created on behalf of a child account. When your users make a successful transaction, the transaction will be recorded in the Child Account's balance. As a parent, you are equipped with the ability to view the Child Account's balance and transaction list anytime through Children → Children Statement. 

The flow will be as follows:

![MAM Payment Link](images/mam_flow_payment_link.png)

Follow the below steps to create a payment link on behalf of a child account:

***Via API***

Hit [API Create Payment Link](https://api-docs.oyindonesia.com/#api-create-payment-link-fund-acceptance) and fill in "child_balance" parameter with the username of a child account that you will set as the balance destination for the transaction. When your users make a successful transaction, the transaction will be recorded in the specified Child Account's balance

***Via Dashboard***
 
1. Click Payment Link -> One-time (if you want to create a one-time payment link) or Click Payment Link -> Reusable (if you want to create a reusable payment link)
2. Click "Create One-Time Link" (for one-time payment link) or click "Create Reusable Link" (for reusable payment link)
3. You will see a pop-up to proceed with the creation process
4. Fill in "Balance Destination" with "My Balance" (if the balance destination of the transaction is your own) or "Child Balance" (if the balance destination of the transaction is your child's). If you select "Child Balance", you will see a dropdown to select a username of the child account. Only 1 child account is currently allowed to be a balance destination
5. If you select "Child Balance", when your users make a successful transaction, the transaction will be recorded in the specified Child Account's balance.

![MAM Payment Link](images/one_time_pc_mam_flow.png)

Preview for one-time payment link

![MAM Payment Link](images/reusable_pc_mam_flow.png)

Preview for reusable payment link

## Xero Integration

Xero is an accounting platform that is mainly used by companies. We have integrated our system to Xero system in order to help you optimize your workflow. By connecting your OY! account to your Xero account, you do not have to login to your Xero account. Means that you do not have to manually record your transaction that happened in OY! to Xero. You will get seamless experience of recording your transaction.

### How does it works?

Once you have connected your Xero account in OY!, any transaction that happened in OY! will be automatically recorded to your Xero tenant account. Upon successful connection, we will trigger creation of new Bank Account, which is OY! Balance Bank Account. Any transaction that happened in OY! will be recorded in that bank account, to SPEND or RECEIVE money transaction. Then, you will be required to map your Xero’s Chart of Account. Mapping your Chart of Accounts will help us to put your transaction into a correct Account.

### Connect your Xero

- Login to your dashboard. In the sidebar, select Integration menu.
![Integration Menu](images/xero/menu.png)

- You will see Xero menu. Click “Connect” to connect your Xero account to OY!. You will be redirected to Xero’s login page. Once you have successfully logged in to Xero, a notification will appear.
![Product List](images/xero/product_list.png)

Preview for Xero's login page
![Xero's Login Page](images/xero/login_xero.png)
![Consent Page](images/xero/consent_page.png)

Preview for Notification
![Notification](images/xero/connect_success_notification.png)

- Upon success connect to Xero, we will create a new Bank Account into your Xero account, named “OY! balance” in which any transaction happened in OY! will be recorded there.
![New Account](images/xero/new_account.png)

### Map your Chart of Account

- Once you have successfully connected to Xero, you will be directed to a page to map your Chart of Account.
![Configure Account Page](images/xero/coa_mapping.png)

- Then, map each product to the corresponding Account. Any transaction using each product will be put into the chart of account you defined in this page. Note: For Bulk Disbursement, you also can define in the create campaign page. 
![Mapping Modal](images/xero/coa_mapping_modal.png)
![Mapping Modal](images/xero/coa_mapping_modal_2.png)

Preview for Mapping in Create Campaign Page
![Mapping in Create Campaign Page](images/xero/bulk_disburse_with_xero.png)

- You can change the CoA mapping anytime as needed, just go to Integration >> Xero >> Configuration.

### Record Transaction to Xero

- Now, your OY! account has been connected to your Xero account and each products has been mapped to its corresponding Chart of Account.
- Any success transaction that happened in OY! will be recorded to Xero with the corresponding Account you defined in Mapping Account menu.
- Transaction in OY! will be treated as SPEND or RECEIVE money transaction in a bank account (OY! Balance). 
- Each transaction will contains of two rows. Row 1 contains of amount of transaction where row 2 contains of admin fee.
- In this version, any tax will be excluded. Means that you will need to input manually the tax invoice you obtained from OY! team to your Xero.
![Recorded Transaction](images/xero/recorded_transaction.png)
![Recorded Transaction](images/xero/recorded_transaction_2.png)

### Disconnected your Xero 

1. To disconnect your Xero account from OY!, open the Integration menu on the sidebar. Then select “Disconnect”.
2. Then, you will be disconnected from Xero. Any transaction that you execute via OY! will not be recorded into Xero.

## Accurate Integration
Accurate is a local accounting platform that is mainly used by companies in Indonesia. We have integrated our system to Accurate system in order to help you optimize your workflow. By connecting your OY! account to your Accurate account, you do not have to log in to your Accurate account. This means that you do not have to manually record your transaction that happened in OY! to Accurate. You will get a seamless experience of recording your transaction.

### How does it works?
Once you have connected your Accurate account in OY!, any transaction that happened in OY! will be automatically recorded to your Accurate account. Upon successful connection, we will trigger the creation of a new Bank Account, which is OY! Balance Bank Account. Transactions that happened in OY! will be recorded in that bank account, to PEMASUKAN or PENGELUARAN module. Then, you will be required to map your Accurate’s Chart of Account (in Accurate, it is Akun Perkiraan). Mapping your Chart of Accounts will help us to put your transaction into the correct Account.

### Connect your Accurate
1. Login to your OY! dashboard. In the sidebar, select the Integration menu.
2. You will see Accurate menu. Click “Connect” to connect your Accurate account to OY!. You will be redirected to Accurate’s login page. 
3. Once you have successfully logged in to Accurate, you will be required to select the database that you want to connect with your OY! account.
4. If the connection process success, a notification will appear.
5. Upon success connecting to Accurate, we will create a new Bank Account into your Accurate account, named “OY! balance” in which any transaction that happened in OY! will be recorded there.
6. In your Accurate Dashboard, you can see that OY! Indonesia app will be listed in the Accurate Store >> Aplikasi Saya menu.
7. Note: A fee of IDR 20k/month will be added to your Accurate billing.

### Map your Chart of Account (Akun Perkiraan)
1. Once you have successfully connected to Accurate, you will be directed to a page to map your Chart of Account (Akun Perkiraan).
2. Then, map each product to the corresponding Account. Any transaction using each product will be put into the Chart of Accounts you defined on this page. Note: For Bulk Disbursement, you also can define on the create campaign page. 
3. You can change the CoA mapping anytime as needed, just go to Integration >> Accurate >> Configuration.

### Record Transaction to Accurate
1. Now, your OY! account has been connected to your Accurate account and each product has been mapped to its corresponding Chart of Account.
2. Any successful transaction that happened in OY! will be recorded to Accurate with the corresponding Account you defined in the Mapping Account menu.
3. Transactions in OY! will be recorded in Pengeluaran or Pemasukan module, under OY! Balance bank account.

### Disconnected your Accurate 
1. To disconnect your Accurate account from OY!, open the Integration menu on the sidebar. Then select “Disconnect”.
2. Then, you will be disconnected from Accurate. Any transaction that you execute via OY! will not be recorded in Accurate.
3. Note: To remove the bill, please make sure you also uninstall OY! app in your Accurate dashboard.