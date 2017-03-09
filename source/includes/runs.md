# Runs

## GET all runs in your project

This endpoint retrieves all runs.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/1/runs.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
set_filter_id | the testSet's filter id -> showing instances of TestSets which are in this filter |
set_filter_user_id | if filter uses current_user criteria in it, you should provide which is the this user ([list of user ids](#users)) |
test_id | filter instances that are related to a certain test_id (NOT display_id!) |
set_ids | filter by TestSets ids, separated by comma (NOT display_id) |
name_exact | filter by instance name exact match; case sensitive! |
name_like | filter by instance name: case insensitive, phrase can be inside the name |
display_id | filter instances based on an instance display_id (can be used to convert display to system id) |
