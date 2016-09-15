# FAQ

## Not found merchants

Запросы, для которых не нашлось описание мерчента по ключевым словам, попадают в таблицу <code>missed_queries</code>

## Current version

Запрос <code>http://{HOST}:{PORT}/SmartTransactionsEndpoint/version</code> возвращает текущую версию сборки

## Statistics collection mode

В режиме сбора статистики сервис только накапливает ненайденные запросы, в ответе всегда возвращается пустой список. Для переключения нужно в файле <code>${TOMCAT_HOME}/webapps/SmartTransactionsEndpoint/META-INF/context.xml</code> установить параметр <code>silentMode</code> в <code>true</code>

## cURL sample query

```cURL

			curl -X POST -H "Content-Type: application/json" -d '{"0": {"text": "Starbucks"}, "1": {"text": "Burger king"}}' http://dev.idamob.ru/SmartTransactionsEndpoint/describeTransactions
		
```

## UTF-8 support

В server.xml необжодимо добавить URIEncoding="UTF-8" как в примере:

<code>
<Connector port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               URIEncoding="UTF-8" />
</code>