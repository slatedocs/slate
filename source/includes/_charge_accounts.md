# Conta de Cobrança

```shell
Conta de Cobrança

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
    "registered_charges": true,
    "agreement_number": 4576361,
    "remittance_cnab_pattern": 400,
    "initial_remittance_number": 1,
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

**Parâmetros**

| Campo                     | Tipo            | Comentário                                                                                                                        |
|---------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------|
| id                        | integer         |                                                                                                                                   |
| bank_account_id           | integer         | identificador da conta bancária desta conta de cobrança no Cobrato                                                                |
| portfolio_code            | string          | código de portfólio                                                                                                               |
| agreement_code            | string          | código de convênio ou do beneficiário, de acordo com o banco. No caso do Itaú deve ser igual ao campo 'account' da conta bancária |
| agreement_code_digit      | string          | verificador do código de convênio, de acordo com o banco                                                                          |
| name                      | string          | nome que identifica esta conta de cobraça                                                                                         |
| initial_number            | integer         | número inicial do nosso número, sendo atribuído automaticamente e sequencialmente as cobranças                                    |
| current_number            | integer         | nosso número atribuído a última cobrança criada a partir desta conta de cobrança                                                  |
| end_number                | integer         | número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada                           |
| status                    | string          | caso for 'pending' a conta ainda não está homologada caso for 'ok' a conta já consta como homologada                              |
| registered_charges        | boolean         | informa se a conta de cobrança utiliza boletos registrados ou não, sendo false por padrão                                         |
| agreement_number          | integer         | número do convênio com o banco (apenas para o Bradesco)                                                                           |
| remittance_cnab_pattern   | integer         | padrão utilizado no arquivo CNAB de remessa                                                                                       |
| initial_remittance_number | integer         | número inicial de remessa, ou seja, qual foi o último número sequencial de remessa enviado para o banco (apenas para o Bradesco)  |
| _links                    | array of object | links da conta de cobrança e de sua conta bancária                                                                                |

## Informações da Conta de Cobrança

```shell
Mostrar Conta de Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
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
    "registered_charges": true,
    "agreement_number": 4576361,
    "remittance_cnab_pattern": 400,
    "initial_remittance_number": 1,
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

## Lista de Todas as Contas de Cobrança

```shell
Listar Contas de Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
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
          // informações conta de cobrança 1
        },
        {
          // informações conta de cobrança 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos as contas de cobranças que pertencem a sua Conta de Serviço.

## Criação de Conta de Cobrança

```shell
Criar Conta de Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charge_accounts \
    -d '{
          "bank_account_id": "1",
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Conta Cobrança",
          "initial_number": "1",
          "end_number": "1000",
          "registered_charges": "true",
          "agreement_number": "4576361",
          "remittance_cnab_pattern": "400",
          "initial_remittance_number": "1"
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

**Parâmetros**

| Campo                     | Tipo    | Comentário                                                                                                                                                          |
|---------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| bank_account_id           | integer | **(requerido)** código de identificação da conta bancária em que a conta de cobrança irá pertencer                                                                  |
| portfolio_code            | string  | **(requerido)** código de portfólio, validação conforme o banco                                                                                                     |
| agreement_code            | string  | **(requerido, com exceção do Itaú onde é preenchido automaticamente)** código de convênio ou do beneficiário, de acordo com o banco                                 |
| agreement_code_digit      | string  | **(requerido, com exceção do HSBC e Itaú, sendo preenchido automaticamente para o último)** verificador do código de convênio, de acordo com o banco                |
| name                      | string  | **(requerido)** nome que identifica esta conta de cobraça                                                                                                           |
| initial_number            | integer | **(requerido)** número inicial do nosso número, sendo atribuído automaticamente e sequencialmente às cobranças                                                      |
| end_number                | integer | (opcional) número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada                                                  |
| registered_charges        | boolean | (opcional) informa se a conta de cobrança utiliza boletos registrados ou não, sendo false por padrão                                                                |
| agreement_number          | integer | (opcional, requerido apenas se registered_charges for `true`) número do convênio com o banco (apenas para o Bradesco)                                               |
| remittance_cnab_pattern   | integer | (opcional, requerido apenas se registered_charges for `true`) padrão utilizado no arquivo CNAB de remessa. Os valores permitidos são 240 ou 400                     |
| initial_remittance_number | integer | (opcional) número inicial de remessa, ou seja, qual foi o último número sequencial de remessa enviado para o banco (apenas para o Bradesco). Por padrão o valor é 1 |

## Atualização de Conta de Cobrança

```shell
Atualizar Conta de Cobrança

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id
  PATCH https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id \
    -d '{
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

**Parâmetros**

| Campo                     | Tipo    | Comentário                                                                                                                                                          |
|---------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| portfolio_code            | string  | **(requerido)** código de portfólio, validação conforme o banco                                                                                                     |
| agreement_code            | string  | **(requerido, com exceção do Itaú onde é preenchido automaticamente)** código de convênio ou do beneficiário, de acordo com o banco                                 |
| agreement_code_digit      | string  | **(requerido, com exceção do HSBC e Itaú, sendo preenchido automaticamente para o último)** verificador do código de convênio, de acordo com o banco                |
| name                      | string  | **(requerido)** nome que identifica esta conta de cobraça                                                                                                           |
| initial_number            | integer | **(requerido)** número inicial do nosso número, sendo atribuído automaticamente e sequencialmente às cobranças                                                      |
| end_number                | integer | (opcional) número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada                                                  |
| registered_charges        | boolean | (opcional) informa se a conta de cobrança utiliza boletos registrados ou não, sendo false por padrão                                                                |
| agreement_number          | integer | (opcional, requerido apenas se registered_charges for `true`) número do convênio com o banco (apenas para o Bradesco)                                               |
| remittance_cnab_pattern   | integer | (opcional, requerido apenas se registered_charges for `true`) padrão utilizado no arquivo CNAB de remessa. Os valores permitidos são 240 ou 400                     |
| initial_remittance_number | integer | (opcional) número inicial de remessa, ou seja, qual foi o último número sequencial de remessa enviado para o banco (apenas para o Bradesco). Por padrão o valor é 1 |

## Exclusão de Conta de Cobrança

```shell
Excluir Conta de Cobrança

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/charge_accounts/:charge_account_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
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

## Métodos de Pagamentos Disponíveis

```shell
Métodos de Pagamentos Disponíveis

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charge_accounts/available_payment_methods

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charge_accounts/available_payment_methods

EXEMPLO DE ESTADO DA RESPOTA

  200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "payment_methods":
    [
      "billet",
      "cnab"
    ]
  }


```

Mostra todos os métodos de pagamentos disponíveis pelo Cobrato.