

# Info APIs

Does not require authentication.

## Get Version

Returns the backend version.

```APIs
GET https://dev.zoomsymbols.com/api/info/version
```

> Response

```json
{
  "result": {
      "backend_version": "1.0.17"
      }
}
```

## Get Mobile Help Screen Items

Returns items displayed in help screen.

```APIs
GET https://dev.zoomsymbols.com/api/info/getMobileHelpScreenItems
```

> Response

```json
{
  "result": [{
      "item_code": "support",
      "item_name": "Support",
      "children": [{
               "item_code": "contact_us",
               "item_name": "Contact Us"
	   },
	   {
		      "item_code": "feedback",
		      "item_name": "Feedback"
           }
        ] 
     }]
}
```

## Get Mobile Help Screen Item Content

Returns the content of a given help screen item code.

```APIs
GET https://dev.zoomsymbols.com/api/info/getMobileHelpScreenItemContent
```

> Parameters

```
code: code_name
```

> Response

```json
{
	"result": "This is the Feedback - ..."
}
```
