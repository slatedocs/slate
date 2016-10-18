# Invoicer API


## Addresses

  Um endereço pertence à um cliente ou uma empresa. Use a rota `addresses` para criar, deletar e atualizar endereços.

<br> <br> <br> <br> <br>

### Criando um endereço

  > POST /v1/addresses

  ```shell
    curl -v -X POST /v1/addresses \
    -d 'api_key=YOUR_API_KEY' \
    -d '[ {
            country: "BR",
            zipcode: "11111111",
            number: "123"
          }
        ]'
  ```
  <br> <br> <br>

  Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **country** | `string` | *Obrigatório. Deve ser a abreviação do país.*
  **zipcode** |`string` | *Obrigatório. Coloque somente os números do CEP*
  **number** |`string` | *Opcional. Número da casa/prédio.*
  **neighborhood** | `string` | *Opcional.*
  **street** | `string` | *Opcional.*
  **additional_details** | `string` | *Opcional.*
  **city** |`string` | *Opcional.*
  **state** | `string` | *Opcional.*


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

  Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **:id** | `string` | *Obrigatório. Id do endereço criado.*
  **api_key** | `string` | *Obrigatório. Chave da API.*


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

###Retornando endereços

  Retorna um array contendo objetos de Address.

  > GET v1/addresses/

  ```shell
    curl -v -X GET /v1/addresses/
    -d 'api_key=YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
    [
  {
    "id": "9bxxxxxxxxxxxxx8e37",
    "neighborhood": "Vila Alexandria",
    "street": "Rua Palacete das Águias",
    "number": "123",
    "additional_details": null,
    "zipcode": "04635021",
    "city": "São Paulo",
    "state": "SP",
    "country": "BR"
  }
  {
    "id": "9bxxxxxxxxxxxxxxx7",
    "neighborhood": "Vila Clementino",
    "street": "Rua Doutor Diogo de Faria",
    "number": "123",
    "additional_details": null,
    "zipcode": "046xxxx1",
    "city": "SãoPaulo",
    "state": "SP",
    "country": "BR"
  }

]

  ```


## Phones

  Um telefone pertence à um cliente ou uma empresa. Use a rota `phones` para criar, deletar e atualizar telefones.

<br> <br> <br> <br> <br>

### Criando um telefone

  > POST /v1/phones

  ```shell
    curl -v -X POST /v1/phones \
    -d 'api_key=YOUR_API_KEY' \
    -d '[ {
            "phone_type": "celular",
            "number": "96xxxx65",
            "area_code": "11"
          }
        ]'
  ```
  <br> <br> <br>

   Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **phone_type** | `int` | *Obrigatório. Telefone residencial (0) ou celular(1).*
  **number** |`int` | *Obrigatório. Coloque somente os números.*
  **area_code** |`int` | *Obrigatório. Código de área do município.*
  **country_code** | `int` | *Opcional. Código do país.*
  **extension** | `int` | *Opcional.*


<br> <br> <br> <br> <br>

###Retornando um telefone

  > GET v1/phones/:id

   ```shell
    curl -v -X GET /v1/phones/:id \
    -d 'api_key=YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
  {
    "id": "ce745f0xxxxxxxxx6a2cc851",
    "phone_type": 1,
    "number": "966xxxx65",
    "area_code": "11",
    "country_code": null,
    "extension": null
  }
  ```

  Retorna os dados do telefone criado ou solicitado pelo id.

  Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **:id** | `string` | *Obrigatório. Id do telefone criado.*
  **api_key** | `string` | *Obrigatório. Chave da API.*


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

###Retornando telefones

  Retorna um array contendo objetos de Phones.

  > GET v1/phones/

  ```shell
    curl -v -X GET /v1/phones/
    -d 'api_key=YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
    [
      {
        "id": "ce745f0xxxxxxxxx6a2cc851",
        "phone_type": 1,
        "number": "966xxxx65",
        "area_code": "11",
        "country_code": null,
        "extension": null
      },
      {
        "id": "9767f516xxxxxxxxxx6366de4",
        "phone_type": 0,
        "number": "51xxxx22",
        "area_code": "21",
        "country_code": null,
        "extension": null
      }
    ]

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

  Parâmetro | Tipo| Descrição
 -------------- | -------------- | --------------
  **name** |`string` | *Obrigatório.*
  **registry_code** | `string` | *Obrigatório. CNPJ da empresa.*
  **legal_name** | `string` | *Opcional.*
  **email** |`string` | *Obrigatório.*
  **address_id** | `string` | *Obrigatório.*

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

  Parâmetro | Tipo| Descrição
 -------------- | -------------- | --------------
  **:id** | `string` | *Obrigatório. Id do endereço criado.*
  **api_key** | `string`| *Obrigatório. Chave da API.*

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br>

###Retornando as empresas
  Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **api_key** | `string` | *Obrigatório. Chave da API.*

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
  Parâmetro | Tipo | Descrição
  -------------- | -------------- | --------------
  **name** | `string` | *Nome do documento.*
  **code** | `string` | *Código para identificação(Por exemplo:"NFS-e").*
  **type** | `string` | *Tipo do esquema do documento.*
  **status** | `int`  | *Status ativo(1) ou inativo(0 - deletado). Default: 1*
  **credentials** | `text` | *Credenciais para a criação do objeto. Retorna JSON.*
  **sequence** | `int` | *O documento é guardado com uma sequência.*
  **company_id** |`string` | *O document_scheme pertence à uma empresa.*


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

  Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **name** | `string` | *Obrigatório. Deve ser preenchido como preferir.*
  **code** | `string` | *Obrigatório. Código para identificação(Por exemplo:"NFS-e")*
  **type** | `string` | *Obrigatório.*
  **credentials** | `text` | *Opcional. Deve ser preenchido com as credenciais para o objeto.(Por exemplo: certificado).*

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

  Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **:id** | `string` | *Obrigatório. Id do esquema criado.*
  **api_key** | `string` | *Obrigatório. Chave da API.*

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
### Atualizando as credenciais para o esquema de documento

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

  Parâmetro | Tipo | Descrição
 -------------- | -------------- | --------------
  **:id** | `string` | *Obrigatório. Id de um document_scheme*
  **credentials** | `text` | *Parâmetros válidos para determinado esquema de documento.*


  <br> <br> <br>
  As `credentials` representam os parâmetros necessários para acessar cada tipo de documento. No caso da Nota Fiscal de Serviço, pode ser exigido o certificado digital, usuário e senha, etc.
  <br>
  <aside class="notice">
    A NFS-e do município de São Paulo exige o certificado digital, senha e data de expiração.
  </aside>


### Credenciais de cada município
  Município | Estado | Credenciais
 -------------- | -------------- | --------------
  São Paulo | SP | Certificado, senha, data de expiração
  Rio de Janeiro | RJ | Certificado, senha, data de expiração


## Items

## Settings

## Documents

## Customers

## Operations

## Transactions
