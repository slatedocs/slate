# Invoicer API


## Addresses

  Um endereço pertence à um cliente ou uma empresa. Use a rota `addresses` para criar, deletar e atualizar endereços.

<br> <br> <br> <br> <br>

### Criando um endereço

  > POST /v1/addresses

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
  <br> <br> <br>
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
  **neighborhood** `string` <br>
  *Opcional.*
  <br>
  **street** `string` <br>
  *Opcional.*
  <br>
  **additional_details** `string` <br>
  *Opcional.*
  <br>
  **city** `string` <br>
  *Opcional.*
  <br>
  **state** `string` <br>
  *Opcional.*


<br> <br> <br> <br> <br>

###Retornando um endereço
  > GET v1/addresses/:id

   ```shell
    curl -v -X GET /v1/addresses/:id \
    -d 'api_key=YOUR_API_KEY'
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

  Retorna os dados do endereço criado ou solicitado pelo id.

   **Parâmetros**
  <br>
  **:id** <br>
  *Obrigatório. Id do endereço criado.*
  <br>
  **api_key** <br>
  *Obrigatório. Chave da API.*
  <br>

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

###Retornando endereços

  Retorna um array contendo objetos de Address.

  > GET v1/addresses/

  ```shell
    curl -v -X GET /v1/addresses/
    -d 'api_key=YOUR_API_KEY' \
  ```


## Companies

  Uma empresa contém um endereço e telefone, e contém muitos “document schemes”.


###Criando uma empresa

  Para criar uma empresa é necessário ter a [chave de API](http://example.com/developers).

  > POST /v1/companies/

  ```shell
  curl -X POST /v1/companies \
  -d 'api_key=YOUR_API_KEY' \
  -d '[
        { "name": "Fast Notas",
          "legal_name": "Fast Notas",
           "email": "exemplo@fastnotas.com",
           "registry_code": "11111111111111",
           "address_id": "9bf4xxxxxxxxxe37"
        }
      ]'
 ```

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

<br> <br> <br> <br> <br> <br> <br> <br>
###Retornando uma empresa

  > `GET /v1/companies/:id`

  ```shell
    curl -v -X GET /v1/companies/:id \
    -d 'api_key=YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "cdxxxxxxxxxxxxxxxx0d1a",
      "name": "Fast Notas",
      "legal_name": "Fast Notas",
      "email": "exemplo@fastnotas.com",
      "registry_code": "111111111111111",
      "status": "active",
      "phone": null,
      "api_key": "275xxxxxxxxxxx724",
      "address": {
        "id": "9bf4bxxxxxxxxxxxxe37",
        "neighborhood": "Vila Clementino",
        "street": "Rua Doutor Diogo Faria",
        "number": 123,
        "additional_details": null,
        "zipcode": "11111111",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    }
  ```

  Retorna dados em JSON de uma determinada empresa.

  **Parâmetros**
  <br>
  **:id** <br>
  *Obrigatório. Id do endereço criado.*
  <br>
  **api_key** <br>
  *Obrigatório. Chave da API.*
  <br>

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br>

###Retornando as empresas
  **Parâmetros**
  <br>
  **api_key** <br>
  *Obrigatório. Chave da API.*
  <br>

  > `GET /v1/companies`


  ```shell
    curl -v -X GET /v1/companies/ \
    -d 'api_key=YOUR_API_KEY'
  ```

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
      "address": {
        "id": "9bf4bxxxxxxxxxxxxe37",
        "neighborhood": "Vila Clementino",
        "street": "Rua Doutor Diogo Faria",
        "number": 123,
        "additional_details": null,
        "zipcode": "11111111",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    }

    {
      "id": company_id,
      "name": "Vindi",
      "legal_name": "Vindi Tecnologia",
      "email": "exemplo@vindi.com",
      "registry_code": "11111111111111",
      "status": "active",
      "phone": null,
      "api_key": YOUR_API_KEY,
      "address": {
        "id": "9bf4bxxxxxxxxxxxxe37",
        "neighborhood": "Vila Clementino",
        "street": "Rua Doutor Diogo Faria",
        "number": 123,
        "additional_details": null,
        "zipcode": "11111111",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    }

  ]

  ```

