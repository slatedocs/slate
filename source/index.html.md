---
title: DYNM

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL
  - python: Python
  - javascript: Javascript
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

Energy and Carbon Dioxide conversions

# Carbon Dioxide

> REQUEST

```shell
curl -X POST \
  https://dynm.herokuapp.com/carbon-dioxide-conversion \
  -H "Content-type: application/json" \
  -d '{
    "fuel_type": "Vegetable Oil",
    "input": 100,
    "unit": "gallon"
  }'
```

```javascript
const Conversions = Object.freeze({
  VEGETABLE_OIL_BTU_PER_GALLON: 120000,
  VEGETABLE_OIL_MMBTU_PER_GALLON: 0.12,
  VEGETABLE_OIL_KGCO2_PER_GALLON: 9.79,
  VEGETABLE_OIL_GCH4_PER_GALLON: 0.13,
  VEGETABLE_OIL_GN2O_PER_GALLON: 0.01,
});

function get_fuel_conversions(fuel_type) {
  var fuel_conversions = {};
  var reg = new RegExp("^" + fuel_type, "i");
  Object.entries(Conversions).forEach(function ([key, value]) {
    if (key.match(reg)) {
      fuel_conversions[key] = value;
    }
  });
  return fuel_conversions;
}

function get_units(fuel_conversions) {
  var units = {};
  Object.entries(fuel_conversions).forEach(([key, value]) => {
    units[key.match(/.+_(\S+)_PER_/)[1]] = value;
  });
  return units;
}

function convert(fuel_type, unit, input) {
  var fuel_conversions = get_fuel_conversions(fuel_type);
  if (!fuel_conversions) return "Fuel type not found";
  var units = get_units(fuel_conversions);

  primary_unit = Object.keys(fuel_conversions)[0].split("_PER_")[1];

  units[primary_unit] = 1.0;

  if (!Object.keys(units).includes(unit.toUpperCase()))
    return "Unit not found. Use either [" + Object.keys(units) + "]";

  var conversion = {};
  var unit_value = units[unit.toUpperCase()];

  Object.entries(units).forEach(([key, value]) => {
    var val = input * (value / unit_value);
    conversion[key] = parseFloat(val);
  });
  return JSON.stringify(conversion);
}
console.log(convert("VEGETABLE_OIL", "gch4", 0.13));
```

```python
import json
import re
Conversions = {
	"VEGETABLE_OIL_BTU_PER_GALLON": 120000,
	"VEGETABLE_OIL_MMBTU_PER_GALLON": 0.12,
	"VEGETABLE_OIL_KGCO2_PER_GALLON": 9.79,
	"VEGETABLE_OIL_GCH4_PER_GALLON": 0.13,
	"VEGETABLE_OIL_GN2O_PER_GALLON": 0.01
}

def convert(fuel_type, unit, amount):
  fuel_conversions = {key: value for (key, value) in Conversions.items() if re.search(r"^{0}".format(fuel_type), key, re.IGNORECASE)}
  if not fuel_conversions: return "Fuel type not found"

  primary_unit = list(fuel_conversions)[0].partition('_PER_')[2]
  base_conversion = unit_conversion(fuel_conversions, unit)
  unit_is_primary = re.match(unit, primary_unit, re.IGNORECASE)
  if not unit_is_primary and not base_conversion:
    return "Unit not found."

  conversion = {}

  if unit_is_primary:
    conversion[primary_unit] = float(amount)
  else:
    conversion[primary_unit] = amount /float(base_conversion)

  for name, value in fuel_conversions.items():
    fuel_unit = re.search('.+_(\S+)_PER_', name, re.IGNORECASE).group(1)
    if unit_is_primary:
      val = amount * float(value)
    else:
      val = amount * float(value)/ base_conversion
    conversion[fuel_unit] = float(val)
  return json.dumps(conversion)


def unit_conversion(units, unit):
  for (key, value) in units.items():
    presence = re.search(unit + '_PER_', key, re.IGNORECASE)
    if presence: return value
  return False

print(convert("VEGETABLE_OIL", 'Gallon', 1))
```

