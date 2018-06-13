# Pessoa

```shell
Pessoa

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
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/people/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/people/1"}
      ]
  }
```

É possível ter indeterminadas pessoas pertencentes a uma Conta de Serviço. Podem ser tanto pessoas físicas como pessoas jurídicas.

<aside class="notice">
  É importante ressaltar que, para a pessoa ser utilizada em uma cobrança via boleto registrado, neste caso como Pagador, todos os dados são obrigatórios, com exceção do <code>complement</code>.
</aside>

**Parâmetros**

| Campo                    | Tipo            | Comentário                                                      |
|--------------------------|-----------------|-----------------------------------------------------------------|
| id                       | integer         |                                                                 |
| national_identifier_type | string          | tipo de identificação nacional ('cpf' ou 'cnpj')                |
| national_identifier      | string          | número válido de cnpj ou cpf, de acordo com o campo anterior    |
| name                     | string          | nome completo da pessoa                                         |
| city                     | string          | nome da cidade do domicílio da pessoa                           |
| state                    | string          | uf do estado do domicílio da pessoa (duas letras, p. ex. 'RJ')  |
| neighbourhood            | string          | bairro do domicílio da pessoa                                   |
| street                   | string          | logradouro da pessoa                                            |
| number                   | string          | número da logradouro da pessoa                                  |
| zipcode                  | string          | cep do domicílio da pessoa                                      |
| complement               | string          | complemento para o endereço de domicilio da pessoa              |
| _links                   | array of object | links da pessoa                                                 |

## Informações da Pessoa

```shell
Mostrar Pessoa

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/people/:person_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/people/:person_id

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
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/people/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/people/1"}
      ]
  }
```

Retorna as informações detalhadas da pessoa em JSON.

## Lista de Todos as Pessoas

```shell
Listar Pessoas

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/people

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/people

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "people":
      [
        {
          // informações pessoa 1
        },
        {
          // informações pessoa 2
        },
        ...
      ]
  }
```

Retorna uma lista em JSON contendo todas as pessoas pertencentes a sua Conta de Serviço.

## Criação de Pessoa

```shell
Criar Pessoa

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/people

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/people \
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

Cria uma nova pessoa, retornando as informações da mesma caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta.

**Parâmetros**

| Campo                    | Tipo   | Comentário                                                                   |
|--------------------------|--------|------------------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo de identificação nacional ('cpf' ou 'cnpj')             |
| national_identifier      | string | **(requerido)** número válido de cnpj ou cpf, de acordo com o campo anterior |
| name                     | string | **(requerido)** nome completo da pessoa                                      |
| city                     | string | (opcional) nome da cidade do domicílio da pessoa                             |
| state                    | string | (opcional) uf do estado do domicílio da pessoa (duas letras, p. ex. 'RJ')    |
| neighbourhood            | string | (opcional) bairro do domicílio da pessoa                                     |
| street                   | string | (opcional) logradouro da pessoa                                              |
| number                   | string | (opcional) número da logradouro da pessoa                                    |
| zipcode                  | string | (opcional) cep do domicílio da pessoa                                        |
| complement               | string | (opcional) complemento para o endereço de domicilio da pessoa                |

## Atualização de Pessoa

```shell
Atualizar Pessoa

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/people/:person_id
  PATCH https://app.cobrato.com/api/v1/people/:person_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/people/:person_id \
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

Atualiza uma determinada pessoa, retornando as informações da mesma caso haja sucesso. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

**Parâmetros**

| Campo                    | Tipo   | Comentário                                                                   |
|--------------------------|--------|------------------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo de identificação nacional ('cpf' ou 'cnpj')             |
| national_identifier      | string | **(requerido)** número válido de cnpj ou cpf, de acordo com o campo anterior |
| name                     | string | **(requerido)** nome completo da pessoa                                      |
| city                     | string | (opcional) nome da cidade do domicílio da pessoa                             |
| state                    | string | (opcional) uf do estado do domicílio da pessoa (duas letras, p. ex. 'RJ')    |
| neighbourhood            | string | (opcional) bairro do domicílio da pessoa                                     |
| street                   | string | (opcional) logradouro da pessoa                                              |
| number                   | string | (opcional) número da logradouro da pessoa                                    |
| zipcode                  | string | (opcional) cep do domicílio da pessoa                                        |
| complement               | string | (opcional) complemento para o endereço de domicilio da pessoa                |
