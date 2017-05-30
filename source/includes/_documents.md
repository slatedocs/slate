# Documents

  Representa um documento fiscal.

  Para emitir um documento utilize o endpoint `/documents`. É possível listar, exibir e criar documentos.

## Objeto `document`

  Parâmetro |  Descrição
 -------------- | --------------
  **amount** <br>Float | *Valor total dos itens do documento*
  **status** <br> Default: pending | *Consulte a [lista](#status-do-documento) de status possíveis do documento*
  **last_operation** <br> Hash | *Última operação do documento*
  **last_operation[last_transaction]** <br> Hash | *Última transação da operação do documento*
  **sequence** <br> Int | *Número sequencial do documento*
  **document_schema**  <br> Hash | *Representação da entidade [document_schema](#document-schemas)*
  **customer** <br> Hash | *Representação da entidade [customer](#customers)*
  **document_items** <br> Array | *Produtos/serviços prestados do documento*
  **print_url** <br> String | *Link para download do documento*

## Status do documento

Quando um documento é criado, o status inicial é `pending` . Ele pode ter os seguintes status:


  * `pending`: *Documento esperando para ser processado*
  * `processing` : *Documento sendo processado*
  * `waiting` : *Documento aguardando o retorno de um sistema externo*
  * `error` : *Erro de comunicação com um sistema externo*
  * `success` : *Documento emitido/arquivado com sucesso*
  * `rejected` : *Documento rejeitado*


## Criando um documento

> POST https://api.fastnotas.com/v1/documents/

```shell
  curl -X POST  https://api.fastnotas.com/v1/documents/ \
    -u 'YOUR_API_KEY:' \
    -d 'document_schema_id=d0b0d7ef-cb07-42af-9f74-ab17236c82c9' \
    -d 'customer_id=1a925c53-b415-448f-8356-46d33bc2c431' \
    -d 'document[0][item_id]=daa356f5-d7ec-4a42-b99b-4ffc7db39c16'
    -d 'document[0][amount]=12.34'
```

> Exemplo de retorno em JSON:

```json
  [
    {
      "id": "728a124f-99cd-409a-bd13-b50685778977",
      "company_id": "6f262be2-3f9f-4d3e-95c6-8bd4762f919d",
      "amount": 345.5,
      "sequence": 1,
      "status": "processing",
      "last_operation": {
        "id": "831fb818-704d-484f-8c8f-8fadf361b26b",
        "operation_type": "issue",
        "status": "processing",
        "print_url": "https://api.fastnotas.com/v1/documents/728a124f-99cd-409a-bd13-b50685778977/print",
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
      },
      "document_items": [
        {
          "id": "daa356f5-d7ec-4a42-b99b-4ffc7db39c16",
          "name": "item",
          "description": "item description",
          "amount": 345.5,
          "item_id": "5643de81-e19e-4545-b766-1d80838a744b",
          "settings": {
            "taxes": {
              "iss": "3.1"
            },
            "parameters": {
              "service_code": "123"
            }
          }
        }
      ],
      "customer": {
        "id": "1a925c53-b415-448f-8356-46d33bc2c431",
        "name": "Carolina",
        "email": "exemplo@fastnotas.com",
        "registry_code": "11111111111",
        "status": "active",
        "phone": {
          "id": "3d630e5a-620d-4cb1-b9ad-d4f8aeabf5ba",
          "phone_type": "mobile",
          "country_code": null,
          "area_code": "11",
          "extension": null,
          "number": "43214321",
          "company_id": "6f262be2-3f9f-4d3e-95c6-8bd4762f919d"
        }
      },
      "document_schema": {
       "id": "d0b0d7ef-cb07-42af-9f74-ab17236c82c9",
        "name": "nota fiscal de serviço",
        "code": "nfs-e",
        "type": "DocumentSchema::Invoice::Nfse::Sp::SaoPaulo",
        "sequence": 1,
        "credentials": {
          "certificate_key": "[FILTERED]",
          "expiration_date": "2017-06-24 15:54:00 UTC",
          "certificate": "[FILTERED]"
        },
        "status": "active"
      }
    }
  ]
```

  Parâmetro |  Descrição
 -------------- | --------------
  **customer_id** <br> <p> obrigatório </p> | *Id do cliente*
  **document_schema_id**  <br> <p> obrigatório </p> | *Id do esquema de documento*
  **document[][`item_id`]** <br> <p> obrigatório </p>| *Id do produto/serviço prestado*
  **document[][`attributes`]** | *Você pode sobrescrever os valores padrões do* [item](#objeto-item)


## Retornando um documento


  > GET https://api.fastnotas.com/v1/documents/{DOCUMENT_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/documents/{DOCUMENT_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

```json
  [
    {
      "id": "728a124f-99cd-409a-bd13-b50685778977",
      "company_id": "6f262be2-3f9f-4d3e-95c6-8bd4762f919d",
      "amount": 345.5,
      "sequence": 1,
      "status": "processing",
      "print_url": "https://api.fastnotas.com/v1/documents/728a124f-99cd-409a-bd13-b50685778977/print",
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
      },
      "document_items": [
        {
          "id": "daa356f5-d7ec-4a42-b99b-4ffc7db39c16",
          "name": "item",
          "description": "item description",
          "amount": 345.5,
          "item_id": "5643de81-e19e-4545-b766-1d80838a744b",
          "settings": {
            "taxes": {
              "iss": "3.1"
            },
            "parameters": {
              "service_code": "123"
            }
          }
        }
      ],
      "customer": {
        "id": "1a925c53-b415-448f-8356-46d33bc2c431",
        "name": "Carolina",
        "email": "exemplo@fastnotas.com",
        "registry_code": "11111111111",
        "status": "active",
        "phone": {
          "id": "3d630e5a-620d-4cb1-b9ad-d4f8aeabf5ba",
          "phone_type": "mobile",
          "country_code": null,
          "area_code": "11",
          "extension": null,
          "number": "43214321",
          "company_id": "6f262be2-3f9f-4d3e-95c6-8bd4762f919d"
        }
      },
      "document_schema": {
       "id": "d0b0d7ef-cb07-42af-9f74-ab17236c82c9",
        "name": "nota fiscal de serviço",
        "code": "nfs-e",
        "type": "DocumentSchema::Invoice::Nfse::Sp::SaoPaulo",
        "sequence": 1,
        "credentials": {
          "certificate_key": "[FILTERED]",
          "expiration_date": "2017-06-24 15:54:00 UTC",
          "certificate": "[FILTERED]"
        },
        "status": "active"
      }
    }
  ]
```

  Retorna os dados do documento solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do documento criado*


##Retornando documentos

  Retorna um array que contém objetos do documento.

  Parâmetro |  Descrição
-------------- | --------------
**query** |  *Campos para filtro: amount, status, created_at*

  > GET https://api.fastnotas.com/v1/documents/

  ```shell
    curl -X GET https://api.fastnotas.com/v1/documents/ \
    -u 'YOUR_API_KEY'
  ```

  > Exemplo de retorno em JSON:

  ```json
    [
      {
        "id": "40d34041-d8f5-4ff1-8c2c-8bf21dcea35f",
        "company_id": "cced3716-0288-4371-9f4d-027d9a62ddef",
        "amount": 150.5,
        "customer": {
          "id": "cec6d637-599f-4ea5-9672-ad85acb95ebf",
          "name": "Carolina",
          "email": "exemplo@fastnotas.com",
          "registry_code": "11111111111",
          "status": "active",
          "print_url": "https://api.fastnotas.com/v1/documents/728a124f-99cd-409a-bd13-b50685778977/print",
          "phone": {
            "id": "4ad34b22-4c43-40b4-a267-3577cb693fc4",
            "phone_type": "mobile",
            "country_code": null,
            "area_code": "11",
            "extension": null,
            "number": "43214321",
            "company_id": "cced3716-0288-4371-9f4d-027d9a62ddef"
          }
        },
        "document_schema": {
          "id": "d0b0d7ef-cb07-42af-9f74-ab17236c82c9",
          "name": "nota fiscal de serviço",
          "code": "nfs-e",
          "type": "DocumentSchema::Invoice::Nfse::Sp::SaoPaulo",
          "sequence": 1,
          "credentials": {
            "certificate_key": "[FILTERED]",
            "expiration_date": "2017-06-24 15:54:00 UTC",
            "certificate": "[FILTERED]"
          },
          "status": "active"
        },
        "document_items": [
          {
            "id": "428b4110-0368-46a3-84b2-769864868a47",
            "name": "Serviço de emissão de notas fiscais",
            "description": "Software as a service que emite notas",
            "amount": 150.5,
            "item_id": "64479c2c-2f86-4aab-ac7a-6ee8afd0e483",
            "settings": {
              "taxes": {
                "iss": "3.1"
              },
              "parameters": {
                "service_code": "123"
              }
            }
          }
        ]
      }
    ]
  ```

## Obtendo operações do documento

> GET https://api.fastnotas.com/v1/documents/{DOCUMENT_ID}/operations

  ```shell
    curl -X GET https://api.fastnotas.com/v1/documents/{DOCUMENT_ID}/operations \
    -u 'YOUR_API_KEY'
  ```

  > Exemplo de retorno em JSON:

```json
  [
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
  ]
```

Com a rota `/documents/:id/operations` é possível ver todas as operações de um documento.

Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do documento criado*
  **query** |  *Campos para filtro: operation_type, created_at, status*

## Cancelando um documento
Cancela o documento solicitado.

Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do documento criado*

  > DELETE https://api.fastnotas.com/v1/documents/{DOCUMENT_ID}

```shell
  curl -X DELETE https://api.fastnotas.com/v1/documents/{DOCUMENT_ID} \
  -u 'YOUR_API_KEY:'
```

## Imprimindo um documento
Retorna o documento em formato para impressão (se houver).

Caso o [asset](#assets) do tipo `print` para este documento não esteja com o status `available`, o sistema devolverá um arquivo temporário contendo todas as informações e seguindo o padrão do arquivo original.

Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do documento criado*

  > GET https://api.fastnotas.com/v1/documents/{DOCUMENT_ID}/print

```shell
  curl -X GET https://api.fastnotas.com/v1/documents/{DOCUMENT_ID}/print
```
