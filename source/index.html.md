---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://roboticcrowd.com'>Robotic Crowd の製品ページはこちら</a>

includes:
  - errors

search: true
---

# はじめに

このドキュメントは、[Robotic Crowd](https://roboticcrowd.com) のREST APIエンドポイントと
その使い方をまとめています。

API は、curlでの利用で記述していますので、各プログラミング言語で使用するために読み替えを行なってください。

## Base URL

ここで紹介する API のエンドポイントのドメインは、次のものです。

`https://api.roboticcrowd.com/`

全てのエンドポイントはこのドメイン以下に設定されています。

# 認証

Robotic Crowd では、API の認証にJWTを使っています。JWTは、プロジェクト内で作成した API Key のaccess_key_id と secret_access_key から作成することができます。API Key は、
プロジェクトオーナー権限をもつユーザーがプロジェクト管理画面から作成する事ができます。
API Key の作成については、こちらの記事を参照してください。

クライアント側で JWT を作成する事を想定していますが、JWT トークンを取得するためのエンドポイントも用意しています。

JWT は、3つの部分、すなわちヘッダー、ペイロード、および署名からなる、エンコードされたJSONオブジェクトです。

**JWT の形式**

JWT は、base64 エンコードされた、 JSON 形式の header と payload また、その両者を繋げて、ハッシュ化した signature のパートからなり、全部を `.` で繋げた文字列になります。

`[header].[payload].[signature]`

具体例を右側（小さい画面では下側）に表示しています。

> JWT の具体例

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaS5yb2JvdGljY3Jvd2QuY29tLyIsImlzcyI6ImNvbnNvbGUucm9ib3RpY2Nyb3dkLmNvbSIsInN1YiI6Iklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ.fpJ-Ho1IvdRdDdBD-ncp7Xkbijj6UmcboUODi_XtMJk
```

この形でエンコードさえrた文字列が JWT になります。

[jwt.io](https://jwt.io) でトークンを検証する事ができます。

## ヘッダー header

> header

```json
{
  "alg": "HS256",
  "typ": "JWT"
}
```

ヘッダーに使われる JSON は、次のようになります。

### alg

`alg` は、署名を生成するアルゴリズムを指定しています。 `HS256` となっている必要があります。

### typ

`typ` は、 `JWT` となっている必要があります。

## ペイロード payload

> payload

```json
{
  "iss": "console.roboticcrowd.com",
  "sub": "IjoiIiwiZ3JhbnRzIjp7Im",
  "aud": "https://api.roboticcrowd.com/",
  "nbf": 1450471147,
  "exp": 1450473747,
  "scopes": [
    "session_queue.write", 
    "session_queue.read",
    "token"
  ]
}
```

各項目について説明していきます。

### sub

`sub` は、API Key を作成した時に決定される Robotic Crowd 内で一意の ID です。利用する API Key の `access_key_id` をセットしてください。 Robotic Crowd は、`sub` を一人のユーザーとして認識します。

### iss

`iss` は、トークンの発行者です。 `access_key_id` もしくは、トークンを発行するサーバーのドメインなどをセットしてください。この情報は検証されません。

### aud

`aud` は、トークンを受け取るURLです。`https://api.roboticcrowd.com/` である必要があります。

### nbf

`nbf` は、`not before` の略で、指定した unix 時間以降にトークンが初めて有効になります。通常は、現在時刻を指定しておけば問題ないでしょう。

### exp

`exp` は、`expire` の略で、指定した unix 時間以降にトークンが無効になります。

<aside class="notice">
長い有効期限（例えば、1年など）を設定するのは避けましょう。現在、個別のトークンを無効化することはできません。
全ての JWT を無効化するには API Key ごと削除する必要があります。
</aside>

### scopes

`scopes` は、このトークンで許容された API の利用権限を入力します。

この権限は、API Key を作成する時にも設定できますが、個別のトークンにもスコープを設定できます。
両方で許容された権限のみが利用できるようになります。

**スコープの詳細**

| スコープ | 権限 |
|---|---|
| session_queue.write | 実行キューを作成できます |
| session_queue.read | 実行キューの取得ができます |
| token  | トークンの作成ができます |

## 署名

> signature

```javascript
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  "523463041EF9FFA2950D8450FEB34C88BC8692C40C9CF3C99DCDF75E270229E2"
)
```

署名は、トークンの信頼性を担保するパートになっています。署名は、 header と payload をそれぞれ base64 エンコードした文字列を `.` で接続し、 `secret_access_key` でハッシュ値を計算したものになります。ですので、 `secret_access_key` が安全に保存されている事は非常に重要になります。

Robotic Crowd では、 `secret_access_key` は、暗号化されデータベースに保存されています。生の `secret_access_key` は、API Key を生成したタイミングで一度だけ表示されます。そして2度とやりとりされることはありません。

署名を検証することにより、ペイロードが改ざんされていないことを確認する事ができます。

## JWT を生成する

> headerを生成する

```shell
echo -n '{"alg":"HS256","typ":"JWT"}' | base64
# eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
```

> payloadを生成する

```shell
echo -n '{"iss": "console.roboticcrowd.com","sub": "IjoiIiwiZ3JhbnRzIjp7Im","aud": "https://api.roboticcrowd.com/","nbf": 1450471147,"exp": 1450473747,"scopes": ["session_queue.write","session_queue.read","token"]}' | base64 | tr -d '='

# eyJpc3MiOiJjb25zb2xlLnJvYm90aWNjcm93ZC5jb20iLCJzdWIiOiJJam9pSWl3aVozSmhiblJ6SWpwN0ltIiwiYXVkIjoiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ
```

> signatureを生成する

```shell

# echo -n "header.payload" | openssl dgst -binary -sha256 -hmac "secret_access_key" | base64 | sed "s/+/-/g;s/\//_/g;s/=//g"

echo -n "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJjb25zb2xlLnJvYm90aWNjcm93ZC5jb20iLCJzdWIiOiJJam9pSWl3aVozSmhiblJ6SWpwN0ltIiwiYXVkIjoiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ" | openssl dgst -binary -sha256 -hmac "523463041EF9FFA2950D8450FEB34C88BC8692C40C9CF3C99DCDF75E270229E2" | base64 | sed "s/+/-/g;s/\//_/g;s/=//g"

# LbICm0Ylbt0UFUGBRP7tqL1tT_RwH1D-XWSt_dfenUg
```

command line で base64 エンコードするのは、簡単のようで簡単ではありません。各OSによって微妙に仕様が異なっています。

ここでは、macOSの例を示しています。JWT は、URL-Safe な文字列である必要があるため、`+` を `-` に、 `/` を `_` に置き換えています。さらに、base64 では、 `=` がパディングとして利用されており、これは JWT に必要がないので、削除するコマンドも含めています。

まず、ヘッダーを生成します。これは全てのユーザーで同一になるはずで、生成しなくとも、以下のものをそのまま使えます。

`eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9`

次に、ペイロードを生成します。ペイロードで設定すべきは、 `exp` と `scopes` でしょう。
これをできる限り必要最小限のものにすればより安全なトークンを生成できます。

それから、署名を行います。ヘッダーとペイロードを `secret_access_key` を用いて HMACSHA256 で署名します。

最後に、これらの出力を全てドット `.` で接続して JWT の完成です。

`eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJjb25zb2xlLnJvYm90aWNjcm93ZC5jb20iLCJzdWIiOiJJam9pSWl3aVozSmhiblJ6SWpwN0ltIiwiYXVkIjoiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ.LbICm0Ylbt0UFUGBRP7tqL1tT_RwH1D-XWSt_dfenUg`

出来上がった JWT を [jwt.io](https://jwt.io) で検証してみましょう。Encoded のテキストエリアに JWT をpーエースとします。
その下に、 `Invalid Signature` と表示されたのではないでしょうか。これは署名が懸賞できなかったという事です。

右側の Decoded の VERIFY SIGNATURE というセクションにシークレットキーを入力するところがありますので、 この例のシークレットキー `523463041EF9FFA2950D8450FEB34C88BC8692C40C9CF3C99DCDF75E270229E2` を入力してみてください。

Signature Verified になりましたでしょうか？よかったです。これで JWT が検証されました。

> JWT

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJjb25zb2xlLnJvYm90aWNjcm93ZC5jb20iLCJzdWIiOiJJam9pSWl3aVozSmhiblJ6SWpwN0ltIiwiYXVkIjoiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ.LbICm0Ylbt0UFUGBRP7tqL1tT_RwH1D-XWSt_dfenUg
```

<aside class="notice">
JWT は、クライアントサイドで生成することを推奨しています。お困りの事がありましたらお問い合わせください。
</aside>

<aside class="warning">
JWT は、header と payload が base64 で誰でもデコードできてしまうので、公開しても大丈夫なのかと誤解してしまうかもしれません。ですが、これは API へのアクセストークンそのものです。安易に共有せず、シークレットキーと同様に安全に使用するようにしてください。
</aside>

# token

## トークンを生成する

> tokenを取得する

```shell
curl --location --request POST "https://api.roboticcrowd.com/v1/token" \
  --data "{
  \"access_key_id\": \"your_key_id\",
  \"secret_access_key\": \"your_secret_access_key\",
  \"expires\": 3600
}"
```

このエンドポイントは、JWTトークンをサーバーサイドで生成して返却します。

<aside class="success">
JWT は、クライアントサイドで生成することを推奨しています。お困りの事がありましたらお問い合わせください。
</aside>

### HTTP Request

`POST https://api.roboticcrowd.com/v1/token`

### パラメーター
### - access_key_id

**初期値**

無し、必須

**説明**

アクセスキーIDです。プロジェクトの API Key より確認できます。


### - secret_access_key

**初期値**

無し、必須 

**説明**

シークレットアクセスキーです。プロジェクトの API Key を生成した時にのみ確認できます。紛失した場合は、該当する API Key を削除し新たに作成してください。

### expires

**初期値**

600

**説明**

トークンの有効期間（秒）です。初期値は、10分です。

# 認証

> 認証するためには、

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

