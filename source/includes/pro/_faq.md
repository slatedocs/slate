# FAQ

## Pro Install

**Порядок установки серверной части iDa Mobile**

Общие шаги

0. Произвести установку СУБД PostgresSQL
0. При помощи утилиты pgAdmin (обычно входит в дистрибутив PostgreSQL) подключиться к СУБД
0. Создать новую роль (пользователя)
0. Создать новую БД с указанием созданной в п.3 роли в качестве владельца создаваемой БД
0. В созданной БД добавить схемы с названиями: lightschema, proschema
0. Установить Apache Tomcat
0. При желании - настроить работу [Apache Tomcat с протоколом SSL](http://habrahabr.ru/post/134453/) (можно выполнить позднее)
0. Открыть файл *.war при помощи ZIP-архиватора и перейти в подпапку ``*.war\WEB-INF\classes\META-INF``
0. Открыть файл persistence.xml и внести соответствующие правки, необходимые для подключения к БД (параметры: hibernate.connection.url, hibernate.connection.username, hibernate.connection.password).
0. Заменить в *.war файле persistence.xml на тот, который был отредактирован в п.3
0. Запустить Apache Tomcat (в случае с linux - ``./tomcat/bin/startup.sh``, в случае с windows вомпользоваться специальной системной службой)

Установка iDa Pro

0. В подпапке ``pro.war\WEB-INF\classes\config`` открыть конфигурационный файл банка (Например, bank.properties) и проверить корректность значений параметров proxy.wsdl, proxy.service, proxy.endpoint а так же проверить доступность значения параметра proxy.wsdl с машины, на которой будет запущен iDa Pro. В случае внесения изменений в файл *.properties - сохранить новую версию этого файла в pro.war
0. Скопировать файл pro.war в папку /tomcat/webapps и дождаться пока будет автоматически создана подпапка /Pro
0. Открыть через pgAdmin требуемую БД и проверить, что в схеме proschema добавились таблицы
0. Проверить работоспособность приложения с помощью настроенного мобильного клиента

**Порядок обновления серверной части iDa Mobile (*.war)**

0. Получить новую сборку в виде файла *.war
0. Открыть файл *.war при помощи ZIP-архиватора и перейти в подпапку ``*.war\WEB-INF\classes\META-INF``
0. Открыть файл persistence.xml и внести соответствующие правки, необходимые для подключения к БД (параметры: hibernate.connection.url, hibernate.connection.username, hibernate.connection.password).
0. Заменить в *.war файле persistence.xml на тот, который был отредактирован в п.3
0. Убедится, что серверй приложений Tomcat запущен (в linux - ``ps -ef|grep tomcat</code>)``. Если не запущен - запустить его (в linux - ``./tomcat/bin/startup.sh``).
0. Перейти в папку tomcat/webapps
0. В случае наличия в ней старой версии iDa - удалить файл *.war и дождаться пока папка обновляемого приложения удалится автоматически (~ 15 секунд)
0. Скопировать в папку /tomcat/webapps/ полученный в п.4 файл *.war
0. Дождаться пока в папке /tomcat/webapps появится папка с наименованием приложения (~ 15 секунд)
0. Осуществить проверку работы приложения при помощи настроенного мобильного клиента

**Эталонная wsdl**

pro server - [http://dev.idamob.ru/proxy/services/IdaMobProxyServiceFacade?wsdl](http://dev.idamob.ru/proxy/services/IdaMobProxyServiceFacade?wsdl)

## Multy server

**Рекомендация по развертыванию нескольких серверов на одной машине**

0. Повторно выполнить шаги 3, 4, 5 из раздела 'Порядок установки серверной части iDa Mobile' для создания ещё одной копии схемы БД
0. В Apache TomCat задеплоить копии pro.war и light.war предварительно переименовав их, например в pro_new.war и light_new.war
0. Установить фронт-серверное приложение, например, [nginx](https://nginx.org/ru/) или [Apache HTTPD](https://httpd.apache.org)
0. Настроить дополнительный домен, например, если у вас используется домен ida.mybank.com для мобильных приложений, то нужно создать домен ida_new.mybank.com, который так-же будет ссылаться на IP настраиваемого сервера
0. Произвести настройку фронт-сервера таким образом, что бы траффик для домена ida.mybank.com перенаправлялся на localhost:8080/pro (8080 - порт TomCat по умолчанию), а траффик ``ida_new.mybank.com`` направлялся на ``localhost:8080/pro_new``. Пример подобной [настройки nginx](http://serverfault.com/questions/536576/nginx-how-do-i-forward-a-http-request-to-another-port)

## Server config

key | type | comment
--- | --- | ---:
smarttransactions.enabled | bool | наличие модуля SmartTransactions
proxy.timeout | int | время ожидания отвера сервера из бэка, в милесекундах (должно быть так же установлено в мобильной апликации)
proxy.login.case.insensitive | bool | признак caseSensitive для логина

 | | 
--- | --- | ---:
proxy.wsdl | string | ${bank.proxy.wsdl}
proxy.service | string | IdaMobProxyServiceFacade
proxy.endpoint | string | IdaMobProxyServiceFacadeHttpSoap12Endpoint

 | | 
--- | --- | ---:
security.password.hash | bool | наличие запроса хэш пароля и алгоритм как он был получен. На сервере pro происходит проверка совпадают ли хеши полученные с клиента и с сервера банка
security.password.encrypt | bool | пароль, зашифрованный по алгоритму Диффи-Хеллмана
security.verification.encrypt | bool | верификационный код в запросе [confirmTransfer](#confirmTransfer) приходит в зашифрованном виде по алгоритму Диффи-Хеллмана
security.incorrect_login_attempts | int | количество неверных попыток ввода ПИН кода

 | | 
--- | --- | ---:
pigeon.url | string | сервер пушей ``http://dev.idamob.ru/pigeon``
pigeon.enabled | bool | наличие связки с сервером пуш сообщений PiGeon
pigeon.twoFactorAuth | bool | наличие процесса двухфакторной аутентификации при подписке пользователя на пуш уведомления
