# iDa Bank Proxy to PiGeon

```text
www.websequencediagrams.com

participant Bank as B
participant Pigeon as P
participant "iDa Pro" as Pro
participant Mobile as M

B->P: pushSend(). В данном сообщении передается \nвся информация о содержимом Push-уведомления
P->M: Отправка push-уведомления
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

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBhcyBCCgAKDFBpZ2VvbiBhcyBQAAsNImlEYSBQcm8iABYFcm8AKA1Nb2JpbGUgYXMgTQoKQi0-UDogcHVzaFNlbmQoKS4g0JIg0LTQsNC90L3QvtC8INGB0L7QvtCx0YnQtdC90LjQuCDQv9C10YDQtQAjBbXRgtGB0Y8gXG7QsgAEBdC40L3RhNC-0YDQvNCw0YbQuNGPINC-AEMGtAA1BbbQuNC8AFkFUHVzaC3Rg9CyAEkFvtC80LsAYQbRjwpQLT5NOiDQntGC0L_RgNCw0LLQutCwAIEoBQAbGE0ALQaf0L7Qu9GM0LfQvtCy0LDRgtC10LvRjCDQvtGC0LrRgNGL0LIAgTUGADQa0LUKCk0tPlBybwCCGgZJc09wZW5lZCgpCiAgICBQcm8AgjIJAAsQLT5CACMRCmFsdCDQkgCCZgUg0L0AdwXQt9CwAIFWBb7RgQCBUgdHZXREZXRhaWxzAGEHAIFHC7rQsNC3AIIzFLPQvgCBehxcbtCyIACCawWx0LgAghMFAINUBgCCUQW40LvQvtC2AINSCrJcbgCBEway0LjRgQCDIwbRgdGC0LgAgjoFINGC0LjQv9CwIACDHxdlbHNlAIFfCrXRgdGC0YwAgV4NAIFQGSsAgmQJAIF2EWFjdGl2YXRlIE0AgnIMAIIdFVAtAIMvB9CU0LXRgtCw0LvQuACFXgUAgzAJAIRTBgAKFWRlAGIJUHJvAIJ7CC0AghhsCmVuZA&s=default "Схема отправки push-уведомления")

- Банк инициирует отправку сообщения в iDa PiGeon
- iDa PiGeon отправляет сообщение на мобильные устройства. В случае, если устройство не зарегистрировано, отправляет соответствующее сообщение об ошибке
- Если на мобильном устройстве открыли уведомление, то приложение отправляет информацию об этом событии
- Если для показа уведомление нужны дополнительные детали, то производится соответствующий запрос. Если нет, то показывается содержимое push-уведомления