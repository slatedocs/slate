# Document schemas

  Utilize este método para cadastrar o tipo de documento que você deseja emitir/arquivar.

  Através do endpoint `/document_schemas` é possível listar, exibir, criar, atualizar e deletar tipos de documentos.


##Objeto `document_schema`
  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> String | *Nome do documento.*
  **code**  <br> String | *Código para identificação (Por exemplo:"NFS-e")*
  **type**  <br> String | *Tipo de documento que deve ser emitido/arquivado* <br> **Tipos:** `Invoice::Nfse`
  **status** <br> Default: active | *Define se o tipo de documento está ativado ou não na API*
  **serie**  <br> <p> Default: FASTN </p>  | *Série para a identificação dos documentos de determinado tipo de documento*
  **sequence**  <br> Int | *Número sequencial do último documento emitido/armazenado desse tipo*
  **credentials** <br>[`attributes`]<br> Hash | *Consulte a [seção](https://atendimento.fastnotas.com/hc/pt-br/categories/115000135067-Configura%C3%A7%C3%B5es-da-NFS-e) de configurações para cada tipo de <br>`document_schema`*
  **parameters** <br>[`attributes`]<br> Hash |*Consulte a [seção de configurações](https://atendimento.fastnotas.com/hc/pt-br/categories/115000135067-Configura%C3%A7%C3%B5es-da-NFS-e) de configurações para cada tipo de <br>`document_schema`*


## Criando um tipo de documento

  > POST https://api.fastnotas.com/v1/document_schemas

  ```shell
  curl -X POST https://api.fastnotas.com/v1/document_schemas \
    -u 'YOUR_API_KEY:' \
    -H 'Content-Type: application/json; charset=utf-8' \
    -d '{
      "name": "Nota fiscal de serviço",
      "code": "NFS-e",
      "type": "Invoice::Nfse",
      "credentials": {
        "attribute_1": "value",
        "attribute_2": "value",
        "attribute_3": "value"
      },
      "parameters": {
        "attribute_4": "value"
      }
    }'
 ```

  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> <p>obrigatório</p>  | *Nome do documento*
  **code**  <br> <p>obrigatório</p>  | *Código para identificação (Por exemplo:"NFS-e")*
  **type**  <br> <p>obrigatório</p>  | *Aceita o tipo do tipo do documento* <br> **Tipos:** `Invoice::Nfse`
  **serie**  <br> <p>Default: FASTN </p>  | *Série para a identificação do documento*
  **sequence**  <br> <p>Default: 1 </p>  | *Número sequencial da série*
  **credentials<br>[`attributes`]** <br> <p>obrigatório</p> | *Consulte a [seção](https://atendimento.fastnotas.com/hc/pt-br/categories/115000135067-Configura%C3%A7%C3%B5es-da-NFS-e) de configurações para cada tipo de <br>`document_schema`*
  **parameters** <br>[`attributes`]<br> Hash | *Consulte a [seção](https://atendimento.fastnotas.com/hc/pt-br/categories/115000135067-Configura%C3%A7%C3%B5es-da-NFS-e) de configurações para cada tipo de <br>`document_schema`*


  Caso seja necessário enviar arquivos para o seu tipo de documento, utilize o `header` abaixo:

HTTP Header | Valor
-------------- | --------------
**Content-Type** | *multipart/form-data*

<br> <br> <br> <br> <br> <br>
## Retornando um tipo de documento

  > GET https://api.fastnotas.com/v1/document_schemas/{DOCUMENT_SCHEMA_ID}

   ```shell
    curl -X GET https://api.fastnotas.com/v1/document_schemas/{DOCUMENT_SCHEMA_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "name": "Nota fiscal de serviço",
      "code": "NFS-e",
      "type": "Invoice::Nfse",
      "status": "active",
      "serie": "FASTN",
      "sequence": 1,
      "credentials": {
        "certificate": "[FILTERED]",
        "password": "[FILTERED]",
        "expiration_date": "2020-12-30"
      },
      "parameters": {
        "municipal_registration": "12211"
      }
    }
  ```

  Retorna os dados do tipo de documento solicitado.

  Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do tipo de documento.*


## Retornando tipos de documento

  > GET https://api.fastnotas.com/v1/document_schemas/

   ```shell
    curl -X GET https://api.fastnotas.com/v1/document_schemas \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    [
      {
        "id": "b7658863-988b-4e44-9632-a93a282dd41a",
        "name": "Nota fiscal de serviço",
        "code": "NFS-e",
        "type": "Invoice::Nfse",
        "status": "active",
        "serie": "FASTN",
        "sequence": 1,
        "credentials": {
          "certificate": "[FILTERED]",
          "password": "[FILTERED]",
          "expiration_date": "2020-12-30"
        },
        "parameters": {
          "municipal_registration": "12211"
        }
      }
    ]
  ```

  Retorna um array que contém objetos de tipo de documento.

## Atualizando um tipo de documento

  > PUT https://api.fastnotas.com/v1/document_schema/{DOCUMENT_SCHEMA_ID}

  ```shell
  curl -X PUT https://api.fastnotas.com/v1/document_schemas/{DOCUMENT_SCHEMA_ID} \
  -u 'YOUR_API_KEY:' \
  -H 'Content-Type: application/json; charset=utf-8' \
  -d '{
    "name": "Tipo de Documento para NFS-e",
    "code": "invoice_nfse"
  }'
 ```

  > Exemplo de retorno JSON:

  ```json
    {
      "id": "b7658863-988b-4e44-9632-a93a282dd41a",
      "name": "Tipo de Documento para NFS-e",
      "code": "invoice_nfse",
      "type": "Invoice::Nfse",
      "status": "active",
      "sequence": 1,
      "credentials": {
        "certificate": "[FILTERED]",
        "password": "[FILTERED]",
        "expiration_date": "2020-12-30"
      },
      "parameters": {
        "municipal_registration": "12211"
      }
    }
  ```

Atualiza o tipo de documento solicitado e retorna com os parâmetros atualizados.

Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do tipo de documento.*

## Deletando um tipo de documento
  Deleta o tipo de documento solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do tipo de documento*

  > DELETE https://api.fastnotas.com/v1/document_schemas/{DOCUMENT_schema_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/document_schemas/{DOCUMENT_schema_ID} \
    -u 'YOUR_API_KEY:'
  ```

## Retornando items de um tipo de documento

> GET https://api.fastnotas.com/v1/document_schemas/{DOCUMENT_SCHEMA_ID}/items

   ```shell
    curl -X GET https://api.fastnotas.com/v1/document_schemas/{DOCUMENT_SCHEMA_ID}/items \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

```json
  [
    {
      "id": "dac22e14-351d-49b9-bed3-18c50ba81adf",
      "name": "emissão de nota fiscal",
      "description": "teste",
      "amount": 345.5,
      "document_schema_id": "3f6fa6a9-6fe7-4464-aa7f-8ee302580537",
      "setting": {
        "taxes": {
          "iss": "3.1"
        },
        "parameters": {
          "service_code": "123"
        }
      }
    }
  ]
```
Com a rota `/document_schemas/:id/items` é possível ver todos os itens de um tipo de documento.

  Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do tipo de documento.*
