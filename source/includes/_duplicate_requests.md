# Duplicate Requests

> Example Request:

```shell
curl https://app.beyonic.com/api -H "Duplicate-Check-Key: ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = Beyonic::Payment.create({
    phonenumber: "+80000000001",
    first_name: "Kennedy",
    last_name: "Amani",
    amount: "100.2",
    currency: "BXC",
    description: "Per diem payment",
    payment_type: "money",
    callback_url: "https://my.website/payments/callback",
    metadata: {id: "1234", name: "Lucy"}
}, {"Duplicate-Check-Key"=>"ab594c14986612f6167a"})

```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$payment = Beyonic_Payment::create(array(
  "phonenumber" => "+80000000001",
  "first_name" => "Kennedy",
  "last_name" => "Kennedy",
  "amount" => "100.2",
  "currency" => "BXC",
  "description" => "Per diem payment",
  "payment_type" => "money",
  "callback_url" => "https://my.website/payments/callback",
  "metadata" => array("id"=>"1234", "name"=>"Lucy")
), array("Duplicate-Check-Key": "ab594c14986612f6167a"));

print_r($payment);  // Examine the returned object
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = beyonic.Payment.create(phonenumber='+80000000001',
                       first_name='Kennedy',
                       last_name='Amani',
                       amount='1200',
                       currency='BXC',
                       description='Per diem',
                       callback_url='https://my.website/payments/callback',
                       metadata={'id': '1234', 'name': 'Lucy'},
                       duplicate_check_key="ab594c14986612f6167a"
                       )

print payment  # Examine the returned object

```

```java
package com.beyonic.examples.payments;

import org.json.JSONException;
import org.json.JSONObject;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class CreatePayment {

    private static final String API_ENDPOINT = "https://app.beyonic.com/api/payments";
    private static final String API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";
    private static final String CHARSET = "UTF-8";
    private static final String PHONE_NUMBER = "+80000000001";
    private static final String CURRENCY = "BXC";
    private static final String DESCRIPTION = "Per Diem";
    private static final String AMOUNT = "1200";
    private static final String CALLBACK_URL = "https://my.website/payments/callback";

    public static void main(String[] args){
        URL url = null;
        try {
            url = new URL(API_ENDPOINT);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("charset", CHARSET);
            conn.setRequestProperty("Authorization", "Token " + API_KEY);
            conn.setRequestProperty("Duplicate-Check-Key", "ab594c14986612f6167a");
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setDoInput(true);

            JSONObject paymentObject = createPaymentObject();

            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            out.write(paymentObject.toString());
            out.close();

            System.out.println(conn.getResponseCode() + " // " + conn.getResponseMessage());

            try {
                if (conn.getResponseCode() == 201) {
                    InputStream inputStream = conn.getInputStream();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                    String response = reader.readLine();
                    reader.close();

                    JSONObject obj = new JSONObject(response);
                    int paymentID = obj.getInt("id");
                    System.out.println("ID of created Payment: " + paymentID);
                }
            } finally {
                conn.disconnect();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static JSONObject createPaymentObject() throws JSONException {
        JSONObject payment = new JSONObject();
        payment.put("phonenumber", PHONE_NUMBER);
        payment.put("amount", AMOUNT);
        payment.put("currency", CURRENCY);
        payment.put("description", DESCRIPTION);
        payment.put("callback_url", CALLBACK_URL);
        return payment;
    }
}
```

Beyonic provides a way for you to make sure that duplicate requests do not result in multiple transactions. This allows you to safely retry a request if you're not sure that it worked the first time.

You do this by adding a "Duplicate-Check-Key" header to your request. The value of this header can be any string value of your choosing. If Beyonic finds a previous request with the same Duplicate-Check-Key, we will reject the new request with a 409 Conflict error. The response body will include "Duplicate Request Detected!" as part of the error detail message.

Duplicate Check Keys expire after 24 hours, after which a new request is generated if the same key is used.