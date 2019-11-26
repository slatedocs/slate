# Requirement traceability

## GET all tests linked to a specific requirement

This endpoint retrieves all tests linked to a specific requirement

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

## Replace linked tests for a specific requirement

This endpoint replaces linked tests for a specific requirement

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Replace tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/tests.json \
-d '{"data": [{ "id": TEST_ID, "type": "tests" },{ "id": ANOTHER_TEST_ID, "type": "tests" }]}'

```
## Add linked tests to a specific requirement

This endpoint adds linked tests for a specific requirement

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Add tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/tests.json \
-d '{"data": [{ "id": TEST_ID, "type": "tests" },{ "id": ANOTHER_TEST_ID, "type": "tests" }]}'

```
## Delete linked tests for a specific requirement

This endpoint removes linked tests for a specific requirement

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Remove tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/tests.json \
-d '{"data": [{ "id": TEST_ID, "type": "tests" },{ "id": ANOTHER_TEST_ID, "type": "tests" }]}'

```

## GET all issues linked to a specific requirement

This endpoint retrieves all issues linked to a specific requirement

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

## Replace linked issues for a specific requirement

This endpoint replaces linked issues for a specific requirement

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Replace tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```

## Add linked issues to a specific requirement

This endpoint adds linked issues for a specific requirement

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Add tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
## Delete linked issues for a specific requirement

This endpoint removes linked issues for a specific requirement

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Remove tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
