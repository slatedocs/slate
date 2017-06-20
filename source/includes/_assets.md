# Assets

Os `assets` são as entidades que representam os arquivos relacionados a um documento. Exemplo: Arquivo para impressão do documento, XML's e TXT's que contém informações de comunicação com órgãos emissores e etc.

## Objeto `asset`
  Este objeto representa um asset relacionado ao documento, operação e transação.

Parâmetro |  Descrição
 -------------- | --------------
  **status** <br> Default: pending | *Consulte a [lista de status](#status-do-asset) possíveis do asset*
  **type** <br> Hash | *Consulte a [lista de tipos](#tipos-do-asset) possíveis do asset*
  **document** <br> Hash | *Representação da entidade Document*
  **operation** <br> Hash | *Representação da entidade Operation*
  **transaction** <br> Hash | *Representação da entidade Transaction*

## Status do asset

Quando um asset é criado, o status inicial é `pending` . Ele pode ter os seguintes status:

  * `pending`: *Asset aguardando para ser armazenado*
  * `uploading` : *Asset está sendo processado*
  * `error` : *Erro ao armazenar o arquivo*
  * `available` : *Asset disponível para download*
  * `archived` : *Asset arquivado*

## Tipos do asset

Ele pode ter os seguintes tipos:

  * `Asset::Print`: *Arquivo para impressão do documento*
  * `Asset::XmlRequest` : *XML enviado na comunicação com órgãos emissores*
  * `Asset::XmlResponse` : *XML recebido na comunicação com órgãos emissores*

## Retornando um asset

> GET https://api.fastnotas.com/v1/assets/{ASSET_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/assets/{ASSET_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "a8ac430a-ea19-46cf-9617-ff8f47ef1260",
      "status": "available",
      "type": "Asset::Print",
      "created_at": "2017-06-13T11:59:47.686Z",
      "updated_at": "2017-06-13T11:59:48.787Z",
      "document": {
        "id": "d18abeb1-185e-4fa7-ba22-6b336d9c3ddd",
        "customer_id": "dacdf315-aff4-4710-84c5-09c272f1a841",
        "company_id": "b94888a8-ba9a-493a-8373-ccd0202784c6",
        "document_schema_id": "8479b00b-f06e-4f85-b9f5-98a240d1f90d",
        "created_at": "2017-06-13T11:59:44.518Z",
        "updated_at": "2017-06-13T11:59:47.607Z",
        "status": "success",
        "amount": 1985.52,
        "sequence": 126,
        "serie": "FASTN"
      }
    }
  ```



Retorna os dados do asset solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do asset criado*

## Baixando um asset

> GET https://api.fastnotas.com/v1/assets/{ASSET_ID}/download

  ```shell
    curl -X GET https://api.fastnotas.com/v1/assets/{ASSET_ID}/download \
    -u 'YOUR_API_KEY:'
  ```

  Retorna o asset em formato para impressão (se houver).

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do asset criado*
