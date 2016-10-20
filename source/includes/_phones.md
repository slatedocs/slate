# Phones

  Um telefone pertence à um cliente ou uma empresa. Use a rota `phones` para criar, deletar e atualizar telefones.

<br> <br> <br>

## Objeto `phone`

  Parâmetro | Descrição
 -------------- | --------------
  **phone_type** <br> String | *Telefone residencial ou celular* <br> **Valores possíveis:** <br> `landline` <br>`mobile`
  **number** <br> String | *Número do telefone sem separadores*
  **area_code** <br> String | *Código de área do município*
  **country_code**  <br> String | *Código do país*
  **extension**  <br> String | *Extensão*


## Criando um telefone

  > POST https://api.fastnotas.com/v1/phones

  ```shell
    curl -X POST https://api.fastnotas.com/v1/phones \
      -d 'phone_type= landline' \
      -d 'number=12345678' \
      -d 'area_code=11' \
      -d 'country_code=55' \
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f",
      "phone_type": "landline",
      "number": "12345678",
      "area_code": "11",
      "country_code": "55",
      "extension": null
    }
  ```

  <br> <br> <br>

  Parâmetro | Descrição
 -------------- | --------------
  **phone_type** <br> <p>obrigatório</p> | *Telefone residencial ou celular*
  **number** <br> <p>obrigatório</p> | *Número do telefone sem separadores*
  **area_code** <br> <p>obrigatório</p> | *Código de área do município*
  **country_code**  | *Código do país*
  **extension**  | *Extensão*


<br> <br> <br> <br> <br>

##Retornando um telefone

  > GET https://api.fastnotas.com/v1/phones/bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f

  ```shell
    curl -X GET https://api.fastnotas.com/v1/phones/bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f",
      "phone_type": "landline",
      "number": "12345678",
      "area_code": "11",
      "country_code": "55",
      "extension": null
    }
  ```

  Retorna os dados do telefone criado ou solicitado pelo id.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone criado*

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

##Retornando telefones

  Retorna um array contendo objetos de Phones.

  > GET https://api.fastnotas.com/v1/phones/

  ```shell
    curl -X GET https://api.fastnotas.com/v1/phones/
    -u 'YOUR_API_KEY:' \
  ```
  > Exemplo de retorno em JSON:

  ```json
    [
      {
        "id": "bed01a89-2ff8-4ef2-8d0b-586a3bcbba3f",
        "phone_type": "landline",
        "number": "12345678",
        "area_code": "11",
        "country_code": "55",
        "extension": null
      },
      {
        "id": "88e506c5-218b-420a-86f7-6c168c58937c",
        "phone_type": "mobile",
        "number": "987651234",
        "area_code": "11",
        "country_code": "55",
        "extension": null
      }
    ]
  ```
## Atualizando um telefone

Retorna o telefone solicitado com os parâmetros atualizados

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone criado*

  > PUT https://api.fastnotas.com/v1/phones/88e506c5-218b-420a-86f7-6c168c58937c

  ```shell
    curl -X PUT https://api.fastnotas.com/v1/phones/88e506c5-218b-420a-86f7-6c168c58937c
      -u 'YOUR_API_KEY:' \
      -d 'number=94321234'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "88e506c5-218b-420a-86f7-6c168c58937c",
      "phone_type": "mobile",
      "number": "94321234",
      "area_code": "11",
      "country_code": "55",
      "extension": null
    }
  ```

## Deletando um telefone
  Deleta o telefone solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone*

  > DELETE https://api.fastnotas.com/v1/phones/88e506c5-218b-420a-86f7-6c168c58937c

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/phones/88e506c5-218b-420a-86f7-6c168c58937c
    -u 'YOUR_API_KEY:'
  ```
