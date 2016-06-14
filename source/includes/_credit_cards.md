# Cartão de Crédito

```shell
Cartão de Crédito

EXEMPLO

  {
    "id": 8,
    "number": "545301******6167",
    "holder_name": "John Doe",
    "unusable": false,
    "brand": "amex",
    "expiration": "05/18",
    "avs_address": "Rua Julio de Castilhos",
    "avs_number": "100",
    "avs_complement": "Apto 103",
    "avs_district": "Centro",
    "avs_zipcode": "99000-750",
    "reusable": false,
    "payer_id": 1,
    "charge_config_id": 12,
    "_links": [
      { "rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/credit_cards/8" }
    ]
  }
```

Os Cartões de Crédito pertencem ao Pagador utilizado no momento de sua criação (primeira utilização em uma Cobrança) e, dessa forma, só pode ser reutilizado em Cobranças onde o Pagador é o mesmo.

**Parâmetros**

| Campo            | Tipo            | Comentário                                                                    |
|------------------|-----------------|-------------------------------------------------------------------------------|
| number           | string          | números do cartão (incompleto, apenas para identificação)                     |
| expiration       | string          | expiração do cartão, no formato "mm/aa"                                       |
| holder_name      | string          | nome do dono do cartão                                                        |
| brand            | string          | bandeira do cartão (visa, mastercard, amex, elo, diners, discover, jcb, aura) |
| avs_address      | string          | endereço de cobrança do cartão                                                |
| avs_number       | string          | número do endereço de cobrança do cartão                                      |
| avs_complement   | string          | complemento endereço de cobrança do cartão                                    |
| avs_district     | string          | bairro do endereço de cobrança do cartão                                      |
| avs_zipcode      | string          | cep do endereço de cobrança do cartão                                         |
| unusable         | boolean         | indica se o cartão está inutilizável                                          |
| reusable         | boolean         | indica se o cartão é reutilizável                                             |
| payer_id         | integer         | identificador do Payer ao qual este cartão pertence                           |
| charge_config_id | integer         | identificador da ChargeConfig à qual este cartão pertence                     |
| _links           | array of object | links do beneficiário                                                         |

## Informações do Cartão de Crédito

```shell
Mostrar Cartão de Crédito

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/credit_cards/:credit_card_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/credit_cards/:credit_card_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id": 8,
    "number": "545301******6167",
    "holder_name": "John Doe",
    "unusable": false,
    "brand": "amex",
    "expiration": "05/18",
    "avs_address": "Rua Julio de Castilhos",
    "avs_number": "100",
    "avs_complement": "Apto 103",
    "avs_district": "Centro",
    "avs_zipcode": "99000-750",
    "reusable": false,
    "payer_id": 1,
    "charge_config_id": 12,
    "_links": [
      { "rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/credit_cards/8" }
    ]
  }
```

Retorna as informações detalhadas do cartão de crédito informado em JSON.
