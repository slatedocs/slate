<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Smart Transactions</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav>
	<div>
		<a href="about.html">О решении</a>
		<a href="architecture.html">Архитектура</a>
		<a class="active" href="installation.html">Установка</a>
		<a href="protocol.html">Протокол</a>
		<a href="faq.html">Вопросы</a>
	</div>
</nav>
<div>

## Предусловия ##

Для установки сервиса SmartTransactions необходимо наличие следующих запущенных сервисов:

- Apache Tomcat 7.x
- Postgres 9.x

## Содержимое поставки ##

- SmartTransactionsEndpoint.war веб-приложение сервиса
- merchants_dump.sql - дамп базы

## Инструкция по установке ##
1. Остановить Tomcat с текущей установкой SmartTransactions
2. Удалить базу smarttransactions (данные и схему)
3. Создать базу пустую smarttransactions с владельцем dbUsername/dbPassword (параметры используются ниже в настройках подключения)
4. Выполнить предоставленный скрипт: `psql -U <username> -W smarttransactions < merchants_dump.sql`
5. Скопировать `SmartTransactionsEndpoint.war` в `${TOMCAT_HOME}/webapps`

## Настройка приложения ##
Следующие параметры приложения находятся в файле `${TOMCAT_HOME}/webapps/SmartTransactionsEndpoint/META-INF/context.xml`:

* dbUrl - строка соединения с базой данных
* dbUsername - имя пользователя
* dbPassword - пароль
* silentMode - true если необходимо влючить приложение только в режим сбора статистики

## Проверка успешности установки ##

Открыть в браузре [http://127.0.0.1:8080/SmartTransactionsEndpoint/](http://127.0.0.1:8080/SmartTransactionsEndpoint/)
При успешной установке на открывшейся странице отобразится версия сборки, Service URL, количество доступных объектов (больше 0)

## Настройка модуля iDaPro ##

Приложение Pro имеет доступ к сервису SmartTransactions по протоколу JSON over HTTP.
Для этого файле `${PRO_TOMCAT_HOME}/webapps/pro/WEB-INF/classes/smarttransactions.properties` требуется указать в свойстве `service_url` значение Service URL, полученное после установки сервиса SmartTransactions.

## Обновление базы данных ##

1. Остановить Tomcat с приложением
2. Убедиться, что нет открытых соединений с базой данных smarttransactions
3. Удалить полностью базу smarttransactions
4. Создать новую базу smarttransactions для используемого ранее пользователя (например, test)
5. Запустить предоставленный скрипт merchants_dump.sql
6. Запустить Tomcat

</div>
</body>
</html>