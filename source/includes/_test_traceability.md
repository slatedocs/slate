# Test traceability

## GET all requirements linked to a specific test

This endpoint retrieves all requirements linked to a specific test

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

### PAT Support
Supported - if the user has the permissions to view Tests

## Replace linked requirements for a specific test
```shell
# Some request examples:

# Replace requirements linked to the test in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/tests/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
This endpoint replaces linked requirements for a specific test

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests


## Link requirements to a specific test

```shell
# Some request examples:

# Add requirements linked to the test in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/tests/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
This endpoint links requirements to a specific test

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests


## Delete linked requirements for a specific test

```shell
# Some request examples:

# Remove requirements linked to the test in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/tests/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
This endpoint removes linked requirements for a specific test

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests
