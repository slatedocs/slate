# Companies

  Através do endpoint `/company` é possível exibir todos os dados da sua empresa.

  É essa entidade que possui a `API_KEY`, todas as outras entidades que forem criadas serão diretamente relacionadas a empresa.
  A informação é vinculada através do header de [autenticação](#autentica-o).
  
  Caso não tenha uma `API_KEY` entre em contato com nosso atendimento: <atendimento@fastnotas.com>
  
## Objeto `company`

  Parâmetro |  Descrição
 -------------- | --------------
  **api_key** <br> String | *Chave de API da empresa*
  **name** <br> String | *Nome da empresa*
  **legal_name** <br>String | *Razão social*
  **email** <br> String | *Email da empresa*
  **registry_code** <br>String | *Documento da empresa(CNPJ)*
  **status** <br> Default: active | *Define se a empresa está ativada ou não na API*
  **address[country]** <br> String | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **address[zipcode]** <br> String | *Código Postal da empresa*
  **address[state]** <br> String | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **address[city]** <br> String | *Cidade da empresa*
  **address[neighborhood]** <br> String | *Bairro da empresa*
  **address[street]** <br> String | *Rua da empresa*
  **address[number]** <br> String |  *Número do endereço da empresa*
  **address[additional_details]** <br> String | *Complemento do endereço da empresa*
  **phone[phone_type]** <br> String | *Telefone residencial ou celular*
  **phone[number]** <br> String | *Número do telefone da empresa sem separadores*
  **phone[area_code]** <br> String | *Código de área do município*
  **phone[country_code]**  <br> String | *Código do país*
  **phone[extension]**  <br> String | *Ramal*

## Retornando os dados da sua empresa

  Retorna os dados cadastrados da sua empresa.

  > GET https://api.fastnotas.com/v1/company

   ```shell
    curl -X GET https://api.fastnotas.com/v1/company
    -u 'YOUR_API_KEY:'
  ```
  > Exemplo de retorno em JSON:

  ```json
{
    "id": "029821f2-e5e3-4b0b-af8f-a86f737d38d1",
    "name": "Teste Company",
    "legal_name": "Company of tests,",
    "email": "teste@teste.com",
    "registry_code": "77534615000122",
    "status": "active",
    "api_key": "YOUR_API_KEY",
    "webhook_url": "URL configurada na plataforma",
    "address": {
        "id": "1c05cf53-ad2c-4ae0-8f15-ef098b11186d",
        "neighborhood": "Vila Augusta",
        "street": "Maestro Zeferino Santana",
        "number": "132",
        "additional_details": "apto 1221",
        "zipcode": "18040010",
        "city": "Sorocaba",
        "state": "SP",
        "country": "BR"
    },
    "phone": {
        "phone_type": "landline",
        "country_code": null,
        "area_code": "11",
        "extension": null,
        "number": "59047394"
    }
}
  ```

## Parceiros Fast Notas
    
  Para cadastrar uma empresa afiliada, você deve ser uma empresa parceira do Fast Notas.
  
  Gostaria de ser um parceiro? Entre em contato com nosso atendimento <atendimento@fastnotas.com>
  
   
## Criando uma empresa
 O cadastro deve ser feito utilizando um `POST` no endpoint `/companies` com os dados referentes do novo afiliado, utilizando a sua chave de API de parceiro.
 Retorna os dados da empresa criada.
 
  > POST https://api.fastnotas.com/v1/companies

  ```shell
  curl -X POST https://api.fastnotas.com/v1/companies \
    -u 'YOUR_API_KEY_PARTNER:' \
    -H 'Content-Type: application/json; charset=utf-8' \
    -d '{
          "name": "Teste Company",
          "legal_name": "Company of tests,",
          "email": "teste@teste.com",
          "registry_code": 53514882000170,
          "status": "active",
          "address": {
            "street": "Rua Albano Eugênio Dahmer", 
            "number": 325,
            "zipcode": "06710750",
            "neighborhood": "Pinus Park",
            "additional_details": "Conjunto 123",
            "city": "Cotia",
            "state": "SP",
            "country": "BR"
          },
          "phone": {
            "phone_type": "landline",
            "country_code": null,
            "area_code": "11",
            "extension": null,
            "number": "59047394"
          }
        }'
 ```

  > Exemplo de retorno em JSON:

```json
{
    "id": "59e470fa-4c6d-47ee-9399-356c20b8e4af",
    "name": "Teste Company",
    "legal_name": "Company of tests,",
    "email": "teste@teste.com",
    "registry_code": "77534615000122",
    "status": "active",
    "phone": {
        "id": "e3fd4f8c-9253-4e5c-a6bb-f548158315e1",
        "phone_type": "landline",
        "country_code": null,
        "area_code": "11",
        "extension": null,
        "number": "59047394"
    },
    "api_key": "YOUR_API_KEY",
    "webhook_url": "URL configurada na plataforma",
    "partner": {
        "id": "223fb491-f663-4ac1-9247-df7af3abcbc1",
        "name": "Fast Notas - Partner",
        "legal_name": "Fast Notas - Partner",
        "email": "admin@partner.com",
        "registry_code": "56311864000189",
        "status": "active",
        "phone": null,
        "webhook_url": "URL configurada na plataforma",
        "partner": null
    },
    "address": {
        "id": "b9ca74ca-b774-461d-a049-ee23bc2e9570",
        "neighborhood": "Ipiranga",
        "street": "Rua dona leopoldina",
        "number": "825",
        "additional_details": "Cj. 12",
        "zipcode": "04278040",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
    }
} 
  ```

  Parâmetro |  Descrição
  -------------- | --------------
  **name** <br> String | *Nome da empresa*
  **legal_name** <br>String | *Razão social*
  **email** <br> String | *Email da empresa*
  **registry_code** <br>String | *Documento da empresa(CNPJ)*
  **status** <br> Default: active | *Define se a empresa está ativada ou não na API*
  **address[country]** <br> String | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **address[zipcode]** <br> String | *Código Postal da empresa*
  **address[state]** <br> String | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **address[city]** <br> String | *Cidade da empresa*
  **address[neighborhood]** <br> String | *Bairro da empresa*
  **address[street]** <br> String | *Rua da empresa*
  **address[number]** <br> String |  *Número do endereço da empresa*
  **address[additional_details]** <br> String | *Complemento do endereço de uma empresa*
  **phone[phone_type]** <br> String | *Telefone residencial ou celular*
  **phone[number]** <br> String | *Número do telefone da empresa sem separadores*
  **phone[area_code]** <br> String | *Código de área do município*
  **phone[country_code]**  <br> String | *Código do país*
  **phone[extension]**  <br> String | *Ramal*


<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br>

##Retornando as empresas afiliadas

  Retorna um array que contém objetos das empresas afiliadas.

  > GET https://api.fastnotas.com/v1/companies/

  ```shell
    curl -X GET https://api.fastnotas.com/v1/companies/
    -u 'YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

```json
[
    {
        "id": "bf49bdb3-d13d-418b-b991-65d606cf326e",
        "name": "Fast Notas - affiliates 2",
        "legal_name": "Fast Notas - affiliates 2",
        "email": "admin@affiliates2.com",
        "registry_code": "24513608000188",
        "status": "active",
        "phone": {
            "phone_type": "landline",
            "country_code": null,
            "area_code": "11",
            "extension": null,
            "number": "59047394"
        },
        "api_key": "YOUR_API_KEY",
        "webhook_url": null,
        "partner": {
            "id": "92fed7d5-0da6-4db9-9ac9-a365019e8707",
            "name": "Fast Notas - Partner",
            "legal_name": "Fast Notas - Partner",
            "email": "admin@partner.com",
            "registry_code": "56311864000189",
            "status": "active",
            "phone": null,
            "webhook_url": null,
            "partner": null
        },
        "address": {
            "id": "50dfbef7-bb57-4d43-910d-ee35c37b0b0a",
            "neighborhood": "Ipiranga",
            "street": "Rua dona leopoldina",
            "number": "825",
            "additional_details": "Cj. 12",
            "zipcode": "04278040",
            "city": "São Paulo",
            "state": "SP",
            "country": "BR"
        }
    },
    {
        "id": "6b652f4d-c657-4e38-b2d6-b15b98c1af00",
        "name": "Fast Notas - affiliates",
        "legal_name": "Fast Notas - affiliates",
        "email": "admin@affiliates.com",
        "registry_code": "91818231000162",
        "status": "active",
        "phone": {
            "phone_type": "landline",
            "country_code": null,
            "area_code": "11",
            "extension": null,
            "number": "59047394"
        },
        "api_key": "275aab6d-e37f-4d90-9bad-8b743e2cf725",
        "webhook_url": null,
        "partner": {
            "id": "92fed7d5-0da6-4db9-9ac9-a365019e8707",
            "name": "Fast Notas - Partner",
            "legal_name": "Fast Notas - Partner",
            "email": "admin@partner.com",
            "registry_code": "56311864000189",
            "status": "active",
            "phone": null,
            "webhook_url": null,
            "partner": null
        },
        "address": {
            "id": "50dfbef7-bb57-4d43-910d-ee35c37b0b0a",
            "neighborhood": "Ipiranga",
            "street": "Rua dona leopoldina",
            "number": "825",
            "additional_details": "Cj. 12",
            "zipcode": "04278040",
            "city": "São Paulo",
            "state": "SP",
            "country": "BR"
        }
    }
]
```

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br>


##Retornando uma empresa

  Retorna objeto de empresa.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da empresa*
  > GET https://api.fastnotas.com/v1/companies/{COMPANY_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/companies/{COMPANY_ID} 
    -u 'YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
{
    "id": "451203aa-7d60-425a-91ad-fc18b54f327b",
    "name": "Fast Notas - Partner",
    "legal_name": "Fast Notas - Partner",
    "email": "admin@partner.com",
    "registry_code": "56311864000189",
    "status": "active",
    "phone": {
        "phone_type": "landline",
        "country_code": null,
        "area_code": "11",
        "extension": null,
        "number": "59047394"
    },
    "api_key": "YOUR_API_KEY",
    "webhook_url": null,
    "partner": null,
    "address": {
        "id": "3b71ce21-65ed-4d34-8d75-068536eb7185",
        "neighborhood": "Ipiranga",
        "street": "Rua dona leopoldina",
        "number": "825",
        "additional_details": "Cj. 12",
        "zipcode": "04278040",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
    }
}
  ```

## Atualizando um empresa

  Atualiza a empresa solicitado e retorna com os parâmetros atualizados.
  
  Este processo deve ser realizado utilizando os dados de autenticação da empresa afiliada.
  

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da empresa*
  **name** <br> String | *Nome da empresa*
  **legal_name** <br>String | *Razão social*
  **email** <br> String | *Email da empresa*
  **registry_code** <br>String | *Documento da empresa(CNPJ)*
  **status** <br> Default: active | *Define se a empresa está ativada ou não na API*
  **address[country]** <br> String | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **address[zipcode]** <br> String | *Código Postal da empresa*
  **address[state]** <br> String | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **address[city]** <br> String | *Cidade da empresa*
  **address[neighborhood]** <br> String | *Bairro da empresa*
  **address[street]** <br> String | *Rua da empresa*
  **address[number]** <br> String |  *Número do endereço da empresa*
  **address[additional_details]** <br> String | *Complemento do endereço da empresa*
  **phone[phone_type]** <br> String | *Telefone residencial ou celular*
  **phone[number]** <br> String | *Número do telefone da empresa sem separadores*
  **phone[area_code]** <br> String | *Código de área do município*
  **phone[country_code]**  <br> String | *Código do país*
  **phone[extension]**  <br> String | *Ramal*


  > PUT https://api.fastnotas.com/v1/companies/{COMPANY_ID}

  ```shell
    curl -X PUT https://api.fastnotas.com/v1/companies/{COMPANY_ID} \
      -u 'YOUR_API_KEY:' \
      -H 'Content-Type: application/json; charset=utf-8' \
      -d '{"id": "451203aa-7d60-425a-91ad-fc18b54f327b",
           "name": "Fast Notas - Partner",
           "legal_name": "Fast Notas - Partner",
           "email": "admin@partner.com",
           "registry_code": "56311864000189",
           "status": "active",
           "phone": {
             "phone_type": "landline",
             "country_code": null,
             "area_code": "11",
             "extension": null,
             "number": "59047394"
           },
           "api_key": "YOUR_API_KEY",
           "webhook_url": null,
           "partner": null,
           "address": {
             "id": "3b71ce21-65ed-4d34-8d75-068536eb7185",
             "neighborhood": "Ipiranga",
             "street": "Rua dona leopoldina",
             "number": "825",
             "additional_details": "Cj. 12",
             "zipcode": "04278040",
             "city": "São Paulo",
             "state": "SP",
             "country": "BR"
           }
         }'
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

## Inativando uma empresa
  Inativa a empresa solicitada.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id da empresa que será inativada.*

  > DELETE https://api.fastnotas.com/v1/companies/{COMPANY_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/companies/{COMPANY_ID} \
    -u 'YOUR_API_KEY:'
  ```
