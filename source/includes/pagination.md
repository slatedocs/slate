# Pagination

The "list" request for all top level API resources are paginated.

### Query parameters


&nbsp; | &nbsp;
------ | -----
limit | <strong>optional</strong> A limit on the number of objects returned. (default : 20, max: 250)
offset | <strong>optional</strong> A cursor for use in pagination. 


### List response format

&nbsp; | &nbsp;
------ | -----
objects | <strong>list</strong> Requested resource data
meta.total | <strong>number</strong> Total count
meta.limit | <strong>number</strong> Limit 
meta.offset | <strong>number</strong> Offset 
