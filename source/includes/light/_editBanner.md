## editBanner

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bannerId | string | 1..1 | идентиифкатор
banner | [WsBannerDTO](#wsbannerdto) | 1..1 | баннер
**Response:** | | |
banner | [WsBannerDTO](#wsbannerdto) | 0..1 | баннер
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
