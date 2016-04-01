# Configuração de Cobrança

```shell
Configuração de Cobrança

EXEMPLO

  {
    "id": 1,
    "type": "billet",
    "bank_account_id": 1,
    "portfolio_code": "17",
    "agreement_code": "12345678",
    "agreement_code_digit": "1",
    "name": "Configuração de Cobrança por Boleto",
    "initial_number": 1,
    "current_number": 1,
    "end_number": 1000,
    "status": "pending",
    "registered_charges": true,
    "agreement_number": 4576361,
    "remittance_cnab_pattern": 400,
    "initial_remittance_number": 1,
    "transmission_code": "987655",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"bank_account","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"}
      ]
  }

```

As Configurações de Cobrança podem ser de tipos diferentes. Sendo assim, os parâmetros e algums comportamentos irão variar de acordo com o tipo. Atualmente temos os tipos:

- Boleto (billet)

**Parâmetros (Boleto)**

As Configurações de Cobrança do tipo **Boleto** (billet), pertencem as suas contas bancárias, sendo assim é necessário que sempre haja ao menos uma conta bancária para criação desse tipo configuração de cobrança, que também tem suas validações de acordo com o banco de sua conta bancária.


| Campo                     | Tipo            | Comentário                                                                                                                        |
|---------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------|
| id                        | integer         |                                                                                                                                   |
| type                      | string          | indica o tipo da configuração de cobrança. Valores possíveis: (billet)                                                            |
| bank_account_id           | integer         | identificador da conta bancária desta configuração de cobrança no Cobrato                                                         |
| portfolio_code            | string          | código de portfólio                                                                                                               |
| agreement_code            | string          | código de convênio ou do beneficiário, de acordo com o banco. No caso do Itaú deve ser igual ao campo 'account' da conta bancária |
| agreement_code_digit      | string          | verificador do código de convênio, de acordo com o banco                                                                          |
| name                      | string          | nome que identifica esta configuração de cobraça                                                                                  |
| initial_number            | integer         | número inicial do nosso número, sendo atribuído automaticamente e sequencialmente as cobranças                                    |
| current_number            | integer         | nosso número atribuído a última cobrança criada a partir desta configuração de cobrança                                           |
| end_number                | integer         | número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada                           |
| status                    | string          | 'ok' ou 'pending' para indicar se configuração de cobrança está ou não homologada, respectivamente                                |
| registered_charges        | boolean         | informa se a configuração de cobrança utiliza boletos registrados ou não, sendo false por padrão                                  |
| agreement_number          | integer         | número do convênio com o banco (apenas para o Bradesco)                                                                           |
| remittance_cnab_pattern   | integer         | padrão utilizado no arquivo CNAB de remessa                                                                                       |
| initial_remittance_number | integer         | número inicial de remessa, ou seja, qual foi o último número sequencial de remessa enviado para o banco (apenas para o Bradesco)  |
| transmission_code         | string          | código de transmissão (apenas para o Santander)                                                                                   |
| _links                    | array of object | links da configuração de cobrança e de sua conta bancária                                                                         |

## Informações da Configuração de Cobrança

```shell
Mostrar Configuração de Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charge_configs/:charge_config_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charge_configs/:charge_config_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA (BOLETO)

  {
    "id": 1,
    "type": "billet",
    "bank_account_id": 1,
    "portfolio_code": "17",
    "agreement_code": "12345678",
    "agreement_code_digit": "1",
    "name": "Configuração de Cobrança por Boleto",
    "initial_number": 1,
    "current_number": 1,
    "end_number": 1000,
    "status": "pending",
    "registered_charges": true,
    "agreement_number": 4576361,
    "remittance_cnab_pattern": 400,
    "initial_remittance_number": 1,
    "transmission_code": "987655",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"bank_account","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"}
      ]
  }

```

Retorna as informações detalhadas da Configuração de Cobrança informada em JSON e também suas referências.

## Lista de Todas as Configurações de Cobrança

```shell
Listar Configurações de Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charge_configs

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charge_configs

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "charge_accounts":
      [
        {
          // informações configuração de cobrança 1
        },
        {
          // informações configuração de cobrança 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todas as Configurações de Cobrança que pertencem a sua Conta de Serviço.

## Criação de Configuração de Cobrança

```shell
Criar Configuração de Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charge_accounts

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charge_accounts \
    -d '{
          "type": "billet",
          "bank_account_id": "1",
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Configuração de Cobrança por Boleto",
          "initial_number": "1",
          "end_number": "1000",
          "registered_charges": "true",
          "agreement_number": "4576361",
          "remittance_cnab_pattern": "400",
          "initial_remittance_number": "1"
          "transmission_code": "987655"
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

Cria uma nova Configuração de Cobrança, retornando as informações da mesma em caso de sucesso. Se houverem erros eles serão informados no corpo da resposta.

