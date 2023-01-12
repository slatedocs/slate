Lesion measurements

## Request
```
GET /msk-apim/external/v2/crit/blaze/api/observation
-H Authorization: Bearer {access_token} 
```
### Query Parameters
| Parameters      | Type   | Is Required | Description                   |
| --------------- | ------ | ----------- | ----------------------------- |
| `category`      | string | true        | For lesion data use `imaging` |
| `researchstudy` | string | true        | MSK unique study number       |
| `x-partnerid`   | string | true        | MSK provided partner ID       |

For a list of optional filtering parameters visit the [Searching page](/searching).

### Example Code

## Response

### Field Definitions