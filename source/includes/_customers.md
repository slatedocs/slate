# Customers

  Representa uma pessoa física ou jurídica que será o tomador dos seus serviços ou o comprador dos produtos da sua empresa.

  Através do endpoint `/customers` é possível listar, exibir, criar, atualizar e deletar clientes.

##Objeto `customer`
  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> String | *Nome do cliente*
  **registry_code**  <br> String | *Documento do cliente (CPF ou CNPJ)*
  **email**  <br> String | *Email do cliente*
  **external_code**  <br> String | *Referência opcional para controle do seu sistema*
  **address[country]** <br> String | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **address[zipcode]** <br> String | *Código Postal do cliente*
  **address[state]** <br> String | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **address[city]** <br> String | *Cidade do cliente*
  **address[neighborhood]** <br> String | *Bairro do cliente*
  **address[street]** <br> String | *Rua do cliente*
  **address[number]** <br> String |  *Número do endereço do cliente*
  **address[additional_details]** <br> String | *Complemento do endereço do cliente*
  **phone[phone_type]** <br> String | *Telefone residencial ou celular*
  **phone[number]** <br> String | *Número do telefone do cliente sem separadores*
  **phone[area_code]** <br> String | *Código de área do município*
  **phone[country_code]**  <br> String | *Código do país*
  **phone[extension]**  <br> String | *Ramal*

