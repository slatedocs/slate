# FAQ

**Порядок установки серверной части iDa Mobile**

Общие шаги

1. Произвести установку СУБД PostgresSQL
2. При помощи утилиты pgAdmin (обычно входит в дистрибутив PostgreSQL) подключиться к СУБД
3. Создать новую роль (пользователя)
4. Создать новую БД с указанием созданной в п.3 роли в качестве владельца создаваемой БД
5. В созданной БД добавить схемы с названиями: lightschema, proschema
6. Установить Apache Tomcat
7. При желании - настроить работу [Apache Tomcat с протоколом SSL](http://habrahabr.ru/post/134453/) (можно выполнить позднее)
8. Открыть файл *.war при помощи ZIP-архиватора и перейти в подпапку *.war\WEB-INF\classes\META-INF
9. Открыть файл persistence.xml и внести соответствующие правки, необходимые для подключения к БД (параметры: hibernate.connection.url, hibernate.connection.username, hibernate.connection.password).
10. Заменить в *.war файле persistence.xml на тот, который был отредактирован в п.3
11. Запустить Apache Tomcat (в случае с linux - <code>./tomcat/bin/startup.sh</code>, в случае с windows вомпользоваться специальной системной службой)

Установка iDa Pro

1. В подпапке pro.war\WEB-INF\classes\config открыть конфигурационный файл банка (Например, bank.properties) и проверить корректность значений параметров proxy.wsdl, proxy.service, proxy.endpoint а так же проверить доступность значения параметра proxy.wsdl с машины, на которой будет запущен iDa Pro. В случае внесения изменений в файл *.properties - сохранить новую версию этого файла в pro.war
2. Скопировать файл pro.war в папку /tomcat/webapps и дождаться пока будет автоматически создана подпапка /Pro
3. Открыть через pgAdmin требуемую БД и проверить, что в схеме proschema добавились таблицы
4. Проверить работоспособность приложения с помощью настроенного мобильного клиента

**Порядок обновления серверной части iDa Mobile (pro.war)**

1. Получить новую сборку в виде файла *.war
2. Открыть файл *.war при помощи ZIP-архиватора и перейти в подпапку *.war\WEB-INF\classes\META-INF
3. Открыть файл persistence.xml и внести соответствующие правки, необходимые для подключения к БД (параметры: hibernate.connection.url, hibernate.connection.username, hibernate.connection.password).
4. Заменить в *.war файле persistence.xml на тот, который был отредактирован в п.3
5. Убедится, что серверй приложений Tomcat запущен (в linux - <code>ps -ef|grep tomcat</code>). Если не запущен - запустить его (в linux - <code>./tomcat/bin/startup.sh</code>).
6. Перейти в папку tomcat/webapps
7. В случае наличия в ней старой версии iDa Light или iDa Pro (в зависимости от того, что обновляется) - удалить файл pro.war и дождаться пока папка обновляемого приложения удалится автоматически (~ 15 секунд)
8. Скопировать в папку /tomcat/webapps/ полученный в п.4 файл *.war
9. Дождаться пока в папке /tomcat/webapps появится папка с наименованием приложения (~ 15 секунд)
10. Осуществить проверку работы приложения при помощи настроенного мобильного клиента

**Эталонная wsdl**

- pro server - [http://dev.idamob.ru/proxy/services/IdaMobProxyServiceFacade?wsdl](http://dev.idamob.ru/proxy/services/IdaMobProxyServiceFacade?wsdl)

**Рекомендация по развертыванию нескольких серверов на одной машине**

Используйте nginx
