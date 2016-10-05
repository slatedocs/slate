## DeviceInfoDTO

key | type | status | comment
--- | ---- | :----: | ---:
IP | string | 1..1 | MAC адрес устройства в случае его наличия и возможности получения от девайсв
APP_VERSION | string | 1..1 | версия приложения, например ``1.2.3 (456)``
OS | string | 1..1 | операционная система { IOS, ANDROID }
VENDOR_ID | string | 1..1 | уникальный идентификатор устройства

<aside class="warning">[Apple](https://developer.apple.com/library/content/releasenotes/General/WhatsNewIniOS/Articles/iOS7.html#//apple_ref/doc/uid/TP40013162-SW1): In iOS 7 and later, if you ask for the MAC address of an iOS device, the system returns the value 02:00:00:00:00:00. If you need to identify the device, use the identifierForVendor (VENDOR_ID)</aside>
