##How do I Query the Bodhi Cloud APIServer?


###Overview

In order to send queries to the Bodhi Cloud and see results the user doing the query has to minimally have read access to the types they are querying.  For the following examples shown in this document, you must have read access to the Sales type in your namespace.  To query Bodhi Cloud you can use the standard [MongoDB Query Operators](http://docs.mongodb.org/manual/tutorial/query-documents/)

### Adding data
Adding data to your namespace can be done in several ways:

* Installing Bodhi Agent and installing the Compri Agent Application
* Using the [Bodhi Cloud API](https://api.bodhi.space/apidocs/index.html)

Example Employee 
Example Store

along with queries

* Using Bodhi CLI
* User Bodhi Job Engine
* 


For this example we are going to use the Bodhi Cloud API to add some simple data to show how to perform some simple queries: 

* Datetime
* string
* integer
* enumerated type
* currency

### How to formulate your query?
The query is composed of 4 parameters: 

```
where=<any MongoDb Json query>
fields=<list of fields comma separated to display>
paging=limit:<the limit of elements to display by page>,page:<the page number to display>
sort=<fieldname>:<asc or desc>,<fieldname>:<asc or desc>,...
```

```
example:
https://api.bodhi.space/<namespace>/resources/Sales?where="{name:'test'}"&fields=name&paging=limit:5,paging:1&sort=name:asc


```
