# Filtering Results

> Filtering Example:

```shell
curl https://app.beyonic.com/api/contacts?first_name=tom -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contacts = Beyonic::Contact.list(
  first_name: 'tom'
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contacts = Beyonic_Contact::getAll(
  "first_name" => "tom"
);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contacts = beyonic.Contact.list(first_name='tom')


```

Most Beyonic API methods support a way to retrieve a list of records or a single record. For example, you can retrieve a list of contacts or a single contact.

When retrieving a list or a single record, you can limit the results to records where a given field matches specific search criteria. To do this, add the  keyword to your request as shown in the examples.

Not all fields are filterable. See the documentation for each method below to see which fields are filterable within that method.