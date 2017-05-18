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

**Пример wsdl**

pro - [IdaMobProxyServiceFacade?wsdl](http://dev.idamob.ru/proxy/services/IdaMobProxyServiceFacade?wsdl)

**Версия сервера**

pro - [version/getVersion](http://dev.idamob.ru/pro/endpoints/version/getVersion)

## Multy server

**Рекомендация по развертыванию нескольких серверов на одной машине**

0. Повторно выполнить шаги 3, 4, 5 из раздела 'Порядок установки серверной части iDa Mobile' для создания ещё одной копии схемы БД
0. В Apache TomCat задеплоить копии pro.war и light.war предварительно переименовав их, например в pro_new.war и light_new.war
0. Установить фронт-серверное приложение, например, [nginx](https://nginx.org/ru/) или [Apache HTTPD](https://httpd.apache.org)
0. Настроить дополнительный домен, например, если у вас используется домен ida.mybank.com для мобильных приложений, то нужно создать домен ida_new.mybank.com, который так-же будет ссылаться на IP настраиваемого сервера
0. Произвести настройку фронт-сервера таким образом, что бы траффик для домена ida.mybank.com перенаправлялся на localhost:8080/pro (8080 - порт TomCat по умолчанию), а траффик ``ida_new.mybank.com`` направлялся на ``localhost:8080/pro_new``. Пример подобной [настройки nginx](http://serverfault.com/questions/536576/nginx-how-do-i-forward-a-http-request-to-another-port)

## Server config

```xml
smarttransactions.enabled=false
proxy.timeout=60000
proxy.login.case.insensitive=true

proxy.wsdl=http://dev.idamob.ru/proxy/services/IdaMobProxyServiceFacade?wsdl
proxy.service=IdaProServiceFacade
proxy.endpoint=BasicHttpBinding_IdaMobProxyServiceFacadePortType

security.password.hash=false
security.password.encrypt=false
security.verification.encrypt=false

pro.banner.enabled=false

pigeon.enabled=false
pigeon.url=http://dev.idamob.ru/pigeon
pigeon.twoFactorAuth=false
```

**Конфиг сервера**

Все настройки сервиса задаются через файл конфигурирования, который расположен по адресу ``pro.war\WEB-INF\classes\config\bank.properties`` путём добавления следующих параметров:

key | type | comment
--- | --- | ---:
smarttransactions.enabled | bool | наличие модуля SmartTransactions
proxy.timeout | int | время ожидания отвера сервера из бэка, в милесекундах (должно быть так же установлено в мобильной апликации)
proxy.login.case.insensitive | bool | признак чуствительности к регистру для логина

 | | -
--- | --- | ---:
proxy.wsdl | string | ``${bank.proxy.wsdl}``
proxy.service | string | IdaMobProxyServiceFacade
proxy.endpoint | string | IdaMobProxyServiceFacadeHttpSoap12Endpoint

 | | -
--- | --- | ---:
security.password.hash | bool | наличие запроса хэш пароля и алгоритм как он был получен [requestHashedPassword](#requesthashedpassword). на сервере pro происходит проверка совпадают ли хеши полученные с клиента и с сервера банка
security.password.encrypt | bool | расшифровывать пароль, зашифрованный на мобильном криенте
security.verification.encrypt | bool | расшифровывать код из запроса [confirmTransfer](#confirmtransfer), зашифрованный на мобильном криенте
security.incorrect_login_attempts | int | количество неверных попыток ввода ПИН кода

 | | -
--- | --- | ---:
pigeon.url | string | сервер пушей ``http://dev.idamob.ru/pigeon``
pigeon.enabled | bool | наличие связки с сервером пуш сообщений PiGeon
pigeon.twoFactorAuth | bool | наличие процесса двухфакторной аутентификации при подписке пользователя на пуш уведомления

```xml
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="1.0"
             xmlns="http://java.sun.com/xml/ns/persistence"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_1_0.xsd">

    <persistence-unit name="jpaUnit" transaction-type="RESOURCE_LOCAL">
        <provider>org.hibernate.ejb.HibernatePersistence</provider>

        <class>com.idamobile.platform.pro.model.Session</class>
        <class>com.idamobile.platform.pro.model.SecretKey</class>
        <class>com.idamobile.platform.pro.model.PinCode</class>
        <class>com.idamobile.platform.pro.model.User</class>
        <class>com.idamobile.platform.pro.model.IncorrectLoginAttempt</class>
        <class>com.idamobile.platform.pro.model.DeviceVerificationCode</class>
        <class>com.idamobile.platform.pro.model.DeviceVerificationCodeSalt</class>

        <!--POSTGRESQL-->
        <properties>
            <property name="hibernate.connection.driver_class" value="org.postgresql.Driver" />
            <property name="hibernate.connection.url" value="jdbc:postgresql://127.0.0.1/proproxytestbase" />
            <property name="hibernate.connection.username" value="username" />
            <property name="hibernate.connection.password" value="password" />
            <property name="hibernate.dialect" value="org.hibernate.dialect.PostgreSQL82Dialect" />
            <property name="hibernate.hbm2ddl.auto" value="update"/>
            <property name="hibernate.show_sql" value="false"/>
        </properties>
    </persistence-unit>
</persistence>
```

**Конфиг базы**

Все настройки базы задаются через файл конфигурирования, который расположен по адресу ``pro.war/WEB-INF/classes/META-INF/persistence.xml`` путём добавления следующих параметров:

key | type | comment
--- | --- | ---:
hibernate.connection.url | string | адрес расположения базы банных
hibernate.connection.username | string | логин к базе
hibernate.connection.password | string | пароль к базе
