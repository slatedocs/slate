--- 

title: Swagger Petstore 

language_tabs: 
   - shell 

toc_footers: 
   - <a href='#'>Sign Up for a Developer Key</a> 
   - <a href='https://github.com/lavkumarv'>Documentation Powered by lav</a> 

includes: 
   - errors 

search: true 

--- 

# Introduction 

This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters. 

**Version:** 1.0.0 

[Find out more about Swagger](http://swagger.io) 

# Authentication 

|oauth2|*OAuth 2.0*|
|---|---| 

|apiKey|*API Key*|
|---|---| 

# /PET
## ***POST*** 

**Summary:** Add a new pet to the store

**Description:** 

### HTTP Request 
`***POST*** /pet` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| body | body | Pet object that needs to be added to the store | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 405 | Invalid input |

## ***PUT*** 

**Summary:** Update an existing pet

**Description:** 

### HTTP Request 
`***PUT*** /pet` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| body | body | Pet object that needs to be added to the store | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 400 | Invalid ID supplied |
| 404 | Pet not found |
| 405 | Validation exception |

# /PET/FINDBYSTATUS
## ***GET*** 

**Summary:** Finds Pets by status

**Description:** Multiple status values can be provided with comma separated strings

### HTTP Request 
`***GET*** /pet/findByStatus` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| status | query | Status values that need to be considered for filter | Yes | array |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |
| 400 | Invalid status value |

# /PET/FINDBYTAGS
## ***GET*** 

**Summary:** Finds Pets by tags

**Description:** Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.

### HTTP Request 
`***GET*** /pet/findByTags` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| tags | query | Tags to filter by | Yes | array |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |
| 400 | Invalid tag value |

# /PET/{PETID}
## ***GET*** 

**Summary:** Find pet by ID

**Description:** Returns a single pet

### HTTP Request 
`***GET*** /pet/{petId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| petId | path | ID of pet to return | Yes | long |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |
| 400 | Invalid ID supplied |
| 404 | Pet not found |

## ***POST*** 

**Summary:** Updates a pet in the store with form data

**Description:** 

### HTTP Request 
`***POST*** /pet/{petId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| petId | path | ID of pet that needs to be updated | Yes | long |
| name | formData | Updated name of the pet | No | string |
| status | formData | Updated status of the pet | No | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 405 | Invalid input |

## ***DELETE*** 

**Summary:** Deletes a pet

**Description:** 

### HTTP Request 
`***DELETE*** /pet/{petId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| api_key | header |  | No | string |
| petId | path | Pet id to delete | Yes | long |

**Responses**

| Code | Description |
| ---- | ----------- |
| 400 | Invalid ID supplied |
| 404 | Pet not found |

# /PET/{PETID}/UPLOADIMAGE
## ***POST*** 

**Summary:** uploads an image

**Description:** 

### HTTP Request 
`***POST*** /pet/{petId}/uploadImage` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| petId | path | ID of pet to update | Yes | long |
| additionalMetadata | formData | Additional data to pass to server | No | string |
| file | formData | file to upload | No | file |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |

# /STORE/INVENTORY
## ***GET*** 

**Summary:** Returns pet inventories by status

**Description:** Returns a map of status codes to quantities

### HTTP Request 
`***GET*** /store/inventory` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |

# /STORE/ORDER
## ***POST*** 

**Summary:** Place an order for a pet

**Description:** 

### HTTP Request 
`***POST*** /store/order` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| body | body | order placed for purchasing the pet | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |
| 400 | Invalid Order |

# /STORE/ORDER/{ORDERID}
## ***GET*** 

**Summary:** Find purchase order by ID

**Description:** For valid response try integer IDs with value >= 1 and <= 10. Other values will generated exceptions

### HTTP Request 
`***GET*** /store/order/{orderId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| orderId | path | ID of pet that needs to be fetched | Yes | long |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |
| 400 | Invalid ID supplied |
| 404 | Order not found |

## ***DELETE*** 

**Summary:** Delete purchase order by ID

**Description:** For valid response try integer IDs with positive integer value. Negative or non-integer values will generate API errors

### HTTP Request 
`***DELETE*** /store/order/{orderId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| orderId | path | ID of the order that needs to be deleted | Yes | long |

**Responses**

| Code | Description |
| ---- | ----------- |
| 400 | Invalid ID supplied |
| 404 | Order not found |

# /USER
## ***POST*** 

**Summary:** Create user

**Description:** This can only be done by the logged in user.

### HTTP Request 
`***POST*** /user` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| body | body | Created user object | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| default | successful operation |

# /USER/CREATEWITHARRAY
## ***POST*** 

**Summary:** Creates list of users with given input array

**Description:** 

### HTTP Request 
`***POST*** /user/createWithArray` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| body | body | List of user object | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| default | successful operation |

# /USER/CREATEWITHLIST
## ***POST*** 

**Summary:** Creates list of users with given input array

**Description:** 

### HTTP Request 
`***POST*** /user/createWithList` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| body | body | List of user object | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| default | successful operation |

# /USER/LOGIN
## ***GET*** 

**Summary:** Logs user into the system

**Description:** 

### HTTP Request 
`***GET*** /user/login` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| username | query | The user name for login | Yes | string |
| password | query | The password for login in clear text | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |
| 400 | Invalid username/password supplied |

# /USER/LOGOUT
## ***GET*** 

**Summary:** Logs out current logged in user session

**Description:** 

### HTTP Request 
`***GET*** /user/logout` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

**Responses**

| Code | Description |
| ---- | ----------- |
| default | successful operation |

# /USER/{USERNAME}
## ***GET*** 

**Summary:** Get user by user name

**Description:** 

### HTTP Request 
`***GET*** /user/{username}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| username | path | The name that needs to be fetched. Use user1 for testing.  | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |
| 400 | Invalid username supplied |
| 404 | User not found |

## ***PUT*** 

**Summary:** Updated user

**Description:** This can only be done by the logged in user.

### HTTP Request 
`***PUT*** /user/{username}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| username | path | name that need to be updated | Yes | string |
| body | body | Updated user object | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 400 | Invalid user supplied |
| 404 | User not found |

## ***DELETE*** 

**Summary:** Delete user

**Description:** This can only be done by the logged in user.

### HTTP Request 
`***DELETE*** /user/{username}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| username | path | The name that needs to be deleted | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 400 | Invalid username supplied |
| 404 | User not found |

<!-- Converted with the swagger-to-slate https://github.com/lavkumarv/swagger-to-slate -->