## Criando um cliente

  > POST https://api.fastnotas.com/v1/customers

  ```shell
  curl -X POST https://api.fastnotas.com/v1/customers \
    -u 'YOUR_API_KEY:' \
    -d 'name=Carolina' \
    -d 'registry_code=11111111111' \
    -d 'email=exemplo@gmail.com' \
    -d 'external_code=400' \
    -d 'address[street]= Rua Doutor Diogo de Faria' \
    -d 'address[number]=775' \
    -d 'address[additional_details]=Cj. 123' \
    -d 'address[zipcode]=04037003' \
    -d 'address[neighborhood]=Vila Mariana' \
    -d 'address[city]=São Paulo' \
    -d 'address[state]=SP' \
    -d 'phone[phone_type]=landline' \
    -d 'phone[number]=12345678' \
    -d 'phone[area_code]=11' \
    -d 'phone[country_code]=55'
 ```

  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "c7538d37-3ed1-4ee2-bc2d-f89afecb08d1",
      "name": "Carolina",
      "email": "exemplo@gmail.com",
      "external_code": "400",
      "registry_code": "11111111111",
      "status": "active",
      "phone": {
        "id": "bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f",
        "phone_type": "landline",
        "country_code": "55",
        "area_code": "11",
        "extension": null,
        "number": "12345678",
        "company_id": "cdbe85f0-dc05-446c-aac8-af62b32e0d1a"
      },
      "address": {
        "id": "b7658863-988b-4e44-9632-a93a282dd41a",
        "neighborhood": "Rua Doutor Diogo de Faria",
        "street": "Rua Doutor Diogo de Faria",
        "number": "775",
        "additional_details": "Cj. 123",
        "zipcode": "04037003",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    }
  ```

  Parâmetro |  Descrição
  -------------- | --------------
  **name**  <br> <p> obrigatório </p> | *Nome do cliente*
  **registry_code**  <br> <p> obrigatório </p> | *Documento do cliente (CPF ou CNPJ)*
  **email**  <br> <p> obrigatório </p> | *Email do cliente*
  **external_code**  <br>  <p> obrigatório </p>| *Referência opcional para controle do seu sistema*
  **address[zipcode]** <br>  <p> obrigatório </p> | *Código Postal do cliente*
  **address[number]**  <p> obrigatório </p> |  *Número do endereço do cliente*
  **address[country]** | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **address[state]** | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **address[city]** | *Cidade do cliente*
  **address[neighborhood]** | *Bairro do cliente*
  **address[street]** | *Rua do cliente*
  **address[additional_details]** | *Complemento do endereço do cliente*
  **phone[phone_type]** | *Telefone residencial ou celular*
  **phone[number]** | *Número do telefone do cliente sem separadores*
  **phone[area_code]** | *Código de área do município*
  **phone[country_code]**  | *Código do país*
  **phone[extension]**  | *Ramal*


<br> <br> <br> <br> <br> <br>
## Retornando um cliente

  > GET https://api.fastnotas.com/v1/customers/{CUSTOMER_ID}

   ```shell
    curl -X GET https://api.fastnotas.com/v1/customers/{CUSTOMER_ID}
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "c7538d37-3ed1-4ee2-bc2d-f89afecb08d1",
      "name": "Carolina",
      "email": "exemplo@gmail.com",
      "registry_code": "11111111111",
      "external_code": "400",
      "status": "active",
      "phone": {
        "id": "bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f",
        "phone_type": "landline",
        "country_code": "55",
        "area_code": "11",
        "extension": null,
        "number": "12345678",
        "company_id": "cdbe85f0-dc05-446c-aac8-af62b32e0d1a"
      },
      "address": {
        "id": "b7658863-988b-4e44-9632-a93a282dd41a",
        "neighborhood": "Rua Doutor Diogo de Faria",
        "street": "Rua Doutor Diogo de Faria",
        "number": "775",
        "additional_details": "Cj. 123",
        "zipcode": "04037003",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    }
  ```


  Retorna os dados do cliente.

  Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id do cliente.*

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br>

##Retornando clientes

  Retorna um array que contém objetos de clientes.

  Parâmetro |  Descrição
-------------- | --------------
**query** |  *Campos para filtro: name, email, registry_code, status, created_at*

  > GET https://api.fastnotas.com/v1/customers/

  ```shell
    curl -X GET https://api.fastnotas.com/v1/customers/ \
    -u 'YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
    [
      {
        "id": "c7538d37-3ed1-4ee2-bc2d-f89afecb08d1",
        "name": "Carolina",
        "email": "exemplo@gmail.com",
        "registry_code": "11111111111",
        "external_code": "400",
        "status": "active",
        "phone": {
          "id": "bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f",
          "phone_type": "landline",
          "country_code": "55",
          "area_code": "11",
          "extension": null,
          "number": "12345678",
          "company_id": "cdbe85f0-dc05-446c-aac8-af62b32e0d1a"
        },
        "address": {
          "id": "b7658863-988b-4e44-9632-a93a282dd41a",
          "neighborhood": "Rua Doutor Diogo de Faria",
          "street": "Rua Doutor Diogo de Faria",
          "number": "775",
          "additional_details": "Cj. 123",
          "zipcode": "04037003",
          "city": "São Paulo",
          "state": "SP",
          "country": "BR"
        }
      }
    ]
  ```

## Atualizando um cliente

  Atualiza o cliente solicitado e retorna com os parâmetros atualizados

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do cliente*

  > PUT https://api.fastnotas.com/v1/customers/{CUSTOMER_ID}

  ```shell
    curl -X PUT https://api.fastnotas.com/v1/customers/{CUSTOMER_ID} \
      -u 'YOUR_API_KEY:' \
      -d 'email=novo_email@gmail.com'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "c7538d37-3ed1-4ee2-bc2d-f89afecb08d1",
      "name": "Carolina",
      "email": "novo_email@gmail.com",
      "registry_code": "11111111111",
      "external_code": "400",
      "status": "active",
      "phone": {
        "id": "bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f",
        "phone_type": "landline",
        "country_code": "55",
        "area_code": "11",
        "extension": null,
        "number": "12345678",
        "company_id": "cdbe85f0-dc05-446c-aac8-af62b32e0d1a"
      },
      "address": {
        "id": "b7658863-988b-4e44-9632-a93a282dd41a",
        "neighborhood": "Rua Doutor Diogo de Faria",
        "street": "Rua Doutor Diogo de Faria",
        "number": "775",
        "additional_details": "Cj. 123",
        "zipcode": "04037003",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    }
  ```

## Deletando um cliente
  Deleta o cliente solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do cliente que será deletado.*

  > DELETE https://api.fastnotas.com/v1/customers/{CUSTOMER_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/customers/{CUSTOMER_ID} \
    -u 'YOUR_API_KEY:'
  ```
