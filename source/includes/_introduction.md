# Introduction

The Rotessa API allows access to the core Rotessa platform. The endpoints allow you to manage customers and transactions in the Rotessa system. Typical use of the API is as follows:

- Obtain access to the API by [generating an API key](#generate-an-api-key).
- [Create a customer](#create-a-customer) for which you would like to withdraw funds.
- For each customer [create a transaction schedule](#create-a-transaction-schedule), which specifies the amount and frequency of fund withdrawals. Transaction schedules generate [financial transactions](#financial-transactions), which are the individual transaction results of a schedule.
- Query the status of your transactions via the [transaction report](#transaction-report) to determine payment success or failure.