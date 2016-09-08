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

Установка панели администрирования iDa Light

0. Установить среду выполнения Python версии 2.7
0. Установить расширение Tornado-web для Python (например, с помощью утилиты PIP)
0. Распаковать файл WebAdmin.rar, полученный от iDa Mobile в требуемую папку на сервере
0. Запустить админ-панель скриптом: python /WebAdmin/server.py --bank_id [bankId, полученный от iDa Mobile] --port [порт, на котором будет доступна админ-панель] --server [путь, по которому доступен сервер iDa Light, например, http://dev.idamob.ru]

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

**Эталонная wsdl**

- light server - [http://dev.idamob.ru/light/services/WsEndpointServiceFacade?wsdl](http://dev.idamob.ru/light/services/WsEndpointServiceFacade?wsdl)
