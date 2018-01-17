## teamCategoryItem object

teamCategoryItem objects have the following attributes:

####id

A unique identifier for this category item.

####category

The numeric identifier for the category of this item.

####name

The name for this category item.

### teamCategoryItem.list

<script>tryit('teamCategoryItem.list')</script> 

Lists all items associated with a team category. Uses [pagination](#pagination).

Optional parameters: `select` object with a `category` attribute identifying a single numerical category of items to be returned. E.g. `
{select:{category:3}}`

### teamCategoryItem.add

<script>tryit('teamCategoryItem.add')</script> 

Creates a new item under a team category.

Required parameters:

####id

A unique identifier for this category item.

####name

The name for this category item.

Response: On success, the created teamCategoryItem will be returned.

### teamCategoryItem.update

<script>tryit('teamCategoryItem.update')</script> 

Updates the name of an item within a team category.

Required parameters:

Required parameters:

####id

A unique identifier for this category item.

####name

The name for this category item.

Response: On success, the updated teamCategoryItem will be returned

### teamCategoryItem.delete

<script>tryit('teamCategoryItem.delete')</script> 

Deletes an item within a team category.

Required parameters:

####id

The unique identifier for the category item.

Response: On success, an empty results will be returned

