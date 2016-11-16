## LogoResource

URL для доступа к логотипу распознает параметр для удобства расположения на сервере и оптимизации размеров - _http://.../${image.type}/name.png_ и будет автоматически в зависимости от платформы подменять его на **ios-small** или **android-small**

size | os.type | comment
---|:---:|---:
64х64 | -small | картинка для списка форм
90х60 | -small | картинка логотипа карты (VISA, MasterCard...) отображаемая на карте и в списке продуктов
640х380 | -big | картинка фона пластиковой карты
640х320 | -big | картинка баннера в форме
640х320 | -small | картинка баннера в новостях

comment | url
--- | ---
proxy response | ``http://static.idamob.ru/pro/cards/${image.type}/ic_visa.png``
iPhone convert | [http://static.idamob.ru/pro/cards/ios-small/ic_visa.png](http://static.idamob.ru/pro/cards/ios-small/ic_visa.png)
Android convert | [http://static.idamob.ru/pro/cards/android-small/ic_visa.png](http://static.idamob.ru/pro/cards/android-small/ic_visa.png)
