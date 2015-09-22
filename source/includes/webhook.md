
includes:
  - nao_to_sendo_chamado


# Webhooks


## Lista de Todos os Webhooks

```
Listar Webhooks

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/webhooks

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/webhooks

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "webhooks":
      [
        {
          //informações webhook 1
        },
        {
          //informações webhook 2
        },
        ...
      ]
  }
```

Retorna uma lista em JSON contendo todos os webhooks pertencentes a sua Conta de Serviço.


## Informações do Webhook

```
Mostra Webhook

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/webhooks/:webhook_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/webhooks/:webhook_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id": 1,
    "url": "http://www.seusitema.com/cobrato",
    "description": "teste",
    "_links": [
      {"rel":"self","method":"GET","href":"http://localhost:3000/api/v1/webhooks/1"},
      {"rel":"update","method":"PUT","href":"http://localhost:3000/api/v1/webhooks/1"},
      {"rel":"destroy","method":"DELETE","href":"http://localhost:3000/api/v1/webhooks/1"}
    ]
  }

```


Retorna as informações detalhadas do webhook em formato JSON.

```
Criar Webhook

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/webhooks

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/webhooks
    -D '{
        "url": "http://www.seusitema.com/cobrato",
        "description": "Webhook teste"
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors": {
      "url": [
        "não é válida",
        "não pode ficar em branco",
        "não é válido"
      ]
    }
  }

```

Criação de Webhook

Cria um novo webhook, retornando as informações do mesmo caso haja sucesso. Para realizar o cadastro é necessária que a URL informa aceite as requisições POST e GET, respondendo sempre com HTTP 200. Afim de verificação da URL, o Cobrato fará requisições testes a mesma

Parâmetros

url:  string requirido
URL na qual serão feitas as requisições GET e POST, esperando HTTP 200 como retorno
description:  string
Descrição opcional do Webhook


## Atualização de Webhook

```
Atualizar Webhook

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/webhooks/:webhook_id
  PATCH https://app.cobrato.com/api/v1/webhooks/:webhook_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/webhooks/:webhook_id
    -D '{
        "city": "Farroupilha",
        "state": "RS"
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CEDENTE INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

```

Atualiza a descrição do webhook. Não é possível alterar a URL de um Webhook. A requisição não diferencia a utilização dos verbos PUT e PATCH.

Parâmetros

description:  string
Descrição opcional do Webhook

## Exclusão de Webhook

```
Excluir Webhook

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/webhooks/:webhook_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/webhooks/:webhook_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM WEBHOOK INEXISTENTE

    404 Not Found

```

Exclui determinado webhook. A exclusão é irreversível.


## Payloads

Exemplos de requisições enviadas pelo webhook do Cobrato.

As ações notificadas são:

|Objeto         |  Ação              |    Descrição                                    |
|---------------|--------------------|-------------------------------------------------|
|charge         | created            | quando a cobrança é criada                      |
|charge         | received           |  quando a cobrança é recebida                   |
|charge         | undone_receivement |  quando a cobrança tem seu recebimento desfeito |
|charge         | updated            | quando a cobrança é atualizada                  |
|charge         | destroyed          | quando a cobrança é excluída                    |
|charge         | received           |  quando a cobrança é recebida                   |
|charge_account | created            | quando a conta de cobrança é criada             |
|charge_account | updated            | quando a conta de cobrança é atualizada         |
|charge_account | destroyed          | quando a conta de cobrança é excluída           |
