# Companies

  Uma empresa contém um endereço e telefone, e contém muitos “document schemes”. Autorização apenas para retornar uma ou todas empresas.

  <aside class="notice"> Cada empresa tem uma chave de API.</aside>

## Objeto `company`

  Parâmetro |  Descrição
 -------------- | --------------
  **api_key** <br> String | *Chave de API da empresa*
  **name** <br> String | *Nome da empresa*
  **legal_name** <br>String | *Razão social*
  **email** <br> String | *Email da empresa*
  **registry_code** <br>String | *Documento da empresa (CNPJ)*
  **status** <br> Default: active | *Define se a empresa está ativada ou não na API.*
  **address[:country]** <br> String | *Código do país no formato ISO 3166-1 alpha-2. Exemplo: BR*
  **address[:zipcode]** <br> String | *Código postal da empresa*
  **address[:state]** <br> String | *Código do estado no formato ISO 3166-2. Exemplo: SP*
  **address[:city]** <br> String | *Cidade da empresa*
  **address[:neighborhood]** <br> String | *Bairro da empresa*
  **address[:street]** <br> String | *Rua da empresa*
  **address[:number]** <br> String |  *Número do endereço da empresa*
  **address[:additional_details]** <br> String | *Complemento do endereço da empresa*
  **phone[phone_type]** <br> String | *Telefone residencial ou celular*
  **phone[number]** <br> String | *Número do telefone sem separadores da empresa*
  **phone[area_code]** <br> String | *Código de área do município*
  **phone[country_code]**  <br> String | *Código do país*
  **phone[extension]**  <br> String | *Extensão*

##Retornando uma empresa

  > `GET https://api.fastnotas.com/v1/companies/3eb45d08-f70b-4110-a1db-fd5572c08114`

  ```shell
    curl -X GET https://api.fastnotas.com/v1/companies/3eb45d08-f70b-4110-a1db-fd5572c08114 \
      -u 'YOUR_API_KEY'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "3eb45d08-f70b-4110-a1db-fd5572c08114",
      "name": "Fast Notas",
      "legal_name": "Fast Notas",
      "email": "admin@fastnotas.com",
      "registry_code": "53514882000170",
      "status": "active",
      "phone": {
        "id": "e7401d8f-4f2c-4e96-9b06-19f1223e9bf9",
        "phone_type": "mobile",
        "country_code": null,
        "area_code": "11",
        "extension": null,
        "number": "43214321",
        "company_id": "3eb45d08-f70b-4110-a1db-fd5572c08114"
      },
      "api_key": "275aab6d-e37f-4d90-9bad-8b743e2cf724",
      "address": {
        "id": "2087a58d-4f06-40d9-b788-74d80959afff",
        "neighborhood": "Rua Dona Leopoldina",
        "street": "Rua Dona Leopoldina",
        "number": "825",
        "additional_details": "Cj. 12",
        "zipcode": "04278040",
        "city": "São Paulo",
        "state": "SP",
        "country": "BR"
      }
    }
  ```

  Retorna dados em JSON de uma determinada empresa.

Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id da empresa*
