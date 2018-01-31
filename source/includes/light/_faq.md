# FAQ

**Порядок установки серверной части iDa Mobile**

Общие шаги

0. Произвести установку СУБД PostgresSQL
0. При помощи утилиты pgAdmin (обычно входит в дистрибутив PostgreSQL) подключиться к СУБД
0. Создать новую роль (пользователя)
0. Создать новую БД с указанием созданной в п.3 роли в качестве владельца создаваемой БД
0. В созданной БД добавить схемы с названиями: lightschema, proschema
0. Установить Apache Tomcat
0. При желании - настроить работу [Apache Tomcat с протоколом SSL](http://habrahabr.ru/post/134453/) (можно выполнить позднее)
0. Открыть файл *.war при помощи ZIP-архиватора и перейти в подпапку *.war\WEB-INF\classes\META-INF
0. Открыть файл persistence.xml и внести соответствующие правки, необходимые для подключения к БД (параметры: hibernate.connection.url, hibernate.connection.username, hibernate.connection.password).
0. Заменить в *.war файле persistence.xml на тот, который был отредактирован в п.3
0. Запустить Apache Tomcat (в случае с linux - <code>./tomcat/bin/startup.sh</code>, в случае с windows вомпользоваться специальной системной службой)

Установка iDa Light

0. Скопировать файл light.war в папку /tomcat/webapps и дождаться пока будет автоматически создана подпапка /Light
0. Открыть через pgAdmin требуемую БД и проверить, что в схеме lightschema добавились таблицы
0. Через консоль pgAdmin выполнить предоставленный компанией iDa Mobile скрипт SQL для заполнения БД первоначальными данными
0. Проверить работоспособность приложения с помощью настроенного мобильного клиента
0. Второй вариант проверки является вызов wsdl из браузера ``http://.../light/services/WsEndpointServiceFacade?wsdl``

**Порядок обновления серверной части iDa Mobile (*.war)**

0. Получить новую сборку в виде файла *.war
0. Открыть файл *.war при помощи ZIP-архиватора и перейти в подпапку *.war\WEB-INF\classes\META-INF
0. Открыть файл persistence.xml и внести соответствующие правки, необходимые для подключения к БД (параметры: hibernate.connection.url, hibernate.connection.username, hibernate.connection.password).
0. Заменить в *.war файле persistence.xml на тот, который был отредактирован в п.3
0. Убедится, что серверй приложений Tomcat запущен (в linux - <code>ps -ef|grep tomcat</code>). Если не запущен - запустить его (в linux - <code>./tomcat/bin/startup.sh</code>).
0. Перейти в папку tomcat/webapps
0. В случае наличия в ней старой версии iDa - удалить файл *.war и дождаться пока папка обновляемого приложения удалится автоматически (~ 15 секунд)
0. Скопировать в папку /tomcat/webapps/ полученный в п.4 файл *.war
0. Дождаться пока в папке /tomcat/webapps появится папка с наименованием приложения (~ 15 секунд)
0. Осуществить проверку работы приложения при помощи настроенного мобильного клиента

**Пример wsdl**

light server - [http://dev.idamob.ru/light/services/WsEndpointServiceFacade?wsdl](http://dev.idamob.ru/light/services/WsEndpointServiceFacade?wsdl)

## Server config

```xml
bankId.current=UniMegaBank
resources.path = lightresources

news.first.result.size=10
rss.updates.interval=600
ws.allowed_addresses=

com.idamobile.platform.light.core.processor.EmailProcessor.SEND_EMAIL=false
com.idamobile.platform.light.core.processor.EmailProcessor.WSDL_URL=http://dev.idamob.ru/orders-server-stub/services/OrdersWebServiceFacade?wsdl

proxy.wsdl=http://dev.idamob.ru/proxy/services/IdaMobLightProxyServiceFacade?wsdl
proxy.service=IdaMobLightProxyServiceFacade
proxy.endpoint=IdaMobLightProxyServiceFacadeHttpSoap12Endpoint
```

**Конфиг сервера**

key | type | comment
--- | --- | ---:
bankId.current | string | уникальный идентификатор банка
resources.path | string | папка на сервере где располажены ресурсы (иконочки, баннеры)
news.first.result.size | int | пакеты новостей для пэгинации на апликации
rss.updates.interval | int | как часто сервер будет пытаться читать обновления rss ленты
ws.allowed_addresses | string | ограничитель адресов доступа к лайту (модет быть пустым и желательно настраивать через средства nginx)
SEND_EMAIL | bool | нужно ли отправлять заявки из контакнтых форм на email
WSDL_URL | string | возможность получать заявки через веб-сервис. необходимо реализвать сервис по шаблону WSDL http://dev.idamob.ru/orders-server-stub/services/OrdersWebServiceFacade?wsdl
proxy.wsdl | string | WSDL многошаговой формы
proxy.service | string | IdaMobLightProxyServiceFacade
proxy.endpoint | string | IdaMobLightProxyServiceFacadeHttpSoap12Endpoint


##  SMTP

```xml
update lightschema.properties set value = 'Trust iDa Mail Server' where key = 'mail.sender.name'
update lightschema.properties set value = 'smtp.gmail.com' where key = 'mail.smtp.host'
update lightschema.properties set value = '465' where key = 'mail.smtp.port'
update lightschema.properties set value = 'true' where key = 'mail.smtp.ssl.enable'
update lightschema.properties set value = 'notification@idamob.ru' where key = 'mail.smtp.user'
update lightschema.properties set value = 'notificationidamob' where key = 'mail.smtp.pass'
update lightschema.properties set value = 'true' where key = 'mail.smtp.auth.enable'
```

**Обновление в базе настроек**

Для конфигурирования обратной связи клиента с банком через почту нужно прописать настройки в базу
