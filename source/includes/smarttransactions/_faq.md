# FAQ

### Мониторинг запросов, для которых нет описания

Запросы, для которых не нашлось описание мерчента по ключевым словам, попадают в таблицу <code>missed_queries</code>

### Запрос текущей версии сборки

Запрос <code>http://{HOST}:{PORT}/SmartTransactionsEndpoint/version</code> возвращает текущую версию сборки

### Переключение сервиса в режим сбора статистики

В режиме сбора статистики сервис только накапливает ненайденные запросы, в ответе всегда возвращается пустой список. Для переключения нужно в файле <code>${TOMCAT_HOME}/webapps/SmartTransactionsEndpoint/META-INF/context.xml</code> установить параметр <code>silentMode</code> в <code>true</code>

### Пример вызова сервиса с помощью cURL
<code>
			curl -X POST -H "Content-Type: application/json" -d '{"0": {"text": "Starbucks"}, "1": {"text": "Burger king"}}' http://dev.idamob.ru/SmartTransactionsEndpoint/describeTransactions
		</code>