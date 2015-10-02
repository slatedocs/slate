# Webhook Conta Cobranca

## Conta de Cobrança Atualizada

```shell
Conta de Cobrança Atualizada

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"updated",
          "object_type":"charge_account",
          "object_id":7,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charge_accounts/7"
          }]
        }
```


Informações enviadas quando uma Conta de Cobrança é atualizada.

## Conta de Cobrança criada

```shell
Conta de Cobrança Criada

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"created",
          "object_type":"charge_account",
          "object_id":7,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charges_accounts/7"
          }]
        }

```


Informações enviadas quando uma Conta de Cobrança é Criada.

## Conta de Cobrança Excluida

```shell
Conta de Cobrança Excluida

EXEMPLO DE PAYLOAD

        {
          "created_at":"2015-05-21T16:13:33Z",
          "event":"destroyed",
          "object_type":"charge_account",
          "object_id":7,
          "_links":[{
            "rel":"self",
            "method":"GET",
            "url":"https://app.cobrato.com/api/v1/charge_accounts/7"
          }]
        }

```


Informações enviadas quando uma Conta de Cobrança é excluida.
