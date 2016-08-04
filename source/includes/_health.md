# Health

```java
import org.javalite.http.Get;
import org.javalite.http.Http;

Get response = Http.get("http://api.douglasrlee.com/v1/public/health");
```

```shell
curl -X GET "http://api.douglasrlee.com/v1/public/health"
```

> The above command returns JSON structured like this:

```json
{
  "overall_status": "OK"
}
```

The health endpoint is available to check to status of Douglas R. Lee' API.