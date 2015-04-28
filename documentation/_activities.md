# Activities
*Available modes of operation: real-time*

Long-running operations are performed asynchronously. Upon initiating those operations via an API endpoint, activity 
tracking information is returned to the caller, which can be used to query the status of the activity later on. 
Throughout processing, activities may transition through the following states:

* init - The activity is initializing
* queued - The activity is in queue waiting to start/resume
* scheduled - The activity is scheduled for the next available transmission to the trading partner
* generating - The activity is generating X12 transactions
* processing - The activity is processing X12 transactions that have been received
* transmitting - The activity is transmitting X12 transactions to trading partner
* waiting - The activity is waiting on a trading partner Response
* receiving - The activity is receiving X12 transactions from a trading partner
* paused - The activity is paused
* notifying - The activity is notifying the client application about activity results
* stored - The activity has stored uploaded batch transactions for later processing
* canceled - The activity was canceled by the client application
* failed - The activity was unable to process successfully
* Information concerning the activity’s progression through the system is available via the API Dashboard, as well as the endpoints listed below.

Available Activity Endpoints:

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/activities/ | GET | List current activities A query string parameter ‘parent_id’ may also be used with this API to get information about sub-activities that were initiated from a batch file upload.
/activities/{id} | GET | Return detailed information about the specified activity. API applications will receive an activity ID in the API response for all operations that are asynchronous.
/activities/{id} | PUT | Updates an existing activity -- useful for canceling pending activities that a client application no longer wishes to execute

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/activities/
```

```python
```
