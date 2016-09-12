# iDa Pro to Bank Proxy

```text
www.websequencediagrams.com

participant Mobile as mob
participant iDaPro as pro
participant iDaPiGeon as pig
participant Bank Proxy as bank

mob->pro: registerDevice()
pro->pig: exists()
alt exists true
    pro->pig: updateToken()
else exists false
    pro->bank: checkSubscriptionAuthorized()
    alt checkSubscriptionAuthorized true
        pro->pig: subscribe()
    else checkSubscriptionAuthorized false
        pro->bank: authorizeSubscription()
        bank-->mob: send SMS with code
        pro->bank: verifySubscriptionAuthorization()
        alt code ok
            pro->pig: subscribe()
end
```

В данном разделе описаны запросы от сервера iDa Pro к банковскому проксирующему серверу

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgTW9iaWxlIGFzIG1vYgoADgxpRGFQcm8gYXMgcHJvAAkRaUdlb24AGAVpZwAqDUJhbmsgUHJveHkgYXMgYmFuawoKbW9iLT5wcm86IHJlZ2lzdGVyRGV2aWNlKCkKcHJvLT5waWc6IGV4aXN0cygpCmFsdAAGByB0cnVlCiAgICAAHQp1cGRhdGVUb2tlbigpCmVsc2UAJQhmYWxzACMLYmFuazogY2hlY2tTdWJzY3JpcHRpb25BdXRob3JpemVkKCkAVgVhbHQAChwAegoAeg5zAE4GYmUAQAcAgQUFACwcAIEVCgCBFA9hAIEKCACBGwwAgRYHICAgAII_BS0tPm1vYjogc2VuZCBTTVMgd2l0aCBjb2QAPRV2ZXJpZnkAgWIUYQBNDwCBeAVvZGUgb2sAgVsJAIFKHgplbmQ&s=default "Схема регистрации на push-уведомления")

- Мобильное приложение инициирует регистрацию устройства на iDa Pro
- iDa Pro проверяет iDa Pigeon, зарегистрировано ли устройство
- Если устройство не зарегистрировано, iDa Pro инициирует запрос к proxy на отправку одноразового пароля
- Банк отправляет одноразовый пароль, который вводится в мобильном приложении
- Мобильное приложение отправляет в iDa Pro введенный код, который маршрутизируется в системы банка
- Если пароль верный, iDa Pro отправляет в iDa PiGeon запрос на регистрацию устройства
