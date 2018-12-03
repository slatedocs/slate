# Bank Proxy to iDa PiGeon

```text
www.websequencediagrams.com

participant Bank as B
participant Pigeon as P
participant "iDa Pro" as Pro
participant Cloud Messaging Service as CM
participant Mobile as M

B->P: pushSend(). В данном сообщении передается \nвся информация о содержимом Push-уведомления
P->CM: Отправка push-уведомления
CM->M: Отправка push-уведомления
M->M: Пользователь открывает push-уведомление

M->Pro: pushIsOpened()
    Pro->P: pushIsOpened()
    P->B: pushIsOpened()

alt В push нет запроса pushGetDetails()
    M->M: Показ содержимого push-уведомления\nв мобильном приложении в\n зависимости от типа уведомления
else В push есть запрос pushGetDetails()
    M->+Pro: pushGetDetails()
    activate M
    Pro->P:pushGetDetails()
    P-->Pro: Детали push
    Pro-->M: Детали push
    deactivate Pro
    M->-M: Показ содержимого push-уведомления\nв мобильном приложении
end
```

В данном разделе описаны запросы от банковского проксирующего сервера к сервера iDa PiGeon

**Пример реализации отправки**

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBhcyBCCgAKDFBpZ2VvbiBhcyBQAAsNImlEYSBQcm8iABYFcm8AKA1DbG91ZCBNZXNzYWdpbmcgU2VydmljZSBhcyBDTQBSDU1vYmlsABQFTQoKQi0-UDogcHVzaFNlbmQoKS4g0JIg0LTQsNC90L3QvtC8INGB0L7QvtCx0YnQtdC90LjQuCDQv9C10YDQtQAjBbXRgtGB0Y8gXG7QsgAEBdC40L3RhNC-0YDQvNCw0YbQuNGPINC-AEMGtAA1BbbQuNC8AFkFUHVzaC3Rg9CyAEkFvtC80LsAYQbRjwpQLT5DTTog0J7RgtC_0YDQsNCy0LrQsACBKQUAHBhDTS0-AAQwACwHn9C-0LvRjNC30L7QstCw0YLQtdC70Ywg0L7RgtC60YDRi9CyAIFqBgBoGtC1CgpNLT5Qcm8Agk8GSXNPcGVuZWQoKQogICAgUHJvAIJnCQALEC0-QgAjEQphbHQg0JIAgxsFINC9AHcF0LfQsACCCgW-0YEAggYHR2V0RGV0YWlscwBhBwCBRwu60LDQtwCCaBSz0L4Agi4cXG7QsiAAgyAFsdC4AIITBQCECQYAgwUFuNC70L7QtgCEBwqyXG4AgRMGstC40YEAg1gG0YHRgtC4AII6BSDRgtC40L_QsCAAg1QXZWxzZQCBXwq10YHRgtGMAIFeDQCBUBkrAIJkCQCBdhFhY3RpdmF0ZSBNAIJyDACCHRVQLQCDLwfQlNC10YLQsNC70LgAhhMFAIMwCQCEUwYAChVkZQBiCVBybwCCewgtAIIYbAplbmQ&s=napkin "Схема отправки push-уведомления")

- Банк инициирует отправку сообщения в iDa PiGeon
- iDa PiGeon отправляет сообщение на мобильные устройства. В случае, если устройство не зарегистрировано, отправляет соответствующее сообщение об ошибке
- Если на мобильном устройстве открыли уведомление, то приложение отправляет информацию об этом событии
- Если для показа уведомление нужны дополнительные детали, то производится соответствующий запрос. Если нет, то показывается содержимое push-уведомления
