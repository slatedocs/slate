# Installation

**Системные требования**

Для установки сервиса SmartTransactions необходимо наличие:

 ||
--- | ---
RDBMS | [PostgreSQL 9.3](https://www.postgresql.org/download/) or higher
Servlet container | [Apache Tomcat 7](http://tomcat.apache.org/download-70.cgi)

**Состав поставки**

- SmartTransactionsEndpoint.war - веб-приложение сервиса
- smt_core.backup - дамп базы core
- smt_merchants.backup - дамп базы merchants

**Инструкция по установке**

0. Создать новую базу smt_merchants и установить нужного владельца
0. Выбрать новую базу smt_merchants и нажать на ней правой клавишей. В контекстном меню выбрать пункт "Восстановить.." 
0. В открывшемся окне выбрать исходный файл (smt_merchants.backup), на вкладке "Параметры восстановления #1" поставить флажок напротив пункта Не сохранять - Владелец
0. Запустить восстановление
0. Создать новую базу smt_core и установить нужного владельца
0. Выбрать новую базу smt_core и нажать на ней правой клавишей. В контекстном меню выбрать пункт "Восстановить.." 
0. В открывшемся окне выбрать исходный файл (smt_core.backup), на вкладке "Параметры восстановления #1" поставить флажок напротив пункта Не сохранять - Владелец
0. Запустить восстановление
0. Скопировать ``SmartTransactionsEndpoint.war</code> в <code>${TOMCAT_HOME}/webapps``
0. Скопировать ``SmartTransactionsConsole.war</code> в <code>${TOMCAT_HOME}/webapps``



**Настройка приложения**

Следующие параметры приложения находятся в файле ``${TOMCAT_HOME}/conf/server.xml`` внутри тега GlobalNamingResources:

   <Resource name="jdbc/core"
            url="jdbc:postgresql://localhost:5432/smt_core"
            username="username"
            password="password"
            auth="Container" type="javax.sql.DataSource" driverClassName="org.postgresql.Driver"
            maxActive="20" maxIdle="10" maxWait="-1"/>

    <Resource name="jdbc/merchants"
            url="jdbc:postgresql://localhost:5432/smt_merchants"
            username="username"
            password="password"
            auth="Container" type="javax.sql.DataSource" driverClassName="org.postgresql.Driver"
            maxActive="20" maxIdle="10" maxWait="-1"/>


**Проверка успешности установки**

Открыть в браузре [127.0.0.1:8080/SmartTransactionsEndpoint/](http://127.0.0.1:8080/SmartTransactionsEndpoint/)
При успешной установке на открывшейся странице отобразится версия сборки, Service URL, количество доступных объектов (больше 0)

**Настройка модуля iDaPro**

Приложение Pro имеет доступ к сервису SmartTransactions по протоколу JSON over HTTP.
Для этого файле ``${PRO_TOMCAT_HOME}/webapps/pro/WEB-INF/classes/smarttransactions.properties`` требуется указать в свойстве ``service_url`` значение Service URL, полученное после установки сервиса SmartTransactions

**Инструкция по обновлению сервиса SmartTransactions**

0. Раздеполить SmartTransactionsConsole.war и SmartTransactionsEndpoint.war
0. Задеплоить новые версии, сначала SmartTransactionsEndpoint.war, а затем SmartTransactionsConsole.war


**Инструкция по обновлению базы мерчантов**

0. Получить от IDA Mobile свежий дамп базы мерчантов smt_merchants.backup
0. Остановить Tomcat, на котором работает SmartTransactions
0. Запустить pgAdmin и подключиться к нужному серверу СУБД
0. Удалить базу данных smt_merchants (предварительно посмотрев какому владельцу она принадлежит)
0. Создать новую базу smt_merchants и установить того владельца, который был в удалённой БД на шаге 4
0. Выбрать новую базу и нажать на ней правой клавишей. В контекстном меню выбрать пункт "Восстановить.." 
0. В открывшемся окне выбрать исходный файл (из шага 1), на вкладке "Параметры восстановления #1" поставить флажок напротив пункта Не сохранять - Владелец
0. Запустить восстановление
0. После завершения восстановления запустить Tomcat