**Parâmetros (Boleto)**

| Campo                     | Tipo    | Comentário                                                                                                                                                          |
|---------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type                      | string  | indica o tipo da configuração de cobrança. Neste caso deve ser informado "billet" ou deixado em branco, pois este é o valor padrão                                  |
| bank_account_id           | integer | **(requerido)** código de identificação da conta bancária em que a configuração de cobrança irá pertencer                                                           |
| portfolio_code            | string  | **(requerido)** código de portfólio, validação conforme o banco                                                                                                     |
| agreement_code            | string  | **(requerido, com exceção do Itaú onde é preenchido automaticamente)** código de convênio ou do beneficiário, de acordo com o banco                                 |
| agreement_code_digit      | string  | **(requerido, com exceção do HSBC e Itaú, sendo preenchido automaticamente para o último)** verificador do código de convênio, de acordo com o banco                |
| name                      | string  | **(requerido)** nome que identifica esta configuração de cobraça                                                                                                    |
| initial_number            | integer | **(requerido)** número inicial do nosso número, sendo atribuído automaticamente e sequencialmente às cobranças                                                      |
| end_number                | integer | (opcional) número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada                                                  |
| registered_charges        | boolean | (opcional) informa se a configuração de cobrança utiliza boletos registrados ou não, sendo false por padrão                                                         |
| agreement_number          | integer | (opcional, requerido apenas se registered_charges for `true`) número do convênio com o banco (apenas para o Bradesco)                                               |
| remittance_cnab_pattern   | integer | (opcional, requerido apenas se registered_charges for `true`) padrão utilizado no arquivo CNAB de remessa. Os valores permitidos são 240 ou 400                     |
| transmission_code         | string  | (opcional, requerido apenas se registered_charges for `true`) código de transmissão (apenas para o Santander)                                                       |
| initial_remittance_number | integer | (opcional) número inicial de remessa, ou seja, qual foi o último número sequencial de remessa enviado para o banco (apenas para o Bradesco). Por padrão o valor é 1 |

## Atualização de Configuração de Cobrança

```shell
Atualizar Configuração de Cobrança

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charge_configs/:charge_config_id
  PATCH https://app.cobrato.com/api/v1/charge_configs/:charge_config_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/charge_configs/:charge_config_id \
    -d '{
          "portfolio_code": "17",
          "agreement_code": "12345678",
          "agreement_code_digit": "1",
          "name": "Novo Nome"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CONFIGURAÇÃO DE COBRANÇA INEXISTENTE

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

Atualiza a Configuração de Cobrança determinada, retornando as informações da mesma em caso de sucesso. Se houverem erros, eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

**Parâmetros (Boleto)**

| Campo                     | Tipo    | Comentário                                                                                                                                                          |
|---------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| portfolio_code            | string  | **(requerido)** código de portfólio, validação conforme o banco                                                                                                     |
| agreement_code            | string  | **(requerido, com exceção do Itaú onde é preenchido automaticamente)** código de convênio ou do beneficiário, de acordo com o banco                                 |
| agreement_code_digit      | string  | **(requerido, com exceção do HSBC e Itaú, sendo preenchido automaticamente para o último)** verificador do código de convênio, de acordo com o banco                |
| name                      | string  | **(requerido)** nome que identifica esta configuração de cobraça                                                                                                    |
| initial_number            | integer | **(requerido)** número inicial do nosso número, sendo atribuído automaticamente e sequencialmente às cobranças                                                      |
| end_number                | integer | (opcional) número final do nosso número, sendo o último número a ser atribuído, após isso a sequência é reiniciada                                                  |
| registered_charges        | boolean | (opcional) informa se a configuração de cobrança utiliza boletos registrados ou não, sendo false por padrão                                                         |
| agreement_number          | integer | (opcional, requerido apenas se registered_charges for `true`) número do convênio com o banco (apenas para o Bradesco)                                               |
| remittance_cnab_pattern   | integer | (opcional, requerido apenas se registered_charges for `true`) padrão utilizado no arquivo CNAB de remessa. Os valores permitidos são 240 ou 400                     |
| transmission_code         | string  | (opcional, requerido apenas se registered_charges for `true`) código de transmissão (apenas para o Santander)                                                       |
| initial_remittance_number | integer | (opcional) número inicial de remessa, ou seja, qual foi o último número sequencial de remessa enviado para o banco (apenas para o Bradesco). Por padrão o valor é 1 |

## Exclusão de Configuração de Cobrança

```shell
Excluir Configuração de Cobrança

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/charge_configs/:charge_config_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/charge_configs/:charge_config_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM CONFIGURAÇÃO DE COBRANÇA INEXISTENTE

    404 Not Found

```

Exclui determinada Configuração de Cobrança e junto a ela todas suas Cobranças. As mudanças são irreversíveis.
