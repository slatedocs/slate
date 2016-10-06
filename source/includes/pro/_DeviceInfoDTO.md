## DeviceInfoDTO

key | type | status | comment
--- | ---- | :----: | ---:
IP | string | 1..1 | IP адрес устройства в случае его доступности или ``0.0.0.0``
APP_VERSION | string | 1..1 | версия приложения, например ``1.2.3 (456)``
OS | string | 1..1 | операционная система { IOS, ANDROID }
VENDOR_ID | string | 1..1 | уникальный идентификатор устройства
MAC | string | 0..1 | приходит если доступно получение значения от устройства

<aside class="warning">Apple: In iOS 7 and later, if you ask for the MAC address of an iOS device, the system returns the value 02:00:00:00:00:00. If you need to identify the device, use the identifierForVendor (VENDOR_ID)</aside>
