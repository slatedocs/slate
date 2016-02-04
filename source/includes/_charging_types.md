# Tipos de cobrança

Os tipos de cobrança implementados pelo Cobrato.

<aside class="notice">Não é necessária autenticação.</aside>

**bank_billets (Boletos bancários)**

| Campo           | Tipo   | Comentário                                                       |
|-----------------|--------|------------------------------------------------------------------|
| bank_code       | string | código do banco                                                  |
| bank_name       | string | nome do banco                                                    |
| portfolio_codes | array  | lista de códigos de portfólio do banco                           |
| regress         | array  | indica quais layouts CNAB de retorno são suportados para o banco |
| remittance      | array  | indica quais layouts CNAB de remessa são suportados para o banco |


## Lista de Todos os Tipos de Cobrança

```shell
Listar Tipos de Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charging_types

EXEMPLO DE REQUISIÇÃO

  $ curl -i \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charging_types

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "charging_types": {
      "bank_billets": [
        {
          "bank_code": "001",
          "bank_name": "BancoDoBrasil",
          "portfolio_codes": [ "11", "12", "16", "17", "18", "31", "51" ],
          "regress": [240],
          "remittance": []
        },
        {
          // informações de outro banco
        }
        ...
      ]
    }
  }
```

Retorna um objeto JSON contendo todos os tipos de cobraça implementados pelo Cobrato.
