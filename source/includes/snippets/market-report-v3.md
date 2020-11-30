> Ejemplo de petición

```shell
curl -X POST -H "Authorization: Token YOUR_TOKEN" "https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1"
```

```python
import requests

headers = {
    'Authorization': 'Token YOUR_TOKEN',
    'content-type': 'application/json'
}

params = (
    ('day', '2020-10-01'),
    ('country', '1'),
    ('device', '1'),
    ('ad_type', '1'),
)

response = requests.post(
  'https://clientela.admetricks.com/market-report/data/v3/',
  headers=headers,
  params=params
)
```

```javascript
const endpoint = "https://clientela.admetricks.com/market-report/data/v3/?day=2020-10-01&country=1&device=1&ad_type=1"

fetch(endpoint, {
    method: 'POST',
    headers: {
        'Authorization': 'Token YOUR_TOKEN',
        'content-type': 'application/json'
    }
});
```
