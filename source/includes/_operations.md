# Operations

## Objeto `operation`

 Este objeto representa a operação de emissão/cancelamento do documento.


  Parâmetro |  Descrição
 -------------- | --------------
  **operation_type** <br> Symbol | *Tipo de operação* <br> **Valores:** *issue e cancel*
  **status** <br> Default: pending | *Consulte a* [lista](#status-da-opera-o) *de status possíveis da operação*
  **document <br> [`attributes`]** <br> Hash | *Representação da entidade [document](#documents)*

## Status da operação

Quando uma operação é criada, o status inicial é `pending` . Ela pode ter os seguintes status:


  * `pending`: *Operação esperando para ser processada*
  * `processing` : *Operação está sendo processada*
  * `waiting` : *Operação aguardando o retorno de um sistema externo*
  * `error` : *Erro de comunicação com um sistema externo*
  * `success` : *Operação concluída com sucesso*
  * `rejected` : *Operação rejeitada*


## Retornando uma operação

> GET https://api.fastnotas.com/v1/operations/{OPERATION_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/operations/{OPERATION_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "831fb818-704d-484f-8c8f-8fadf361b26b",
      "operation_type": "issue",
      "status": "processing",
      "created_at": "2016-11-18T13:09:27.800Z",
      "updated_at": "2016-11-18T13:09:27.851Z",
      "last_transaction": {
        "id": "d03cd204-cba8-4ae0-b2ca-548e0ceed86d",
        "status": "processing",
        "messages": null,
        "response_fields": null,
        "created_at": "2016-11-18T13:09:27.896Z",
        "updated_at": "2016-11-18T13:09:27.905Z"
      },
      "document": {
        "id": "728a124f-99cd-409a-bd13-b50685778977",
        "company_id": "6f262be2-3f9f-4d3e-95c6-8bd4762f919d",
        "amount": 345.5,
        "sequence": 1,
        "status": "processing",
        "last_operation": {
          "id": "831fb818-704d-484f-8c8f-8fadf361b26b",
          "operation_type": "issue",
          "status": "processing",
          "created_at": "2016-11-18T13:09:27.800Z",
          "updated_at": "2016-11-18T13:09:27.851Z",
          "last_transaction": {
            "id": "d03cd204-cba8-4ae0-b2ca-548e0ceed86d",
            "status": "processing",
            "messages": null,
            "response_fields": null,
            "created_at": "2016-11-18T13:09:27.896Z",
            "updated_at": "2016-11-18T13:09:27.905Z"
          }
        }
      }
    }
  ```

Retorna os dados da operação solicitada.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da operação criada*


## Obtendo transações de uma operação

> GET https://api.fastnotas.com/v1/operations/{OPERATION_ID}/transactions

```shell
    curl -X GET https://api.fastnotas.com/v1/operations/{OPERATION_ID}/transactions \
    -u 'YOUR_API_KEY:'
```

> Exemplo de retorno em JSON:

```json
  [
    {
      "id": "d03cd204-cba8-4ae0-b2ca-548e0ceed86d",
      "status": "processing",
      "messages": null,
      "response_fields": null,
      "created_at": "2016-11-18T13:09:27.896Z",
      "updated_at": "2016-11-18T13:09:27.905Z"
    }
  ]
```

Com a rota `/operations/:id/transactions` é possível ver todas as transações de uma operação.

Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da operação criada*
  **query** |  *Campos para filtro: status, created_at*
