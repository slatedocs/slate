# API

## Introduction

The ScoutAPM API is currently fairly narrow in scope. It is intended to
support 3rd party dashboards, exporting summary data from your applications.

If you have ideas on API enhancements, please contact us at support@scoutapm.com

## Authorization

### Obtaining a token

1. Log into the ScoutAPM website
2. Go to your organization's settings
3. Enter a name (for your use), and obtain a token

### Sending Authorization

The key must be provided with every request, via one of several methods:

* An HTTP Header named `X-SCOUT-API`
* As part of the JSON request body, as the top level key: `key`
* A URL query string argument named `key`

### Response Format

Every endpoint returns a JSON object. The object will at the minimum,
have a `"header"` field with embedded status and message fields. If the
endpoint returned results, it will be under a results keys.

```
{
  "header": {
    "status": {
      "code": 200,
      "message": "OK"
    },
    "apiVersion": "0.1"
  },
  "results": { ... }
}
```

## API Endpoints

### Applications

#### Applications List

`/api/v0/apps` - returns a list of applications and their ids

Results:

```
"results": {
  "apps": [
    {
      "name": "MyApp Staging",
      "id": 100
    },
    {
      "name": "MyApp Production",
      "id": 101
    }
}
```


#### Application Detail

`/api/v0/apps/:id` - returns information about a specific application

Results:

```
"results": {
  "app": {
    "id": 101,
    "name": "MyApp Production"
  }
}
```

### Metrics

#### Known Metric List

`/api/v0/apps/:id/metrics` returns a list of known metric types

Results:

```
"results": {
  availableMetrics": [
    "response_time",
    "errors",
    "throughput"
  ]
}
```


#### Metric Data

`/api/v0/apps/:id/metrics/:metric_type` - will return a time series dataset for the metric.

**Parameters:**

* **from** - start time, ISO8601 formatted
* **to** - end time, ISO8601 formatted

These two times must not be more than 2 weeks apart

Results:

```
"results": {
  series": {
    "response_time": [
      [
        "2016-05-16T22:00:00Z",
        90.33333333333333
      ],
      [
        "2016-05-16T22:01:00Z",
        86.87233333333333
      ]
    ]
  }
}
```
