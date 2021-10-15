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

HOST: [https://dynm.herokuapp.com/](https://dynm.herokuapp.com/).

## About

Many of our daily activities - such as using electricity, driving a car, or disposing of waste - cause greenhouse gas emissions. Together these emissions make up a household's carbon footprint.

The calculator estimates your footprint in three areas: home energy, transportation and waste. Everyone's carbon footprint is different depending on their location, habits, and personal choices.

For an explanation of the calculator's assumptions and sources, see the [Assumptions and References](https://www.epa.gov/sites/production/files/signpost/cc.html) page.

## How To

You can get a quick, rough estimate of your carbon footprint by using U.S. average amounts. They are provided (along with other useful information) in the "tool tips" throughout the calculator.

For a more accurate estimate, use your own numbers. Gather your utility bills (electricity, natural gas, fuel oil, propane) to calculate your average use over a year. You can find your car's rated fuel efficiency at [fueleconomy.gov](https://fueleconomy.gov/), or you can [calculate your car's actual efficiency](https://www.fueleconomy.gov/mpg/MPG.do?action=calcMPG).

## Adding/Editing conversions

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
  $url = "https://dynm.herokuapp.com/home-energy";
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

`POST https://dynm.herokuapp.com/transportation`

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
  $url = "https =>//dynm.herokuapp.com/transportation";
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

`POST https://dynm.herokuapp.com/transportation`

<aside>Request params</aside>

| Param                             | Type   | Required | Description                                                                      |
| --------------------------------- | ------ | -------- | -------------------------------------------------------------------------------- |
| current_maintainance              | string | true     | state of maintainance of the vehicle. Options are "Do not Do" and "Already Done" |
| average_emissions \_per_vehicle   | string | true     | the average emissions of exhaust per vehicle                                     |
| vehicles                          | object | true     | the vehicles in a household.                                                     |
| average_miles_driven ['duration'] | string | true     | the duration in which the vehicles are driven. Options are Per Week and Per Year |
| average_miles_driven ['value']    | string | true     | the average amount of miles driven                                               |
| average_gas_mileage               | string | true     | average amount of gas used by vehicles per mileage                               |

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

# Conversions

<!-- ......here -->

## Carbon Dioxide

> REQUEST

```shell
curl -X POST \
  https://dynm.herokuapp.com/carbon-dioxide-conversion \
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

fetch("https://dynm.herokuapp.com/carbon-dioxide-conversion", {
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

url = "https://dynm.herokuapp.com/carbon-dioxide-conversion"

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
  $url = "https://dynm.herokuapp.com/carbon-dioxide-conversion";
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

`POST https://dynm.herokuapp.com/carbon-dioxide-conversion`

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

## Carbon Dioxide with mass

> REQUEST

```shell
curl -X POST \
  https://dynm.herokuapp.com/carbon-dioxide-conversion \
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

fetch("https://dynm.herokuapp.com/carbon-dioxide-conversion", {
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

url = "https://dynm.herokuapp.com/carbon-dioxide-conversion"

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
  $url = "https://dynm.herokuapp.com/carbon-dioxide-conversion";
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

`POST https://dynm.herokuapp.com/carbon-dioxide-conversion`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                                                                                                                                     |
| --------- | ------ | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert                                                                                                                                        |
| input     | number | true     | This is the number of units to convert                                                                                                                          |
| unit      | string | true     | The unit of measurement. Common units are gallon, short_tons, scf, mmbtu, btu, co2, ch4, n2o                                                                    |
| mass      | string | false    | This param is only required when the unit type is CO2, CH4 or N2O. Acceptable mass units are kg, g and lbs. If mass is not provided, it defaults to pounds(lbs) |
| category  | string | true     | There are four categories in which conversion can take place. The categories include: residential, commercial, industrial and transportation                    |

## Carbon Dioxide units

> REQUEST

```shell
curl -X GET \
  https://dynm.herokuapp.com/carbon-dioxide-conversion?fuel_type=propane \
  -H "Content-type: application/json" \
```

```javascript
const fetch = require("node-fetch");
fetch("https://dynm.herokuapp.com/energy-conversion?fuel_type=propane", {
  method: "GET",
  headers: {
    "Content-Type": "application/json",
  },
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
url = "https://dynm.herokuapp.com/energy-conversion?fuel_type=propane"
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
  CURLOPT_URL => 'https://dynm.herokuapp.com/carbon-dioxide-conversion?fuel_type=propane',
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

`GET https://dynm.herokuapp.com/carbon-dioxide-conversion?fuel_type=propane`

<aside>Query params</aside>
| Param     | Type   | Required | Description                                                                                                                                  |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert          |

## Energy

> REQUEST

```shell
curl -X POST \
  https://dynm.herokuapp.com/energy-conversion \
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

fetch("https://dynm.herokuapp.com/energy-conversion", {
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

url = "https://dynm.herokuapp.com/energy-conversion"

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
  $url = "https://dynm.herokuapp.com/energy-conversion";
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

`POST https://dynm.herokuapp.com/energy-conversion`

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

## Energy units

> REQUEST

```shell
curl -X GET \
  https://dynm.herokuapp.com/energy-conversion?fuel_type=propane \
  -H "Content-type: application/json" \
```

```javascript
const fetch = require("node-fetch");
fetch("https://dynm.herokuapp.com/energy-conversion?fuel_type=propane", {
  method: "GET",
  headers: {
    "Content-Type": "application/json",
  },
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
url = "https://dynm.herokuapp.com/energy-conversion?fuel_type=propane"
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
  CURLOPT_URL => 'https://dynm.herokuapp.com/energy-conversion?fuel_type=propane',
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

`GET https://dynm.herokuapp.com/energy-conversion?fuel_type=propane`

<aside>Query params</aside>
| Param     | Type   | Required | Description                                                                                                                                  |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| fuel_type | string | true     | The fuel type to convert          |

# Solutions

> REQUEST

```shell
curl --location --request POST 'http://localhost:3000/solutions' \
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

fetch("https://dynm.herokuapp.com/solutions", {
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

url = "https://dynm.herokuapp.com/solutions"

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
  $url = "https =>//dynm.herokuapp.com/transportation";
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

`POST https://dynm.herokuapp.com/solutions`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                   |
| --------- | ------ | -------- | --------------------------------------------- |
| fuel_type | string | true     | fuel type to be recycled                      |
| input     | number | true     | no of tons/month of fuel type to be converted |
