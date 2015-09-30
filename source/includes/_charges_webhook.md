# Webhook - Cobrança

## Cobrança Atualizada

```shell
Cobrança Atualizada

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"updated",
          "object_type":"charge",
          "object_id":12,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charges/12"
          }]
        }

```

Informações enviadas quando uma Cobrança é atualizada.


## Cobrança criada

```shell
Cobrança Criada

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"created",
          "object_type":"charge",
          "object_id":12,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charges/12"
          }]
        }

```

Informações enviadas quando uma Cobrança é criada.

## Cobrança Recebida


```shell
Cobrança Recebida

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"received",
          "object_type":"charge",
          "object_id":12,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charges/12"
          }]
        }

```
Informações enviadas quando uma Cobrança é recebida.


## Cobrança Excluida

```shell
Cobrança Excluida

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"destroyed",
          "object_type":"charge",
          "object_id":12,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charges/12"
          }]
        }

```


Informações enviadas quando uma Cobrança é excluida.


## Desfazer Recebimento de Cobrança

```shell
Desfazer Recebimento de Cobrança

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"undone_receivement",
          "object_type":"charge",
          "object_id":12,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charges/12"
          }]
        }

```

Informações enviadas quando uma Cobrança tem seu recebimento desfeito.

