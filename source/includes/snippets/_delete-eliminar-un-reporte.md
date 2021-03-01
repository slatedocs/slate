> Ejemplo de petición

```shell
curl 'https://clientela.admetricks.com/report/13505/' \
  -X 'DELETE' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Authorization: Token YOUR_TOKEN'
```

```javascript
var fetch = require('node-fetch');

fetch('https://clientela.admetricks.com/report/13504/', {
    method: 'DELETE',
    headers: {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'Token YOUR_TOKEN'
    }
});
```

```python
import requests

headers = {
    'Accept': 'application/json, text/plain, */*',
    'Authorization': 'Token YOUR_TOKEN',
}

response = requests.delete('https://clientela.admetricks.com/report/13504/', headers=headers)
```

```php
<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'Accept' => 'application/json, text/plain, */*',
    'Authorization' => 'Token YOUR_TOKEN'
);
$response = Requests::delete('https://clientela.admetricks.com/report/13504/', $headers);
```

> Ejemplo de respuesta

```shell
# Si la operación es exitosa, recibirás una respuesta con cuerpo vacío y estado 204

# De lo contrario, recibirás el código de error correspondiente y una breve descripción de lo ocurrido
```
