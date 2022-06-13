---
title: DYNM

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL
  - javascript: Javascript
  - python: Python
  - php: PHP

toc_footers:
  - <div>&copy; Dynamhex Inc. 2022</div>

includes:
  - errors

search: true

code_clipboard: true
---

# Carbon Footprint

## Introduction

HOST: [https://dynm-api.herokuapp.com/](https://dynm-api.herokuapp.com/).

### About

Many of our daily activities - such as using electricity, driving a car, or disposing of waste - cause greenhouse gas emissions. Together these emissions make up a household's carbon footprint.

The calculator estimates your footprint in three areas: home energy, transportation and waste. Everyone's carbon footprint is different depending on their location, habits, and personal choices.

For an explanation of the calculator's assumptions and sources, see the [Assumptions and References](https://www.epa.gov/sites/production/files/signpost/cc.html) page.

### How To

You can get a quick, rough estimate of your carbon footprint by using U.S. average amounts. They are provided (along with other useful information) in the "tool tips" throughout the calculator.

For a more accurate estimate, use your own numbers. Gather your utility bills (electricity, natural gas, fuel oil, propane) to calculate your average use over a year. You can find your car's rated fuel efficiency at [fueleconomy.gov](https://fueleconomy.gov/), or you can [calculate your car's actual efficiency](https://www.fueleconomy.gov/mpg/MPG.do?action=calcMPG).

### Adding/Editing conversions

> Adding/Editing conversions

```ruby
NEW_FUEL_BTU_PER_SHORT_TON = 314200
NEW_FUEL_mmBTU_SHORT_TON = 3.142
NEW_FUEL_CO2_PER_SHORT_TON = 6.14
NEW_FUEL_CH4_PER_SHORT_TON = 0.2892
NEW_FUEL_N2O_PER_SHORT_TON = 14.955
```

To edit or add fuel types and their conversion constants, open the [models](https://github.com/sunnysanwar/fuel-co2-conv-api.git) folder where you will see the different files named after the endpoints. Edit the file that is specific to the conversion you want to make.

For example, go to [carbon_dioxide_conversion.rb](https://github.com/sunnysanwar/fuel-co2-conv-api/blob/main/app/models/carbon_dioxide_conversion.rb) to New Fuel to CO2 with the following conversion constants.

<iframe src="images/dynm-updating-conversions.mp4" height="320" width="560" allowfullscreen="" frameborder="0"></iframe>

## Home Energy

> REQUEST

```shell
curl -X POST \
  https://dynm-api.herokuapp.com/carbon-footprint/home-energy \
  -H "Content-type: application/json" \
  -d '{
    "number_of_people": 2,
    "primary_heating_source": "Electricity",
    "utility_options": {
      "natural_gas": {
        "unit_of_measurement": "Dollars",
        "average_price_per_thousand_cubic_feet": 1000,
        "amount": 1000
      },
      "electricity": {
        "unit_of_measurement": "Dollars",
        "average_price_per_kilowatt": 1000,
        "green_percentage": 10,
        "amount": 1000
      },
      "fuel_oil": {
        "unit_of_measurement": "Dollars",
        "average_price_per_gallon": 1000,
        "amount": 1000
      },
      "propane": {
        "unit_of_measurement": "Dollars",
        "average_price_per_gallon": 1000,
        "amount": 1000
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
      amount: 1000,
    },
    electricity: {
      unit_of_measurement: "Dollars",
      average_price_per_kilowatt: 1000,
      green_percentage: 10,
      amount: 1000,
    },
    fuel_oil: {
      unit_of_measurement: "Dollars",
      average_price_per_gallon: 1000,
      amount: 1000,
    },
    propane: {
      unit_of_measurement: "Dollars",
      average_price_per_gallon: 1000,
      amount: 1000,
    },
  },
};

fetch("https://dynm-api.herokuapp.com/carbon-footprint/home-energy", {
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

url = "https://dynm-api.herokuapp.com/carbon-footprint/home-energy"

payload = {
    "number_of_people": 2,
    "primary_heating_source": "Electricity",
    "utility_options": {
        "natural_gas": {
            "unit_of_measurement": "Dollars",
            "average_price_per_thousand_cubic_feet": 1000,
            "amount": 1000
        },
        "electricity": {
            "unit_of_measurement": "Dollars",
            "average_price_per_kilowatt": 1000,
            "green_percentage": 10,
            "amount": 1000
        },
        "fuel_oil": {
            "unit_of_measurement": "Dollars",
            "average_price_per_gallon": 1000,
            "amount": 1000
        },
        "propane": {
            "unit_of_measurement": "Dollars",
            "average_price_per_gallon": 1000,
            "amount": 1000
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
  $url = "https://dynm-api.herokuapp.com/carbon-footprint/home-energy";
  $ch = curl_init($url);
  $postData = array(
    "number_of_people" => 2,
    "primary_heating_source" => "Electricity",
    "utility_options" => array(
      "natural_gas" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_thousand_cubic_feet" => 1000,
        "amount" => 1000
      ),
      "electricity" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_kilowatt" => 1000,
        "green_percentage" => 10,
        "amount" => 1000
      ),
      "fuel_oil" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_gallon" => 1000,
        "amount" => 1000
      ),
      "propane" => array(
        "unit_of_measurement" => "Dollars",
        "average_price_per_gallon" => 1000,
        "amount" => 1000
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

Your Current Emissions from Home Energy.

`POST https://dynm-api.herokuapp.com/carbon-footprint/home-energy`

<aside>Request params</aside>

| Param                                                  | Type   | Required | Description                                                                                                                 |
| ------------------------------------------------------ | ------ | -------- | --------------------------------------------------------------------------------------------------------------------------- |
| number_of_people                                       | string | true     | the number of people in the household                                                                                       |
| primary_heating_source                                 | string | true     | primmary heating source in the household                                                                                    |
| utility_options                                        | object | true     | price or amount of energy you use in the house. The options are natural_gas, electricity, fuel_oil and propane              |
| natural_gas ['unit_of_measurement']                    | string | true     | The unit of measurement you use to determine amount of energy consumed. Options are Dollars, Therms and Thousand Cubic Feet |
| natural_gas ['average_price* per_thousand_cubic_feet'] | string | false    | The average price per thousand cubic feet of natural gas. If not provided the assumption is 10.68                           |
| natural_gas ['amount']                                 | string | false    | The amount of natural_gas consumed whether in price or thousand cubic feet                                                  |
| electricity ['unit_of_measurement']                    | string | true     | The unit of measurement you use to determine amount of energy consumed. Options are Dollars and Kilowatts                   |
| electricity ['average_price_ per_kilowatt']            | string | false    | The average price per kilowatt of electricity. If not provided the assumption is 0.1188                                     |
| electricity ['green_percentage']                       | string | false    | the percentage of green electricity used in a household                                                                     |
| electricity ['amount']                                 | string | false    | The amount of electricity consumed whether in price or kilowatts                                                            |
| fuel_oil ['unit_of_measurement']                       | string | true     | The unit of measurement you use to determine amount of energy consumed. Options are Dollars and Gallons                     |
| fuel_oil ['average_price _per_gallon']                 | string | false    | The average price per gallon of fuel_oil. If not provided the assumption is 4.02                                            |
| fuel_oil ['amount']                                    | string | false    | The amount of fuel_oil consumed whether in price or gallons                                                                 |
| propane ['unit_of_measurement']                        | string | true     | The unit of measurement you use to determine amount of energy consumed. Options are Dollars and Gallons                     |
| propane ['average_price_ per_gallon']                  | string | false    | The average price per gallon of propane. If not provided the assumption is 2.47                                             |
| propane ['amount']                                     | string | false    | The amount of propane consumed whether in price or gallons                                                                  |

## Transportation

> REQUEST

```shell
curl -X POST \
  https://dynm-api.herokuapp.com/carbon-footprint/transportation \
  -H "Content-type: application/json" \
  -d '{
    "current_maintenance": "Do Not Do",
    "average_emissions_per_vehicle": 10484,
    "vehicles": [
      {
        "average_miles_driven": {
          "duration": "Per Week",
          "amount": 23
        },
        "average_gas_mileage": 20
      },
      {
        "average_miles_driven": {
          "duration": "Per Week",
          "amount": 30
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
        amount: 23,
      },
      average_gas_mileage: 20,
    },
    {
      average_miles_driven: {
        duration: "Per Week",
        amount: 30,
      },
      average_gas_mileage: 30,
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/carbon-footprint/transportation", {
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

url = "https://dynm-api.herokuapp.com/carbon-footprint/transportation"

payload={
  "current_maintenance": "Do Not Do",
  "average_emissions_per_vehicle": 10484,
  "vehicles": [{
    "average_miles_driven": {
      "duration": "Per Week",
      "amount": 23
    },
    "average_gas_mileage": 20
  },
  {
    "average_miles_driven": {
      "duration": "Per Week",
      "amount": 30
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
  $url = "https =>//dynm-api.herokuapp.com/carbon-footprint/transportation";
  $ch = curl_init($url);
  $postData = array(
    "current_maintenance" => "Do Not Do",
    "average_emissions_per_vehicle" => 10484,
    "vehicles" => array(
      array(
        "average_miles_driven" => array(
          "duration" => "Per Week",
          "amount" => 23
        ),
        "average_gas_mileage" => 20
      ),
      array(
        "average_miles_driven" => array(
          "duration" => "Per Week",
          "amount" => 30
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

`POST https://dynm-api.herokuapp.com/carbon-footprint/transportation`

<aside>Request params</aside>

| Param                             | Type   | Required | Description                                                                      |
| --------------------------------- | ------ | -------- | -------------------------------------------------------------------------------- |
| current_maintainance              | string | true     | state of maintainance of the vehicle. Options are "Do not Do" and "Already Done" |
| average_emissions \_per_vehicle   | string | true     | the average emissions of exhaust per vehicle                                     |
| vehicles                          | object | true     | the vehicles in a household.                                                     |
| average_miles_driven ['duration'] | string | true     | the duration in which the vehicles are driven. Options are Per Week and Per Year |
| average_miles_driven ['value']    | string | true     | the average amount of miles driven                                               |
| average_gas_mileage               | string | true     | average amount of gas used by vehicles per mileage                               |

## Waste

> REQUEST

```shell
curl -X POST \
  https://dynm-api.herokuapp.com/carbon-footprint/waste \
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

fetch("https://dynm-api.herokuapp.com/carbon-footprint/waste", {
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

url = "https://dynm-api.herokuapp.com/carbon-footprint/waste"

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
  $url = "https://dynm-api.herokuapp.com/carbon-footprint/waste";
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

`POST https://dynm-api.herokuapp.com/carbon-footprint/waste`

<aside>Request params</aside>

| Param                            | Type    | Required | Description                                                                          |
| -------------------------------- | ------- | -------- | ------------------------------------------------------------------------------------ |
| average_waste_per_person         | string  | true     | the average waste of one person in a household                                       |
| number_of_people                 | string  | true     | the number of people in a household                                                  |
| materials_recycled               | object  | true     | materials to be recycled. Options are metal, plastic, glass,newspaper and magazines. |
| materials_recycled ['metal']     | boolean | true     | Metal is the material being recycled. if true, the value of reduction is -89.38      |
| materials_recycled ['plastic']   | boolean | true     | Plastic is the material being recycled. if true, the value of reduction is -35.50    |
| materials_recycled ['glass']     | boolean | true     | Glass is the material being recycled. if true, the value of reduction is -25.39      |
| materials_recycled ['newspaper'] | boolean | true     | Newspaper is the material being recycled. if true, the value of reduction is -113.14 |
| materials_recycled ['magazines'] | boolean | true     | Magazine is the material being recycled. if true, the value of reduction is -27.46   |

## Conversions

<!-- ......here -->

### Carbon Dioxide

> REQUEST

```shell
curl -X POST \
  https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion \
  -H "Content-type: application/json" \
  -d '{
    "conversion": {
      "fuel_type": "Vegetable oil",
      "input": 123,
      "unit": "btu",
      "category": "residential"
    }
  }'
```

```javascript
const fetch = require("node-fetch");
const data = {
  conversion: {
    fuel_type: "Vegetable Oil",
    input: 123,
    unit: "btu",
    category: "residential",
  },
};

fetch(
  "https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion",
  {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  }
)
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

url = "https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion"

payload = {
  "conversion": {
    "fuel_type": "Vegetable Oil",
    "input": 123,
    "unit": "btu",
    "category": "residential"
  }
}

headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers, data=json.dumps(payload))

data = response.json()
print(data)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion";
  $ch = curl_init($url);
  $postData = array(
    "conversion" => array(
      "fuel_type" => "Vegetable Oil",
      "input" => 123,
      "unit" => "btu",
      "category"=> "residential"
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

> RESPONSE

```json
{
  "BTU": 123.0,
  "mmBTU": 0.000123,
  "gCH4": 0.00013325,
  "kgCH4": 1.3325e-7,
  "lbCH4": 2.937656e-7,
  "gCO2": 0.01003475,
  "kgCO2": 1.003475e-5,
  "lbCO2": 2.212281e-5,
  "gN2O": 1.025e-5,
  "kgN2O": 1.025e-8,
  "lbN2O": 2.259736e-8,
  "GALLON": 0.001025,
  "Category": "residential"
}
```

`POST https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                                                                                                                  |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert                                                                                                                     |
| input     | number | true     | This is the number of units to convert                                                                                                       |
| unit      | string | true     | The unit of measurement. Common units are gallon, short_tons, scf, mmbtu, btu, co2, ch4, n2o                                                 |
| category  | string | true     | There are four categories in which conversion can take place. The categories include: residential, commercial, industrial and transportation |

<aside>Fuel Types</aside>

| Fuel Type                   | Fuel Type                | Fuel Type                |
| --------------------------- | ------------------------ | ------------------------ |
| agricultural byproducts     | distillate fuel oil no 1 | petrochemical feedstocks |
| peat                        | distillate fuel oil no 2 | petroleum coke           |
| solid byproducts            | distillate fuel oil no 4 | propane                  |
| wood and wood residuals     | ethane                   | propylne                 |
| natural gas                 | ethylene                 | residual fuel oil no 5   |
| blast furnace gas           | heavy gas oils           | residual fuel oil no 6   |
| coke oven gas               | isobutane                | special naphtha          |
| fuel gas                    | isobutylene              | still gas                |
| propane gas                 | kerosene                 | unfished oils            |
| landfill gas                | kerosene type jet fuel   | used oils                |
| other biomass gases         | liquefied petroleum gas  | biodiesel 100 percent    |
| compressed natural gas      | lubricants               | ethanol 100 percent      |
| asphalt and road oil        | motor gasoline           | rendered animal fat      |
| aviation gasoline           | naphtha 401 deg f        | diesel fuel              |
| butane                      | natural gasoline         | liquefied natural gas    |
| butylene                    | other oil 401 def f      | methanol                 |
| crude oil                   | pentanes plus            | residual fuel oil        |
| anthracite coal             | vegetable oil            | bituminous coal          |
| sub bituminous coal         | lignite coal             | mixed commercial sector  |
| mixed electric power sector | mixed industrial cooking | coal coke                |
| municipal solid waste       | petroleum coke solid     | plastics                 |
| plastics quad short ton     | tires                    | tires short ton          |

### Carbon Dioxide with mass

> REQUEST

```shell
curl -X POST \
  https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion \
  -H "Content-type: application/json" \
  -d '{
    "conversion": {
      "fuel_type": "Vegetable oil",
      "input": 123,
      "unit": "co2",
      "mass": "kg",
      "category": "residential"
    }
  }'
```

```javascript
const fetch = require("node-fetch");
const data = {
  conversion: {
    fuel_type: "Vegetable Oil",
    input: 123,
    unit: "co2",
    mass: "kg",
    category: "residential",
  },
};

fetch(
  "https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion",
  {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  }
)
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

url = "https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion"

payload = {
  "conversion": {
    "fuel_type": "Vegetable Oil",
    "input": 123,
    "unit": "co2",
    "mass": "kg",
    "category": "residential"
  }
}

headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers, data=json.dumps(payload))

data = response.json()
print(data)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion";
  $ch = curl_init($url);
  $postData = array(
    "conversion" => array(
      "fuel_type" => "Vegetable Oil",
      "input" => 123,
      "unit" => "co2",
      "mass" => "kg",
      "category"=> "residential"
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

> RESPONSE

```json
{
  "BTU": 1507661000.0,
  "mmBTU": 1507.661,
  "gCO2": 123000.0,
  "kgCO2": 123.0,
  "lbCO2": 271.1683,
  "gCH4": 1633.299,
  "kgCH4": 1.633299,
  "lbCH4": 3.600804,
  "gN2O": 125.6384,
  "kgN2O": 0.1256384,
  "lbN2O": 0.2769849,
  "GALLON": 12563.84,
  "Category": "residential"
}
```

Units that require mass include CO2, CH4 and N2O

`POST https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                                                                                                                                     |
| --------- | ------ | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert                                                                                                                                        |
| input     | number | true     | This is the number of units to convert                                                                                                                          |
| unit      | string | true     | The unit of measurement. Common units are gallon, short_tons, scf, mmbtu, btu, co2, ch4, n2o                                                                    |
| mass      | string | false    | This param is only required when the unit type is CO2, CH4 or N2O. Acceptable mass units are kg, g and lbs. If mass is not provided, it defaults to pounds(lbs) |
| category  | string | true     | There are four categories in which conversion can take place. The categories include: residential, commercial, industrial and transportation                    |

### Carbon Dioxide units

> REQUEST

```shell
curl -X GET \
  https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion?fuel_type=propane \
  -H "Content-type: application/json" \
```

```javascript
const fetch = require("node-fetch");
fetch(
  "https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion?fuel_type=propane",
  {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
  }
)
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
url = "https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion?fuel_type=propane"
headers = {
  'Content-Type': 'application/json'
}
response = requests.request("GET", url, headers=headers)
print(response.text)
```

```php
<?php
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion?fuel_type=propane',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));
$response = curl_exec($curl);
curl_close($curl);
echo $response;
?>
```

> RESPONSE : <code>200</code>

```json
["mmBTU", "CO2", "CH4", "N2O", "BTU", "GALLON"]
```

`GET https://dynm-api.herokuapp.com/carbon-footprint/carbon-dioxide-conversion?fuel_type=propane`

<aside>Query params</aside>
| Param     | Type   | Required | Description                                                                                                                                  |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert          |

### Energy

> REQUEST

```shell
curl -X POST \
  https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion \
  -H "Content-type: application/json" \
  -d  '{
    "conversion": {
      "fuel_type": "Anthracite coal",
      "input": 123,
      "unit": "short ton",
      "category": "transportation"
    }
  }
```

```javascript
const fetch = require("node-fetch");
const data = {
  conversion: {
    fuel_type: "Anthracite coal",
    input: 123,
    unit: "short ton",
    category: "transportation",
  },
};

fetch("https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion", {
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

url = "https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion"

payload = {"conversion": {
    "fuel_type": "Anthracite coal",
    "input": 123,
    "unit": "short ton",
    "category": "transportation"
  }
}

headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers, data=json.dumps(payload))

data = response.json()
print(data)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion";
  $ch = curl_init($url);
  $postData = array(
    "conversion" => array(
      "fuel_type" => "Anthracite coal",
      "input" => 123,
      "unit" => "short ton",
      "category"=> "transportation"
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
  "QUAD": 3.567e-6,
  "EJ": 3.76134e-6,
  "kWH": 1045428.0,
  "BTU": 3567000000.0,
  "SHORT_TON": 123.0,
  "Category": "transportation"
}
```

Energy Conversion

`POST https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                                                                                                                  |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert                                                                                                                     |
| input     | number | true     | This is the number of units to convert                                                                                                       |
| unit      | string | true     | The unit of measurement. Common units are gallon, short_tons, scf, kwh and btu                                                               |
| category  | string | true     | There are four categories in which conversion can take place. The categories include: residential, commercial, industrial and transportation |

<aside>Fuel Types</aside>

| Fuel Type                   | Fuel Type                | Fuel Type                |
| --------------------------- | ------------------------ | ------------------------ |
| agricultural byproducts     | distillate fuel oil no 1 | petrochemical feedstocks |
| peat                        | distillate fuel oil no 2 | petroleum coke           |
| solid byproducts            | distillate fuel oil no 4 | propane                  |
| wood and wood residuals     | ethane                   | propylne                 |
| natural gas                 | ethylene                 | residual fuel oil no 5   |
| blast furnace gas           | heavy gas oils           | residual fuel oil no 6   |
| coke oven gas               | isobutane                | special naphtha          |
| fuel gas                    | isobutylene              | still gas                |
| propane gas                 | kerosene                 | unfished oils            |
| landfill gas                | kerosene type jet fuel   | used oils                |
| other biomass gases         | liquefied petroleum gas  | biodiesel 100 percent    |
| compressed natural gas      | lubricants               | ethanol 100 percent      |
| asphalt and road oil        | motor gasoline           | rendered animal fat      |
| aviation gasoline           | naphtha 401 deg f        | diesel fuel              |
| butane                      | natural gasoline         | liquefied natural gas    |
| butylene                    | other oil 401 def f      | methanol                 |
| crude oil                   | pentanes plus            | residual fuel oil        |
| anthracite coal             | vegetable oil            | bituminous coal          |
| sub bituminous coal         | lignite coal             | mixed commercial sector  |
| mixed electric power sector | mixed industrial cooking | coal coke                |
| municipal solid waste       | petroleum coke solid     | plastics                 |
| plastics quad short ton     | tires                    | tires short ton          |

### Energy units

> REQUEST

```shell
curl -X GET \
  https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion?fuel_type=propane \
  -H "Content-type: application/json" \
```

```javascript
const fetch = require("node-fetch");
fetch(
  "https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion?fuel_type=propane",
  {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
  }
)
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
url = "https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion?fuel_type=propane"
headers = {
  'Content-Type': 'application/json'
}
response = requests.request("GET", url, headers=headers)
print(response.text)
```

```php
<?php
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion?fuel_type=propane',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));
$response = curl_exec($curl);
curl_close($curl);
echo $response;
?>
```

> RESPONSE : <code>200</code>

```json
["BTU", "QUAD", "EJ", "kWH", "SCF"]
```

`GET https://dynm-api.herokuapp.com/carbon-footprint/energy-conversion?fuel_type=propane`

<aside>Query params</aside>
| Param     | Type   | Required | Description                                                                                                                                  |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert          |

## Solutions

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/carbon-footprint/solutions' \
--header 'Content-Type: application/json' \
--data-raw '{
    "fuel_type": "wood waste",
    "input": 20
}'
```

```javascript
const fetch = require("node-fetch");

const data = {
  fuel_type: "wood waste",
  input: 20,
};

fetch("https://dynm-api.herokuapp.com/carbon-footprint/solutions", {
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

url = "https://dynm-api.herokuapp.com/carbon-footprint/solutions"

payload={
  "fuel_type": "wood waste",
  "input": 20,
}

headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers, data=json.dumps(payload))

data = response.json()
print(data)

```

```php
<?php
  $url = "https =>//dynm-api.herokuapp.com/carbon-footprint/solutions";
  $ch = curl_init($url);
  $postData = array(
    "fuel_type" => "wood waste",
    "input" => 20
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
  "GHGS_MONTH": 39.0,
  "NO_OF_CARS": 101.03626943005182
}
```

This endpoint deals with solutions. it estimates the impact of your waste reduction practices, expressed in tons of carbon dioxide saved, or cars taken off the road.

Each time you recycle or compost materials instead of discarding them, you help reduce greenhouse gas (GHG) emissions and protect the climate. Over time these emission reductions add up to significant amounts! In fact, GHG reductions from recycling and composting are often so considerable that they can be compared to avoided tailpipe emissions from vehicles, or cars taken off the road.

`POST https://dynm-api.herokuapp.com/carbon-footprint/solutions`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                   |
| --------- | ------ | -------- | --------------------------------------------- |
| fuel_type | string | true     | fuel type to be recycled                      |
| input     | number | true     | no of tons/month of fuel type to be converted |

# Corporate

## About

A calculation tool for estimating GHG emissions based on the GHG Protocol.

The tool uses default emission factors, which vary by country. These are free to use and publicly available, and the tool includes links of where to obtain them. Currently, separate sets of emission factors are available for the UK and US. Location-based Scope 2 emission factors are also available for the US, Canada and Australia, while market-based residual mix emission factors are available for the US, Canada and all European counties. The GHG emissions results for each activity types are provided in the "Results Summary".

This tool covers the following cross-sectoral emission sources:

- Scope 1 - Stationary Combustion, Mobile Combustion, and Fugitive Emissions from Air Conditioning.

- Scope 2 - Purchased Electricity and Purchased Heat/Steam.

- Scope 3 - Upstream Transportation and Distribution, Business Travel, and Employee Commuting.

## Stationary Combustion

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/corporate/stationary-combustion' \
--header 'Content-Type: application/json' \
--data-raw '{
  "facility_id": 1,
  "year": 2019,
  "fuel_type": "Coal Coke",
  "amount": 1000,
  "units": "therm",
  "activity_type": "Stationary combustion",
  "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
  "scope": "Scope 1"
}'
```

```javascript
const fetch = require("node-fetch");
const data = {
  facility_id: 1,
  year: 2019,
  fuel_type: "Coal Coke",
  amount: 1000,
  units: "therm",
  activity_type: "Stationary combustion",
  gwp_dataset_revision: "2014 IPCC Fifth Assessment",
  scope: "Scope 1",
};

fetch("https://dynm-api.herokuapp.com/corporate/stationary-combustion", {
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

url = "https://dynm-api.herokuapp.com/corporate/stationary-combustion"

payload = json.dumps({
  "facility_id": 1,
  "year": 2019,
  "fuel_type": "Coal Coke",
  "amount": 1000,
  "units": "therm",
  "activity_type": "Stationary combustion",
  "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
  "scope": "Scope 1"
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/corporate/stationary-combustion";
  $ch = curl_init($url);
  $postData = array(
    "facility_id" => 1,
    "year"=> 2019,
    "fuel_type" => "Coal Coke",
    "amount" => 1000,
    "units" => "therm",
    "activity_type" => "Stationary combustion",
    "gwp_dataset_revision" => "2014 IPCC Fifth Assessment",
    "scope" => "Scope 1"
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
  "biofuel_c02_tonnes": 0.0,
  "c02_tonnes": 11.367,
  "c02e_tonnes": 11.4402,
  "ch4_tonnes": 0.0011,
  "ef_kg_c02e": 114.402,
  "n20_tonnes": 0.00016
}
```

Includes fuel consumption at a facility to produce electricity, steam, heat, or power. The combustion of fossil fuels by natural gas boilers, diesel generators and other equipment emits carbon dioxide, methane, and nitrous oxide into the atmosphere.

`POST https://dynm-api.herokuapp.com/corporate/stationary-combustion`

<aside>Request params</aside>

| Param                | Type    | Required | Description                                                                                            |
| -------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------ |
| facility_id          | string  | true     | Id of the facility selected. e.g 5                                                                     |
| year                 | integer | true     | Selected year for the row. e.g 2018                                                                    |
| fuel_type            | string  | true     | Type of fuel for the stationary combustion row e.g Coal Coke                                           |
| amount               | float   | true     | Fuel amount enetered for the row                                                                       |
| units                | string  | true     | Selected unit of measuement (e.g., kg or kWh or therms)                                                |
| activity_type        | string  | true     | The activity type under which the row entry falls under. Fixed to 'Stationary Combustion' for all rows |
| gwp_dataset_revision | string  | true     | The selected GWP dataset revision e.g 2014 IPCC Fifth Assessment                                       |
| scope                | string  | true     | The scope under which this row falls under. Required for aggregation and summaries. Fixed to Scope 1   |

## Mobile Combustion

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/corporate/mobile-combustion' \
--header 'Content-Type: application/json' \
--data-raw '{
    "facility_id": 1,
    "year": 2019,
    "fuel_source": "Biodiesel (100%)",
    "vehicle_type": "Biodiesel Light-duty Vehicles",
    "amount": 100,
    "units": "scf",
    "activity_type": "Fuel Use",
    "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
    "scope": "Scope 1"
}'
```

```javascript
const fetch = require("node-fetch");
const data = {
  facility_id: 1,
  year: 2019,
  fuel_source: "Biodiesel (100%)",
  vehicle_type: "Biodiesel Light-duty Vehicles",
  amount: 100,
  units: "scf",
  activity_type: "Fuel Use",
  gwp_dataset_revision: "2014 IPCC Fifth Assessment",
  scope: "Scope 1",
};

fetch("https://dynm-api.herokuapp.com/corporate/mobile-combustion", {
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

url = "https://dynm-api.herokuapp.com/corporate/mobile-combustion"

payload = json.dumps({
  "facility_id": 1,
  "year": 2019,
  "fuel_source": "Biodiesel (100%)",
  "vehicle_type": "Biodiesel Light-duty Vehicles",
  "amount": 100,
  "units": "scf",
  "activity_type": "Fuel Use",
  "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
  "scope": "Scope 1"
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/corporate/mobile-combustion";
  $ch = curl_init($url);
  $postData = array(
    "facility_id"=> 1,
    "year"=> 2019,
    "fuel_source"=> "Biodiesel (100%)",
    "vehicle_type"=> "Biodiesel Light-duty Vehicles",
    "amount"=> 100,
    "units"=> "scf",
    "activity_type"=> "Fuel Use",
    "gwp_dataset_revision"=> "2014 IPCC Fifth Assessment",
    "scope"=> "Scope 1"
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
  "biofuel_c02_tonnes": 7.069,
  "c02_tonnes": 0.0,
  "c02e_tonnes": 0.003,
  "ch4_tonnes": 6e-6,
  "ef_kg_c02e": 0.0045198,
  "n20_tonnes": 1.2e-5
}
```

Includes fuel consumption by vehicles that are owned or leased by the company. Combustion of fossil fuels in vehicles (including cars, trucks, planes, and boats) emits carbon dioxide, methane, and nitrous oxide into the atmosphere.

`POST https://dynm-api.herokuapp.com/corporate/mobile-combustion`

| Param                | Type    | Required | Description                                                                                                                   |
| -------------------- | ------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| facility_id          | string  | true     | Id of the facility selected. e.g 5                                                                                            |
| year                 | integer | true     | Selected year for the row. e.g 2018                                                                                           |
| fuel_source          | string  | true     | Source of fuel for the mobile combustion row. e.g Motor Gasoline                                                              |
| vehicle_type         | string  | true     | The type of vehicle used. e.g Gasoline Passenger Cars                                                                         |
| amount               | float   | true     | Fuel amount entered for the row.                                                                                              |
| units                | string  | true     | Selected unit of measurement.(e.g.mile)                                                                                       |
| activity_type        | string  | true     | The activity type under which the row entry falls under. Can be either Fuel Use, Distance Activity or Custom Emission Factor. |
| gwp_dataset_revision | string  | true     | The selected GWP dataset revision e.g 2014 IPCC Fifth Assessment                                                              |
| scope                | string  | true     | The scope under which this row falls under. Required for aggregation and summaries. Fixed to Scope 1                          |

## Transportation

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/corporate/transportation' \
--header 'Content-Type: application/json' \
--data-raw '{
    "facility_id": 1,
    "year": 2019,
    "emission_dataset": "UK DEFRA",
    "vehicle_type": "Average Car - Plug-in Hybrid Electric Vehicle",
    "mode_of_transport": "Car",
    "category": "Employee Commute",
    "amount": 100,
    "units": "km",
    "activity_type": "Distance",
    "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
    "scope": "Scope 3"
}'
```

```javascript
const fetch = require("node-fetch");
const data = {
  facility_id: 1,
  year: 2019,
  emission_dataset: "UK DEFRA",
  vehicle_type: "Average Car - Plug-in Hybrid Electric Vehicle",
  mode_of_transport: "Car",
  category: "Employee Commute",
  amount: 100,
  units: "km",
  activity_type: "Distance",
  gwp_dataset_revision: "2007 IPCC Fifth Assessment",
  scope: "Scope 3",
};

fetch("https://dynm-api.herokuapp.com/corporate/transportation", {
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

url = "https://dynm-api.herokuapp.com/corporate/transportation"

payload = json.dumps({
  "facility_id": 1,
  "year": 2019,
  "emission_dataset": "UK DEFRA",
  "vehicle_type": "Average Car - Plug-in Hybrid Electric Vehicle",
  "mode_of_transport": "Car",
  "category": "Employee Commute",
  "amount": 100,
  "units": "km",
  "activity_type": "Distance",
  "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
  "scope": "Scope 3"
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/corporate/transportation";
  $ch = curl_init($url);
  $postData = array(
    "facility_id"=> 1,
    "year"=> 2019,
    "emission_dataset"=> "UK DEFRA",
    "vehicle_type"=> "Average Car - Plug-in Hybrid Electric Vehicle",
    "mode_of_transport"=> "Car",
    "category"=> "Employee Commute",
    "amount"=> 100,
    "units"=> "km",
    "activity_type"=> "Distance",
    "gwp_dataset_revision"=> "2007 IPCC Fifth Assessment",
    "scope"=> "Scope 3"
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
  "biofuel_c02_tonnes": 0.011454356557703015,
  "c02_tonnes": 0.0,
  "c02e_tonnes": 1.4155457130358705e-5,
  "ch4_tonnes": 3.2932673188578697e-8,
  "ef_kg_c02e": 0.18456781,
  "n20_tonnes": 4.473872584108805e-8
}
```

Fuel consumption by vehicles used to conduct company-financed travel. Examples include commercial air travel and use of rented vehicles during business trips (travel using company-owned/leased vehicles are included in Scope 1).

`POST https://dynm-api.herokuapp.com/corporate/transportation`

<aside>Request params</aside>

| Param                | Type    | Required | Description                                                                                                                   |
| -------------------- | ------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| facility_id          | string  | true     | Id of the facility selected. e.g 5                                                                                            |
| year                 | integer | true     | Selected year for the row. e.g 2018                                                                                           |
| amount               | float   | true     | Fuel amount entered for the row.                                                                                              |
| units                | string  | true     | Selected unit of measurement.(e.g.mile)                                                                                       |
| emission_dataset     | string  | true     | Emission factors database including emission factors for EPA(US based) and DEFRA(UK Based)                                    |
| category             | string  | true     | The transportation category which can be one of ‘Upstream T&D’, ‘Business Travel’ or ‘Employee Commute’.                      |
| mode_of_transport    | string  | true     | The method of transport which can be one of Air, Car, Bus, Rail or Ferry.                                                     |
| vehicle_type         | string  | true     | The type of vehicle used. e.g for Car mode, Average Car - Diesel.                                                             |
| activity_type        | string  | true     | The activity type under which the row entry falls under. Can be either Fuel Use, Distance Activity or Custom Emission Factor. |
| gwp_dataset_revision | string  | true     | The selected GWP dataset revision e.g 2014 IPCC Fifth Assessment                                                              |
| scope                | string  | true     | The scope under which this row falls under. Required for aggregation and summaries. Fixed to Scope 3                          |

## Purchased Electricity

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/corporate/electricity' \
--header 'Content-Type: application/json' \
--data-raw '{
    "facility_id": 1,
    "year": 2018,
    "emission_factor_type": "Grid Average/Location Based",
    "approach": "Purchased Electricity - Market Based",
    "amount": 100,
    "units": "GJ",
    "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
    "scope": "Scope 2",
    "facilities": [
        {
        "facility_id": 1,
        "grid_region": "AKGD",
        "country": "USA"
        },
        {
        "facility_id": 2,
        "grid_region": "Ontario",
        "country": "Canada"
        }
    ]
}'
```

```javascript
const fetch = require("node-fetch");
const data = {
  facility_id: 1,
  year: 2018,
  emission_factor_type: "Grid Average/Location Based",
  approach: "Purchased Electricity - Market Based",
  amount: 100,
  units: "GJ",
  gwp_dataset_revision: "2007 IPCC Fifth Assessment",
  scope: "Scope 2",
  facilities: [
    {
      facility_id: 1,
      grid_region: "AKGD",
      country: "USA",
    },
    {
      facility_id: 2,
      grid_region: "Ontario",
      country: "Canada",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/corporate/electricity", {
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

url = "https://dynm-api.herokuapp.com/corporate/electricity"

payload = json.dumps({
  "facility_id": 1,
  "year": 2018,
  "emission_factor_type": "Grid Average/Location Based",
  "approach": "Purchased Electricity - Market Based",
  "amount": 100,
  "units": "GJ",
  "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
  "scope": "Scope 2",
  "facilities": [
    {
      "facility_id": 1,
      "grid_region": "AKGD",
      "country": "USA"
    },
    {
      "facility_id": 2,
      "grid_region": "Ontario",
      "country": "Canada"
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/corporate/electricity";
  $ch = curl_init($url);
  $postData = array(
    "facility_id"=> 1,
    "year"=> 2018,
    "emission_factor_type"=> "Grid Average/Location Based",
    "approach"=> "Purchased Electricity - Market Based",
    "amount"=> 100,
    "units"=> "GJ",
    "gwp_dataset_revision"=> "2007 IPCC Fifth Assessment",
    "scope"=> "Scope 2",
    "facilities"=> [
        [
            "facility_id"=> 1,
            "grid_region"=> "AKGD",
            "country"=> "USA"
        ],
        [
            "facility_id"=> 2,
            "grid_region"=> "Ontario",
            "country"=> "Canada"
        ]
     ]
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
  "biofuel_c02_tonnes": 0.011454356557703015,
  "c02_tonnes": 0.0,
  "c02e_tonnes": 1.4155457130358705e-5,
  "ch4_tonnes": 3.2932673188578697e-8,
  "ef_kg_c02e": 0.18456781,
  "n20_tonnes": 4.473872584108805e-8
}
```

Electricity and other sources of energy purchased from your local utility (that is not combusted on-site). Examples include electricity, steam, and chilled or hot water. To generate this energy, utilities combust coal, natural gas, and other fossil fuels, emitting carbon dioxide, methane, and nitrous oxide in the process.

`POST https://dynm-api.herokuapp.com/corporate/electricity`

<aside>Request params</aside>

| Param                | Type    | Required | Description                                                                                          |
| -------------------- | ------- | -------- | ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| facility_id          | string  | required | Id of the facility selected. e.g 5.                                                                  |
| year                 | integer | required | Selected year for the row. e.g 2018.                                                                 |
| amount               | float   | required | Fuel amount entered for the row.                                                                     |
| units                | string  | required | Selected unit of measurement. e.g kWh.                                                               |
| emission_factor_type | string  | required | Type of emission factor selected. Can be either Residual Mix,                                        | Location Based/Grid Average or Custom Emission Factor.                                                            |
| facilities           | list    | required | List of all facilities with facility information for each i.e facility_id, grid_region and country   |
| approach             | string  | required | Calculation approach selected                                                                        | Can be either of ‘Purchased Electricity - Market Based’, ‘Purchased Electricity - Location Based’ or ‘Heat/Steam’ |
| gwp_dataset_revision | string  | required | The selected GWP dataset revision e.g 2014 IPCC Fifth Assessment.                                    |
| scope                | string  | required | The scope under which this row falls under. Required for aggregation and summaries. Fixed to Scope 2 |

## Refrigerants

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/corporate/refrigerants' \
--header 'Content-Type: application/json' \
--data-raw '{
    "year": 2018,
    "facility_id": 1,
    "refrigerant": "Methane",
    "calculation_method": "Sales Approach (Product)",
    "equipment_type": "",
    "inventory_start": 50,
    "inventory_end": 1,
    "purchased": 0,
    "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
    "scope": "Scope 1"
}'
```

```javascript
const fetch = require("node-fetch");
const data = {
  year: 2018,
  facility_id: 1,
  refrigerant: "Methane",
  calculation_method: "Sales Approach (Product)",
  equipment_type: "",
  inventory_start: 50,
  inventory_end: 1,
  purchased: 0,
  gwp_dataset_revision: "2007 IPCC Fifth Assessment",
  scope: "Scope 1",
};

fetch("https://dynm-api.herokuapp.com/corporate/refrigerants", {
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

url = "https://dynm-api.herokuapp.com/corporate/refrigerants"

payload = json.dumps({
  "year": 2018,
  "facility_id": 1,
  "refrigerant": "Methane",
  "calculation_method": "Sales Approach (Product)",
  "equipment_type": "",
  "inventory_start": 50,
  "inventory_end": 1,
  "purchased": 0,
  "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
  "scope": "Scope 1"
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/corporate/refrigerants";
  $ch = curl_init($url);
  $postData = array(
    "year"=> 2018,
    "facility_id"=> 1,
    "refrigerant"=> "Methane",
    "calculation_method"=> "Sales Approach (Product)",
    "equipment_type"=> "",
    "inventory_start"=> 50,
    "inventory_end"=> 1,
    "purchased"=> 0,
    "gwp_dataset_revision"=> "2007 IPCC Fifth Assessment",
    "scope"=> "Scope 1"
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
  "c02e_tonnes": 1.225
}
```

Includes leaks in your company's HVAC system, chillers, refrigerators, etc., through which refrigerant gas escapes. Most refrigerant gases contribute to global warming when leaked into the atmosphere. The quantity of leaked gas is assumed to equal the amount of gas replaced in these systems by your HVAC or chiller maintenance company.

Records or invoices from your maintenance company show the amount and type of refrigerant gas (e.g., freon, R-22, HFC-134a , CFC-12) replaced in your building's systems.

`POST https://dynm-api.herokuapp.com/corporate/refrigerants`

<aside>Request params</aside>

| Param                | Type    | Required | Description                                                                                                            |
| -------------------- | ------- | -------- | ---------------------------------------------------------------------------------------------------------------------- |
| facility_id          | string  | required | Id of the facility selected. e.g 5.                                                                                    |
| year                 | integer | required | Selected year for the row. e.g 2018.                                                                                   |
| fuel_source          | string  | required | Source of fuel for the mobile combustion row. e.g Motor Gasoline.                                                      |
| calculation_method   | string  | required | Calculation approach used. Either of ‘Sales Approach (Product)’, ‘Sales Approach (User)’ or ‘Lifecycle Stage Approach’ |
| equipment_type       | string  | false    | Type of air conditioning and refrigeration equipment.                                                                  |
| refrigerant          | string  | required | Type of refrigerant gas whose emissions are being calculated e.g HFC-134a.                                             |
| gwp_dataset_revision | string  | required | The selected GWP dataset revision e.g 2014 IPCC Fifth Assessment.                                                      |
| scope                | string  | required | The scope under which this row falls under. Required for aggregation and summaries. Fixed to Scope 1                   |

Different calculation methods will have different fields:

<aside>Sales Approach (User)</aside>

| Param                             | Type  | Description                                                                                      |
| --------------------------------- | ----- | ------------------------------------------------------------------------------------------------ |
| inventory_start                   | float | Refrigerant inventory (in storage, not equipment) at the beginning of the year                   |
| inventory_end                     | float | Refrigerant inventory (in storage, not equipment) at the end of the year                         |
| bulk_purchased                    | float | Refrigerant purchased from producers/ distributors in bulk                                       |
| manufacturer_provided             | float | Refrigerant provided by manufacturers with or inside equipment                                   |
| contractor_added                  | float | Refrigerant added to equipment by contractors                                                    |
| returned_offsite_recycling        | float | Refrigerant returned after off-site recycling or reclamation                                     |
| bulk_sales                        | float | Sales of refrigerant (in bulk, not in equipment) to other entities                               |
| left_equipment_sales              | float | Refrigerant left in equipment that is sold to other entities                                     |
| returned_suppliers                | float | Refrigerant returned to suppliers                                                                |
| sent_offsite_recycling            | float | Refrigerant sent off-site for recycling or reclamation                                           |
| sent_offsite_destruction          | float | Refrigerant sent off-site for destruction                                                        |
| new_equipment_charge              | float | Total full charge of new equipment                                                               |
| retrofitted_equipment_charge      | float | Total full charge of equipment retrofitted to use this refrigerant                               |
| retired_or_sold_equipment_charge  | float | Original total full charge of equipment that is retired or sold to other entities                |
| retrofitted_away_equipment_charge | float | Total full charge of equipment retrofitted away from this refrigerant to a different refrigerant |

<aside>Sales Approach (Product)</aside>

| Param                     | Type  | Description                                                                               |
| ------------------------- | ----- | ----------------------------------------------------------------------------------------- |
| inventory_start           | float | Refrigerant inventory (in storage, not equipment) at the beginning of the year            |
| inventory_end             | float | Refrigerant inventory (in storage, not equipment) at the end of the year                  |
| purchased                 | float | Refrigerant purchased from producers/ distributors                                        |
| user_returned             | float | Refrigerant returned by equipment users                                                   |
| returned_recycling        | float | Refrigerant returned after off-site recycling or reclamation                              |
| charged_equipment         | float | Refrigerant charged into equipment\* If not known, see steps A1 to A4 for a default value |
| delivered_equipment_users | float | Refrigerant delivered to equipment users in containers                                    |
| returned_producers        | float | Refrigerant returned to refrigerant producers                                             |
| sent_offsite_recycling    | float | Refrigerant sent off-site for recycling or reclamation                                    |
| sent_offsite_destruction  | float | Refrigerant sent off-site for destruction                                                 |

<aside>Lifecycle Stage Approach</aside>

| Param                                | Type  | Description                                                                                               |
| ------------------------------------ | ----- | --------------------------------------------------------------------------------------------------------- |
| new_equipment_fill                   | float | Refrigerant used to fill new equipment                                                                    |
| retrofitted_equipment_fill           | float | Refrigerant used to fill equipment retrofitted to use this refrigerant                                    |
| new_equipment_charge                 | float | Total full charge of new equipment using this refrigerant                                                 |
| retrofitted_equipment_charge         | float | Total full charge of equipment retrofitted to use this refrigerant                                        |
| equipment_service_amount             | float | Refrigerant used to service equipment (net amount after recovery, recycling and recharge)                 |
| retired_equipment_charge             | float | Original total full charge of equipment that is retired or sold to other entities                         |
| retrofitted_away_equipment_charge    | float | Total original full charge of equipment retrofitted away from this refrigerant to a different refrigerant |
| retiring_equipment_recovered         | float | Refrigerant recovered from retiring equipment                                                             |
| retrofitted_away_equipment_recovered | float | Refrigerant recovered from equipment retrofitted away from this refrigerant to a different refrigerant    |

## Results Summary

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/corporate/summary' \
--header 'Content-Type: application/json' \
--data-raw '{
    "stationary_combustion": [{
        "facility_id": 1,
        "year": 2018,
        "fuel_type": "Coal Coke",
        "amount": 1000,
        "units": "kWh",
        "activity_type": "Stationary combustion",
        "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
        "scope": "Scope 1"
    }],
    "mobile_combustion": [{
        "facility_id": 1,
        "year": 2018,
        "fuel_source": "Motor Gasoline",
        "vehicle_type": "Gasoline Passenger Cars",
        "amount": 100,
        "units": "mile",
        "activity_type": "Distance Activity",
        "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
        "scope": "Scope 1"
    }],
    "transportation": [{
        "facility_id": 1,
        "year": 2019,
        "emission_dataset": "US EPA",
        "vehicle_type": "Air Travel - Short Haul (< 300 miles)",
        "mode_of_transport": "Air",
        "category": "Business Travel",
        "amount": 10,
        "units": "mile",
        "activity_type": "Passenger Distance",
        "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
        "scope": "Scope 3"
    }],
    "electricity": [
        {
            "facility_id": 1,
            "year": 2018,
            "emission_factor_type": "Grid Average/Location Based",
            "approach": "Purchased Electricity - Market Based",
            "amount": 100,
            "units": "GJ",
            "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
            "scope": "Scope 2"
        }
    ],
    "refrigerants": [
        {
            "year": 2018,
            "facility_id": 1,
            "refrigerant": "Methane",
            "calculation_method": "Sales Approach (Product)",
            "equipment_type": "",
            "inventory_start": 50,
            "inventory_end": 1,
            "purchased": 0,
            "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
            "scope": "Scope 2"
        }
    ],
    "disaggregation_boundary": "Facility",
    "inventory_data": [
        {"inventory_year": 2018},
        {"inventory_year": 2019},
        {"inventory_year": 2020},
        {"inventory_year": 2021}
    ],
    "facilities": [
        {
        "facility_id": 1,
        "grid_region": "AKGD",
        "country": "USA"
        },
        {
        "facility_id": 2,
        "grid_region": "Ontario",
        "country": "Canada"
        }
    ]
}'
```

```javascript
const fetch = require("node-fetch");
const data = {
  stationary_combustion: [
    {
      facility_id: 1,
      year: 2018,
      fuel_type: "Coal Coke",
      amount: 1000,
      units: "kWh",
      activity_type: "Stationary combustion",
      gwp_dataset_revision: "2014 IPCC Fifth Assessment",
      scope: "Scope 1",
    },
  ],
  mobile_combustion: [
    {
      facility_id: 1,
      year: 2018,
      fuel_source: "Motor Gasoline",
      vehicle_type: "Gasoline Passenger Cars",
      amount: 100,
      units: "mile",
      activity_type: "Distance Activity",
      gwp_dataset_revision: "2014 IPCC Fifth Assessment",
      scope: "Scope 1",
    },
  ],
  transportation: [
    {
      facility_id: 1,
      year: 2019,
      emission_dataset: "US EPA",
      vehicle_type: "Air Travel - Short Haul (< 300 miles)",
      mode_of_transport: "Air",
      category: "Business Travel",
      amount: 10,
      units: "mile",
      activity_type: "Passenger Distance",
      gwp_dataset_revision: "2014 IPCC Fifth Assessment",
      scope: "Scope 3",
    },
  ],
  electricity: [
    {
      facility_id: 1,
      year: 2018,
      emission_factor_type: "Grid Average/Location Based",
      approach: "Purchased Electricity - Market Based",
      amount: 100,
      units: "GJ",
      gwp_dataset_revision: "2007 IPCC Fifth Assessment",
      scope: "Scope 2",
    },
  ],
  refrigerants: [
    {
      year: 2018,
      facility_id: 1,
      refrigerant: "Methane",
      calculation_method: "Sales Approach (Product)",
      equipment_type: "",
      inventory_start: 50,
      inventory_end: 1,
      purchased: 0,
      gwp_dataset_revision: "2007 IPCC Fifth Assessment",
      scope: "Scope 2",
    },
  ],
  disaggregation_boundary: "Facility",
  inventory_data: [
    {
      inventory_year: 2018,
    },
    {
      inventory_year: 2019,
    },
    {
      inventory_year: 2020,
    },
    {
      inventory_year: 2021,
    },
  ],
  facilities: [
    {
      facility_id: 1,
      grid_region: "AKGD",
      country: "USA",
    },
    {
      facility_id: 2,
      grid_region: "Ontario",
      country: "Canada",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/corporate/summary", {
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

url = "https://dynm-api.herokuapp.com/corporate/summary"

payload = json.dumps({
  "stationary_combustion": [
    {
      "facility_id": 1,
      "year": 2018,
      "fuel_type": "Coal Coke",
      "amount": 1000,
      "units": "kWh",
      "activity_type": "Stationary combustion",
      "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
      "scope": "Scope 1"
    }
  ],
  "mobile_combustion": [
    {
      "facility_id": 1,
      "year": 2018,
      "fuel_source": "Motor Gasoline",
      "vehicle_type": "Gasoline Passenger Cars",
      "amount": 100,
      "units": "mile",
      "activity_type": "Distance Activity",
      "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
      "scope": "Scope 1"
    }
  ],
  "transportation": [
    {
      "facility_id": 1,
      "year": 2019,
      "emission_dataset": "US EPA",
      "vehicle_type": "Air Travel - Short Haul (< 300 miles)",
      "mode_of_transport": "Air",
      "category": "Business Travel",
      "amount": 10,
      "units": "mile",
      "activity_type": "Passenger Distance",
      "gwp_dataset_revision": "2014 IPCC Fifth Assessment",
      "scope": "Scope 3"
    }
  ],
  "electricity": [
    {
      "facility_id": 1,
      "year": 2018,
      "emission_factor_type": "Grid Average/Location Based",
      "approach": "Purchased Electricity - Market Based",
      "amount": 100,
      "units": "GJ",
      "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
      "scope": "Scope 2"
    }
  ],
  "refrigerants": [
    {
      "year": 2018,
      "facility_id": 1,
      "refrigerant": "Methane",
      "calculation_method": "Sales Approach (Product)",
      "equipment_type": "",
      "inventory_start": 50,
      "inventory_end": 1,
      "purchased": 0,
      "gwp_dataset_revision": "2007 IPCC Fifth Assessment",
      "scope": "Scope 2"
    }
  ],
  "disaggregation_boundary": "Facility",
  "inventory_data": [
    {
      "inventory_year": 2018
    },
    {
      "inventory_year": 2019
    },
    {
      "inventory_year": 2020
    },
    {
      "inventory_year": 2021
    }
  ],
  "facilities": [
    {
      "facility_id": 1,
      "grid_region": "AKGD",
      "country": "USA"
    },
    {
      "facility_id": 2,
      "grid_region": "Ontario",
      "country": "Canada"
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```php
<?php
  $url = "https://dynm-api.herokuapp.com/corporate/summary";
  $ch = curl_init($url);
  $postData = array(
    "stationary_combustion"=> [
        [
            "facility_id"=> 1,
            "year"=> 2018,
            "fuel_type"=> "Coal Coke",
            "amount"=> 1000,
            "units"=> "kWh",
            "activity_type"=> "Stationary combustion",
            "gwp_dataset_revision"=> "2014 IPCC Fifth Assessment",
            "scope"=> "Scope 1"
        ]
    ],
    "mobile_combustion"=> [
        [
            "facility_id"=> 1,
            "year"=> 2018,
            "fuel_source"=> "Motor Gasoline",
            "vehicle_type"=> "Gasoline Passenger Cars",
            "amount"=> 100,
            "units"=> "mile",
            "activity_type"=> "Distance Activity",
            "gwp_dataset_revision"=> "2014 IPCC Fifth Assessment",
            "scope"=> "Scope 1"
        ]
    ],
    "transportation"=> [
        [
            "facility_id"=> 1,
            "year"=> 2019,
            "emission_dataset"=> "US EPA",
            "vehicle_type"=> "Air Travel - Short Haul (< 300 miles)",
            "mode_of_transport"=> "Air",
            "category"=> "Business Travel",
            "amount"=> 10,
            "units"=> "mile",
            "activity_type"=> "Passenger Distance",
            "gwp_dataset_revision"=> "2014 IPCC Fifth Assessment",
            "scope"=> "Scope 3"
        ]
    ],
    "electricity"=> [
        [
            "facility_id"=> 1,
            "year"=> 2018,
            "emission_factor_type"=> "Grid Average/Location Based",
            "approach"=> "Purchased Electricity - Market Based",
            "amount"=> 100,
            "units"=> "GJ",
            "gwp_dataset_revision"=> "2007 IPCC Fifth Assessment",
            "scope"=> "Scope 2"
        ]
    ],
    "refrigerants"=> [
        [
            "year"=> 2018,
            "facility_id"=> 1,
            "refrigerant"=> "Methane",
            "calculation_method"=> "Sales Approach (Product)",
            "equipment_type"=> "",
            "inventory_start"=> 50,
            "inventory_end"=> 1,
            "purchased"=> 0,
            "gwp_dataset_revision"=> "2007 IPCC Fifth Assessment",
            "scope"=> "Scope 2"
        ]

    ],
    "disaggregation_boundary"=> "Facility",
    "inventory_data"=> [
        [
            "inventory_year"=> 2018
        ],
        [
            "inventory_year"=> 2019
        ],
        [
            "inventory_year"=> 2020
        ],
        [
            "inventory_year"=> 2021
        ]
    ],
    "facilities"=> [
        [
            "facility_id"=> 1,
            "grid_region"=> "AKGD",
            "country"=> "USA"
        ],
        [
            "facility_id"=> 2,
            "grid_region"=> "Ontario",
            "country"=> "Canada"
        ]
    ]
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
  "disaggregation": {
    "1": {
      "Scope 1": {
        "Mobile Combustion": {
          "2018": 0.0,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Refrigerants/Fugitive Emissions": {
          "2018": 1.225,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Stationary Combustion": {
          "2018": 0.390355827342494,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        }
      },
      "Scope 1(Biogenic)": {
        "2018": 0.0,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Scope 2": {
        "Heat/Steam": {
          "2018": 0.0,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Purchased Electricity - Location Based": {
          "2018": 0.0,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Purchased Electricity - Market Based": {
          "2018": 13.16631238777778,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        }
      }
    },
    "2": {
      "Scope 1": {
        "Mobile Combustion": {
          "2018": 0.0,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Refrigerants/Fugitive Emissions": {
          "2018": 1.225,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Stationary Combustion": {
          "2018": 0.390355827342494,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        }
      },
      "Scope 1(Biogenic)": {
        "2018": 0.0,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Scope 2": {
        "Heat/Steam": {
          "2018": 0.0,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Purchased Electricity - Location Based": {
          "2018": 0.0,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        },
        "Purchased Electricity - Market Based": {
          "2018": 13.16631238777778,
          "2019": 0.0,
          "2020": 0.0,
          "2021": 0.0
        }
      }
    }
  },
  "results": {
    "Scope 1": {
      "Fugitive emissions from air-conditioning": {
        "2018": 1.225,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Mobile Combustion": {
        "2018": 0.039,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Stationary Combustion": {
        "2018": 0.390355827342494,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "total": {
        "2018": 1.654355827342494,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      }
    },
    "Scope 1(Biogenic)": {
      "2018": 0.0,
      "2019": 0.0,
      "2020": 0.0,
      "2021": 0.0
    },
    "Scope 2": {
      "Heat/Steam": {
        "2018": 0.0,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Purchased Electricity - Location Based": {
        "2018": 0.0,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Purchased Electricity - Market Based": {
        "2018": 13.16631238777778,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Scope 2 - Location based + Heat/Steam": {
        "2018": 13.16631238777778,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Scope 2 - Market based + Heat/Steam": {
        "2018": 0.0,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      }
    },
    "Scope 2(Biogenic)": {
      "2018": 0.0,
      "2019": 0.0,
      "2020": 0.0,
      "2021": 0.0
    },
    "Scope 3": {
      "Business Travel": {
        "2018": 0.0,
        "2019": 0.00227010675965,
        "2020": 0.0,
        "2021": 0.0
      },
      "Employee Commute": {
        "2018": 0.0,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      },
      "Upstream T&D": {
        "2018": 0.0,
        "2019": 0.0,
        "2020": 0.0,
        "2021": 0.0
      }
    },
    "Scope 3(Biogenic)": {
      "2018": 0.0,
      "2019": 0.0,
      "2020": 0.0,
      "2021": 0.0
    }
  }
}
```

Aggregates data for rows in all sheets above. Returns an overall emissions summary grouped by scope for each year in inventory data. Also returns a disaggregation of Scope 1 and 2 per either Facility or Country as entered in facilities data.

`POST https://dynm-api.herokuapp.com/corporate/summary`

<aside>Request params</aside>

| Param                   | Type   | Required | Description                                                                                           |
| ----------------------- | ------ | -------- | ----------------------------------------------------------------------------------------------------- |
| stationary_combustion   | list   | required | List of all stationary combustion rows and their fields.                                              |
| mobile_combustion       | list   | required | List of all mobile combustion rows and their fields.                                                  |
| transportation          | list   | required | List of all transportation rows and their fields                                                      |
| electricity             | list   | required | List of all electricity rows and their fields                                                         |
| refrigerants            | list   | required | List of all refrigerant rows and their fields                                                         |
| disaggregation_boundary | string | required | Type of disaggregation to be used. Can be either of Country or Facility                               |
| inventory_data          | list   | required | List of inventory data entries with inventory information i.e inventory_year, start_date and end_date |
| facilities              | list   | required | List of all facilities with facility information for each i.e facility_id, grid_region and country    |

## Emission Factors

### Stationary Combustion

<aside>Fuel Types</aside>

| Fuel Type                       | Fuel Type                 | Fuel Type                     |
| ------------------------------- | ------------------------- | ----------------------------- | -------------- | ------------------------- | ------------------------- | --------- |
| Anthracite Coal                 | Bituminous Coal           | Sub-bituminous Coal           |
| Lignite Coal                    | Mixed (Commercial Sector) | Mixed (Electric Power Sector) |                | Mixed (Industrial Coking) | Mixed (Industrial Sector) | Coal Coke |
| Municipal Solid Waste           | Petroleum Coke (Solid)    | Plastics                      |
| Tires                           | Agricultural Byproducts   | Peat                          |
| Solid Byproducts                | Wood and Wood Residuals   | Natural Gas                   |
| Blast Furnace Gas               | Coke Oven Gas             | Fuel Gas                      |
| Propane Gas                     | Landfill Gas              | Other Biomass Gases           |
| Asphalt and Road Oil            | Aviation Gasoline         | Butane                        |
| Butylene                        | Crude Oil                 | Distillate Fuel Oil No. 1     |
| Distillate Fuel Oil No. 2       | Distillate Fuel Oil No. 4 | Ethane                        |
| Ethylene                        | Heavy Gas Oils            | Isobutane                     |
| Isobutylene                     | Kerosene                  | Kerosene-Type Jet Fuel        |
| Liquefied Petroleum Gases (LPG) | Lubricants                | Motor Gasoline                |
| Naphtha (<401 deg F)            | Natural Gasoline          | Other Oil (>401 deg F)        |
| Pentanes Plus                   | Petrochemical Feedstocks  | Straw                         |
| Petroleum Coke                  | Propane                   | Propylene                     |
| Residual Fuel Oil No. 5         | Residual Fuel Oil No. 6   | Special Naphtha               |
| Unfinished Oils                 | Used Oil                  | Biodiesel (100%)              | Ethanol (100%) |
| Rendered Animal Fat             | Vegetable Oil 0.12        | North American Hardwood       |
| North American Softwood         | Bamboo                    |                               |

Source:
EPA, "Emission Factors for Greenhouse Gas Inventories," Table 1 Stationary Combustion Emission Factors, March 9, 2018 (https://www.epa.gov/climateleadership/center-corporate-climate-leadership-ghg-emission-factors-hub).
Note: Emission factors are per unit of heat content using higher heating values (HHV). If heat content is available from the fuel supplier, it is preferable to use that value. If not, default heat contents are provided.

### Mobile Combustion

<aside>Fuel Types</aside>

| Fuel Type                                                | Fuel Type                                                    | Fuel Type                                                               |
| -------------------------------------------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------------- | ------------------------------------------------- |
| Electricity - Mobile - Electric Vehicle                  | Motor Gasoline - Gasoline Passenger Cars                     | Motor Gasoline - Gasoline Light-duty Trucks (Vans, Pickup Trucks, SUVs) | Motor Gasoline - Gasoline Heavy-duty Vehicles     |
| Diesel Fuel - Diesel Passenger Cars                      | Diesel Fuel - Diesel Light-duty Trucks                       | Diesel Fuel - Diesel Medium- and Heavy-duty Vehicles                    |
| Biodiesel (100%) - Biodiesel Passenger Cars              | Biodiesel (100%) - Biodiesel Light-duty Vehicles             | Biodiesel (100%) - Biodiesel Medium- and Heavy-duty Vehicles            |
| Compressed Natural Gas - CNG Light-duty Vehicles         | Compressed Natural Gas - CNG Medium- and Heavy-duty Vehicles | Ethanol (100%) - Ethanol Light-duty Vehicles                            |
| Ethanol (100%) - Ethanol Medium- and Heavy-duty Vehicles | Motor Gasoline - Hybrid (Gasoline) Passenger Cars            | Motor Gasoline - Gasoline Agricultural Equipment                        |
| Diesel Fuel - Diesel Agricultural Equipment              | Motor Gasoline - Gasoline Ships and Boats                    | Diesel Fuel - Diesel Ships and Boats                                    |
| Jet Fuel - Jet Fuel Aircraft                             | Aviation Gasoline - Aviation Gasoline Aircraft               | Motor Gasoline - Gasoline Motorcycles                                   | Motor Gasoline - Other Gasoline Non-Road Vehicles |
| Diesel Fuel - Other Diesel Non-Road Vehicles             | Biodiesel (100%) - Biodiesel Medium- and Heavy-duty Vehicles |

### Transport

<aside>Lookup Name</aside>

| Lookup Name                                                        | Lookup Name                                                   | Lookup Name                                                           |
| ------------------------------------------------------------------ | ------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------- | ---------------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- | --- | --- | -------------------------------------------------------------- | ---------------------------------------------------------- |
| Passenger Car A                                                    | Light-Duty Truck B                                            | Motorcycle                                                            |
| Intercity Rail (i.e. Amtrak) C                                     | Commuter Rail D                                               | Transit Rail (i.e. Subway, Tram) E                                    |                       | Bus                                                        | Air Travel - Short Haul(< 300 miles)                | Air Travel - Medium Haul(>= 300 miles,< 2300 miles) |
| Air Travel - Long Haul (>= 2300 miles)                             | Average Car - Diesel                                          | Average Car - Petrol                                                  |
| Average Car - Hybrid                                               | Average Car - CNG                                             | Average Car - LPG                                                     |
| Average Car - Plug-in Hybrid Electric Vehicle                      | Average Car - Battery Electric Vehicle                        | Average Car - Unknown                                                 |
| Motorbike                                                          | Taxi - regular                                                | Local Bus                                                             |
| National rail                                                      | International rail Light rail and tram                        | Freight flights - International, to/from non-UK_RF                    |
| Air Travel - Domestic, to/from UK - Average passenger              | Air Travel - Short-haul, to/from UK - Average passenger       | Air Travel - Short-haul, to/from UK - Economy class                   |
| Air Travel - Short-haul, to/from UK - Business class               | Air Travel - Long-haul, to/from UK - Average passenger        | Air Travel - Long-haul, to/from UK - Economy class                    |                       | Air Travel - Long-haul, to/from UK - Premium economy class | Air Travel - Long-haul, to/from UK - Business class | Air Travel - Long-haul, to/from UK - First class    |     |     | Air Travel - International, to/from non-UK - Average passenger | Air Travel - International, to/from non-UK - Economy class |
| Air Travel - International, to/from non-UK - Premium economy class | Air Travel - International, to/from non-UK - Business class   | Air Travel - International, to/from non-UK - First class              |
| Ferry - Average (all passenger)                                    | Medium- and Heavy-Duty Truck                                  | Passenger Car A1                                                      |
| Light-Duty Truck B1                                                | Medium- and Heavy-Duty TruckC                                 | Rail                                                                  |
| Waterborne Craft                                                   | Aircraft                                                      | Vans - Average (up to 3.5 tonnes) - Diesel                            |
| Vans - Average (up to 3.5 tonnes) - Petrol                         | Vans - Average (up to 3.5 tonnes) - CNG                       | Vans - Average (up to 3.5 tonnes) - LPG                               |
| Vans - Average (up to 3.5 tonnes) - Unknown                        | Vans - Average (up to 3.5 tonnes) - Battery Electric Vehicle  | HGV (all diesel) - tonne.km                                           | HGV (all diesel) - km |
| HGV (all diesel) - miles                                           | HGV refrigerated (all diesel) - tonne.km                      | HGV refrigerated (all diesel) - km                                    |
| HGV refrigerated (all diesel) - miles                              | Freight flights - Domestic, to/from UK                        | Freight flights - Short-haul, to/from UK                              |
| Freight flights - Long-haul, to/from UK                            | Freight flights - International, to/from non-UK               | Rail - Freight train                                                  |
| Sea Tanker - Crude Tanker - Average                                | Sea Tanker - Products Tanker - Average                        | Sea Tanker - Chemical Tanker - Average                                |
| Sea Tanker - LNG Tanker - Average                                  | Sea Tanker - LPG Tanker - Average                             | Cargo Ship - Bulk Carrier - Average                                   |
| Cargo Ship - General Cargo - Average                               | Cargo Ship - Container Ship - Average                         | Cargo Ship - Vehicle Transport - Average                              |
| Cargo Ship - RoRo-Ferry - Average                                  | Cargo Ship - Large RoPax Ferry - Average                      | Cargo Ship - Refrigerated Cargo - All dwt                             |
| Air Travel - Domestic, to/from UK - Average passenger_RF           | Air Travel - Short-haul, to/from UK - Average passenger_RF    | Air Travel - Short-haul, to/from UK - Economy class_RF                |
| Air Travel - Short-haul, to/from UK - Business class_RF            | Air Travel - Long-haul, to/from UK - Average passenger_RF     | Air Travel - Long-haul, to/from UK - Economy class_RF                 |
| Air Travel - Long-haul, to/from UK - Premium economy class_RF      | Air Travel - Long-haul, to/from UK - Business class_RF        | Air Travel - Long-haul, to/from UK - First class_RF                   |
| Air Travel - International, to/from non-UK - Average passenger_RF  | Air Travel - International, to/from non-UK - Economy class_RF | Air Travel - International, to/from non-UK - Premium economy class_RF |
| Air Travel - International, to/from non-UK - Business class_RF     | Air Travel - International, to/from non-UK - First class_RF   | Freight flights - Domestic, to/from UK_RF                             |
| Freight flights - Short-haul, to/from UK_RF                        | Freight flights - Long-haul, to/from UK_RF                    |

### Purchased Electricity

<aside>Grid Region - Location Based</aside>
|Grid Region                 | Grid Region                 | Grid Region             |
| --------------------------- | ------------------------ | ------------------------ |
|AKGD		| AKMS	| AZNM |
|CAMX		|	ERCT	|	FRCC |
|HIMS		| HIOA	| MROE |
|MROW		| NEWE	| NWPP |
|	NYCW	| NYLI	| NYUP |
|	RFCE	|	RFCM  |	RFCW |
| RMPA	| SPNO	| SPSO |
|SRMV		| SRMW	| SRSO |
|SRTV |	SRVC	|	U.S.		|
|CA		|Newfoundland and Labrador	|Prince Edward Island	|
|Nova Scotia|	New Brunswick	| Quebec	|
|Ontario			| Manitoba		| Saskatchewan			|
|Alberta		| British Columbia			| Yukon		|
|Northwest Territories and Nunavut | New South Wales and ACT	| Victoria	|
|Queensland | South Australia		| SWIS in Western Australia			|
|Tasmania		| Northern Territory |	North China Grid	|
|	China Northeast Grid	| East China Grid	|	 China Grid	|
|	China Northwest Grid		|		China Southern Grid	|	Hainan Province China Power Grid|

<aside>eGrid Subregion - Residual Mix - Market Based</aside>
|eGrid Subregion                 | eGrid Subregion                 | eGrid Subregion             |
| --------------------------- | ------------------------ | ------------------------ |
|AKGD | AKMS | AZNM |
|CAMX | ERCT | FRCC |
|HIMS | HIOA | MROE |
|MROW | NEWE | NWPP |
|NYCW | NYLI | NYUP |
|RFCE | RFCM | RFCW |
|SPSO | SRMV | SRMW |
|SRSO | SRTV | SRVC |
|Newfoundland and Labrador | Quebec | Ontario |
|Manitoba | Saskatchewan | Alberta |
|British Columbia | Austria | Belgium |
|Bulgaria | Croatia | Cyprus |
|Czech Republic | Denmark |Estonia |
|Finland | France | Germany |
|United Kingdom | Greece | Hungary |
|Iceland |Ireland | Italy |
|Latvia | Lithuania | Luxembourg |
|Malta | Netherlands | Norway |
|Poland | Portugal |Romania |
|Slovakia | Slovenia | Spain |
|Sweden |Switzerland|

### Refrigerants

GWPs of Required Greenhouse Gases and Refrigerant Blends

<aside>Grid Region - Location Based</aside>
|Common Name                | Common Name                 | Common Name            |
| --------------------------- | ------------------------ | ------------------------ |
|	Carbon dioxide | Methane		| Nitrous oxide	|
| Nitrogen trifluoride		| Sulfur hexafluoride	 	| Hydrofluorocarbons (HFCs)	 |
| HFC-23 (R-23)	| HFC-32 (R-32)		| HFC-41 (R-41)	|
|	HFC-125 (R-125) | HFC-134 (R-134)	| HFC-134a (R-134a)	|
|	HFC-143 (R-143)	| HFC-143a (R-143a) | HFC-152 (R-152)	|
|	HFC-152a (R-152a)	| HFC-161 (R-161)		| HFC-227ea (R-227ea) |
| HFC-236cb (R-236cb)	| HFC-236ea (R-236ea)	| HFC-236fa (R-236fa)	|
|	HFC-245ca (R-245ca)	|	HFC-245fa (R-245fa) |	HFC-365mfc  	|
|	HFC-43-10mee (R-4310)	|	Perfluorocarbons (PFCs)	|	PFC-116 (Perfluoroethane)  	|
|	PFC-218 (Perfluoropropane)  |	PFC-318 (Perfluorocyclobutane) |	PFC-4-1-12 (Perfluoropentane)  |
|	PFC-9-1-18 (Perfluorodecalin) |

# Community

## About

The Community API is designed to support cities in reporting city-wide GHG emissions according to GPC protocol.

## Stationary Combustion

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/community/stationary' \
--header 'Content-Type: application/json' \
--data-raw '{
    "gpc_ref": "I.1.1",
    "scope": "1",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "Biodiesels",
    "category": "I.1 RESIDENTIAL BUILDINGS",
    "sub_category": "Emissions from fuel combustion within the city boundary",
    "sub_category_option": "Residential (1.a.b)",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}'

```

```javascript
import fetch from "node-fetch";
const data = {
  gpc_ref: "I.1.1",
  scope: "1",
  description: "Stationary Emissions for Biodiesels fuel type",
  activity: "Biodiesels",
  category: "I.1 RESIDENTIAL BUILDINGS",
  sub_category: "Emissions from fuel combustion within the city boundary",
  sub_category_option: "Residential (1.a.b)",
  notation_key: "NO",
  activity_amount: 1000,
  activity_units: "kWh",
  activity_multiplier_units: "kWh",
  activity_multiplier: null,
  oxidation_factor: 1,
  gases: "CO2",
  manual_emissions_data: false,
  emission_factor: "Biodiesels EF",
  CO2: null,
  CH4: null,
  total_CO2e: null,
  CO2b: null,
  N2O: null,
  data_quality: "L",
  methodology_description: "",
  source: "",
  data_quality_explanation: "",
  custom_emission_factors: [
    {
      activity: "Biodiesels",
      reference: "Biodiesels EF",
      type: "GHG",
      gwp: "4AR",
      unit_numerator: "kg",
      unit_denominator: "kWh",
      CO2: 1000,
      CH4: 100,
      N2O: 100,
      total_CO2e: 1000,
      CO2b: 100,
      data_quality: "",
      year: 2019,
      scale: "",
      description: "",
      source: "",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/community/stationary", {
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

url = "https://dynm-api.herokuapp.com/community/stationary"

payload = json.dumps({
  "gpc_ref": "I.1.1",
  "scope": "1",
  "description": "Stationary Emissions for Biodiesels fuel type",
  "activity": "Biodiesels",
  "category": "I.1 RESIDENTIAL BUILDINGS",
  "sub_category": "Emissions from fuel combustion within the city boundary",
  "sub_category_option": "Residential (1.a.b)",
  "notation_key": "NO",
  "activity_amount": 1000,
  "activity_units": "kWh",
  "activity_multiplier_units": "kWh",
  "activity_multiplier": None,
  "oxidation_factor": 1,
  "gases": "CO2",
  "manual_emissions_data": False,
  "emission_factor": "Biodiesels EF",
  "CO2": None,
  "CH4": None,
  "total_CO2e": None,
  "CO2b": None,
  "N2O": None,
  "data_quality": "L",
  "methodology_description": "",
  "source": "",
  "data_quality_explanation": "",
  "custom_emission_factors": [
    {
      "activity": "Biodiesels",
      "reference": "Biodiesels EF",
      "type": "GHG",
      "gwp": "4AR",
      "unit_numerator": "kg",
      "unit_denominator": "kWh",
      "CO2": 1000,
      "CH4": 100,
      "N2O": 100,
      "total_CO2e": 1000,
      "CO2b": 100,
      "data_quality": "",
      "year": 2019,
      "scale": "",
      "description": "",
      "source": ""
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/community/stationary',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "gpc_ref": "I.1.1",
    "scope": "1",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "Biodiesels",
    "category": "I.1 RESIDENTIAL BUILDINGS",
    "sub_category": "Emissions from fuel combustion within the city boundary",
    "sub_category_option": "Residential (1.a.b)",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;

```

> RESPONSE : <code>200</code>

```json
{
  "CH4_tCO2e": 2500.0,
  "N20_tCO2e": 29799.999999999996,
  "TtCO2e": 1000.0,
  "tCO2b": 100.0,
  "tCO2e": 1000.0
}
```

Endpoint for recording activity and emissions data for Stationary energy sources.

`POST https://dynm-api.herokuapp.com/community/stationary`

<aside>Request params</aside>

| Param                     | Type    | Required | Description                                                                                                                                                                                             |
| ------------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| gpc_ref                   | string  | true     | The GPC reference string for this category e.g I.1.1 for the sub-category ‘Emissions from fuel combustion within the city boundary’ within Stationary Combustion’s category ‘I.1 RESIDENTIAL BUILDINGS’ |
| scope                     | string  | true     | The appropriate scope. One of 1, 2 or 3                                                                                                                                                                 |
| description               | string  | nullable | General description of the row activity or calculation.                                                                                                                                                 |
| activity                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| category                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| sub_category              | string  | nullable | Appropriate sub-category under Inventory options with sub-categories e.g from the gpc_ref example above Emissions from fuel combustion within the city boundary                                         |
| sub_category_option       | string  | nullable | Appropriate sub(sub-category) under Inventory options with sub-categories e.g from the gpc_ref example above Residential 1.A.4.b                                                                        |
| notation_key              | string  | true     | Denote justifications for exclusion or partial accounting of GHG emission source categories. E.g NE for Not Estimated                                                                                   |
| activity_amount           | float   | true     | Amount of the units of the selected activity to report on. eg 100                                                                                                                                       |
| activity_units            | string  | true     | Measurement units for the activity data e.g kWh                                                                                                                                                         |
| activity_multiplier_units | string  | nullable | Units to be used if you wish to convert your data e.g kWh                                                                                                                                               |
| activity_multiplier       | float   | nullabke | An override value for converting activity data. If provided the conversion from activity_multiplier_units won’t be used rather this figure will be used. E.g 1.0                                        |
| oxidation_factor          | float   | nullable | Overrides default oxidation factor(1) e.g 1.0                                                                                                                                                           |
| gases                     | string  | nullable | Selection of gases in the reported emissions                                                                                                                                                            |
| manual_emissions_data     | boolean | true     | Indicates whether to use manually entered emission data or to calculate from an emission dataset. Defaults to false.                                                                                    |
| emission_factor           | string  | nullable | Name of the custom emission factor to be referenced. It is the reference field from one of the custom emission factors added. e.g Biodiesels_EF                                                         |
| CO2                       | float   | nullable | Manually entered C02 emissions                                                                                                                                                                          |
| CH4                       | float   | nullable | Manually entered CH4 emissions                                                                                                                                                                          |
| total_CO2e                | float   | nullable | Manually entered total_CO2e emissions                                                                                                                                                                   |
| CO2b                      | float   | nullable | Manually entered CO2b emissions                                                                                                                                                                         |
| N2O                       | float   | nullable | Manually entered N2O emissions                                                                                                                                                                          |
| data_quality              | string  | true     | Denotes quality of the submitted emissions data e.g L                                                                                                                                                   |
| methodology_description   | string  | nullable | Description of the methodology used for selecting a Notation Key                                                                                                                                        |
| source                    | string  | true     | The data source for the emissions or activity.                                                                                                                                                          |
| data_quality_explanation  | string  | true     | The explanation for choice of data quality level.                                                                                                                                                       |
| custom_emission_factors   | list    | true     | custom params for this particular endpoint                                                                                                                                                              |

## Transportation

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/community/transportation' \
--header 'Content-Type: application/json' \
--data-raw '{
    "gpc_ref": "II.1.1",
    "scope": "1",
    "fleet_type": "Municipal",
    "method": "Fuel sales approach",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "Biodiesels",
    "category": "II.1 ON-ROAD TRANSPORTATION",
    "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}'
```

```javascript
import fetch from "node-fetch";
const data = {
  gpc_ref: "II.1.1",
  scope: "1",
  fleet_type: "Municipal",
  method: "Fuel sales approach",
  description: "Stationary Emissions for Biodiesels fuel type",
  activity: "Biodiesels",
  category: "II.1 ON-ROAD TRANSPORTATION",
  sub_category:
    "Emissions from fuel combustion on-road combustion ocurring in the city",
  notation_key: "NO",
  activity_amount: 1000,
  activity_units: "kWh",
  activity_multiplier_units: "kWh",
  activity_multiplier: null,
  oxidation_factor: 1,
  gases: "CO2",
  manual_emissions_data: false,
  emission_factor: "Biodiesels EF",
  CO2: null,
  CH4: null,
  total_CO2e: null,
  CO2b: null,
  N2O: null,
  data_quality: "L",
  methodology_description: "",
  source: "",
  data_quality_explanation: "",
  custom_emission_factors: [
    {
      activity: "Biodiesels",
      reference: "Biodiesels EF",
      type: "GHG",
      gwp: "4AR",
      unit_numerator: "kg",
      unit_denominator: "kWh",
      CO2: 1000,
      CH4: 100,
      N2O: 100,
      total_CO2e: 1000,
      CO2b: 100,
      data_quality: "",
      year: 2019,
      scale: "",
      description: "",
      source: "",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/community/transportation", {
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

url = "https://dynm-api.herokuapp.com/community/transportation"

payload = json.dumps({
  "gpc_ref": "II.1.1",
  "scope": "1",
  "fleet_type": "Municipal",
  "method": "Fuel sales approach",
  "description": "Stationary Emissions for Biodiesels fuel type",
  "activity": "Biodiesels",
  "category": "II.1 ON-ROAD TRANSPORTATION",
  "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
  "notation_key": "NO",
  "activity_amount": 1000,
  "activity_units": "kWh",
  "activity_multiplier_units": "kWh",
  "activity_multiplier": None,
  "oxidation_factor": 1,
  "gases": "CO2",
  "manual_emissions_data": False,
  "emission_factor": "Biodiesels EF",
  "CO2": None,
  "CH4": None,
  "total_CO2e": None,
  "CO2b": None,
  "N2O": None,
  "data_quality": "L",
  "methodology_description": "",
  "source": "",
  "data_quality_explanation": "",
  "custom_emission_factors": [
    {
      "activity": "Biodiesels",
      "reference": "Biodiesels EF",
      "type": "GHG",
      "gwp": "4AR",
      "unit_numerator": "kg",
      "unit_denominator": "kWh",
      "CO2": 1000,
      "CH4": 100,
      "N2O": 100,
      "total_CO2e": 1000,
      "CO2b": 100,
      "data_quality": "",
      "year": 2019,
      "scale": "",
      "description": "",
      "source": ""
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/community/transportation',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "gpc_ref": "II.1.1",
    "scope": "1",
    "fleet_type": "Municipal",
    "method": "Fuel sales approach",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "Biodiesels",
    "category": "II.1 ON-ROAD TRANSPORTATION",
    "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


```

> RESPONSE : <code>200</code>

```json
{
  "CH4_tCO2e": 2500.0,
  "N20_tCO2e": 29799.999999999996,
  "TtCO2e": 1000.0,
  "tCO2b": 100.0,
  "tCO2e": 1000.0
}
```

Endpoint for recording activity and emissions data for Transportation sources.

`POST https://dynm-api.herokuapp.com/community/transportation`

<aside>Request params</aside>

| Param                     | Type    | Required | Description                                                                                                                                                                                             |
| ------------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| gpc_ref                   | string  | true     | The GPC reference string for this category e.g I.1.1 for the sub-category ‘Emissions from fuel combustion within the city boundary’ within Stationary Combustion’s category ‘I.1 RESIDENTIAL BUILDINGS’ |
| scope                     | string  | true     | The appropriate scope. One of 1, 2 or 3                                                                                                                                                                 |
| fleet_type                | string  | true     | The type of fleet used in calculation e.g Municipal                                                                                                                                                     |
| method                    | string  | true     | The calculation approach to be used in calculation e.g Fuel sales approach                                                                                                                              |
| description               | string  | nullable | General description of the row activity or calculation.                                                                                                                                                 |
| activity                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| category                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| sub_category              | string  | nullable | Appropriate sub-category under Inventory options with sub-categories e.g from the gpc_ref example above Emissions from fuel combustion within the city boundary                                         |
| sub_category_option       | string  | nullable | Appropriate sub(sub-category) under Inventory options with sub-categories e.g from the gpc_ref example above Residential 1.A.4.b                                                                        |
| notation_key              | string  | true     | Denote justifications for exclusion or partial accounting of GHG emission source categories. E.g NE for Not Estimated                                                                                   |
| activity_amount           | float   | true     | Amount of the units of the selected activity to report on. eg 100                                                                                                                                       |
| activity_units            | string  | true     | Measurement units for the activity data e.g kWh                                                                                                                                                         |
| activity_multiplier_units | string  | nullable | Units to be used if you wish to convert your data e.g kWh                                                                                                                                               |
| activity_multiplier       | float   | nullabke | An override value for converting activity data. If provided the conversion from activity_multiplier_units won’t be used rather this figure will be used. E.g 1.0                                        |
| oxidation_factor          | float   | nullable | Overrides default oxidation factor(1) e.g 1.0                                                                                                                                                           |
| gases                     | string  | nullable | Selection of gases in the reported emissions                                                                                                                                                            |
| manual_emissions_data     | boolean | true     | Indicates whether to use manually entered emission data or to calculate from an emission dataset. Defaults to false.                                                                                    |
| emission_factor           | string  | nullable | Name of the custom emission factor to be referenced. It is the reference field from one of the custom emission factors added. e.g Biodiesels_EF                                                         |
| CO2                       | float   | nullable | Manually entered C02 emissions                                                                                                                                                                          |
| CH4                       | float   | nullable | Manually entered CH4 emissions                                                                                                                                                                          |
| total_CO2e                | float   | nullable | Manually entered total_CO2e emissions                                                                                                                                                                   |
| CO2b                      | float   | nullable | Manually entered CO2b emissions                                                                                                                                                                         |
| N2O                       | float   | nullable | Manually entered N2O emissions                                                                                                                                                                          |
| data_quality              | string  | true     | Denotes quality of the submitted emissions data e.g L                                                                                                                                                   |
| methodology_description   | string  | nullable | Description of the methodology used for selecting a Notation Key                                                                                                                                        |
| source                    | string  | true     | The data source for the emissions or activity.                                                                                                                                                          |
| data_quality_explanation  | string  | true     | The explanation for choice of data quality level.                                                                                                                                                       |
| custom_emission_factors   | list    | true     | custom params for this particular endpoint                                                                                                                                                              |

## Waste

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/community/waste' \
--header 'Content-Type: application/json' \
--data-raw '{
    "gpc_ref": "III.1.1",
    "scope": "1",
    "treatment_activity": "Landfill sites - Methane commitment",
    "waste_type": "All waste",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "category": "III.1 SOLID WASTE DISPOSAL",
    "sub_category": "Emissions from solid waste generated in the city and disposed in landfills or open dumps within the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}'

```

```javascript
// const fetch = require("node-fetch");
import fetch from "node-fetch";
const data = {
  gpc_ref: "III.1.1",
  scope: "1",
  treatment_activity: "Landfill sites - Methane commitment",
  waste_type: "All waste",
  description: "Stationary Emissions for Biodiesels fuel type",
  category: "III.1 SOLID WASTE DISPOSAL",
  sub_category:
    "Emissions from solid waste generated in the city and disposed in landfills or open dumps within the city",
  notation_key: "NO",
  activity_amount: 1000,
  activity_units: "kWh",
  activity_multiplier_units: "kWh",
  activity_multiplier: null,
  oxidation_factor: 1,
  gases: "CO2",
  manual_emissions_data: false,
  emission_factor: "Biodiesels EF",
  CO2: null,
  CH4: null,
  total_CO2e: null,
  CO2b: null,
  N2O: null,
  data_quality: "L",
  methodology_description: "",
  source: "",
  data_quality_explanation: "",
  custom_emission_factors: [
    {
      activity: "Biodiesels",
      reference: "Biodiesels EF",
      type: "GHG",
      gwp: "4AR",
      unit_numerator: "kg",
      unit_denominator: "kWh",
      CO2: 1000,
      CH4: 100,
      N2O: 100,
      total_CO2e: 1000,
      CO2b: 100,
      data_quality: "",
      year: 2019,
      scale: "",
      description: "",
      source: "",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/community/waste", {
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

url = "https://dynm-api.herokuapp.com/community/waste"

payload = json.dumps({
  "gpc_ref": "III.1.1",
  "scope": "1",
  "treatment_activity": "Landfill sites - Methane commitment",
  "waste_type": "All waste",
  "description": "Stationary Emissions for Biodiesels fuel type",
  "category": "III.1 SOLID WASTE DISPOSAL",
  "sub_category": "Emissions from solid waste generated in the city and disposed in landfills or open dumps within the city",
  "notation_key": "NO",
  "activity_amount": 1000,
  "activity_units": "kWh",
  "activity_multiplier_units": "kWh",
  "activity_multiplier": None,
  "oxidation_factor": 1,
  "gases": "CO2",
  "manual_emissions_data": False,
  "emission_factor": "Biodiesels EF",
  "CO2": None,
  "CH4": None,
  "total_CO2e": None,
  "CO2b": None,
  "N2O": None,
  "data_quality": "L",
  "methodology_description": "",
  "source": "",
  "data_quality_explanation": "",
  "custom_emission_factors": [
    {
      "activity": "Biodiesels",
      "reference": "Biodiesels EF",
      "type": "GHG",
      "gwp": "4AR",
      "unit_numerator": "kg",
      "unit_denominator": "kWh",
      "CO2": 1000,
      "CH4": 100,
      "N2O": 100,
      "total_CO2e": 1000,
      "CO2b": 100,
      "data_quality": "",
      "year": 2019,
      "scale": "",
      "description": "",
      "source": ""
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/community/waste',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "gpc_ref": "III.1.1",
    "scope": "1",
    "treatment_activity": "Landfill sites - Methane commitment",
    "waste_type": "All waste",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "category": "III.1 SOLID WASTE DISPOSAL",
    "sub_category": "Emissions from solid waste generated in the city and disposed in landfills or open dumps within the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


```

> RESPONSE : <code>200</code>

```json
{
  "CH4_tCO2e": 2500.0,
  "N20_tCO2e": 29799.999999999996,
  "TtCO2e": 1000.0,
  "tCO2b": 100.0,
  "tCO2e": 1000.0
}
```

Endpoint for recording activity and emissions data for Waste sources.

`POST https://dynm-api.herokuapp.com/community/waste`

<aside>Request params</aside>

| Param                     | Type    | Required | Description                                                                                                                                                                                             |
| ------------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| gpc_ref                   | string  | true     | The GPC reference string for this category e.g I.1.1 for the sub-category ‘Emissions from fuel combustion within the city boundary’ within Stationary Combustion’s category ‘I.1 RESIDENTIAL BUILDINGS’ |
| scope                     | string  | true     | The appropriate scope. One of 1, 2 or 3                                                                                                                                                                 |
| treatment_activity        | string  | true     | The waste treatment type being reported on e.g Landfill sites - Methane commitment                                                                                                                      |
| waste_type                | string  | true     | The type of waste used in calculation e.g Sludge                                                                                                                                                        |
| description               | string  | nullable | General description of the row activity or calculation.                                                                                                                                                 |
| category                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| sub_category              | string  | nullable | Appropriate sub-category under Inventory options with sub-categories e.g from the gpc_ref example above Emissions from fuel combustion within the city boundary                                         |
| sub_category_option       | string  | nullable | Appropriate sub(sub-category) under Inventory options with sub-categories e.g from the gpc_ref example above Residential 1.A.4.b                                                                        |
| notation_key              | string  | true     | Denote justifications for exclusion or partial accounting of GHG emission source categories. E.g NE for Not Estimated                                                                                   |
| activity_amount           | float   | true     | Amount of the units of the selected activity to report on. eg 100                                                                                                                                       |
| activity_units            | string  | true     | Measurement units for the activity data e.g kWh                                                                                                                                                         |
| activity_multiplier_units | string  | nullable | Units to be used if you wish to convert your data e.g kWh                                                                                                                                               |
| activity_multiplier       | float   | nullabke | An override value for converting activity data. If provided the conversion from activity_multiplier_units won’t be used rather this figure will be used. E.g 1.0                                        |
| oxidation_factor          | float   | nullable | Overrides default oxidation factor(1) e.g 1.0                                                                                                                                                           |
| gases                     | string  | nullable | Selection of gases in the reported emissions                                                                                                                                                            |
| manual_emissions_data     | boolean | true     | Indicates whether to use manually entered emission data or to calculate from an emission dataset. Defaults to false.                                                                                    |
| emission_factor           | string  | nullable | Name of the custom emission factor to be referenced. It is the reference field from one of the custom emission factors added. e.g Biodiesels_EF                                                         |
| CO2                       | float   | nullable | Manually entered C02 emissions                                                                                                                                                                          |
| CH4                       | float   | nullable | Manually entered CH4 emissions                                                                                                                                                                          |
| total_CO2e                | float   | nullable | Manually entered total_CO2e emissions                                                                                                                                                                   |
| CO2b                      | float   | nullable | Manually entered CO2b emissions                                                                                                                                                                         |
| N2O                       | float   | nullable | Manually entered N2O emissions                                                                                                                                                                          |
| data_quality              | string  | true     | Denotes quality of the submitted emissions data e.g L                                                                                                                                                   |
| methodology_description   | string  | nullable | Description of the methodology used for selecting a Notation Key                                                                                                                                        |
| source                    | string  | true     | The data source for the emissions or activity.                                                                                                                                                          |
| data_quality_explanation  | string  | true     | The explanation for choice of data quality level.                                                                                                                                                       |
| custom_emission_factors   | list    | true     | custom params for this particular endpoint                                                                                                                                                              |

## IPPU

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/community/ippu' \
--header 'Content-Type: application/json' \
--data-raw '{
    "gpc_ref": "IV.1",
    "scope": "1",
    "industry": "Mineral",
    "industrial_process": "Cement production (2.A.1)",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "category": "IV.1 INDUSTRIAL PROCESS",
    "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}'

```

```javascript
// const fetch = require("node-fetch");
import fetch from "node-fetch";
const data = {
  gpc_ref: "IV.1",
  scope: "1",
  industry: "Mineral",
  industrial_process: "Cement production (2.A.1)",
  description: "Stationary Emissions for Biodiesels fuel type",
  category: "IV.1 INDUSTRIAL PROCESS",
  sub_category:
    "Emissions from fuel combustion on-road combustion ocurring in the city",
  notation_key: "NO",
  activity_amount: 1000,
  activity_units: "kWh",
  activity_multiplier_units: "kWh",
  activity_multiplier: null,
  oxidation_factor: 1,
  gases: "CO2",
  manual_emissions_data: false,
  emission_factor: "Biodiesels EF",
  CO2: null,
  CH4: null,
  total_CO2e: null,
  CO2b: null,
  N2O: null,
  data_quality: "L",
  methodology_description: "",
  source: "",
  data_quality_explanation: "",
  custom_emission_factors: [
    {
      activity: "Biodiesels",
      reference: "Biodiesels EF",
      type: "GHG",
      gwp: "4AR",
      unit_numerator: "kg",
      unit_denominator: "kWh",
      CO2: 1000,
      CH4: 100,
      N2O: 100,
      total_CO2e: 1000,
      CO2b: 100,
      data_quality: "",
      year: 2019,
      scale: "",
      description: "",
      source: "",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/community/ippu", {
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

url = "https://dynm-api.herokuapp.com/community/ippu"

payload = json.dumps({
  "gpc_ref": "IV.1",
  "scope": "1",
  "industry": "Mineral",
  "industrial_process": "Cement production (2.A.1)",
  "description": "Stationary Emissions for Biodiesels fuel type",
  "category": "IV.1 INDUSTRIAL PROCESS",
  "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
  "notation_key": "NO",
  "activity_amount": 1000,
  "activity_units": "kWh",
  "activity_multiplier_units": "kWh",
  "activity_multiplier": None,
  "oxidation_factor": 1,
  "gases": "CO2",
  "manual_emissions_data": False,
  "emission_factor": "Biodiesels EF",
  "CO2": None,
  "CH4": None,
  "total_CO2e": None,
  "CO2b": None,
  "N2O": None,
  "data_quality": "L",
  "methodology_description": "",
  "source": "",
  "data_quality_explanation": "",
  "custom_emission_factors": [
    {
      "activity": "Biodiesels",
      "reference": "Biodiesels EF",
      "type": "GHG",
      "gwp": "4AR",
      "unit_numerator": "kg",
      "unit_denominator": "kWh",
      "CO2": 1000,
      "CH4": 100,
      "N2O": 100,
      "total_CO2e": 1000,
      "CO2b": 100,
      "data_quality": "",
      "year": 2019,
      "scale": "",
      "description": "",
      "source": ""
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/community/ippu',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "gpc_ref": "IV.1",
    "scope": "1",
    "industry": "Mineral",
    "industrial_process": "Cement production (2.A.1)",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "category": "IV.1 INDUSTRIAL PROCESS",
    "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


```

> RESPONSE : <code>200</code>

```json
{
  "CH4_tCO2e": 2500.0,
  "N20_tCO2e": 29799.999999999996,
  "TtCO2e": 1000.0,
  "tCO2b": 100.0,
  "tCO2e": 1000.0
}
```

Endpoint for recording activity and emissions data for IPPU sources.

`POST https://dynm-api.herokuapp.com/community/ippu`

<aside>Request params</aside>

| Param                     | Type    | Required | Description                                                                                                                                                                                             |
| ------------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| gpc_ref                   | string  | true     | The GPC reference string for this category e.g I.1.1 for the sub-category ‘Emissions from fuel combustion within the city boundary’ within Stationary Combustion’s category ‘I.1 RESIDENTIAL BUILDINGS’ |
| scope                     | string  | true     | The appropriate scope. One of 1, 2 or 3                                                                                                                                                                 |
| industry                  | string  | true     | The industry being reported e.g Mineral                                                                                                                                                                 |
| industrial_process        | string  | true     | The industrial process being reported e.g Cement production (2.A.1)                                                                                                                                     |
| description               | string  | nullable | General description of the row activity or calculation.                                                                                                                                                 |
| category                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| sub_category              | string  | nullable | Appropriate sub-category under Inventory options with sub-categories e.g from the gpc_ref example above Emissions from fuel combustion within the city boundary                                         |
| sub_category_option       | string  | nullable | Appropriate sub(sub-category) under Inventory options with sub-categories e.g from the gpc_ref example above Residential 1.A.4.b                                                                        |
| notation_key              | string  | true     | Denote justifications for exclusion or partial accounting of GHG emission source categories. E.g NE for Not Estimated                                                                                   |
| activity_amount           | float   | true     | Amount of the units of the selected activity to report on. eg 100                                                                                                                                       |
| activity_units            | string  | true     | Measurement units for the activity data e.g kWh                                                                                                                                                         |
| activity_multiplier_units | string  | nullable | Units to be used if you wish to convert your data e.g kWh                                                                                                                                               |
| activity_multiplier       | float   | nullabke | An override value for converting activity data. If provided the conversion from activity_multiplier_units won’t be used rather this figure will be used. E.g 1.0                                        |
| oxidation_factor          | float   | nullable | Overrides default oxidation factor(1) e.g 1.0                                                                                                                                                           |
| gases                     | string  | nullable | Selection of gases in the reported emissions                                                                                                                                                            |
| manual_emissions_data     | boolean | true     | Indicates whether to use manually entered emission data or to calculate from an emission dataset. Defaults to false.                                                                                    |
| emission_factor           | string  | nullable | Name of the custom emission factor to be referenced. It is the reference field from one of the custom emission factors added. e.g Biodiesels_EF                                                         |
| CO2                       | float   | nullable | Manually entered C02 emissions                                                                                                                                                                          |
| CH4                       | float   | nullable | Manually entered CH4 emissions                                                                                                                                                                          |
| total_CO2e                | float   | nullable | Manually entered total_CO2e emissions                                                                                                                                                                   |
| CO2b                      | float   | nullable | Manually entered CO2b emissions                                                                                                                                                                         |
| N2O                       | float   | nullable | Manually entered N2O emissions                                                                                                                                                                          |
| data_quality              | string  | true     | Denotes quality of the submitted emissions data e.g L                                                                                                                                                   |
| methodology_description   | string  | nullable | Description of the methodology used for selecting a Notation Key                                                                                                                                        |
| source                    | string  | true     | The data source for the emissions or activity.                                                                                                                                                          |
| data_quality_explanation  | string  | true     | The explanation for choice of data quality level.                                                                                                                                                       |
| custom_emission_factors   | list    | true     | custom params for this particular endpoint                                                                                                                                                              |

## AFOLU

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/community/afolu' \
--header 'Content-Type: application/json' \
--data-raw '{
    "gpc_ref": "V.1",
    "scope": "1",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "All livestock (3.A)",
    "category": "V.1 LIVESTOCK",
    "sub_category": "Emissions from livestock",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}'

```

```javascript
// const fetch = require("node-fetch");
import fetch from "node-fetch";
const data = {
  gpc_ref: "V.1",
  scope: "1",
  description: "Stationary Emissions for Biodiesels fuel type",
  activity: "All livestock (3.A)",
  category: "V.1 LIVESTOCK",
  sub_category: "Emissions from livestock",
  notation_key: "NO",
  activity_amount: 1000,
  activity_units: "kWh",
  activity_multiplier_units: "kWh",
  activity_multiplier: null,
  oxidation_factor: 1,
  gases: "CO2",
  manual_emissions_data: false,
  emission_factor: "Biodiesels EF",
  CO2: null,
  CH4: null,
  total_CO2e: null,
  CO2b: null,
  N2O: null,
  data_quality: "L",
  methodology_description: "",
  source: "",
  data_quality_explanation: "",
  custom_emission_factors: [
    {
      activity: "Biodiesels",
      reference: "Biodiesels EF",
      type: "GHG",
      gwp: "4AR",
      unit_numerator: "kg",
      unit_denominator: "kWh",
      CO2: 1000,
      CH4: 100,
      N2O: 100,
      total_CO2e: 1000,
      CO2b: 100,
      data_quality: "",
      year: 2019,
      scale: "",
      description: "",
      source: "",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/community/afolu", {
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

url = "https://dynm-api.herokuapp.com/community/afolu"

payload = json.dumps({
  "gpc_ref": "V.1",
  "scope": "1",
  "description": "Stationary Emissions for Biodiesels fuel type",
  "activity": "All livestock (3.A)",
  "category": "V.1 LIVESTOCK",
  "sub_category": "Emissions from livestock",
  "notation_key": "NO",
  "activity_amount": 1000,
  "activity_units": "kWh",
  "activity_multiplier_units": "kWh",
  "activity_multiplier": None,
  "oxidation_factor": 1,
  "gases": "CO2",
  "manual_emissions_data": False,
  "emission_factor": "Biodiesels EF",
  "CO2": None,
  "CH4": None,
  "total_CO2e": None,
  "CO2b": None,
  "N2O": None,
  "data_quality": "L",
  "methodology_description": "",
  "source": "",
  "data_quality_explanation": "",
  "custom_emission_factors": [
    {
      "activity": "Biodiesels",
      "reference": "Biodiesels EF",
      "type": "GHG",
      "gwp": "4AR",
      "unit_numerator": "kg",
      "unit_denominator": "kWh",
      "CO2": 1000,
      "CH4": 100,
      "N2O": 100,
      "total_CO2e": 1000,
      "CO2b": 100,
      "data_quality": "",
      "year": 2019,
      "scale": "",
      "description": "",
      "source": ""
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/community/afolu',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "gpc_ref": "V.1",
    "scope": "1",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "All livestock (3.A)",
    "category": "V.1 LIVESTOCK",
    "sub_category": "Emissions from livestock",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


```

> RESPONSE : <code>200</code>

```json
{
  "CH4_tCO2e": 2500.0,
  "N20_tCO2e": 29799.999999999996,
  "TtCO2e": 1000.0,
  "tCO2b": 100.0,
  "tCO2e": 1000.0
}
```

Endpoint for recording activity and emissions data for AFOLU sources.

`POST https://dynm-api.herokuapp.com/community/afolu`

<aside>Request params</aside>

| Param                     | Type    | Required | Description                                                                                                                                                                                             |
| ------------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| gpc_ref                   | string  | true     | The GPC reference string for this category e.g I.1.1 for the sub-category ‘Emissions from fuel combustion within the city boundary’ within Stationary Combustion’s category ‘I.1 RESIDENTIAL BUILDINGS’ |
| scope                     | string  | true     | The appropriate scope. One of 1, 2 or 3                                                                                                                                                                 |
| description               | string  | nullable | General description of the row activity or calculation.                                                                                                                                                 |
| activity                  | string  | true     | The agricultural emission type or activity being reported on e.g Forest land                                                                                                                            |
| category                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| sub_category              | string  | nullable | Appropriate sub-category under Inventory options with sub-categories e.g from the gpc_ref example above Emissions from fuel combustion within the city boundary                                         |
| sub_category_option       | string  | nullable | Appropriate sub(sub-category) under Inventory options with sub-categories e.g from the gpc_ref example above Residential 1.A.4.b                                                                        |
| notation_key              | string  | true     | Denote justifications for exclusion or partial accounting of GHG emission source categories. E.g NE for Not Estimated                                                                                   |
| activity_amount           | float   | true     | Amount of the units of the selected activity to report on. eg 100                                                                                                                                       |
| activity_units            | string  | true     | Measurement units for the activity data e.g kWh                                                                                                                                                         |
| activity_multiplier_units | string  | nullable | Units to be used if you wish to convert your data e.g kWh                                                                                                                                               |
| activity_multiplier       | float   | nullabke | An override value for converting activity data. If provided the conversion from activity_multiplier_units won’t be used rather this figure will be used. E.g 1.0                                        |
| oxidation_factor          | float   | nullable | Overrides default oxidation factor(1) e.g 1.0                                                                                                                                                           |
| gases                     | string  | nullable | Selection of gases in the reported emissions                                                                                                                                                            |
| manual_emissions_data     | boolean | true     | Indicates whether to use manually entered emission data or to calculate from an emission dataset. Defaults to false.                                                                                    |
| emission_factor           | string  | nullable | Name of the custom emission factor to be referenced. It is the reference field from one of the custom emission factors added. e.g Biodiesels_EF                                                         |
| CO2                       | float   | nullable | Manually entered C02 emissions                                                                                                                                                                          |
| CH4                       | float   | nullable | Manually entered CH4 emissions                                                                                                                                                                          |
| total_CO2e                | float   | nullable | Manually entered total_CO2e emissions                                                                                                                                                                   |
| CO2b                      | float   | nullable | Manually entered CO2b emissions                                                                                                                                                                         |
| N2O                       | float   | nullable | Manually entered N2O emissions                                                                                                                                                                          |
| data_quality              | string  | true     | Denotes quality of the submitted emissions data e.g L                                                                                                                                                   |
| methodology_description   | string  | nullable | Description of the methodology used for selecting a Notation Key                                                                                                                                        |
| source                    | string  | true     | The data source for the emissions or activity.                                                                                                                                                          |
| data_quality_explanation  | string  | true     | The explanation for choice of data quality level.                                                                                                                                                       |
| custom_emission_factors   | list    | true     | custom params for this particular endpoint                                                                                                                                                              |

## Other Scope

> REQUEST

```shell
curl --location --request POST 'https://dynm-api.herokuapp.com/community/other' \
--header 'Content-Type: application/json' \
--data-raw '{
    "gpc_ref": "VI.1",
    "scope": "3",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "Food",
    "category": "VI.1 OTHER SCOPE 3",
    "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}'
```

```javascript
// const fetch = require("node-fetch");
import fetch from "node-fetch";
const data = {
  gpc_ref: "VI.1",
  scope: "3",
  description: "Stationary Emissions for Biodiesels fuel type",
  activity: "Food",
  category: "VI.1 OTHER SCOPE 3",
  sub_category:
    "Emissions from fuel combustion on-road combustion ocurring in the city",
  notation_key: "NO",
  activity_amount: 1000,
  activity_units: "kWh",
  activity_multiplier_units: "kWh",
  activity_multiplier: null,
  oxidation_factor: 1,
  gases: "CO2",
  manual_emissions_data: false,
  emission_factor: "Biodiesels EF",
  CO2: null,
  CH4: null,
  total_CO2e: null,
  CO2b: null,
  N2O: null,
  data_quality: "L",
  methodology_description: "",
  source: "",
  data_quality_explanation: "",
  custom_emission_factors: [
    {
      activity: "Biodiesels",
      reference: "Biodiesels EF",
      type: "GHG",
      gwp: "4AR",
      unit_numerator: "kg",
      unit_denominator: "kWh",
      CO2: 1000,
      CH4: 100,
      N2O: 100,
      total_CO2e: 1000,
      CO2b: 100,
      data_quality: "",
      year: 2019,
      scale: "",
      description: "",
      source: "",
    },
  ],
};

fetch("https://dynm-api.herokuapp.com/community/other", {
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

url = "https://dynm-api.herokuapp.com/community/other"

payload = json.dumps({
  "gpc_ref": "VI.1",
  "scope": "3",
  "description": "Stationary Emissions for Biodiesels fuel type",
  "activity": "Food",
  "category": "VI.1 OTHER SCOPE 3",
  "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
  "notation_key": "NO",
  "activity_amount": 1000,
  "activity_units": "kWh",
  "activity_multiplier_units": "kWh",
  "activity_multiplier": None,
  "oxidation_factor": 1,
  "gases": "CO2",
  "manual_emissions_data": False,
  "emission_factor": "Biodiesels EF",
  "CO2": None,
  "CH4": None,
  "total_CO2e": None,
  "CO2b": None,
  "N2O": None,
  "data_quality": "L",
  "methodology_description": "",
  "source": "",
  "data_quality_explanation": "",
  "custom_emission_factors": [
    {
      "activity": "Biodiesels",
      "reference": "Biodiesels EF",
      "type": "GHG",
      "gwp": "4AR",
      "unit_numerator": "kg",
      "unit_denominator": "kWh",
      "CO2": 1000,
      "CH4": 100,
      "N2O": 100,
      "total_CO2e": 1000,
      "CO2b": 100,
      "data_quality": "",
      "year": 2019,
      "scale": "",
      "description": "",
      "source": ""
    }
  ]
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://dynm-api.herokuapp.com/community/other',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "gpc_ref": "VI.1",
    "scope": "3",
    "description": "Stationary Emissions for Biodiesels fuel type",
    "activity": "Food",
    "category": "VI.1 OTHER SCOPE 3",
    "sub_category": "Emissions from fuel combustion on-road combustion ocurring in the city",
    "notation_key": "NO",
    "activity_amount": 1000,
    "activity_units": "kWh",
    "activity_multiplier_units": "kWh",
    "activity_multiplier": null,
    "oxidation_factor": 1,
    "gases": "CO2",
    "manual_emissions_data": false,
    "emission_factor": "Biodiesels EF",
    "CO2": null,
    "CH4": null,
    "total_CO2e": null,
    "CO2b": null,
    "N2O": null,
    "data_quality": "L",
    "methodology_description": "",
    "source": "",
    "data_quality_explanation": "",
    "custom_emission_factors": [
        {
            "activity": "Biodiesels",
            "reference": "Biodiesels EF",
            "type": "GHG",
            "gwp": "4AR",
            "unit_numerator": "kg",
            "unit_denominator": "kWh",
            "CO2": 1000,
            "CH4": 100,
            "N2O": 100,
            "total_CO2e": 1000,
            "CO2b": 100,
            "data_quality": "",
            "year": 2019,
            "scale": "",
            "description": "",
            "source": ""
        }
    ]
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


```

> RESPONSE : <code>200</code>

```json
{
  "CH4_tCO2e": 2500.0,
  "N20_tCO2e": 29799.999999999996,
  "TtCO2e": 1000.0,
  "tCO2b": 100.0,
  "tCO2e": 1000.0
}
```

Endpoint for recording activity and emissions data for Other Scope 3 sources.

`POST https://dynm-api.herokuapp.com/community/other`

<aside>Request params</aside>

| Param                     | Type    | Required | Description                                                                                                                                                                                             |
| ------------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| gpc_ref                   | string  | true     | The GPC reference string for this category e.g I.1.1 for the sub-category ‘Emissions from fuel combustion within the city boundary’ within Stationary Combustion’s category ‘I.1 RESIDENTIAL BUILDINGS’ |
| scope                     | string  | true     | The appropriate scope. One of 1, 2 or 3                                                                                                                                                                 |
| description               | string  | nullable | General description of the row activity or calculation.                                                                                                                                                 |
| activity                  | string  | true     | The emission type or activity being reported on e.g Food                                                                                                                                                |
| category                  | string  | true     | The emission type or activity being reported on e.g Biodiesels                                                                                                                                          |
| sub_category              | string  | nullable | Appropriate sub-category under Inventory options with sub-categories e.g from the gpc_ref example above Emissions from fuel combustion within the city boundary                                         |
| notation_key              | string  | true     | Denote justifications for exclusion or partial accounting of GHG emission source categories. E.g NE for Not Estimated                                                                                   |
| activity_amount           | float   | true     | Amount of the units of the selected activity to report on. eg 100                                                                                                                                       |
| activity_units            | string  | true     | Measurement units for the activity data e.g kWh                                                                                                                                                         |
| activity_multiplier_units | string  | nullable | Units to be used if you wish to convert your data e.g kWh                                                                                                                                               |
| activity_multiplier       | float   | nullabke | An override value for converting activity data. If provided the conversion from activity_multiplier_units won’t be used rather this figure will be used. E.g 1.0                                        |
| oxidation_factor          | float   | nullable | Overrides default oxidation factor(1) e.g 1.0                                                                                                                                                           |
| gases                     | string  | nullable | Selection of gases in the reported emissions                                                                                                                                                            |
| manual_emissions_data     | boolean | true     | Indicates whether to use manually entered emission data or to calculate from an emission dataset. Defaults to false.                                                                                    |
| emission_factor           | string  | nullable | Name of the custom emission factor to be referenced. It is the reference field from one of the custom emission factors added. e.g Biodiesels_EF                                                         |
| CO2                       | float   | nullable | Manually entered C02 emissions                                                                                                                                                                          |
| CH4                       | float   | nullable | Manually entered CH4 emissions                                                                                                                                                                          |
| total_CO2e                | float   | nullable | Manually entered total_CO2e emissions                                                                                                                                                                   |
| CO2b                      | float   | nullable | Manually entered CO2b emissions                                                                                                                                                                         |
| N2O                       | float   | nullable | Manually entered N2O emissions                                                                                                                                                                          |
| data_quality              | string  | true     | Denotes quality of the submitted emissions data e.g L                                                                                                                                                   |
| methodology_description   | string  | nullable | Description of the methodology used for selecting a Notation Key                                                                                                                                        |
| source                    | string  | true     | The data source for the emissions or activity.                                                                                                                                                          |
| data_quality_explanation  | string  | true     | The explanation for choice of data quality level.                                                                                                                                                       |
| custom_emission_factors   | list    | true     | custom params for this particular endpoint                                                                                                                                                              |
