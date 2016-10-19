# Companies

  Uma empresa contém um endereço e telefone, e contém muitos “document schemes”. Autorização apenas para retornar uma ou todas empresas.

  <aside class="notice"> Cada empresa tem uma chave de API.</aside>

## Objeto Company

  Parâmetro |  Descrição
 -------------- | --------------
  **api_key** <br> String | *Chave de API da empresa*
  **name** <br> String | *Nome da empresa*
  **legal_name** <br>String | *Razão social*
  **email** <br> String | *Email da empresa*
  **registry_code** <br>String | *CNPJ da empresa*
  **status** <br> Default: 1 | *Define se a empresa está ativada(1) ou não(0) da API.*
  **address[:country]** <br> String | *País*
  **address[:zipcode]** <br> String | *CEP da empresa*
  **address[:state]** <br> String | *Estado da empresa*
  **address[:city]** <br> String | *Cidade da empresa*
  **address[:neighborhood]** <br> String | *Bairro da empresa*
  **address[:street]** <br> String | *Rua da empresa*
  **address[:number]** <br> String | *Número da empresa*
  **address[:additional_details]** <br> String | *Detalhes adcionais do endereço da empresa.Por ex: Quinto andar.*
  **phone[phone_type]** <br> Int | *Telefone residencial ou celular*
  **phone[number]** <br> String | *Número do telefone sem separadores da empresa*
  **phone[area_code]** <br> String | *Código de área do município*
  **phone[country_code]**  <br> String | *Código do país*
  **phone[extension]**  <br> String | *Extensão*

##Retornando uma empresa

  > `GET https://api.fastnotas.com/v1/companies/:id`

  ```shell
    curl -v -X GET https://api.fastnotas.com/v1/companies/:id \
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
      "phone": {
        "id": "ce745f0xxxxxxxxx6a2cc851",
        "phone_type": 1,
        "number": "966xxxx65",
        "area_code": "11",
        "country_code": null,
        "extension": null
        },
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

Parâmetro | Descrição
 -------------- | --------------
**:id** <br> <p>obrigatório</p> | *Id da empresa*
