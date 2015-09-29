# Cedente
```shell
Cedente

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
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/payees/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/payees/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/payees/1"}
      ]
  }
```


É possível ter indeterminados cedentes, e a eles que pertencem as contas bancárias, contas de cobrança, e as próprias cobranças do sistema. Podem ser tanto pessoas físicas como pessoas jurídicas.

Parâmetros


|Campo                    | Tipo            | Comentário                                             |
|-------------------------|-----------------|--------------------------------------------------------|
|id                       | integer         |                                                        |
|national_identifier_type | string          | tipo de identificação nacional, cpf ou cnpj            |
|national_identifier      | string          | código do cnpj ou cpf, de acordo com o campo anterior  |
|name                     | string          |                                                        |
|city                     | string          | nome da cidade na qual o cedente reside                |
|state                    | string          | uf do estado aonde o cedente reside                    |
|neighbourhood            | string          |                                                        |
|street                   | string          |                                                        |
|number                   | string          |                                                        |
|zipcode                  | string          |                                                        |
|complement               | string          |                                                        |
|_links                   | array of object | links do cedente                                       |

## Lista de Todos os Cedentes

Retorna uma lista em JSON contendo todos os cedentes pertencentes a sua Conta de Serviço.

```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payees

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payees

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "payees":
      [
        {
          //informações cedente 1
        },
        {
          //informações cedente 2
        },
        ...
      ]
  }
```


## Informações do Cedente
```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payees/:payee_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payees/:payee_id

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
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/payees/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/payees/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/payees/1"}
      ]
  }
```
Retorna as informações detalhadas do cedente informado em JSON.

## Criação de Cedente
```shell
DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/payees

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/payees
    -D '{
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
      "city": ["não pode ficar em branco"],
      "national_identifier_type": ["não pode ficar em branco","não está incluído na lista"],
      "state":["não pode ficar em branco","não possui o tamanho esperado (2 caracteres)"],
      "neighbourhood": ["não pode ficar em branco"],
      "street": ["não pode ficar em branco"],
      "number": ["não pode ficar em branco"],
      "zipcode": ["não pode ficar em branco"]
    }
  }

```

Cria um novo cedente, retornando as informações do mesmo caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta.

Parâmetros

|Campo                    | Tipo            | Comentário                                                               |
|-------------------------|-----------------|--------------------------------------------------------------------------|
|national_identifier_type | string          | requirido tipo de identificação nacional, deve ser cpf ou cnpj           |
|national_identifier      | string          | requirido  código válido de cnpj ou cpf, de acordo com o campo anterior  |
|name                     | string          | requirido  nome completo do cedente                                      |
|city                     | string          | requirido  nome da cidade na qual o cedente reside                       |
|state                    | string          | requirido uf do estado aonde o cedente reside                            |
|neighbourhood            | string          | requirido                                                                |
|street                   | string          | requirido                                                                |
|number                   | string          | requirido                                                                |
|zipcode                  | string          | requirido                                                                |
|complement               | string          |                                                                          |


## Atualização de Cedente
```shell
DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/payees/:payee_id
  PATCH https://app.cobrato.com/api/v1/payees/:payee_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/payees/:payee_id
    -D '{
        "city": "Farroupilha",
        "state": "RS"
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CEDENTE INEXISTENTE

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

Atualiza o cedente determinado, retornando as informações do mesmo caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

Parâmetros

|Campo                     | Tipo   | Comentário                                                   |
|--------------------------|--------|--------------------------------------------------------------|
| national_identifier_type | string | tipo de identificação nacional, deve ser cpf ou cnpj         |
| national_identifier      | string | código válido de cnpj ou cpf, de acordo com o campo anterior |
| name                     | string | nome completo do cedente                                     |
| city                     | string | nome da cidade na qual o cedente reside                      |
| state                    | string | uf do estado aonde o cedente reside                          |
| neighbourhood            | string |                                                              |
| street                   | string |                                                              |
| number                   | string |                                                              |
| zipcode                  | string |                                                              |
| complement               | string |                                                              |

## Exclusão de Cedente
```shell
DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/payees/:payee_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/payees/:payee_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM CEDENTE INEXISTENTE

    404 Not Found
```
Exclui determinado cedente e junto a ele todas suas contas de cobrança, contas bancárias e as cobranças. As mudanças são irreversíveis.

