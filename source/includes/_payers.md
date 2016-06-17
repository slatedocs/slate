# Pagador

```shell
Pagador

EXEMPLO

  {
    "id":1,
    "national_identifier_type":"cpf",
    "national_identifier":"38031171513",
    "name":"João Silveira",
    "zipcode":"99000-750",
    "city":"Carapebus",
    "state":"RJ",
    "neighbourhood":"Centro",
    "street":"Rua Julio de Castilhos",
    "number":"100",
    "complement": "Ao lado da lotérica.",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/payers/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/payers/1"}
      ]
  }
```

É possível ter indeterminados pagadores, e a eles que pertencem a uma Conta de Serviço. Podem ser tanto pessoas físicas como pessoas jurídicas.

<aside class="notice">
  É importante ressaltar que, para o pagador ser utilizado em uma cobrança via boleto registrado, todos os dados devem ser preenchidos (são obrigatórios), com exceção do <code>complement</code>.
</aside>

**Parâmetros**

| Campo                    | Tipo            | Comentário                                                      |
|--------------------------|-----------------|-----------------------------------------------------------------|
| id                       | integer         |                                                                 |
| national_identifier_type | string          | tipo de identificação nacional ('cpf' ou 'cnpj')                |
| national_identifier      | string          | número válido de cnpj ou cpf, de acordo com o campo anterior    |
| name                     | string          | nome completo do pagador                                        |
| city                     | string          | nome da cidade do domicílio do pagador                          |
| state                    | string          | uf do estado do domicílio do pagador (duas letras, p. ex. 'RJ') |
| neighbourhood            | string          | bairro do domicílio do pagador                                  |
| street                   | string          | logradouro do pagador                                           |
| number                   | string          | número da logradouro do pagador                                 |
| zipcode                  | string          | cep do domicílio do pagador                                     |
| complement               | string          | complemento para o endereço de domicilio do pagador             |
| _links                   | array of object | links do pagador                                                |

## Informações do Pagador

```shell
Mostrar Pagador

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payers/:payer_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payers/:payer_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id":1,
    "national_identifier_type":"cpf",
    "national_identifier":"38031171513",
    "name":"João Silveira",
    "zipcode":"99000-750",
    "city":"Carapebus",
    "state":"RJ",
    "neighbourhood":"Centro",
    "street":"Rua Julio de Castilhos",
    "number":"100",
    "complement": "Ao lado da lotérica.",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/payers/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/payers/1"}
      ]
  }
```

Retorna as informações detalhadas do pagador em JSON.

## Lista de Todos os Pagadors

```shell
Listar Pagadors

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payers

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payers

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "payers":
      [
        {
          // informações pagador 1
        },
        {
          // informações pagador 2
        },
        ...
      ]
  }
```

Retorna uma lista em JSON contendo todos os pagadores pertencentes a sua Conta de Serviço.

## Criação de Pagador

```shell
Criar Pagador

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/payers

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/payers \
    -d '{
        "name": "João Silva",
        "city": "Caxias do Sul",
        "national_identifier_type": "cpf",
        "national_identifier": "38031171513",
        "state": "RS",
        "street": "Rua Principal",
        "neighbourhood": "Centro",
        "number": "174",
        "zipcode": "95055-777"
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":{
      "name": ["não pode ficar em branco"],
      "national_identifier_type": ["não pode ficar em branco","não está incluído na lista"]
    }
  }

```

Cria um novo pagador, retornando as informações do mesmo caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta.

**Parâmetros**

| Campo                    | Tipo   | Comentário                                                                   |
|--------------------------|--------|------------------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo de identificação nacional ('cpf' ou 'cnpj')             |
| national_identifier      | string | **(requerido)** número válido de cnpj ou cpf, de acordo com o campo anterior |
| name                     | string | **(requerido)** nome completo do pagador                                     |
| city                     | string | (opcional) nome da cidade do domicílio do pagador                            |
| state                    | string | (opcional) uf do estado do domicílio do pagador (duas letras, p. ex. 'RJ')   |
| neighbourhood            | string | (opcional) bairro do domicílio do pagador                                    |
| street                   | string | (opcional) logradouro do pagador                                             |
| number                   | string | (opcional) número da logradouro do pagador                                   |
| zipcode                  | string | (opcional) cep do domicílio do pagador                                       |
| complement               | string | (opcional) complemento para o endereço de domicilio do pagador               |

## Atualização de Pagador

```shell
Atualizar Pagador

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/payers/:payer_id
  PATCH https://app.cobrato.com/api/v1/payers/:payer_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/payers/:payer_id \
    -d '{
        "city": "Farroupilha",
        "state": "RS"
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM BENEFICIÁRIO INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

    {
      "errors":{
        "national_identifier_type":["não está incluído na lista"]
      }
    }

```

Atualiza um determinado pagador, retornando as informações do mesmo caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

**Parâmetros**

| Campo                    | Tipo   | Comentário                                                                   |
|--------------------------|--------|------------------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo de identificação nacional ('cpf' ou 'cnpj')             |
| national_identifier      | string | **(requerido)** número válido de cnpj ou cpf, de acordo com o campo anterior |
| name                     | string | **(requerido)** nome completo do pagador                                     |
| city                     | string | (opcional) nome da cidade do domicílio do pagador                            |
| state                    | string | (opcional) uf do estado do domicílio do pagador (duas letras, p. ex. 'RJ')   |
| neighbourhood            | string | (opcional) bairro do domicílio do pagador                                    |
| street                   | string | (opcional) logradouro do pagador                                             |
| number                   | string | (opcional) número da logradouro do pagador                                   |
| zipcode                  | string | (opcional) cep do domicílio do pagador                                       |
| complement               | string | (opcional) complemento para o endereço de domicilio do pagador               |
