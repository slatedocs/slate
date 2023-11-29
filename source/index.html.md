---
title: Esoko API Reference

language_tabs: # must be one of https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers
  - 

toc_footers:
  - <a href='https://api-agrosmart-esoko.onrender.com/api-docs/#/Generate%20ApiKey/post_create_api_key'>Intaract with the API </a>
  - <a href='https://esoko.com/'>Documentation Powered by Esoko</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Kittn API
---

# Introduction


Welcome to the documentation for the MTN Mobile App Integration with Esoko APIs. This documentation is designed to guide developers through the seamless incorporation of Esoko's powerful agricultural services into MTN's mobile app. By integrating these APIs, users gain access to valuable information such as Market Prices, Weather Forecasts, Agronomic Advisory, and Climate Smart Information.


## Purpose

The primary purpose of this integration is to enhance the user experience within the MTN mobile app by providing real-time and personalized agricultural insights. Developers are encouraged to follow the guidelines outlined in this documentation to ensure a secure, efficient, and successful integration with Esoko's APIs.

## Target Audience

This documentation is intended for developers, engineers, and technical teams involved in the integration process. It provides comprehensive details about API endpoints, request and response structures, authentication mechanisms, and more. Additionally, training sessions are available for MTN's technical and support teams to facilitate a smooth integration process.

## Key Features

- **Communication Architecture:** Utilizing RESTful principles for communication, ensuring a standardized and efficient interaction between the MTN mobile app and Esoko's APIs.

- **Data Exchange Format:** All data exchanged follows the JSON (JavaScript Object Notation) format, promoting consistency and simplicity in information exchange.

- **Authentication and Authorization:** API keys are employed for secure user authentication, with access tokens included in API requests for authorized access.

- **Error Handling:** Standardized error response formats are defined in JSON, including error codes, messages, and suggested resolutions to enhance troubleshooting.

- **API Services:**
  - **Market Prices:** Retrieve real-time market prices for specified commodities, locations, and time ranges.
  - **Weather Forecast:** Access detailed weather forecasts based on geographical coordinates and specific weather attributes.
  - **Agronomic Advisory:** Receive personalized agronomic advice based on user preferences, historical data, and contextual information.
  - **Climate Smart Information:** Obtain daily climate-smart information, including weather details and agronomic tips, for a specific farmer type, location, and commodity.


## Getting Started

