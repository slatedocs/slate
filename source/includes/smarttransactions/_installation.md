# Installation

## Requirements

Для установки сервиса SmartTransactions необходимо наличие следующих запущенных сервисов:

- Apache Tomcat 7.x

- Postgres 9.x

## Содержимое поставки

- SmartTransactionsEndpoint.war веб-приложение сервиса

- merchants_dump.sql - дамп базы

## Инструкция по установке

- Остановить Tomcat с текущей установкой SmartTransactions

- Удалить базу smarttransactions (данные и схему)

- Создать базу пустую smarttransactions с владельцем dbUsername/dbPassword (параметры используются ниже в настройках подключения)

- Выполнить предоставленный скрипт: <code>psql -U &lt;username&gt; -W smarttransactions &lt; merchants_dump.sql</code>

- Скопировать <code>SmartTransactionsEndpoint.war</code> в <code>${TOMCAT_HOME}/webapps</code>

## Настройка приложения

Следующие параметры приложения находятся в файле <code>${TOMCAT_HOME}/webapps/SmartTransactionsEndpoint/META-INF/context.xml</code>:

- dbUrl - строка соединения с базой данных

- dbUsername - имя пользователя

- dbPassword - пароль

- silentMode - true если необходимо влючить приложение только в режим сбора статистики

## Проверка успешности установки

Открыть в браузре [http://127.0.0.1:8080/SmartTransactionsEndpoint/](http://127.0.0.1:8080/SmartTransactionsEndpoint/)
При успешной установке на открывшейся странице отобразится версия сборки, Service URL, количество доступных объектов (больше 0)

## Настройка модуля iDaPro

Приложение Pro имеет доступ к сервису SmartTransactions по протоколу JSON over HTTP.
Для этого файле <code>${PRO_TOMCAT_HOME}/webapps/pro/WEB-INF/classes/smarttransactions.properties</code> требуется указать в свойстве <code>service_url</code> значение Service URL, полученное после установки сервиса SmartTransactions.

## Обновление базы данных

- Остановить Tomcat с приложением

- Убедиться, что нет открытых соединений с базой данных smarttransactions

- Удалить полностью базу smarttransactions

- Создать новую базу smarttransactions для используемого ранее пользователя (например, test)

- Запустить предоставленный скрипт merchants_dump.sql

- Запустить Tomcat