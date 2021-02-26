---
title: DYNM

language_tabs: # must be one of https://git.io/vQNgJ
  - json: json
  - javascript: javascript
  - python: python
  - PHP: PHP

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

This API.......

HOST: [https://dynm.herokuapp.com/](https://dynm.herokuapp.com/).

This API documentation page was created with [Slate](https://github.com/slatedocs/slate).

# Home Energy

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "number_of_people": 2,
  "primary_heating_source": "Electricity",
  "utility_options": {
    "natural_gas": {
      "unit_of_measurement": "Dollars",
      "average_price_per_thousand_cubic_feet": 1000,
      "value": 1000
    },
    "electricity": {
      "unit_of_measurement": "Dollars",
      "average_price_per_kilowatt": 1000,
      "green_percentage": 10,
      "value": 1000
    },
    "fuel_oil": {
      "unit_of_measurement": "Dollars",
      "average_price_per_gallon": 1000,
      "value": 1000
    },
    "propane": {
      "unit_of_measurement": "Dollars",
      "average_price_per_gallon": 1000,
      "value": 1000
    }
  }
}
```

```javascript
const fetch = require("node-fetch");

const data = {
  number_of_people: 2,
  primary_heating_source: "Electricity",
  utility_options: {
    natural_gas: {
      unit_of_measurement: "Dollars",
      average_price_per_thousand_cubic_feet: 1000,
      value: 1000,
    },
    electricity: {
      unit_of_measurement: "Dollars",
      average_price_per_kilowatt: 1000,
      green_percentage: 10,
      value: 1000,
    },
    fuel_oil: {
      unit_of_measurement: "Dollars",
      average_price_per_gallon: 1000,
      value: 1000,
    },
    propane: {
      unit_of_measurement: "Dollars",
      average_price_per_gallon: 1000,
      value: 1000,
    },
  },
};

fetch("https://dynm.herokuapp.com/home-energy", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify(data),
})
  .then((response) => response.json())
  .then((data) => {
    console.log("Success:", data);
  })
  .catch((error) => {
    console.error("Error:", error);
  });
```

```python
import requests
import json

url = "https://dynm.herokuapp.com/home-energy"

payload = {
    "number_of_people": 2,
    "primary_heating_source": "Electricity",
    "utility_options": {
        "natural_gas": {
            "unit_of_measurement": "Dollars",
            "average_price_per_thousand_cubic_feet": 1000,
            "value": 1000
        },
        "electricity": {
            "unit_of_measurement": "Dollars",
            "average_price_per_kilowatt": 1000,
            "green_percentage": 10,
            "value": 1000
        },
        "fuel_oil": {
            "unit_of_measurement": "Dollars",
            "average_price_per_gallon": 1000,
            "value": 1000
        },
        "propane": {
            "unit_of_measurement": "Dollars",
            "average_price_per_gallon": 1000,
            "value": 1000
        }
    }
}

headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers, data=json.dumps(payload))

print(response.text)

```

```php

```

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "total_emissions": 1866,
  "utility_emissions": {
    "natural_gas": 1435,
    "electricity": 11,
    "fuel_oil": 271,
    "propane": 149
  },
  "invalid": []
}
```

```javascript
Success: {
  total_emissions: 1866,
  utility_emissions: { natural_gas: 1435, electricity: 11, fuel_oil: 271, propane: 149 },
  invalid: []
}
```

```python
{"total_emissions":1866,"utility_emissions":{"natural_gas":1435,"electricity":11,"fuel_oil":271,"propane":149},"invalid":[]}
```

```PHP

```

This endpoint deals with home energy.

### EndPoint

POST/home-energy

### HTTP Request

`POST https://dynm.herokuapp.com/home-energy`

# Transportation

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "current_maintenance": "Do Not Do",
  "average_emissions_per_vehicle": 10484,
  "vehicles": [
    {
      "average_miles_driven": {
        "duration": "Per Week",
        "value": 23
      },
      "average_gas_mileage": 20
    },
    {
      "average_miles_driven": {
        "duration": "Per Week",
        "value": 30
      },
      "average_gas_mileage": 30
    }
  ]
}
```

```javascript

```

```python
import requests
import json

url = "https://dynm.herokuapp.com/transportation"

payload={
  "current_maintenance": "Do Not Do",
  "average_emissions_per_vehicle": 10484,
  "vehicles": [{
    "average_miles_driven": {
      "duration": "Per Week",
      "value": 23
    },
    "average_gas_mileage": 20
  },
  {
    "average_miles_driven": {
      "duration": "Per Week",
      "value": 30
    },
    "average_gas_mileage": 30
  }]
}

headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers, data=json.dumps(payload))

print(response.text)

```

```PHP

```

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "total_exhaust": 2310,
  "usa_average": 20968
}
```

```javascript

```

```python
{"total_exhaust":2310,"usa_average":20968}
```

```PHP

```

This endpoint deals with transportation.

### EndPoint

POST/transportation

### HTTP Request

`POST https://dynm.herokuapp.com/transportation`

# Waste

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "average_waste_per_person": 692,
  "number_of_people": 2,
  "materials_recycled": {
    "metal": true,
    "plastic": true,
    "glass": false,
    "newspaper": false,
    "magazines": false
  }
}
```

```javascript

```

```python
import requests
import json

url = "https://dynm.herokuapp.com/waste"

payload={
  "average_waste_per_person": 692,
  "number_of_people": 2,
  "materials_recycled": {
    "metal": true,
    "plastic": true,
    "glass": false,
    "newspaper": false,
    "magazines": false
  }
}

headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers, data=json.dumps(payload))

print(response.text)


```

```PHP

```

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "total_emissions_after_recycling": 1134,
  "total_recycled": 250,
  "usa_average": 1384,
  "waste_reduction": {
    "metal": 179,
    "plastic": 71
  },
  "invalid_inputs": []
}
```

```javascript

```

```python
{"total_emissions_after_recycling":1134,"total_recycled":250,"usa_average":1384,"waste_reduction":{"metal":179,"plastic":71},"invalid_inputs":[]}
```

```PHP

```

This endpoint deals with waste.

### EndPoint

POST/waste

### HTTP Request

`POST https://dynm.herokuapp.com/waste`
