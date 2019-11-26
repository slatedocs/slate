# Test traceability

## GET all requirements linked to a specific test

This endpoint retrieves all requirements linked to a specific test

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

## Replace linked requirements for a specific test

This endpoint replaces linked requirements for a specific test

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Replace requirements linked to the test in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/tests/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
## Add linked requirements to a specific test

This endpoint adds linked requirements to a specific test

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Add requirements linked to the test in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/tests/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
## Delete linked requirements for a specific test

This endpoint removes linked requirements for a specific test

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Remove requirements linked to the test in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/tests/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
