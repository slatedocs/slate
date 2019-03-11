

# Countries

## Get Country

Get data regarding a specific country:

```APIs
GET https://dev.zoomsymbols.com/api/countries/getCountries
```
> Parameters (OPTIONAL)

```
group: true/false

Optional boolean value to group countries by region.
```

> Response

```json
  {
    "result": [
	{
	  "country_id": 1,
	  "name": "Afghanistan",
	  "region": "Asia / Pacific"
	},
	{
	  "country_id": 2,
	  "name": "Albania",
	  "region": "Europe"
	},
	...
	]  
}
```

## Get Timezones

Get data for all time zones:

```APIs
GET https://dev.zoomsymbols.com/api/countries/getTimezones
```


> Response

```json
  {
    "result": [{
	  "timezone_id": 1,
	  "timezone_name": "Africa/Adibjan",
	  "timezone_code": "LTM"
	},
	...
	]  
}
```
