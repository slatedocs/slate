# Transactions

## Objeto `transaction`

  Este objeto representa uma transação dentro da operação de emissão/cancelamento.

Parâmetro |  Descrição
 -------------- | --------------
  **status** <br> Default: pending | *Consulte a lista de status possíveis da transação*
  **messages** <br> Hash | *Mensagens da transação*
  **response_fields** <br> Hash | *Atributos de resposta do serviço de emissão/armazenamento do documento*

## Status da transação

Quando uma transação é criada, o status inicial é `pending` . Ela pode ter os seguintes status:


  * `pending`: *Transação esperando para ser processada*
  * `processing` : *Transação está sendo processada*
  * `error` : *Erro de comunicação com um sistema externo*
  * `success` : *Transação concluída com sucesso*
  * `rejected` : *Transação rejeitada*


## Retornando uma transação

> GET https://api.fastnotas.com/v1/transactions/{TRANSACTION_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/transactions/{TRANSACTION_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "d03cd204-cba8-4ae0-b2ca-548e0ceed86d",
      "status": "processing",
      "messages": null,
      "response_fields": null,
      "created_at": "2016-11-18T13:09:27.896Z",
      "updated_at": "2016-11-18T13:09:27.905Z"
    }
  ```

Retorna os dados da transação solicitada.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da transação criada*

