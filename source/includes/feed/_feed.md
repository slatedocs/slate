# Accern Data Feed

## Overview
We will provide you a link with authorization token (one per user) which you can use to hit our servers, once in 10 seconds (or higher/lower based on mutually agreed terms) with the access token in the header. The return response from the API will be a JSON object with up to 100 JSON documents. Each document corresponds to one article. You can also flatten the JSON documents and save them as rows in a CSV file. We have provided a set of Ruby scripts that can download and save the data in JSON or CSV format, as needed. Please scroll to the bottom of this document for instructions on how to run these scripts.

## Backfill
```shell
curl "http://feed.accern.com/v3/alphas?last_id=43211&token=YOUR_TOKEN"
```

API caches last 30 days of data. Your first request to the URL will fetch 100 documents from the beginning of that time period. For your next request you should use the id of the last document received to fetch the next 100 articles. Last document id should be used in URL like  http://feed.accern.com/v3/alphas?last_id=43211
where 43211 is the id for last document received, or last_id. Once you have caught up to the current data stream, and there are no more documents available, you will get a response with 0 documents. It is suggested that you loop through this process after every 10 seconds once you have caught up to the current stream.

## Filters
You can filter the API response using the following parameters.
1. Assigning last_id: Assigning last_id will help you get the real-time stream without duplication. It will fetch the data from the last_id onwards. Refer to the Backfill section and Ruby scripts for usage details.

2. Assigning ticker: By providing ticker symbol in the URL, you can monitor a portfolio of companies. For example, http://feed.accern.com/v3
/alphas?ticker=msft
will give you only data related to Microsoft. You can provide upto 50 companies in each request (comma separated, like ticker=msft,jpm,GOOG,FB). If you seek to increase this limit, let us know and we will work something out. If you don't provide any ticker value, you will get ALL data.

3. Assigning index: You can also filter our data by index. Currently, we support S&P 500, Russell 1000, Russell 3000, Wilshire 5000, BARRON'S 400, DOW 30. You should use the following values to access index-specific data.
Index ==> Value you should use
S&P 500 ==> sp500
Russell 1000 ==> russell1000
Russell 3000 ==> russell3000
Wilshire 5000 ==> wilshire5000
Barron's 400 ==> barrons400
DOW 30 ==> dow30

Currently, you can only request one index at a time. Here is an example that shows how to get all S&P 500 data: http://feed.accern.com/v3/alphas?index=sp500
If you do not provide any filter information, you will receive all data (including possible duplicates). I recommend that you use at least the last_id filter.
Ruby Scripts
The zip file should contain 4 Ruby scripts - 2 helper scripts, and 2 executables.

If you want the data in JSON format, please run ruby alpha_json.rb in the terminal. It will import the data in feed.json file. You need to provide your access token in the second line of alpha_json.rb

If you want the data in CSV format, please run ruby alpha_csv.rb instead. Please note that the CSV format is just the flattened version of the JSON file. It will import the data in feed.csv file. You need to provide your access token in the second line of alpha_csv.rb

Please do not run both the scripts at the same time as they share the same last_id.
