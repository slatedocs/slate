# Items

  Utilize este método para cadastrar um item de acordo com um tipo de documento.

  Através do endpoint `/items`, é possível listar, exibir, criar, atualizar e deletar itens.


  __*Obs.: Os parâmetros `settings` utilizados em todos os exemplos são referentes a NFS-e emitidas em São Paulo(SP), consulte a <a href="https://atendimento.fastnotas.com/hc/pt-br/categories/115000135067-Configura%C3%A7%C3%B5es-da-NFS-e" target="_blank">seção de configurações</a> para visualizar quais os atributos são necessários para o documento
  que você vai emitir.*__

<br> <br>

## Objeto `item`

  Parâmetro |  Descrição
 -------------- | --------------
  **name** <br> String | *Nome do produto/serviço*
  **description** <br>String | *Descrição do produto/serviço*
  **status** <br> Default: active | *Define se o item está ativado ou não na API*
  **amount** <br>Float | *Valor do produto/serviço*
  **document_schema**  <br> Hash | *Representação da entidade [document_schema](#document-schemas)*
  **settings[]** <br>[`attributes`]<br> Hash | *Consulte a <a href="https://atendimento.fastnotas.com/hc/pt-br/categories/115000135067-Configura%C3%A7%C3%B5es-da-NFS-e" target="_blank">seção de configurações</a>*

## Criando um item

  > POST https://api.fastnotas.com/v1/items

  ```shell
    curl -X POST  https://api.fastnotas.com/v1/items/ \
      -u 'YOUR_API_KEY:' \
      -d 'name=Serviço de emissão de notas fiscais' \
      -d 'description=Software as a service que emite notas' \
      -d 'amount=345.5' \
      -d 'settings[taxes][iss]= 3.1' \
      -d 'settings[parameters][service_code]=123' \
      -d 'document_schema_id=b7658863-988b-4e44-9632-a93a282dd41a'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id":"73831b4e-7c90-465a-bfa5-5114da66bb60",
      "name":"Serviço de emissão de notas fiscais",
      "description":"Software as a service que emite notas",
      "amount":345.5,
      "setting": {
        "taxes": {
          "iss":"3.1"
        },
        "parameters": {
          "service_code":"123"
        }
      },
      "document_schema_id": "b7658863-988b-4e44-9632-a93a282dd41a"
    }
  ```




  <br> <br> <br>

  Parâmetro |  Descrição
 -------------- | --------------
  **name** <br> <p> obrigatório </p>| *Nome do produto/serviço*
  **description** <br> <p> obrigatório </p> | *Descrição do produto/serviço*
  **amount** <br> <p> obrigatório </p>| *Valor do produto/serviço*
  **document_schema_id**  <br> <p> obrigatório </p> | *Id do esquema de documento*
  ****settings[]** <br>[`attributes`]** <br> <p> obrigatório </p>| *Consulte a <a href="https://atendimento.fastnotas.com/hc/pt-br/categories/115000135067-Configura%C3%A7%C3%B5es-da-NFS-e" target="_blank">seção de configurações</a>*


  <br> <br> <br> <br> <br>

##Retornando um item

  > GET https://api.fastnotas.com/v1/items/{ITEM_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/items/{ITEM_ID} \
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id":"73831b4e-7c90-465a-bfa5-5114da66bb60",
      "name":"Serviço de emissão de notas fiscais",
      "description":"Software as a service que emite notas",
      "amount":345.5,
      "setting": {
        "taxes": {
          "iss":"3.1"
        },
        "parameters": {
          "service_code":"123"
        }
      },
      "document_schema_id": "b7658863-988b-4e44-9632-a93a282dd41a"
    }
  ```

  Retorna os dados do item solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do item criado*


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br>

##Retornando itens

  Retorna um array que contém objetos de item.

  Parâmetro |  Descrição
-------------- | --------------
**query** |  *Campos para filtro: name, description, amount, created_at*

  > GET https://api.fastnotas.com/v1/items/

  ```shell
    curl -X GET https://api.fastnotas.com/v1/items/ \
    -u 'YOUR_API_KEY'
  ```

  > Exemplo de retorno em JSON:

  ```json
    [
      {
        "id":"73831b4e-7c90-465a-bfa5-5114da66bb60",
        "name":"Serviço de emissão de notas fiscais",
        "description":"Software as a service que emite notas",
        "amount":345.5,
        "setting": {
          "taxes": {
            "iss":"3.1"
          },
          "parameters": {
            "service_code":"123"
          }
        },
        "document_schema_id": "b7658863-988b-4e44-9632-a93a282dd41a"
      }
    ]
  ```

## Atualizando um item

Atualiza o item solicitado e retorna com os parâmetros atualizados

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do item criado*

  > PUT https://api.fastnotas.com/v1/items/{ITEM_ID}

  ```shell
    curl -X PUT https://api.fastnotas.com/v1/items/{ITEM_ID} \
      -u 'YOUR_API_KEY:' \
      -d 'amount=450'
  ```
  ```json
    [
      {
        "id":"73831b4e-7c90-465a-bfa5-5114da66bb60",
        "name":"Serviço de emissão de notas fiscais",
        "description":"Software as a service que emite notas",
        "amount":450.0,
        "setting": {
          "taxes": {
            "iss":"3.1"
          },
          "parameters": {
            "service_code":"123"
          }
        },
        "document_schema_id": "b7658863-988b-4e44-9632-a93a282dd41a"
      }
    ]
  ```

## Deletando um item

Deleta o item solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do item que será deletado*

  > DELETE https://api.fastnotas.com/v1/items/{ITEM_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/items/{ITEM_ID} \
    -u 'YOUR_API_KEY:'
  ```
