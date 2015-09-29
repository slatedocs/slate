# Conta Cobrança

```shell
EXEMPLO

  {
    "id": 1,
    "bank_account_id": 1,
    "portfolio_code": "17",
    "agreement_code": "12345678",
    "agreement_code_digit": "1",
    "name": "Conta Cobrança",
    "initial_number": 1,
    "current_number": 1,
    "end_number": 1000,
    "status": "pending",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charge_accounts/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charge_accounts/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charge_accounts/1"},
        {"rel":"bank_account","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"}
      ]
  }

```

As Contas de Cobranças, pertencem as suas contas bancárias, sendo assim é necessário que sempre haja ao menos uma conta bancária para criação de conta de cobrança. As validações nas contas de cobranças são de acordo com o banco, de sua conta bancária.

Parâmetros


|Campo                    | Tipo            | Comentário                                             |
|-------------------------|-----------------|--------------------------------------------------------|
| id                      | integer         | -                                                      |
| bank_account_id         | integer         | identificador da conta bancária desta conta de cobrança no Cobrato |
| portfolio_code | string |código de portfólio |
| agreement_code | string | código de convênio ou do cedente, de acordo com o banco. No caso do Itaú deve ser igual ao campo 'account' da conta bancária |
| agreement_code_digit | string | verificador do código de convênio, de acordo com o banco, no caso do Itaú |deve ser igual ao campo 'account_digit' da conta bancária e no HSBC deve permanecer em branco
| name | string | |
| initial_number | integer | número inicial do nosso número, sendo atribuído automaticamente e sequencialmente as cobranças |
| current_number | integer | nosso número atribuído a última cobrança criada a partir desta conta de cobrança |
| end_number | integer | número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada |
| status | string | caso for 'pending' a conta ainda não está homologada
caso for 'ok' a conta já consta como homologada |
| _links | array of object | links da conta de cobrança e de sua conta bancária |


## Lista de Todos as Contas de Cobrança

```shell

Listar Conta de Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "charge_accounts":
      [
        {
          //informações conta de cobrança 1
        },
        {
          //informações conta de cobrança 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos as contas de cobranças que pertencem a sua Conta de Serviço.

## Informações da Conta de Cobrança

```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id": 1,
    "bank_account_id": 1,
    "portfolio_code": "17",
    "agreement_code": "12345678",
    "agreement_code_digit": "1",
    "name": "Conta Cobrança",
    "initial_number": 1,
    "current_number": 1,
    "end_number": 1000,
    "status": "pending",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charge_accounts/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charge_accounts/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charge_accounts/1"},
        {"rel":"bank_account","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"}
      ]
  }

```

Retorna as informações detalhadas da conta de cobrança informada em JSON e também a referência a sua conta bancária.


```shell
Criar Conta de Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charge_accounts
    -D '{
          "bank_account_id": "1",
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Conta Cobrança",
          "initial_number": "1",
          "end_number": "1000"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "name":["não pode ficar em branco"],
        "portfolio_code":["não pode ficar em branco"],
        "agreement_code":["não pode ficar em branco"],
        "agreement_code_digit":["não pode ficar em branco"]
      }
  }

```

##Criação de Conta de Cobrança

```shell

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charge_accounts
    -D '{
          "bank_account_id": "1",
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Conta Cobrança",
          "initial_number": "1",
          "end_number": "1000"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "name":["não pode ficar em branco"],
        "portfolio_code":["não pode ficar em branco"],
        "agreement_code":["não pode ficar em branco"],
        "agreement_code_digit":["não pode ficar em branco"]
      }
  }

```

Cria um nova conta de cobrança, retornando as informações da mesma caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta.


```
Criar Conta de Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charge_accounts
    -D '{
          "bank_account_id": "1",
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Conta Cobrança",
          "initial_number": "1",
          "end_number": "1000"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "name":["não pode ficar em branco"],
        "portfolio_code":["não pode ficar em branco"],
        "agreement_code":["não pode ficar em branco"],
        "agreement_code_digit":["não pode ficar em branco"]
      }
  }

```

Parâmetros

|Campo                    | Tipo            | Comentário                                             |
|-------------------------|-----------------|--------------------------------------------------------|
| bank_account_id         |  integer        | requirido código de identificação da conta bancária em que a conta de cobrança irá pertencer |
| portfolio_code          | string          | requirido código de portfólio, validação conforme o banco determinado através |
| agreement_code          | string          | requirido, com exceção do Itaú onde é preenchido automaticamente |
| agreement_code_digit    | string          | requirido, com exceção do HSBC e Itaú, sendo preenchido automaticamente para o último |
| name                    | string          | requirido |
| initial_number          | integer         | requirido  número inicial do nosso número, sendo atribuído automaticamente e sequencialmente às cobranças |
| end_number              | integer         | número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada |


## Atualização de Conta de Cobrança

```shell
Atualizar Conta de Cobrança

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id
  PATCH https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id
    -D '{
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Novo Nome"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA DE COBRANÇA INEXISTENTE

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

Atualiza a conta de cobrança determinada, retornando as informações da mesma caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

```shell
Atualizar Conta de Cobrança

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id
  PATCH https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id
    -D '{
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Novo Nome"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA DE COBRANÇA INEXISTENTE

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

Parâmetros

|Campo                    | Tipo            | Comentário                                             |
|-------------------------|-----------------|--------------------------------------------------------|
|portfolio_code           | string          | código de portfólio, validação conforme o banco determinado através |
|agreement_code           | string          | - |
|agreement_code_digit     | string          | - |
|name                     | string          | - |
|initial_number           | integer         | requirido número inicial do nosso número, sendo atribuído automaticamente e sequencialmente as cobranças |
|end_number               | integer         | número final do nosso número, sendo o último número a ser atribuído, após sso a sequência é reiniciada |



## Exclusão de Conta de Cobrança

```shell
Excluir Conta de Cobrança

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA DE COBRANÇA INEXISTENTE

    404 Not Found

```
Exclui determinada conta de cobrança e junto a ela todas suas cobranças. As mudanças são irreversíveis.
