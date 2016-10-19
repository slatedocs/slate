# Phones

  Um telefone pertence à um cliente ou uma empresa. Use a rota `phones` para criar, deletar e atualizar telefones.

<br> <br> <br>

## Objeto phone

  Parâmetro | Descrição
 -------------- | --------------
  **phone_type** <br> Int | *Telefone residencial ou celular* <br> **Valores possíveis:** <br> `telefone(0)` <br>`celular(1)`
  **number** <br> String | *Número do telefone sem separadores*
  **area_code** <br> String | *Código de área do município*
  **country_code**  <br> String | *Código do país*
  **extension**  <br> String | *Extensão*


## Criando um telefone

  > POST https://api.fastnotas.com/v1/phones

  ```shell
    curl -v -X POST /v1/phones \
    -d '[ {
            "phone_type": "celular",
            "number": "96xxxx65",
            "area_code": "11"
          }
        ]'
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

  > GET https://api.fastnotas.com/v1/phones/:id

  ```shell
    curl -v -X GET https://api.fastnotas.com/v1/phones/:id
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

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone criado*

<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

##Retornando telefones

  Retorna um array contendo objetos de Phones.

  > GET https://api.fastnotas.com/v1/phones/

  ```shell
    curl -v -X GET https://api.fastnotas.com/v1/phones/
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
## Atualizando um telefone

Retorna o telefone solicitado com os parâmetros atualizados

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone criado*

  > PUT https://api.fastnotas.com/v1/phones/:id

  ```shell
    curl -v -X PUT https://api.fastnotas.com/v1/phones/:id
    -d '[ {
            number: "912xxxx44"
          }
        ]'
  ```
  > Exemplo de retorno em JSON:

  ```json
    {
      "id": "ce745f0xxxxxxxxx6a2cc851",
      "phone_type": 1,
      "number": "912xxxx44",
      "area_code": "11",
      "country_code": null,
      "extension": null
    }
  ```

## Deletando um telefone
  Deleta o telefone solicitado.

  Parâmetro | Descrição
 -------------- | --------------
  **:id** <br> <p>obrigatório</p> | *Id do telefone que será deletado*

  > DELETE https://api.fastnotas.com/v1/phones/:id

  ```shell
    curl -v -X DELETE https://api.fastnotas.com/v1/phones/:id
  ```
