# Invoicer API


## Addresses

  Um endereço pertence à um cliente ou uma empresa.

  **Parâmetros**
  <br>
  **country** `string` <br>
  *Obrigatório. Deve ser a abreviação do país.*
  <br>
  **zipcode** `string` <br>
  *Obrigatório. Coloque somente os números do CEP*
  <br>
  **number** `string` <br>
  *Opcional. Número da casa/prédio.*
  <br>

### Criando um endereço

  ```shell
    curl -v -X POST *url* \
    -H "Authorization: Bearer Access-Token" \
    -d '[ {
            country: "BR",
            zipcode: "11111111",
            number: "123"
          }
        ]'
  ```


###Retornando um endereço

  Retorna os dados do endereço criado ou solicitado pelo id.

  ```shell
    curl -v -X GET /v1/addresses/:id
  ```

  > Exemplo de retorno em JSON:

  ```json
    {
      “id”: “9bf4xxxxxxxxxe37”,
      “neighborhood”: “Vila Clementino”,
      “street”: “Rua Doutor Diogo de Faria”,
      “number”: “123”,
      “additional_details”: null,
      “zipcode”: “04635021”,
      “city”: “São Paulo”,
      “state”: “SP”,
      “country”: “BR”
    }
  ```

###Retornando endereços

  Retorna um array contendo objetos de Address.

  ```shell
    curl -v -X GET /v1/addresses/
  ```


## Companies

  Uma empresa contém um endereço e telefone, e contém muitos “document schemes”.

  **Parâmetros**
  <br>
  **name** `string` <br>
  *Obrigatório.*
  <br>
  **registry_code** `string` <br>
  *Obrigatório. CNPJ da empresa.*
  <br>
  **legal_name** `string` <br>
  *Opcional.*
  <br>
  **email** `string` <br>
  *Obrigatório.*
  <br>
  **address_id** `string` <br>
  *Obrigatório.*
  <br>

###Criando uma empresa

  Para criar uma empresa é necessário ter a [chave de API](http://example.com/developers).
  ```shell
  curl -X POST /v1/companies \
  -d 'api_key=YOUR_API_KEY' \
  -d '[
        { "name": "Fast Notas",
          "legal_name": "Fast Notas",
           "email": "exemplo@fastnotas.com",
           "registry_code": "11111111111111",
           "phone": null,
           "address_id": "9bf4xxxxxxxxxe37"
        }
      ]'
 ```



### Index

> `GET /v1/companies`

```json
[
  {
    "id": company_id,
    "name": "Fast Notas",
    "legal_name": "Fast Notas",
    "email": "exemplo@fastnotas.com",
    "registry_code": "11111111111111",
    "status": "active",
    "phone": null,
    "api_key": YOUR_API_KEY,
    "address": null
  }
]

```

### teste


## Customers

## Document Schemes

  1. Ver index
  2. Criar
  3. Visualizar
  4. Deletar

## Items

## Settings

## Documents

## Operations

## Transactions
