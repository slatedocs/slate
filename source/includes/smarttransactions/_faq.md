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