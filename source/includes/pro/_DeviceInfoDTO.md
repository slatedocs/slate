## DeviceInfoDTO

> iPhone

```xml
<deviceInfo>
    IP=10.7.17.104;OS=IOS;APP_VERSION=1.0.23;VENDOR_ID=EDC2C767-31DC-4095-82B1-71890EE2778B;LOCALE=ru-RU
</deviceInfo>
```

> Android

```xml
<deviceInfo>
    IP=10.40.116.222;OS=ANDROID;APP_VERSION=3.1.943;VENDOR_ID=353490066235256;MAC=BE:BD:61:2B:F3:B9;LOCALE=RU
</deviceInfo>
```

Дополнительная информация о девайсе пользователя

key | type | status | comment
--- | ---- | :----: | ---:
IP | string | 1..1 | IP адрес устройства в случае его доступности или ``0.0.0.0``
APP_VERSION | string | 1..1 | версия приложения, например ``1.2.3 (456)``
OS | string | 1..1 | операционная система { IOS, ANDROID }
VENDOR_ID | string | 1..1 | уникальный идентификатор устройства
LOCALE | string | 0..1 | локаль телефона
MAC | string | 0..1 | приходит если доступно получение значения от устройства

Уточнение по получению данных параметров:

key | ios | android
--- | :----: | :----:
VENDOR_ID | [identifierForVendor](https://developer.apple.com/reference/uikit/uidevice/1620059-identifierforvendor) | [getDeviceId](https://developer.android.com/reference/android/telephony/TelephonyManager.html#getDeviceId) or [ANDROID_ID](https://developer.android.com/reference/android/provider/Settings.Secure.html#ANDROID_ID)
IP | [NSHost](https://developer.apple.com/reference/foundation/host) | [getInetAddresses](https://developer.android.com/reference/java/net/NetworkInterface.html#getInetAddresses)
MAC | [02:00:00:00:00:00](https://developer.apple.com/library/content/releasenotes/General/WhatsNewIniOS/Articles/iOS7.html#//apple_ref/doc/uid/TP40013162-SW1) | [getHardwareAddress](https://developer.android.com/reference/java/net/NetworkInterface.html#getHardwareAddress)

<aside class="warning">Apple: In iOS 7 and later, if you ask for the MAC address of an iOS device, the system returns the value 02:00:00:00:00:00. If you need to identify the device, use the identifierForVendor (VENDOR_ID) property of UIDevice instead. (Apps that need an identifier for their own advertising purposes should consider using the advertisingIdentifier property of ASIdentifierManager instead.)</aside>