```php
<?php

$conversions = [
	'VEGETABLE_OIL_BTU_PER_GALLON' => 120000,
	'VEGETABLE_OIL_MMBTU_PER_GALLON' => 0.12,
	'VEGETABLE_OIL_KGCO2_PER_GALLON' => 9.79,
	'VEGETABLE_OIL_GCH4_PER_GALLON' => 0.13,
	'VEGETABLE_OIL_GN2O_PER_GALLON' => 0.01
];

function fuelConversions($fuelType) {
  global $conversions;
  $matches = array();
  foreach ($conversions as $name => $value) {
    $reg = '/^'. $fuelType .'/i';
    preg_match($reg, $name, $match);

    if (!empty($match)) {
      $matches[$name] = $value;
    }
  }
  return $matches;
}

function unitConversions($fuelConversions) {
  $units = array();
  foreach ($fuelConversions as $name => $value) {
    preg_match('/.+_(\S+)_PER_/i', $name, $match);
    $units[$match[1]] = $value;
  }
  return $units;
}


function convert($fuelType, $unit, $amount) {
  $fuelConversions = fuelConversions($fuelType);

  if (empty($fuelConversions)) { return "Fuel type not found"; }
  $units = unitConversions($fuelConversions);
  $primaryUnit = explode('_PER_', array_keys($fuelConversions)[0])[1];
  $units[$primaryUnit] = 1.0;

  if(!isset($units[strtoupper($unit)])) {
    return 'Unit not found. Use one of ['. implode(', ', array_keys($units)) .']';
  }

  $conversion = array();
  $unitValue = $units[strtoupper($unit)];

  foreach ($units as $name => $value) {
    $val = $amount * floatval($value)/$unitValue;
    $conversion[$name] = floatval($val);
  }
  return json_encode($conversion);
}

var_dump(convert('VEGETABLE_OIL', 'gallon', 1));
?>

```

> RESPONSE : <code>200</code>

```json
{
  "short_ton": 1.0,
  "btu": 29000000.0,
  "quad": 2.9e-8,
  "ej": 3.058e-8,
  "kwh": 8499.414
}
```

Carbon Dioxide Conversion

`POST https://dynm.herokuapp.com/carbon-dioxide-conversion`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                                                                      |
| --------- | ------ | -------- | ------------------------------------------------------------------------------------------------ |
| fuel_type | string | true     | The fuel type to convert                                                                         |
| input     | number | true     | This is the number of units to convert                                                           |
| unit      | string | true     | The unit of measurement. Common units are gallon, short_tons, scf, mmbtu, btu, kgco2, gch4, gn20 |

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

# Energy

> REQUEST

```shell
curl -X POST \
  https://dynm.herokuapp.com/energy-conversion \
  -H "Content-type: application/json" \
  -d '{
    "fuel_type": "Anthracite coal",
    "input": 100,
    "unit": "short ton"
  }'
```

```javascript
const Conversions = Object.freeze({
  ANTHRACITE_COAL_BTU_PER_SHORT_TON: 29000000,
  ANTHRACITE_COAL_QUAD_PER_SHORT_TON: 2.9 * 10 ** -8,
  ANTHRACITE_COAL_EJ_PER_SHORT_TON: 3.058 * 10 ** -8,
  ANTHRACITE_COAL_KWH_PER_SHORT_TON: 8499.414,
});
const unit_conversion = (units, unit) => {
  const presence = units.filter((conversion) => {
    const re = new RegExp(`${unit}_PER_`.toLowerCase());
    const res = conversion[0].toLowerCase().search(re);
    return res > -1 ? conversion : false;
  });
  return presence.length > 0 ? presence[0] : false;
};
const convert = (fuel_type, unit, value) => {
  const fuel_conversions = Object.entries(Conversions);
  if (!fuel_conversions) return "Fuel type not found";
  const primary_unit = fuel_conversions[0][0].split("_PER_")[1];
  const base_conversion = unit_conversion(fuel_conversions, unit);
  const re = new RegExp(unit, "i");
  if (re.test(primary_unit) && !base_conversion) return "Unit not found.";
  let conversion = {};
  if (re.test(primary_unit)) {
    conversion[primary_unit] = value;
  } else {
    conversion[primary_unit] = (value * 1) / base_conversion[1];
  }
  fuel_conversions.forEach((fuel_conversion) => {
    fuel_unit = fuel_conversion[0].match(/.+_(\S+)_PER_/);
    if (primary_unit.match(re)) {
      val = value * parseFloat(fuel_conversion[1]);
    } else {
      val = (value * parseFloat(fuel_conversion[1])) / base_conversion[1];
    }
    conversion[fuel_unit] = val;
  });
  return conversion;
};
console.log(convert("ANTHRACITE_COAL", "kwh", 1));
```

