# Errors

AUTORO が返却する API のエラーコードです。

Code | Description
---------- | -------
400 | Bad Request -- リクエストが無効です。
401 | Unauthorized -- JWT が無効です。
403 | Forbidden -- 禁止されたリクエストです。
404 | Not Found -- リクエスト対象のリソースが発見できませんでした。これには権限が理由になり発見できなかった場合も含みます。
406 | Not Acceptable -- リクエストのフォーマットが異なっています。
429 | Too Many Requests -- リクエストのクオータ上限値に達しました。
500 | Internal Server Error -- サーバー内で何かしらのエラーが発生しました。
503 | Service Unavailable -- サーバーに障害が発生し応答ができません。