# Configuração de Pagamento

<aside class="warning">
Por enquanto, esta API está disponível apenas para contas beta.
</aside>

```shell
Configuração de Pagamento

EXEMPLO

  {
    "id": 1,
    "bank_account_id": 1,
    "name": "Configuração de Pagamento",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/payment_configs/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/payment_configs/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/payment_configs/1"},
        {"rel":"bank_account","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"}
      ]
  }

```

## Informações da Configuração de Pagamento

```shell
Mostrar Configuração de Pagamento

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payment_configs/:payment_config_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payment_configs/:payment_config_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id": 1,
    "bank_account_id": 1,
    "name": "Configuração de Pagamento",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/payment_configs/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/payment_configs/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/payment_configs/1"},
        {"rel":"bank_account","method":"GET","href":"https://app.cobrato.com/api/v1/bank_accounts/1"}
      ]
  }

```

Retorna as informações detalhadas da Configuração de Pagamento informada em JSON e também suas referências.

## Lista de Todas as Configurações de Pagamento

```shell
Listar Configurações de Pagamento

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payment_configs

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payment_configs

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "payment_configs":
      [
        {
          // informações configuração de pagamento 1
        },
        {
          // informações configuração de pagamento 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todas as Configurações de Pagamento que pertencem a sua Conta de Serviço.

## Criação de Configuração de Pagamento

```shell
Criar Configuração de Pagamento

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/payment_configs

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/payment_configs \
    -d '{
          "bank_account_id": "1",
          "name": "Configuração de Pagamento"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "bank_account_id":["não pode ficar em branco"],
        "name":["não pode ficar em branco"]
      }
  }

```

Cria uma nova Configuração de Pagamento, retornando as informações da mesma em caso de sucesso. Se houverem erros eles serão informados no corpo da resposta.

**Parâmetros**

| Campo                     | Tipo    | Comentário                                                                                                                                                                                                      |
|---------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| bank_account_id           | integer | **(requerido)** código de identificação da conta bancária em que a configuração de pagamento irá pertencer                                                                                                       |
| name                      | string  | **(requerido)** nome que identifica esta configuração de pagamento                                                                                                                                               |


## Atualização de Configuração de Pagamento

```shell
Atualizar Configuração de Pagamento

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/payment_configs/:payment_config_id
  PATCH https://app.cobrato.com/api/v1/payment_configs/:payment_config_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/payent_configs/:payent_config_id \
    -d '{
          "name": "Novo Nome"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CONFIGURAÇÃO DE PAGAMENTO INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "name": ["não pode ficar em branco"]
      }
  }

```

Atualiza a Configuração de Pagamento determinada, retornando as informações da mesma em caso de sucesso. Se houverem erros, eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

**Parâmetros**

| Campo                     | Tipo    | Comentário                                                                                                                                                                                     |
|---------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name                      | string  | **(requerido)** nome que identifica esta configuração de pagamento                                                                                                                              |


## Exclusão de Configuração de Pagamento

```shell
Excluir Configuração de Pagamento

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/payment_configs/:payment_config_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/payment_configs/:payment_config_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM CONFIGURAÇÃO DE PAGAMENTO INEXISTENTE

    404 Not Found

```

Exclui determinada Configuração de Pagamento. As mudanças são irreversíveis.