```python
import json
import re
Conversions = {
	'ANTHRACITE_COAL_BTU_PER_SHORT_TON': 29000000,
	'ANTHRACITE_COAL_QUAD_PER_SHORT_TON': 2.9 * 10 ** -8,
	'ANTHRACITE_COAL_EJ_PER_SHORT_TON': 3.058 * 10 ** -8,
	'ANTHRACITE_COAL_KWH_PER_SHORT_TON': 8499.414
}

def convert(fuel_type, unit, amount):
  fuel_conversions = {key: value for (key, value) in Conversions.items() if re.search(r"^{0}".format(fuel_type), key, re.IGNORECASE)}
  if not fuel_conversions: return "Fuel type not found"

  primary_unit = list(fuel_conversions)[0].partition('_PER_')[2]
  base_conversion = unit_conversion(fuel_conversions, unit)
  unit_is_primary = re.match(unit, primary_unit, re.IGNORECASE)
  if not unit_is_primary and not base_conversion:
    return "Unit not found."

  conversion = {}

  if unit_is_primary:
    conversion[primary_unit] = amount
  else:
    conversion[primary_unit] = '{:.03e}'.format(amount /float(base_conversion))

  for name, value in fuel_conversions.items():
    fuel_unit = re.search('.+_(\S+)_PER_', name, re.IGNORECASE).group(1)
    if unit_is_primary:
      val = amount * float(value)
    else:
      val = amount * float(value)/ base_conversion
    conversion[fuel_unit] = '{:.3e}'.format(float(val))
  return json.dumps(conversion)


def unit_conversion(units, unit):
  for (key, value) in units.items():
    presence = re.search(unit + '_PER_', key, re.IGNORECASE)
    if presence: return value
  return False

print(convert("ANTHRACITE_COAL", 'ej', 4.281))
```

```php
<?php

$conversions = [
	'ANTHRACITE_COAL_BTU_PER_SHORT_TON' => 29000000,
	'ANTHRACITE_COAL_QUAD_PER_SHORT_TON' => 2.9 * 10 ** -8,
	'ANTHRACITE_COAL_EJ_PER_SHORT_TON' => 3.058 * 10 ** -8,
	'ANTHRACITE_COAL_KWH_PER_SHORT_TON' => 8499.414
];
function convert($fuelType, $unit, $amount) {
  $fuelConversions = fuelConversions($fuelType);

  if (empty($fuelConversions)) { return "Fuel type not found"; }
  $primaryUnit = explode('_PER_', array_keys($fuelConversions)[0])[1];
  $baseConversion = unitConversion($fuelConversions, $unit);
  $primaryUnitReg = '/' .$unit. '/i';
  if (!preg_match($primaryUnitReg, $primaryUnit) && !$baseConversion) {
    return 'Unit not found.';
  }

  $conversion = array();

  if (preg_match($primaryUnitReg, $primaryUnit)) {
    $conversion[strtoupper($primaryUnit)] = floatval($amount);
  } else {
    $conversion[strtoupper($primaryUnit)] = floatval($amount)/$baseConversion;
  }


  foreach ($fuelConversions as $name => $value) {
    preg_match('/.+_(\S+)_PER_/i', $name, $match);
    $fuelUnit = $match[1];
    if (preg_match($primaryUnitReg, $primaryUnit)) {
      $val = floatval($amount) * $value;
    } else {
      $val = $amount * floatval($value)/$baseConversion;
    }
    $conversion[$fuelUnit] = floatval($val);
  }
  return json_encode($conversion);
}

function fuelConversions($fuelType) {
  global $conversions;
  $matches = array();
  foreach ($conversions as $name => $value) {
    $reg = '/^'. $fuelType .'/i';
    preg_match($reg, $name, $match);

    if (!empty($match)) {
      $matches[$name] = $value;
    }
  }
  return $matches;
}

function unitConversion($fuelConversions, $unit) {
  foreach ($fuelConversions as $name => $value) {
    $reg = '/' .$unit. '+_PER_/i';
    preg_match($reg, $name, $match);

    if (!empty($match)) {
      return $value;
    }
  }
  return false;
}
?>
```

> RESPONSE : <code>200</code>

```json
{
  "short_ton": 1.0,
  "btu": 29000000.0,
  "quad": 2.9e-8,
  "ej": 3.058e-8,
  "kwh": 8499.414
}
```

Energy Conversion

`POST https://dynm.herokuapp.com/energy-conversion`

<aside>Request params</aside>

| Param     | Type   | Required | Description                                                                    |
| --------- | ------ | -------- | ------------------------------------------------------------------------------ |
| fuel_type | string | true     | The fuel type to convert                                                       |
| input     | number | true     | This is the number of units to convert                                         |
| unit      | string | true     | The unit of measurement. Common units are gallon, short_tons, scf, kwh and btu |

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
