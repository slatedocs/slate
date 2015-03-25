#### How to Use Bodhi Query
========
##### Overview 

Bodhi Query is a REST client that helps you be more efficient while working with the Bodhi Cloud API. It allows you to easily retrieve and manipulate data within your individual namespace.

##### Getting Started
The Bodhi Query tool can be accessed at https://tools.bodhi.space/query. You will need your Bodhi Cloud username and password in order to login and begin transfering data.

##### Features
Bodhi Query can be used for the following tasks:

* Create instances of types via POST request
* Delete instances of types via DELETE request
* Update instances of types via PUT request
* Update instance attributes via PATCH request
* Query for instances of types via GET request

The Query request can be modified in the following ways:

* Restrict the attributes of instances returned using the "Field" input
* Restrict the instances returned to key/value matches using the "Where" input
* Sort the instances returned using the "Sort" input
* Limit the number of instances returned using the "Limit" input
* Filter the results by attribute value **post** API request using the "Filter" input

##### How To Use Bodhi Query

###### _Choose an action_

In order to start communicating with your data, you will have to pick an HTTP verb from the action dropdown located on the left of the first toolbar.  The default verb is GET.

![action menu](/images/bq_action.png?raw=true "")

###### _Pick a Type_

Next you need to specify the Type you are interested in retrieving data about. Enter the type name into the input in the middle of the first toolbar. A dropdown will appear to assist you.

![type list](/images/bq_type.png?raw=true "")

###### _Using POST_

If you have chosen Post from the action dropdown and selected a Type to work with; you are ready to start creating instances. Enter JSON into the code box and click send. A successful POST will display a 201 in the response box. See https://api.bodhi.space/apidocs/index.html to learn about the Type schemas.  

![post json](/images/bq_post.png?raw=true "")

###### _Using PUT_

If you have chosen Put from the action dropdown and selected a Type to work with; you are ready to start updating instances. Enter an instance id key (sys_id) into the "Instance" input. Next, enter JSON into the code box and click send. A successful Put will display a 201 in the response box. See https://api.bodhi.space/apidocs/index.html to learn about the Type schemas.

![instance input](/images/bq_instance.png?raw=true "")

###### _Using Patch_

If you have chosen Patch from the action dropdown and selected a Type to work with; you are ready to start updating instance attributes. Enter an instance id key (sys_id) into the "Instance" input. Next, enter JSON into the code box and click send. A successful Put will display a 201 in the response box. The patch JSON syntax is shown below. The "op" key specifies the operation, which include replace, add, and remove.  The "path" key specifies which attribute to change. For example to reach a nested JSON attribute your path would be formatted as such: "/attribute/nested_attribute".  The "value" key specifies the new value. This this key can be removed when using the remove operation. 

![patch json](/images/bq_patch.png?raw=true "")

###### _Using Delete_

If you have chosen Delete from the action dropdown and selected a Type to work with; you are ready to start deleting instances. Enter an instance id key (sys_id) into the "Instance" input and click send. A successful Delete will display a 201 in the response box. 

###### _Querying using GET_

If you have chosen Get from the action dropdown and selected a Type to work with; you are ready to start querying. Click the send button in order to retreive a list of instances.

###### _Restricting Instance Attributes_

To restrict the attributes returned for each instance: simply click the Field input and pick the keys that you would like returned. Click the tags in the input box to remove them. Click send.

![fields selection](/images/bq_fields.png?raw=true "")

###### _Query by Key/Value Pairs_

To restrict the instances returned to only those that have a specific key value match: Enter the attribute into the "Where key" input. Use dot notation for nested attributes (i.e. attribute.nested_attribute). Enter the value you would like to restrict by in the "Where value" input. Click send.

![where input](/images/bq_where.png?raw=true "")

###### _Sorting Queries_

To sort the instances returned: Enter the key that you would like to sort by into the Sort input. Use dot notation for nested attributes (i.e. attribute.nested_attribute). Append ":desc" to the key in order to reverse the sort order. Click send.

![sort input](/images/bq_sort.png?raw=true "")

###### _Limiting Query responses_

To limit the number of instances returned: Enter an amount into the Limit input. Click send. You can use the pagination on the bottom to traverse through subsets of the data equal in size to the number you specified in the limit input.

![limit input](/images/bq_limit.png?raw=true "")

###### _Search Queries_

To search queries for keywords after they have been returned: Enter the search term that you would like to filter by into the Filter input.

![filter input](/images/bq_filter.png?raw=true "")