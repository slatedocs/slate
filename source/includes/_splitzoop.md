# (Marketplace) - Split de Transações

## Enviando um Request de Split

`POST /service/v1`

> Exemplo de integração

```shell
curl -X POST \
  'https://sandbox.ipag.com.br/service/v1?ctrl=zoopsplit&tid=9dd605c47d5144d58c0f091b397fb741' \
  -H 'authorization: Basic am9uYXRoYW46REM4QS00QzE2OU87789S1EQTZBRUY2OC0wRkQ2RDMyOC0wRjAz' \
  -H 'content-type: application/json' \
  -d '{
    "split": [
        {
            "seller_id": "06e004cf5f034e09bb0481a160969d81",
            "amount": "10.01"
        },
        {
            "seller_id": "074e381d9a0c46a790991ac65eae384c",
            "amount": "4.00"
        },
        {
            "seller_id": "edb36507a5864e0996de42d286f865f4",
            "amount": "4.99"
        }
    ]
}'
```

### Os campos abaixo devem ser enviados como parâmetros na URL

Campo |  tipo | Obrigatório | Descrição
------| ----- | ----------- | ---------
ctrl | string | sim | **zoopsplit**
tid  | string | sim | TID da transação no iPag (transId)

> O JSON abaixo deve ser enviado no corpo do Request:

```json
{
  "split": [
    {
      "seller_id": "06e004cf5f034e09bb0481a160969d81",
      "amount": "10.01"
    },
    {
      "seller_id": "074e381d9a0c46a790991ac65eae384c",
      "amount": "4.00"
    },
    {
      "seller_id": "edb36507a5864e0996de42d286f865f4",
      "amount": "4.99"
    }
  ]
}
```

### Campos do JSON de Split

Campo |  tipo | Obrigatório | Descrição
------| ----- | ----------- | ---------
split | container | sim | Container
seller_id  | string | sim | ID do vendedor
amount | double | sim | Valor absoluto que será repassado ao vendedor

## Resposta de um Split com Sucesso

> Resposta de um Split com Sucesso

```json
[
    {
        "seller_id": "06e004cf5f034e09bb0481a160969d81",
        "amount": "10.01",
        "status": "success",
        "rule": "527940e2065b446484f3825a688e332f"
    },
    {
        "seller_id": "074e381d9a0c46a790991ac65eae384c",
        "amount": "4.00",
        "status": "success",
        "rule": "4d48ceb222854fde8818dba581bb990d"
    },
    {
        "seller_id": "edb36507a5864e0996de42d286f865f4",
        "amount": "4.99",
        "status": "success",
        "rule": "b8fdc6097e11417e98a4e683de5627f5"
    }
]
```


## Consultar Transação de Split

<aside class="notice">
  Você pode realizar uma consulta antes de enviar um Split, desta forma você terá o valor líquido total disponível para realizar o Split.
</aside>

`GET /service/v1`

```shell
curl -X GET \
  'https://sandbox.ipag.com.br/service/v1?ctrl=zoopsplitquery&tid=9dd605c47d5144d58c0f091b397fb741' \
  -H 'authorization: Basic am9uYXRoYW46REM4QS00QzE2OU87789S1EQTZBRUY2OC0wRkQ2RDMyOC0wRjAz' \
  -H 'content-type: application/json'
```

### Os campos abaixo devem ser enviados como parâmetros na URL

Campo |  tipo | Obrigatório | Descrição
------| ----- | ----------- | ---------
ctrl | string | sim | **zoopsplitquery**
tid  | string | sim | TID da transação no iPag (transId)

### Resposta da consulta de Split

> Resposta da consulta de Split

```json
{
    "available": "0.20",
    "can_split": 1,
    "zoop_fee": "0.80",
    "split": [
        {
            "seller_id": "074e381d9a0c46a790991ac65eae384c",
            "amount": "4.00",
            "rule": "4d48ceb222854fde8818dba581bb990d"
        },
        {
            "seller_id": "edb36507a5864e0996de42d286f865f4",
            "amount": "4.99",
            "rule": "b8fdc6097e11417e98a4e683de5627f5"
        },
        {
            "seller_id": "06e004cf5f034e09bb0481a160969d81",
            "amount": "10.01",
            "rule": "527940e2065b446484f3825a688e332f"
        }
    ]
}
```




