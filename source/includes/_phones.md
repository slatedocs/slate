# Phones

  Um telefone é associado a um cliente ou uma empresa.

  Através do endpoint `/phones` é possível listar, exibir, criar, atualizar e deletar telefones.

<br> <br> <br>

## Objeto `phone`

  Parâmetro | Descrição
 -------------- | --------------
  **phone_type** <br> String | *Telefone residencial ou celular* <br> **Tipos:** `landline`, `mobile`
  **number** <br> String | *Número do telefone sem separadores*
  **area_code** <br> String | *Código de área do município*
  **country_code**  <br> String | *Código do país*
  **extension**  <br> String | *Ramal*


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
  **extension**  | *Ramal*


<br> <br> <br> <br> <br>

##Retornando um telefone

  > GET https://api.fastnotas.com/v1/phones/{PHONE_ID}

  ```shell
    curl -X GET https://api.fastnotas.com/v1/phones/{PHONE_ID} \
    -u 'YOUR_API_KEY:'
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

  Retorna os dados do telefone solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone criado*

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

##Retornando telefones

  Retorna um array que contém objetos de telefones.

  > GET https://api.fastnotas.com/v1/phones/

  ```shell
    curl -X GET https://api.fastnotas.com/v1/phones/ \
    -u 'YOUR_API_KEY:'
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

Atualiza o telefone solicitado e retorna com os parâmetros atualizados

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone criado*

  > PUT https://api.fastnotas.com/v1/phones/{PHONE_ID}

  ```shell
    curl -X PUT https://api.fastnotas.com/v1/phones/{PHONE_ID} \
      -u 'YOUR_API_KEY:' \
      -d 'number=999999999'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "88e506c5-218b-420a-86f7-6c168c58937c",
      "phone_type": "mobile",
      "number": "999999999",
      "area_code": "11",
      "country_code": "55",
      "extension": null
    }
  ```

## Deletando um telefone
  Deleta o telefone solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone que será deletado*

  > DELETE https://api.fastnotas.com/v1/phones/{PHONE_ID}

  ```shell
    curl -X DELETE https://api.fastnotas.com/v1/phones/{PHONE_ID} \
    -u 'YOUR_API_KEY:'
  ```
