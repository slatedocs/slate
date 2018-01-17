## teamCategory object

teamCategory objects have the following attributes:

####id

A unique identifier for this category.

####category

The numeric identifier for the workgroup category to which this team category belongs.

####label

The label for this team category.

### teamCategory.list

<script>tryit('teamCategory.list')</script>

Lists all current team categories.

### teamCategory.create

<script>tryit('teamCategory.create')</script> 

Creates a new team category.

Only five (5) team categories are allowed.

Required parameters:

####category

The numeric identifier for the category.

####label

The label for this category.

Response: On success, the created teamCategory will be returned.

### teamCategory.update

<script>tryit('teamCategory.update')</script> 

Updates the label on a team category.

Required parameters:

####id

The unique identifier for the category.

####label

The new label for this category.

Response: On success, the updated teamCategory will be returned

### teamCategory.delete

<script>tryit('teamCategory.delete')</script> 

Deletes a team category.

Required parameters:

####id

The unique identifier for the category.

Response: On success, an empty results will be returned

