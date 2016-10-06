# Installation

**Системные требования**

Для установки сервиса SmartTransactions необходимо наличие:

 ||
--- | ---
RDBMS | [PostgreSQL 9.3](https://www.postgresql.org/download/) or higher
Servlet container | [Apache Tomcat 7](http://tomcat.apache.org/download-70.cgi)

**Состав поставки**

- SmartTransactionsEndpoint.war - веб-приложение сервиса
- merchants_dump.sql - дамп базы

**Инструкция по установке**

0. Остановить TomCat с текущей установкой SmartTransactions
0. Удалить базу smarttransactions (данные и схему)
0. Создать базу пустую smarttransactions с владельцем dbUsername/dbPassword (параметры используются ниже в настройках подключения)
0. Выполнить предоставленный скрипт: ``psql -U &lt;username&gt; -W smarttransactions &lt; merchants_dump.sql``
0. Скопировать ``SmartTransactionsEndpoint.war</code> в <code>${TOMCAT_HOME}/webapps``

**Настройка приложения**

Следующие параметры приложения находятся в файле ``${TOMCAT_HOME}/webapps/SmartTransactionsEndpoint/META-INF/context.xml``:

- dbUrl - строка соединения с базой данных
- dbUsername - имя пользователя
- dbPassword - пароль
- silentMode - true если необходимо влючить приложение только в режим сбора статистики

**Проверка успешности установки**

Открыть в браузре [127.0.0.1:8080/SmartTransactionsEndpoint/](http://127.0.0.1:8080/SmartTransactionsEndpoint/)
При успешной установке на открывшейся странице отобразится версия сборки, Service URL, количество доступных объектов (больше 0)

**Настройка модуля iDaPro**

Приложение Pro имеет доступ к сервису SmartTransactions по протоколу JSON over HTTP.
Для этого файле ``${PRO_TOMCAT_HOME}/webapps/pro/WEB-INF/classes/smarttransactions.properties`` требуется указать в свойстве ``service_url`` значение Service URL, полученное после установки сервиса SmartTransactions

**Обновление базы данных**

0. Остановить TomCat с приложением
0. Убедиться, что нет открытых соединений с базой данных smarttransactions
0. Удалить полностью базу smarttransactions
0. Создать новую базу smarttransactions для используемого ранее пользователя (например, test)
0. Запустить предоставленный скрипт merchants_dump.sql
0. Запустить TomCat
