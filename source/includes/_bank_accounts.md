# Contas Bancárias

```shell
EXEMPLO

  {
    "id":1,
    "payee_id":"1",
    "bank_code":"001",
    "agency":"1606",
    "agency_digit":"3",
    "account":"91000",
    "account_digit":"7",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/bank_accounts/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/bank_accounts/1"},
        {"rel":"payee","method":"GET","href":"https://app.cobrato.com/api/v1/payees/1"}
      ]
  }
```
<aside class="notice">
As Contas Bancárias, pertencem aos seus cedentes, sendo assim é necessário que sempre haja ao menos um cedente para criação de conta bancária.
</aside>

Parâmetros

|Campo                    | Tipo            | Comentário                                             |
|-------------------------|-----------------|--------------------------------------------------------|
|id                       |  integer |                                                           |
|payee_id                 |  integer | identificador do cedento no Cobrato |
|bank_code | string | código do banco no Febraban |
|agency|  string | |
|agency_digit|  string | Apenas utilizado pelo Banco do Brasil(001) |
|account| string |  |
|account_digit| string | Apenas não utilizado pelo HSBC(399) |
|_links|  array of object | links da conta bancária e de seu cedente


## Lista de Todos as Contas Bancárias

```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/bank_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/bank_accounts

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "bank_accounts":
      [
        {
          //informações conta bancária 1
        },
        {
          //informações conta bancária 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos as contas bancárias em que seus cedentes pertencentes a sua Conta de Serviço.


## Informações da Conta Bancária

```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id":1,
    "payee_id":"1",
    "bank_code":"001",
    "agency":"1606",
    "agency_digit":"3",
    "account":"91000",
    "account_digit":"7",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/bank_accounts/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/bank_accounts/1"},
        {"rel":"payee","method":"GET","href":"https://app.cobrato.com/api/v1/payees/1"}
      ]
  }

```


Retorna as informações detalhadas da conta bancária informada em JSON e também a referência ao seu cedente.

```shell
DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/bank_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/bank_accounts
    -D '{
          "payee_id": "1",
          "bank_code": "001",
          "agency":"1606",
          "agency_digit":"3",
          "account":"91000",
          "account_digit":"7"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "bank_code": ["não pode ficar em branco","não possui o tamanho esperado (3 caracteres)"],
        "agency": ["não pode ficar em branco","não é um número"],
        "account": ["não pode ficar em branco","não é um número"],
        "payee_id":["não pode ficar em branco"]
      }
  }


```
## Criação de Conta Bancária

Cria um nova conta bancária, retornando as informações da mesma caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta.

Parâmetros

|Campo                    | Tipo            | Comentário                                             |
|-------------------------|-----------------|--------------------------------------------------------|
|payee_id                 | integer         | requirido identificação do cedente em que a conta bancária irá pertencer      |
|bank_code                |  string         | requirido código do banco no Febraban                    |
|agency | string | requirido |
|agency_digit | string | requirido apenas para o Banco do Brasil(001) |
|account |  string | requirido |
|account_digit |  string | requirido com exceção do HSBC(399) |

##Atualização de Conta Bancária

```shell
Atualizar Conta Bancária

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id
  PATCH https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id
    -D '{
          "agency":"1606",
          "agency_digit":"3"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA BANCÁRIA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "bank_code": ["não possui o tamanho esperado (3 caracteres)"],
        "agency": ["não é um número"],
        "account": ["não é um número"],
      }
  }

```

Atualiza a conta bancária determinada, retornando as informações da mesma caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

Ao alterar campo 'bank_code', caso houvesse algum campo preenchido que de acordo com o novo banco deverá ficar em branco, o Cobrato fará automaticamente. Exemplo ao alterar uma conta bancária do Banco do Brasil para o Bradesco, o campo 'agency_digit' receberá 'null' como novo valor.

Parâmetros

|Campo                    | Tipo            | Comentário                                             |
|-------------------------|-----------------|--------------------------------------------------------|
| agency                  | string          |          -                                             |
| agency_digit            | string          |          -                                             |
| account                 | string          |          -                                             |
| account_digit           | string          |          -                                             |



## Exclusão de Conta Bancária

```shell
Excluir Conta Bancária

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA BANCÁRIA INEXISTENTE

    404 Not Found

```

Exclui determinada conta bancária e junto a ela todas suas contas de cobrança, e cobranças. As mudanças são irreversíveis.


## Carteiras disponíveis

```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id/portfolio_codes

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/bank_accounts/:bank_account_id/portfolio_codes

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "portfolio_codes": [
      "11",
      "12",
      "16",
      "17",
      "18",
      "31",
      "51"
    ],
    "_links": {
      "rel": "bank_account",
      "method": "GET",
      "href": "https://sandbox.cobrato.com/api/v1/charges/1"
    }
  }

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA BANCÁRIA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

```

Retorna todas as carteiras disponíveis de uma determinada Conta de Cobrança a partir de uma Conta Bancária.

