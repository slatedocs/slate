# Issue traceability

## GET all requirements linked to a specific issue

This endpoint retrieves all requirements linked to a specific issue

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

## Replace linked requirements for a specific issue

This endpoint replaces linked requirements for a specific issue

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Replace requirements linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
## Add linked requirements to a specific issue

This endpoint adds linked requirements to a specific issue

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Add requirements linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
## Delete linked requirements for a specific issue

This endpoint removes linked requirements for a specific issue

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Remove requirements linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```

## GET all issues linked to a specific issue

This endpoint retrieves all issues linked to a specific issue

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

## Replace linked issues for a specific issue

This endpoint replaces linked issues for a specific issue

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Replace issues linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
## Add linked issues to a specific issue

This endpoint adds linked issues to a specific issue

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Add issues linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
## Delete linked issues for a specific issue

This endpoint removes linked issues for a specific issue

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

```shell
# Some request examples:

# Remove issues linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
