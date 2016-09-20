# FAQ

**Not found merchants**

Запросы, для которых не нашлось описание мерчента по ключевым словам, попадают в таблицу missed_queries

**Current version**

Запрос ``http://{HOST}:{PORT}/SmartTransactionsEndpoint/version`` возвращает текущую версию сборки

**Statistics collection mode**

В режиме сбора статистики сервис только накапливает ненайденные запросы, в ответе всегда возвращается пустой список. Для переключения нужно в файле ``${TOMCAT_HOME}/webapps/SmartTransactionsEndpoint/META-INF/context.xml`` установить параметр silentMode в true

**UTF-8 support**

В server.xml необжодимо добавить URIEncoding="UTF-8" как в примере:

```html
<Connector  port="8080"
            protocol="HTTP/1.1"
            connectionTimeout="20000"
            redirectPort="8443"
            URIEncoding="UTF-8"
/>
```
