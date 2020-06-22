# Issue traceability

## GET all requirements linked to a specific issue

This endpoint retrieves all requirements linked to a specific issue

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

## Replace linked requirements for a specific issue

```shell
# Request example:

# Replace requirements linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
This endpoint replaces linked requirements for a specific issue

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

## Link requirements to a specific issue
```shell
# Request example:

# Add requirements linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
This endpoint links requirements to a specific issue

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response

## Delete linked requirements for a specific issue
```shell
# Request example:

# Remove requirements linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/requirements.json \
-d '{"data": [{ "id": REQUIREMENT_ID, "type": "requirements" },{ "id": ANOTHER_REQUIREMENT_ID, "type": "requirements" }]}'

```
This endpoint removes linked requirements for a specific issue

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/requirements.json`

You can find at the right area an example of the JSON request and response


## GET all issues linked to a specific issue
This endpoint retrieves all issues linked to a specific issue

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

## Replace linked issues for a specific issue
```shell
# Request example:

# Replace issues linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```

This endpoint replaces linked issues for a specific issue

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response


## Link issues to a specific issue
```shell
# Request example:

# Add issues linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
This endpoint links issues to a specific issue

### HTTP Request

`POST http://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

## Delete linked issues for a specific issue
```shell
# Request example:

# Remove issues linked to the issue in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/issues/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'
```

This endpoint removes linked issues for a specific issue

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response
