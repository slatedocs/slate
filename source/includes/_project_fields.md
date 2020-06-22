# Project Fields

## GET all SYSTEM & CUSTOM fields in your project

This endpoint retrieves all fields.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/fields.json`

### Query Parameters - [pagination](#pagination)

Here's the example of the JSON request and response that you may get when submitting a GET request

Remember, you can see examples in the dark area to the right.

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/fields.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/fields.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:

```json
{
     "data": [
    {
      "id": 88769,
        "type": "SystemField",
         "name": "Status",
        "field_format": "list",
        "possible_values": null,
        "uniq_name": "issue_status",
        "entities": [
            "Issue"
    ]
    },
{
      "id": 48633,
      "type": "CustomField",
      "name": "Test Level",
      "field_format": "list",
      "possible_values": [
              "Blah",
              "Regression",
              "Relieve",
              "Sanity"
    ],
      "uniq_name": "___f_48633",
      "entities": [
              "TestSet",
              "Test"
     ]
    },
  {
       "id": 48634,
       "type": "CustomField",
       "name": "Testing Environment",
       "field_format": "list",
       "possible_values": [
               "Production",
               "Testing Lab",
               "Customer"
    ],
      "uniq_name": "___f_48634",
      "entities": [
                "Issue"
       ]
    },
  {
        "id": 48635,
        "type": "CustomField",
        "name": "Testing Project",
        "field_format": "linkedlist",
        "possible_values": {
        "Production": [
                "ASIA",
                "EUROPE",
                "AMERICA"
       ],
        "Testing Lab": [
                "Lab1",
                "Lab2",
                "Lab3"
     ],
        "Customer": [
                "ABC",
                "CBS",
                "NBC",
                "CNN"
    ],
      "": []
   },
       "uniq_name": "___f_48635",
       "entities": [
               "Issue"
     ]
   }
]
