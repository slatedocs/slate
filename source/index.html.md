---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://roboticcrowd.com'>Robotic Crowd の製品ページはこちら</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Kittn API
---

# Overview

このドキュメントは、[Robotic Crowd](https://roboticcrowd.com) のREST APIエンドポイントと
その使い方をまとめています。

ここではコマンドラインでの利用で記述していますので、各プログラミング言語でも同様にできますので、適宜読み替えを行なってください。

## Base URL

ここで紹介する API のエンドポイントのドメインは、次のものです。

`https://api.roboticcrowd.com/`

全てのエンドポイントはこのドメイン以下に設定されています。


# Authorization

> cURL での認証情報の送信

```shell
curl --location --request GET "https://api.roboticcrowd.com/v1/path/to/endpoint" \
  --header "Authorization: Bearer [your_jwt_token]" 
```

> *`path/to/endpoint` と `[your_jwt_token]` は、正しいエンドポイントに置き換えてください。

> 例えば具体的には、次のようになります。

```shell
curl --location --request POST "https://api.roboticcrowd.com/v1/session_queues" \
  --header "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaS5yb2JvdGljY3Jvd2QuY29tLyIsImlzcyI6ImNvbnNvbGUucm9ib3RpY2Nyb3dkLmNvbSIsInN1YiI6Iklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ.fpJ-Ho1IvdRdDdBD-ncp7Xkbijj6UmcboUODi_XtMJk" \
  --header "content-type: application/json" \
  --data "{
  \"workflow_id\": 6391
}" 
```

> *`path/to/endpoint` と `[your_jwt_token]` は、正しいエンドポイントに置き換えてください。

Robotic Crowd では、API の認証にJWTを使っています。JWTは、プロジェクト内で作成した API Key のaccess_key_id と secret_access_key から作成することができます。API Key は、
プロジェクトオーナー権限をもつユーザーがプロジェクト管理画面から作成する事ができます。
API Key の作成については、[こちらの記事](https://support.roboticcrowd.com/docs/management-2/%e3%81%9d%e3%81%ae%e4%bb%96%e3%81%ae%e8%a8%ad%e5%ae%9a/api%e3%82%ad%e3%83%bc%e3%81%ae%e7%99%ba%e8%a1%8c/)を参照してください。

クライアント側で JWT を作成する事を想定していますが、JWT トークンを取得するためのエンドポイントも用意しています。

JWT は、3つの部分、すなわちヘッダー、ペイロード、および署名からなる、エンコードされたJSONオブジェクトです。

API の認証は、ヘッダーに以下のように JWT を設定することで可能になります。

`
Authorization: Bearer [your_jwt_token]
`

具体的には、次のような形式になります。

`
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaS5yb2JvdGljY3Jvd2QuY29tLyIsImlzcyI6ImNvbnNvbGUucm9ib3RpY2Nyb3dkLmNvbSIsInN1YiI6Iklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ.fpJ-Ho1IvdRdDdBD-ncp7Xkbijj6UmcboUODi_XtMJk
`

**JWT の形式**

> JWT の具体例

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaS5yb2JvdGljY3Jvd2QuY29tLyIsImlzcyI6ImNvbnNvbGUucm9ib3RpY2Nyb3dkLmNvbSIsInN1YiI6Iklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJuYmYiOjE0NTA0NzExNDcsImV4cCI6MTQ1MDQ3Mzc0Nywic2NvcGVzIjpbInNlc3Npb25fcXVldWUud3JpdGUiLCJzZXNzaW9uX3F1ZXVlLnJlYWQiLCJ0b2tlbiJdfQ.fpJ-Ho1IvdRdDdBD-ncp7Xkbijj6UmcboUODi_XtMJk
```

JWT は、base64 エンコードされた、 JSON 形式の header と payload また、その両者を繋げて、ハッシュ化した signature のパートからなり、全部を `.` で繋げた文字列になります。

`[header].[payload].[signature]`

具体例を右側（小さい画面では下側）に表示しています。
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
  "scopes": "session_queue.write session_queue.read access_token.create"
  ]
}
```

各項目について説明していきます。

### iss

`iss` は、トークンの発行者を示すデータです。`console.roboticcrowd.com` を設定してください。

### sub

`sub` は、API Key を作成した時に決定される Robotic Crowd 内で一意の ID です。利用する API Key の `access_key_id` をセットしてください。 Robotic Crowd は、`sub` を一人のユーザーとして認識します。

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
| session_queue.read | 実行キューの取得、ワークフロー一覧の取得ができます |
| session_queue.delete | 実行キューをキャンセルできます |
| access_token.create  | トークンの作成ができます |

## 署名

> signature

```javascript
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  "your_secret_access_key"
)
```

> *`your_secret_access_key` は、正しいアクセスキーで置き換えてください。

> コマンドラインでの署名は、次の節の JWT を生成するを参照してください。

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
echo -n '{"iss": "console.roboticcrowd.com","sub": "IjoiIiwiZ3JhbnRzIjp7Im","aud": "https://api.roboticcrowd.com/","nbf": 1450471147,"exp": 1450473747,"scopes": "session_queue.write session_queue.read access_token.create"}' | \
base64 | \
tr -d '='

# eyJpc3MiOiAiY29uc29sZS5yb2JvdGljY3Jvd2QuY29tIiwic3ViIjogIklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJhdWQiOiAiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOiAxNDUwNDcxMTQ3LCJleHAiOiAxNDUwNDczNzQ3LCJzY29wZXMiOiAic2Vzc2lvbl9xdWV1ZS53cml0ZSBzZXNzaW9uX3F1ZXVlLnJlYWQgYWNjZXNzX3Rva2VuLmNyZWF0ZSJ9
```

> signatureを生成する

```shell
# echo -n "header.payload" | openssl dgst -binary -sha256 -hmac "secret_access_key" | base64 | sed "s/+/-/g;s/\//_/g;s/=//g"

echo -n "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiAiY29uc29sZS5yb2JvdGljY3Jvd2QuY29tIiwic3ViIjogIklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJhdWQiOiAiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOiAxNDUwNDcxMTQ3LCJleHAiOiAxNDUwNDczNzQ3LCJzY29wZXMiOiAic2Vzc2lvbl9xdWV1ZS53cml0ZSBzZXNzaW9uX3F1ZXVlLnJlYWQgYWNjZXNzX3Rva2VuLmNyZWF0ZSJ9" | \
openssl dgst -binary -sha256 -hmac "523463041EF9FFA2950D8450FEB34C88BC8692C40C9CF3C99DCDF75E270229E2" | \
base64 | sed "s/+/-/g;s/\//_/g;s/=//g"

# 45ervId5_CudT4hya5Tbx30OrO08KCewFQlgxU7mfew
```

> 生成されたJWT

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiAiY29uc29sZS5yb2JvdGljY3Jvd2QuY29tIiwic3ViIjogIklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJhdWQiOiAiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOiAxNDUwNDcxMTQ3LCJleHAiOiAxNDUwNDczNzQ3LCJzY29wZXMiOiAic2Vzc2lvbl9xdWV1ZS53cml0ZSBzZXNzaW9uX3F1ZXVlLnJlYWQgYWNjZXNzX3Rva2VuLmNyZWF0ZSJ9.45ervId5_CudT4hya5Tbx30OrO08KCewFQlgxU7mfew
```

JWT を生成するには、URL-safe な base64 文字列に変換する必要があります。command line で base64 エンコードするのは、簡単のようで簡単ではありません。各OSによって微妙に仕様が異なっています。

ここでは、macOSの例を示しています。JWT は、URL-Safe な文字列である必要があるため、`+` を `-` に、 `/` を `_` に置き換えています。さらに、base64 では、 `=` がパディングとして利用されており、これは JWT に必要がないので、削除するコマンドも含めています。

まず、ヘッダーを生成します。これは全てのユーザーで同一になるはずで、生成しなくとも、以下のものをそのまま使えます。

`eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9`

次に、ペイロードを生成します。ペイロードで設定すべきは、 `exp` と `scopes` でしょう。
これをできる限り必要最小限のものにすればより安全なトークンを生成できます。

それから、署名を行います。ヘッダーとペイロードを `secret_access_key` を用いて HMACSHA256 で署名します。

最後に、これらの出力を全てドット `.` で接続して JWT の完成です。

`
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiAiY29uc29sZS5yb2JvdGljY3Jvd2QuY29tIiwic3ViIjogIklqb2lJaXdpWjNKaGJuUnpJanA3SW0iLCJhdWQiOiAiaHR0cHM6Ly9hcGkucm9ib3RpY2Nyb3dkLmNvbS8iLCJuYmYiOiAxNDUwNDcxMTQ3LCJleHAiOiAxNDUwNDczNzQ3LCJzY29wZXMiOiAic2Vzc2lvbl9xdWV1ZS53cml0ZSBzZXNzaW9uX3F1ZXVlLnJlYWQgYWNjZXNzX3Rva2VuLmNyZWF0ZSJ9.45ervId5_CudT4hya5Tbx30OrO08KCewFQlgxU7mfew
`

出来上がった JWT を [jwt.io](https://jwt.io) で検証してみましょう。Encoded のテキストエリアに JWT をペーストとします。
その下に、 `Invalid Signature` と表示されたのではないでしょうか。これは署名が検証できなかったという事です。

右側の Decoded の VERIFY SIGNATURE というセクションにシークレットキーを入力するところがありますので、 この例のシークレットキー `523463041EF9FFA2950D8450FEB34C88BC8692C40C9CF3C99DCDF75E270229E2` を入力してみてください。

Signature Verified になりましたでしょうか？よかったです。これで JWT が検証され有効なトークンが生成できました。

<aside class="notice">
JWT は、クライアントサイドで生成することを推奨しています。お困りの事がありましたらお問い合わせください。
</aside>

<aside class="warning">
JWT は、header と payload が base64 で誰でもデコードできてしまうので、公開しても大丈夫なのかと誤解してしまうかもしれません。ですが、これは API へのアクセストークンそのものです。安易に共有せず、シークレットキーと同様に安全に使用するようにしてください。
</aside>

# Token

## トークンを生成する

> tokenを取得する

```shell
curl --location --request POST "https://api.roboticcrowd.com/v1/token" \
  --header "content-type: application/json" \
  --data "{
  \"access_key_id\": \"your_access_key_id\",
  \"secret_access_key\": \"your_secret_access_key\",
  \"expires\": 3600
}"
```

> *`your_access_key_id` と `your_secret_access_key` は、API Key から正しい値に置き換えてください。

このエンドポイントは、JWTトークンをサーバーサイドで生成して返却します。他のエンドポイントと認証が異なっており、 `access_key_id` と `secret_access_key` を直接送信してもらうことにより認証しています。

<aside class="success">
JWT は、クライアントサイドで生成することを推奨しています。お困りの事がありましたらお問い合わせください。
</aside>

### HTTP Request

`
  POST https://api.roboticcrowd.com/v1/token
`

### パラメーター

#### access_key_id

**初期値**

無し、必須

**説明**

アクセスキーIDです。プロジェクトの API Key より確認できます。


#### secret_access_key

**初期値**

無し、必須 

**説明**

シークレットアクセスキーです。プロジェクトの API Key を生成した時にのみ確認できます。紛失した場合は、該当する API Key を削除し新たに作成してください。

#### expires

**初期値**

600

**説明**

トークンの有効期間（秒）です。初期値は、10分です。

<aside class="warning">
長い有効期限を設定することで、実質的に有効期限のない API トークンの様に使うことができますが、推奨しておりません。
</aside>

<aside class="notice">
プロジェクト設定画面から API Key を削除することで、生成ずみの JWT を全て無効化することができます。
</aside>


# Session Queue

Session Queue とは、実行キューのことです。実行が要求されると直ちに作成されます。
Session Queue が作成された時に実行可能なロボットがあれば、ただちに実行が試みられます。
実行が試みられると同時にロボットが割り当てられ、Session が作成されます。
params 内のオブジェクトとして設定した key と value は、ワークフロー内で定義した変数の初期値を定義します。

## 実行キューを作成する

> POST /v1/session_queues

```shell
curl --location --request POST "https://api.roboticcrowd.com/v1/session_queues" \
  --header "Authorization: Bearer [jwt_token]" \
  --header "content-type: application/json" \
  --data "{
  \"workflow_id\": [workflow_id],
  \"params\": {
    \"var1\": \"this is string\",
    \"var2\": [\"this\", \"is\", \"array\"]
  }
}"
```

> Response

```json
{
  "id": 123123123,
  "project_id": 123123123123,
  "started_at": "2019-07-09T10:02:57.000Z",
  "ended_at": "2019-07-09T10:04:01.000Z",
  "status": "running",
  "created_at": "2019-07-09T10:02:57.000Z",
  "workflow": {
    "id": 12341234,
    "name": "Awesome Workflow."
  },
  "params": {
    "var1": "this is string",
    "var2": ["this", "is", "array"]
  },
  "robot": {
    "id": 12341234,
    "name": "standard-1"
  }
}
```

このエンドポイントは、実行するワークフローの ID を指定して、実行キューを作成します。
指定できるワークフロー ID は、API Key が作成されたプロジェクト内に限ります。

### HTTP Request

`
POST https://api.roboticcrowd.com/v1/session_queues
`

### パラメーター

#### workflow_id

**初期値**

無し、必須

**説明**

ワークフローを指定する ID です。ワークフロー ID は、Robotic Crowd のプロジェクト画面から確認できます。

#### params

**初期値**

無し、任意

**説明**

ワークフロー内で使用される変数の初期値を定義します。
ワークフロー内で未定義の変数を使用することにより実行時に変数を定義することができるようになります。
現在のところ、ここで指定したパラメーター内に、文字列として変数リテラル `${...}` が使われていると意図しない挙動をするか例外となります。例： `{ var1: "this is ${var1}"}`

### 応答

Session Queue Schema のJSONオブジェクトを返却します。

## 実行キューの一覧を取得する

> GET /v1/session_queues

```shell
curl --location --request GET "https://api.roboticcrowd.com/v1/session_queues?page=1&per_page=3&query=before:2019-10-11%20after:2019-07-01" \
  --header "Authorization: Bearer [your_jwt]"
```

> Response

```json
{
  "session_queues": [
    {
      "id": 341559,
      "project_id": 226,
      "started_at": "2019-07-09T10:02:57.000Z",
      "ended_at": "2019-07-09T10:04:01.000Z",
      "status": "success",
      "created_at": "2019-07-09T10:02:57.000Z",
      "workflow": {
        "id": 123123,
        "name": "test"
      },
      "params": {
        "var1": "this is string",
        "var2": ["this", "is", "array"]
      },
      "robot": {
        "id": 12341234,
        "name": "sunaba-1"
      }
    },
    {
      "id": 341558,
      "project_id": 226,
      "started_at": "2019-07-09T10:01:44.000Z",
      "ended_at": "2019-07-09T10:03:31.000Z",
      "status": "error",
      "created_at": "2019-07-09T10:01:44.000Z",
      "workflow": {
        "id": 12341234,
        "name": "test"
      },
      "params": {
        "var1": "this is string",
        "var2": ["this", "is", "array"]
      },
      "robot": {
        "id": 12341234,
        "name": "sunaba-2"
      }
    },
    {
      "id": 341557,
      "project_id": 226,
      "started_at": "2019-07-09T10:00:38.000Z",
      "ended_at": "2019-07-09T10:01:23.000Z",
      "status": "success",
      "created_at": "2019-07-09T10:00:38.000Z",
      "workflow": {
        "id": 12341234,
        "name": "test"
      },
      "params": {
        "var1": "this is string",
        "var2": ["this", "is", "array"]
      },
      "robot": {
        "id": 12341234,
        "name": "sunaba-1"
      }
    }
  ],
  "total_count": 1581
}
```

このエンドポイントは、API Key が作成されたプロジェクトの Session Queue の一覧を取得します。パラメーターとして、検索条件、ページ数、ページあたりの件数を設定できます。

### HTTP Request

`
  GET https://api.roboticcrowd.com/v1/session_queues?page=1&per_page=10&query=
`

### クエリパラメーター

#### query

**初期値**

無し

**説明**

検索条件を文字列で指定します。検索条件については、[こちら](https://docs.roboticcrowd.com/search/session)に詳細があります。

#### per_page

**初期値**

10

**説明**

取得するページあたりの件数です。
1ページあたりの最大数は50件です。

#### page

**初期値**

1

**説明**

取得するページです。

### 応答

JSON オブジェクトを返却します。

#### session_queues

Session Queue Schema の JSON オブジェクトの配列が格納されています。

#### total_count

Session Queue Schema のトータル件数が格納されています。

## 実行キューをキャンセルする

> DELETE /v1/session_queues/{session_queue_id}/cancel

```shell
curl --location --request DELETE "https://api.roboticcrowd.com/v1/session_queues/{session_queue_id}/cancel" \
  --header "Authorization: Bearer [jwt_token]" \
  --header "content-type: application/json"
```


このエンドポイントは、実行キューの ID を指定して、実行中のワークフローの実行をキャンセル、または実行待ちのキューの削除を行います。
指定できる実行キュー ID は、API Key が作成されたプロジェクト内に限ります。

### HTTP Request

`
DELETE https://api.roboticcrowd.com/v1/session_queues/{session_queue_id}/cancel
`

### session_queue_id（実行キューID）の確認方法

プロジェクトの セッション画面 の ID により確認できます。



## Session Queue Schema

Session Queue のオブジェクトの返却は、

#### id
作成された実行キュー（Session Queue）のIDです。

#### project_id
プロジェクト ID です。

#### started_at
直ちに実行されれば、実行が開始された日時が文字列として入っています。実行されていなければ `null` となります。

#### ended_at
実行が終了していれば、実行が終了した日時が文字列として入っています。終了していなければ `null` となります。

#### status
ステータスは、

- queued: 実行まち
- running: 実行中
- success: 成功
- error: 失敗（異常終了）

のいずれかになります。

#### created_at
実行キューがデータベースに登録された日時が文字列として入っています。

#### workflow
ワークフローの詳細が記述されている JSON オブジェクトです。返却される項目は、ID とワークフロー名 (name) だけです。

#### params
実行キュー作成時に渡された変数が記述されている JSON オブジェクトです。

#### robot
ロボットの詳細が記述されている JSON オブジェクトです。返却される項目は、ID とロボット名 (name) だけです。

# Workflow
Workflow とは、自動化設定そのものです。外部からワークフローを指定してSession Queue に登録する際に Workflow の ID が必要になりますが、一覧取得のエンドポイントによりIDを確認し指定することができるようになります。
## ワークフロー一覧を取得する。
このエンドポイントは、API Key が作成されたプロジェクトの Workflow の一覧を取得します。パラメーターとして、ページ数、ページあたりの件数を設定できます。パラメーターの指定がない時は、ページあたりの件数は、300件、ページは1ページ目になります。ページあたりの件数は最大で、1000まで指定できます。

> GET /v1/workflows

```shell
curl --location --request GET "https://api.roboticcrowd.com/v1/workflows?page=1&per_page=10" \
  --header "Authorization: Bearer [your_jwt]"
```

> Response

```json
{
  "workflows": [
    {
      "id": 123123122,
      "name": "workflow name1",
      "description": "this is tutorail user's workflow",
      "vpn_option_id": null,
      "debug_mode": true,
      "robot_type": "singleruntime",
      "single_process_mode": true,
      "error_handler_workflow_id": null,
      "color": "#000000",
      "receiver_infos": "",
      "workflow_robots": []
    },
    {
      "id": 123123123,
      "name": "workflow name2",
      "description": "this is tutorials user's workflow",
      "vpn_option_id": null,
      "debug_mode": true,
      "robot_type": "singleruntime",
      "single_process_mode": true,
      "error_handler_workflow_id": null,
      "color": "#000000",
      "receiver_infos": "",
      "workflow_robots": []
    }
 ],
 "total_count": 102
}
```

### HTTP Request

`
GET https://api.roboticcrowd.com/v1/workflows?page=1&per_page=10
`

### クエリパラメーター
#### per_page
初期値
300
#### 説明
取得するページあたりの件数です。 1ページあたりの最大数は1000件です。
#### page
初期値
1
#### 説明
取得するページです。
### 応答
JSON オブジェクトを返却します。
#### workflows
Workflow Schema の JSON オブジェクトの配列が格納されています。
#### total_count
トータル件数が格納されています。
# Quota

APIリクエストの制限は、各組織で契約しているロボット数に応じて決定されています。ロボット一台の契約につき、 1分ごとに60リクエストを上限としています。