Before diving into the API documentation, ensure that you have completed the necessary setup as outlined in the [MTN Mobile App Integration with Esoko APIs Setup Guide](#authentication) to guarantee a smooth integration process.

Now, let's explore the detailed API documentation for each service:

- [Agronomic Advisory API Documentation](#agronomic-advisory-api)
- [Market Prices API Documentation](#market-prices-api)
- [Climate Smart Information API Documentation](#climate-smart-information-api)
- [Weather Forecast API Documentation](#weather-forecast-api)

If you have any questions or require assistance, feel free to reach out to our support team.

Enjoy the journey of integrating Esoko's agricultural services into the MTN mobile app!


# Authentication

To interact with Esoko's APIs, you must obtain an API key.

### Obtaining an API Key

To access Esoko's APIs, follow these steps to generate your API key:

1. Open the [Esoko API Key Management Page](https://api-agrosmart-esoko.onrender.com/api-docs/#/Generate%20ApiKey/post_create_api_key) in your browser.

2. On the API Key Management page, find the "Generate API Key" section.

3. In the request body, provide the necessary information:

   > request body:

```json
{
  "user": "your-username"
}
```

- **user:** Your user information is associated with the API key.

  <aside class="notice">
  You must replace <code>your-username</code> with your personal username.
  </aside>

4. Click the "Execute" button to initiate the API key creation process.

5. If successful, you will receive a response with a status code of `200` and a JSON object containing the following information:

   - message: A success message.
   - apiKey:The newly generated API key.

  > status code : 200

   > Response Structure:

```json
{
  "message": "success",
  "apiKey": "your-generated-api-key"
}
```

6. Copy the generated API key and securely store it. This key will be used in your request header to       access Esoko's agricultural services.

If you encounter any issues during this process, please refer to the [Esoko API Key Management Swagger Documentation](https://api-agrosmart-esoko.onrender.com/api-docs/) for additional details and troubleshooting information.

# Agronomic Advisory API

### Endpoint:

`GET: https://api-agrosmart-esoko.onrender.com/agronomic-advice/v1/daily`

This endpoint retrieves daily agricultural advice for a specific farmer-type,location and date range.

> Sample-Query

> `GET: https://api-agrosmart-esoko.onrender.com/agronomic-advice/v1/daily?location=Tamale&farmerType=crop_farmer&datePublished=2023-12-05`

### Query Parameters:

| Parameter       | Type   | Description                                | Example       |
| --------------- | ------ | ------------------------------------------ | ------------- |
| `location`      | String | The location for which advice is requested | `Tamale`      |
| `farmerType`    | String | The type of farmer                         | `crop_farmer` |
| `datePublished` | String | The date for which advice is requested     | `2023-12-05`  |

> status code : 200

> Response Structure:

```json
{
  "id": "1bad5efd-20ba-41f6-b5d6-c07ab4c0fe3d",
  "farmer_type": "crop_farmer",
  "commodity": "Yam",
  "location": "Tamale",
  "text_advice": {
    "id": "d8bb41c7-7175-4b57-a2c1-64e23d467a2f",
    "title": "Optimizing Crop Yield",
    "body": "For optimal yield of Corn and Beans, ensure that you follow a proper crop rotation schedule. Rotate your crops to improve soil fertility and reduce the risk of pests and diseases. Additionally, consider using organic fertilizers and timely irrigation to support healthy growth."
  },
  "audio_advices": [
    {
      "id": "cf0bdebe-796d-49e5-95bf-9a7a1aac52eb",
      "title": "Audio Guide for Crop Farmers",
      "body": "https://example.com/audio/crop_farming_guide.mp3",
      "advisoryId": "96ec46fe-5de4-406d-93e8-befda4b2b213"
    },
    {
      "id": "665379e3-493b-4f28-a9e3-933d59b92e57",
      "title": "Audio Guide for Crop Farmers",
      "body": "https://example.com/audio/crop_farming_guide.mp3",
      "advisoryId": "96ec46fe-5de4-406d-93e8-befda4b2b213"
    }
  ],
  "date_published": "2023-12-05T00:00:00.000Z"
}
```

### Authorization

  Include the following **API Key** in the header of your request:

  - **Key:** `x-api-key`
  - **Value:** `your-generated-api-key` 

### Error Responses:

Refer to the [Errors](#errors) section for possible error responses and their meanings.

# Market Prices API

### Endpoint:

- `GET: https://api-agrosmart-esoko.onrender.com/market-prices/v1/daily`

This endpoint retrieves daily market prices. The response includes a list of commodities with their corresponding prices

> Sample-Query

> `GET: https://api-agrosmart-esoko.onrender.com/market-prices/v1/daily?commodity=Cassava&market=Makola`

### Query Parameters:

| Parameter   | Type   | Description                                          | Example   |
| ----------- | ------ | ---------------------------------------------------- | --------- |
| `commodity` | String | The type of commodity for which prices are requested | `Cassava` |
| `market`    | String | The market for which prices are requested            | `Makola`  |

> status code : 200

> Response Structure:

```json
{
  "message": "success",
  "totalCount": 2,
  "data": [
    {
      "id": "255ddc12-2716-4e62-a01c-d21e271d780c",
      "market": "Makola",
      "location": "Accra",
      "commodity": "Cassava",
      "wholesale_price": "300",
      "retail_price": "300",
      "date_recorded": "2023-12-05T00:00:00.000Z"
    },
    {
      "id": "797c51c1-43ee-497a-b52d-f966a57d810e",
      "market": "Makola",
      "location": "Accra",
      "commodity": "Cassava",
      "wholesale_price": "500",
      "retail_price": "800",
      "date_recorded": "2023-12-06T00:00:00.000Z"
    }
  ]
}
```

### Authorization

  Include the following **API Key** in the header of your request:

  - **Key:** `x-api-key`
  - **Value:** `your-generated-api-key` 

### Error Responses:

Refer to the [Errors](#errors) section for possible error responses and their meanings.

# Climate Smart Information API

### Endpoint:

- `GET: https://api-agrosmart-esoko.onrender.com/climate-smart-info/v1/daily`

This endpoint retrieves daily climate-smart information, including weather details and agronomic tips, for a specific farmer type, location, and commodity.

> Sample-Query

> `GET: https://api-agrosmart-esoko.onrender.com/climate-smart-info/v1/daily?farmerType=Crop Farmer&location=Nkawkaw&commodity=Rice`

### Query Parameters:

| Parameter    | Type   | Description                                                   | Example       |
| ------------ | ------ | ------------------------------------------------------------- | ------------- |
| `farmerType` | String | The type of farmer for whom information is requested          | `Crop Farmer` |
| `location`   | String | The location for which climate-smart information is requested | `Nkawkaw`     |
| `commodity`  | String | The specific commodity for which information is requested     | `Rice`        |

> status code : 200

> Response Structure:

```json
{
  "message": "success",
  "data": [
    {
      "id": "2cf376a6-4236-4cbc-8ff0-5f5fd40483bd",
      "farmer_type": "Crop Farmer",
      "location": "Nkawkaw",
      "commodity": "Rice",
      "weather_info": "Sunny",
      "audio_advices": [
        {
          "id": "1e281da3-b8e0-4e8e-b266-5c27f33867ba",
          "title": "Audio Guide for Crop Farmers",
          "body": "https://example.com/audio/crop_farming_guide.mp3",
          "climateSmartId": "2cf376a6-4236-4cbc-8ff0-5f5fd40483bd"
        },
        {
          "id": "393cc8a9-d266-4499-baba-6c4986e2560f",
          "title": "Audio Guide for Crop Farmers",
          "body": "https://example.com/audio/crop_farming_guide.mp3",
          "climateSmartId": "2cf376a6-4236-4cbc-8ff0-5f5fd40483bd"
        }
      ],
      "date_published": "2023-12-05T00:00:00.000Z"
    }
  ]
}
```

### Authorization

  Include the following **API Key** in the header of your request:

  - **Key:** `x-api-key`
  - **Value:** `your-generated-api-key` 

### Error Responses:

Refer to the [Errors](#errors) section for possible error responses and their meanings.

# Weather Forecast API:

### Endpoint:

- ` https://api-agrosmart-esoko.onrender.com/weather-forecasts/v1/daily`

This endpoint provides daily weather forecasts for a specified location. Users can tailor the language of the weather description, receiving it in either English or French. Additionally, a corresponding sound file URL is provided in local languages for enhanced accessibility.

> `GET: https://api-agrosmart-esoko.onrender.com/weather-forecasts/v1/daily?language=twi&location=Aburi`

### Query Parameters

| Parameter  | Type   | Description                                            | Example |
| ---------- | ------ | ------------------------------------------------------ | ------- |
| `language` | String | The language in which to receive the weather forecast  | `twi`   |
| `location` | String | The location for which weather forecasts are requested | `Aburi` |

> status code : 200

> Response Structure:

```json
{
  "message": "success",
  "description": "Text in English or French",
  "soundFileUrl": "twi_url"
}
```

### Authorization

  Include the following **API Key** in the header of your request:

  - **Key:** `x-api-key`
  - **Value:** `your-generated-api-key` 

### Error Responses:

Refer to the [Errors](#errors) section for possible error responses and their meanings.
