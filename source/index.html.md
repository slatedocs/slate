---
title: DYNM

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL
  - javascript: Javascript
  - python: Python
  - php: PHP

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

```shell
curl -X POST \
  https://dynm.herokuapp.com/home-energy \
  -H "Content-type: application/json" \
  -d '{
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
  }'
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
}).then((response) => response.json())
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

data = response.json()
print(data)
```

```php
<?php
  $url = "https://dynm.herokuapp.com/home-energy";
  $ch = curl_init($url);
  $postData = array(
    "number_of_people" => 2,
    "primary_heating_source" => "Electricity",
    "utility_options" => array(
      "natural_gas" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_thousand_cubic_feet" => 1000,
        "value" => 1000
      ),
      "electricity" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_kilowatt" => 1000,
        "green_percentage" => 10,
        "value" => 1000
      ),
      "fuel_oil" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_gallon" => 1000,
        "value" => 1000
      ),
      "propane" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_gallon" => 1000,
        "value" => 1000
      )
    )
  );

  curl_setopt_array($ch, array(
    CURLOPT_POST => TRUE, // set post data to true
    CURLOPT_RETURNTRANSFER => TRUE,
    CURLOPT_POSTFIELDS => json_encode($postData),   // post data
    CURLOPT_HTTPHEADER => array("Content-Type: application/json")
  ));

  $response = curl_exec($ch);
  curl_close ($ch);
  $data = json_decode($response, true); // decode the json response
  var_dump($data);
?>

```

> RESPONSE : <code>200</code>

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

This endpoint deals with home energy.

`POST https://dynm.herokuapp.com/transportation`

# Transportation

> REQUEST

```shell
curl -X POST \
  https://dynm.herokuapp.com/transportation \
  -H "Content-type: application/json" \
  -d '{
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
  }'
```

```javascript
const fetch = require("node-fetch");

const data = {
  current_maintenance: "Do Not Do",
  average_emissions_per_vehicle: 10484,
  vehicles: [
    {
      average_miles_driven: {
        duration: "Per Week",
        value: 23,
      },
      average_gas_mileage: 20,
    },
    {
      average_miles_driven: {
        duration: "Per Week",
        value: 30,
      },
      average_gas_mileage: 30,
    },
  ],
};

fetch("https://dynm.herokuapp.com/transportation", {
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

data = response.json()
print(data)

```

```php
<?php
  $url = "https =>//dynm.herokuapp.com/transportation";
  $ch = curl_init($url);
  $postData = array(
    "current_maintenance" => "Do Not Do",
    "average_emissions_per_vehicle" => 10484,
    "vehicles" => array(
      array(
        "average_miles_driven" => array(
          "duration" => "Per Week",
          "value" => 23
        ),
        "average_gas_mileage" => 20
      ),
      array(
        "average_miles_driven" => array(
          "duration" => "Per Week",
          "value" => 30
        ),
        "average_gas_mileage" => 30
      )
    )
  );

  curl_setopt_array($ch, array(
    CURLOPT_POST => TRUE, // set post data to true
    CURLOPT_RETURNTRANSFER => TRUE,
    CURLOPT_POSTFIELDS => json_encode($postData),   // post data
    CURLOPT_HTTPHEADER => array("Content-Type: application/json")
  ));

  $response = curl_exec($ch);
  curl_close ($ch);
  $data = json_decode($response, true); // decode the json response
  var_dump(json_encode($postData));
?>

```

> RESPONSE : <code>200</code>

```json
{
  "total_exhaust": 2310,
  "usa_average": 20968
}
```

This endpoint deals with transportation.

`POST https://dynm.herokuapp.com/transportation`

# Waste

> REQUEST

```shell
curl -X POST \
  https://dynm.herokuapp.com/waste \
  -H "Content-type: application/json" \
  -d '{
    "average_waste_per_person": 692,
    "number_of_people": 2,
    "materials_recycled": {
      "metal": true,
      "plastic": true,
      "glass": false,
      "newspaper": false,
      "magazines": false
    }
  }'

```

```javascript
const fetch = require("node-fetch");

const data = {
  average_waste_per_person: 692,
  number_of_people: 2,
  materials_recycled: {
    metal: true,
    plastic: true,
    glass: false,
    newspaper: false,
    magazines: false,
  },
};

fetch("https://dynm.herokuapp.com/waste", {
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

data = response.json()
print(data)
```

```php
<?php
  $url = "https://dynm.herokuapp.com/waste";
  $ch = curl_init($url);
  $postData = array(
    'average_waste_per_person' => 692,
    'number_of_people' => 2,
    'materials_recycled' => array(
      'metal' => true,
      'plastic' => true,
      'glass' => false,
      'newspaper' => false,
      'magazines' => false
    )
  );

  curl_setopt_array($ch, array(
    CURLOPT_POST => TRUE, // set post data to true
    CURLOPT_RETURNTRANSFER => TRUE,
    CURLOPT_POSTFIELDS => json_encode($postData),   // post data
    CURLOPT_HTTPHEADER => array("Content-Type: application/json")
  ));

  $response = curl_exec($ch);
  curl_close ($ch);
  $data = json_decode($response, true); // decode the json response
  var_dump($data)
?>
```

> RESPONSE : <code>200</code>

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

This endpoint deals with waste.

`POST https://dynm.herokuapp.com/waste`