## Document Schemes
  Atráves da criação de um Document Scheme você cria o próprio esquema do documento que deseja salvar. Através da rota de `document_scheme` é possível criar os parâmetros para a **nota fiscal de serviço**.



###Objeto `document_scheme`
  <br>
  **name** `string` <br>
  *Nome do documento.*
  <br> <br>
  **code** `string` <br>
  *Código para identificação(Por exemplo:"NFS-e").*
  <br> <br>
  **type** `string` <br>
  *Tipo do esquema do documento.*
  <br> <br>
  **status** `int` <br>
  *Status ativo(1) ou inativo(0 - deletado).* <br>
  *Default: 1*
  <br> <br>
  **credentials** `text` <br>
  *Credenciais para a criação do objeto. Retorna JSON.*
  <br> <br>
  **sequence** `int` <br>
  *O documento é guardado com uma sequência.*
  <br> <br>
  **company_id** `string` <br>
  *O document_scheme pertence à uma empresa.*
  <br> <br>

### Criando um esquema de documento

  > POST /v1/document_schemes

  ```shell
  curl -X POST /v1/document_schemes \
  -d '[
        {
          "name": "Nota fiscal de serviço",
          "code": "NFS-e",
          "type": "DocumentScheme::Invoice::Nfse",
        }
      ]'
 ```

  <br>
  **name** `string` <br>
  *Obrigatório. Deve ser preenchido como preferir.*
  <br> <br>
  **code** `string` <br>
  *Obrigatório. Código para identificação(Por exemplo:"NFS-e")*
  <br> <br>
  **type** `string` <br>
  *Obrigatório.*
  <br> <br>
  **credentials** `text` <br>
  *Opcional. Deve ser preenchido com as credenciais para o objeto.(Por exemplo: certificado).*
  <br>
<br> <br> <br> <br> <br> <br>
### Retornando um esquema de documento
  > GET v1/document_schemes/:id

   ```shell
    curl -v -X GET /v1/document_schemes/:id
  ```
  > Exemplo de retorno em JSON:

  ```json

    {
      "name": "Notas fiscais de serviço",
      "code": "invoice_nfse",
      "type": "DocumentScheme::Invoice::Nfse",
      "status": 1,
      "sequence": 1,
      "credentials": null
    }
  ```

  Retorna os dados do esquema criado ou solicitado pelo id.

  **Parâmetros**
  <br>
  **:id** <br>
  *Obrigatório. Id do esquema criado.*
  <br>
  **api_key** <br>
  *Obrigatório. Chave da API.*
  <br>


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
### Criando credentials para o esquema de documento

  > PUT /v1/document_scheme/:id

  ```shell
  curl -X PUT /v1/document_schemes/:id \
  -d '[
        {
          "credentials": "{
            "certificate": "MyString",
            "password": "123",
            "expiration_date": "2016-09-06"
          }"
        }
      ]'
 ```

  > Exemplo de retorno JSON:

  ```json
    {
      "name": "Notas fiscais de serviço",
      "code": "invoice_nfse",
      "type": "DocumentScheme::Invoice::Nfse",
      "status": 1,
      "sequence": 1,
      "credentials": "{
                        "certificate": "MyString",
                        "password": "123",
                        "expiration_date": "2016-09-06"
                      }"
    }
  ```

  **Parâmetros**
  <br>
  **:id** <br>
  *Obrigatório. Id de um document_scheme*
  <br> <br>
  **credentials** <br>
  *Parâmetros válidos para determinado esquema de documento.*
  <br>


  <br> <br> <br>
  As `credentials` representam os parâmetros necessários para acessar cada tipo de documento. No caso da Nota Fiscal de Serviço, pode ser exigido o certificado digital, usuário e senha, etc.
  <br>
  <aside class="notice">
    A NFS-e do município de São Paulo exige o certificado digital, senha e data de expiração.
  </aside>






## Items

## Settings

## Documents

## Customers

## Operations

## Transactions
