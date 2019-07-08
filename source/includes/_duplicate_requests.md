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
import com.beyonic.models.Payment;

// Payments with duplicate key check
HashMap<String, Object> paymentCreate = new HashMap<>();
paymentCreate.put("phonenumber", "+80000000001");
paymentCreate.put("first_name", "Kennedy");
paymentCreate.put("last_name", "Amani");
paymentCreate.put("currency", "BXC");
paymentCreate.put("amount", "30");
paymentCreate.put("description", "Per diem payment");
paymentCreate.put("payment_type", "money");

// Pass unique duplicate key as the third parameter, unique per payment
response = new Payment().create(paymentCreate, null, "duplicate.check.key");
System.out.println(response);

```

Beyonic provides a way for you to make sure that duplicate requests do not result in multiple transactions. This allows you to safely retry a request if you're not sure that it worked the first time.

You do this by adding a "Duplicate-Check-Key" header to your request. The value of this header can be any string value of your choosing. If Beyonic finds a previous request with the same Duplicate-Check-Key, we will reject the new request with a 409 Conflict error. The response body will include "Duplicate Request Detected!" as part of the error detail message.

Duplicate Check Keys expire after 24 hours, after which a new request is generated if the same key is used.