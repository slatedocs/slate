---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  -

search: true
---

# Começando com API de Admissões do Quero Alunos

Bem-vindo à documentação da API de Admissões do Quero Alunos. Aqui você encontrará guias e referências sobre como utilizar nossa API. Qualquer dúvida, entre em contato pelo email api-admissoes@quero.education.

## Informações básicas

Todas as respostas da API são feitas em JSON

Endpoint utilizado

`https://queroalunos.com/api/v1`


# Autenticação

```
POST https://queroalunos.com/api/v1/{action} HTTP/1.1
Content-Type: application/json
authorization: Token ••••••••••••
```

Todas as requisições são autenticadas por um token adicionado ao header.
Caso não tenha o token, solicite-o ao setor de desenvolvimento da Quero Educação.

## Requisição sem token
```
Ausência de Token
Status Code: 401 Unauthorized
www-authenticate: 'Token realm="University Panel"'
```

Em caso de requisição sem o envio do token será retornado status `401 - Unauthorized`.

## Requisição com token inválido

```
Formato de token inválido
Status Code: 400 Bad Request
```

Em caso de token em formato inválido será retornado status `400 - Bad Request`.

## Requisição com token não autorizado

```
Não autorizado
Status Code: 403 Forbidden
```

Em caso de token não autorizado será retornado erro `403 - Forbidden`.

## Requisição com token sem permissão

```
Sem permissão
Status Code: 200 OK
```
```json
{
  "status": "error",
  "errors": [{
    "title": "Invalid Permission",
    "detail": "You are not authorized to access this resource with these paramaters"
  }]
}
```

Em caso de token válido mas sem permissão de acesso ao recurso específico

# Paginação

## Exemplo de paginação

> Exemplo de requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions
```

> Exemplo de retorno

```json
{
  "has_more": true,
  "items": [
    {
      "id": 12345,
      "course_sku": "ADM-MANHA-SP",
      "status": "pending_docs",
      "student": { ... },
      "applications": [ {...} ]
    },
    ...,
    {
      "id": 12369,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ]
    }
  ]
}
```

A API utiliza paginação baseada em cursor atráves dos parâmetros `starting_after` e `ending_before`. Ambos recebem um id de um dado existente e retorna um array com até 25 elementos no máximo.
O parâmetro `ending_before` retorna elementos cujo id é maior que o indicado pelo parâmetro. Em contrapartida, o parâmetro `starting_after` retorna elementos listados após o dado cujo o id foi indicado.
O atributo `has_more` da resposta indica se há mais dados disponíveis depois dessa página. Se for `false`, significa que é o fim da lista e não há mais dados. Se for `true`, significa há mais dados a serem resgatados. Após uma requisição utilizando o parâmetro `ending_before`, o atributo `has_more` se refere à possibilidade de retornar à página anterior.

### Parâmetros de cursores

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo o ID foi indicado. |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo o ID foi indicado. |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | indica se há mais elementos disponíveis antes ou após essa página. |
| items | array | lista dos elementos com dados retornados pela requisição. |

## Uso do cursor starting_after

> Exemplo de requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions?starting_after=12369
```

> Retorno

```json
{
  "has_more": false,
  "items": [
    {
      "id": 12369,
      "course_sku": "ADM-MANHA-SP",
      "status": "pending_docs",
      "student": { ... },
      "applications": [ {...} ]
    },
    ...,
    {
      "id": 12380,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ]
    }
  ]
}
```

No exemplo acima, vimos que `has_more` retornou `true`, portanto existem mais dados a serem resgatados após esse página. Para poder consultá-los, na próxima requisição o parâmetro `starting_after` precisa ter o id do último índice do array `items`. A requisição e retorno ao lado são referentes ao exemplo [acima](#exemplo-de-paginacao).

### Parâmetros de cursores

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo o ID foi indicado. |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo o ID foi indicado. |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | indica se há mais elementos disponíveis antes ou após essa página. |
| items | array | lista dos dados com dados retornados pela requisição. |

## Uso do cursor ending_before

> Exemplo de requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions?ending_before=12369
```

> Retorno

```json
{
  "has_more": true,
  "items": [
    {
      "id": 12345,
      "course_sku": "ADM-MANHA-SP",
      "status": "pending_docs",
      "student": { ... },
      "applications": [ {...} ]
    },
    ...,
    {
      "id": 12369,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ]
    }
  ]
}
```

Assim como avançamos uma página, é possível facilmente retornar a uma página anterior. Para fazer isso, na próxima requisição o parâmetro `ending_before` precisa ter o id do primeiro índice do array `items`. A requisição e retorno ao lado são referentes ao exemplo [acima](#uso-do-cursor-starting_after).

### Parâmetros de cursores

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo o ID foi indicado. |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo o ID foi indicado. |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | indica se há mais elementos disponíveis antes ou após essa página. |
| items | array | lista dos elementos com dados retornados pela requisição. |

# Informações de alunos

## Busca de alunos por CPF

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/students?cpf=111.222.333-44
```

> Retorno

```json
[
  {
    "id": 123456,
    "name": "José da Silva",
    "cpf": "111.222.333-44",
    "birth_date": "1991-01-01",
    "emails": [
      "teste@exemplo.com"
    ],
    "phones": [
      "(11) 98888-7777"
    ],
    "address_information": {
      "address": "Rua Sandra",
      "number": "432S",
      "neighborhood": "Chácara Dora",
      "city": "Araçariguama",
      "state": "SP",
      "postal_code": "18147-000"
    },
    "admissions": [
      {
        "id": 12345,
        "course_sku": "ADM-NOITE-EAD",
        "status": "pending_docs"
      }
    ]
  }
]
```

> Resposta quando não encontra nenhum aluno

```json
{
  "error": true,
  "message": "CPF not found",
  "description": "Could not find any student by given CPF. Make sure you are following the pattern: xxx.xxx.xxx-xx"
}
```

Encontra um ou mais alunos a partir de um dado CPF.

Somente busca por alunos que tenham pré-matrícula na faculdade pertencente ao usuário fazendo pesquisa.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| cpf | Query | CPF do aluno procurado. Exige CPF completamente formatado (ex: 123.456.789-10). |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do aluno. |
| name | string | nome do aluno |
| cpf | string | cpf do aluno |
| birth_date | string | data de nascimento do aluno |
| emails | array de string | lista de emails do aluno |
| phones | array de string | lista de telefones do aluno |
| address_information | object | objeto com dados onde aluno reside |
| [address_information] address | string | endereço onde aluno reside |
| [address_information] number | string | número onde aluno reside |
| [address_information] neighborhood | string | bairro onde aluno reside |
| [address_information] city | string | cidade onde aluno reside |
| [address_information] state | string | estado onde aluno reside |
| [address_information] postal_code | string | código postal onde aluno reside |
| admissions | array | lista de objeto com informações de processo de matricula |
| [admissions] id | number | id do processo de matricula |
| [admissions] course_sku | string | código do curso fornecido pela universidade |
| [admissions] status | string | status que se encontra o processo de matricula |

### Significado dos valores em status
| Nome | Descrição |
| ---- | --------- |
| initiated | Inscrição para exame Pendente |
| pre_registered | Agendamento solicitado para exame vestibular |
| registered | Agendamento confirmado no exame vestibular |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |
| dropped_out | Desistente |
| dropping_out | Desistindo |
| drop_out_confirmed | Desistência confirmada |

## Busca de aluno por ID

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/students/{id}
```

> Resposta

```json
{
  "id": 394932,
  "name": "José da Silva",
  "cpf": "111.222.333-44",
  "birth_date": "1991-01-01",
  "emails": [
    "teste@exemplo.com"
  ],
  "phones": [
    "(11) 98888-7777"
  ],
  "address_information": {
    "address": "Rua Sandra",
    "number": "432S",
    "neighborhood": "Chácara Dora",
    "city": "Araçariguama",
    "state": "SP",
    "postal_code": "18147-000"
  },
  "admissions": [
    {
      "id": 12345,
      "course_sku": "ADM-NOITE-EAD",
      "status": "pending_docs"
    }
  ]
}
```
> Resposta quando não encontra nenhum aluno

```json
{
  "error": true,
  "message": "ID not found",
  "description": "Could not find any student by given ID."
}
```

Somente busca por alunos que tenham pré-matrícula na faculdade pertencente ao usuário fazendo pesquisa.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | Path | ID do aluno procurado. |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do aluno. |
| name | string | nome do aluno |
| cpf | string | cpf do aluno |
| birth_date | string | data de nascimento do aluno |
| emails | array de string | lista de emails do aluno |
| phones | array de string | lista de telefones do aluno |
| address_information | object | objeto com dados onde aluno reside |
| [address_information] address | string | endereço onde aluno reside |
| [address_information] number | string | número onde aluno reside |
| [address_information] neighborhood | string | bairro onde aluno reside |
| [address_information] city | string | cidade onde aluno reside |
| [address_information] state | string | estado onde aluno reside |
| [address_information] postal_code | string | código postal onde aluno reside |
| admissions | array | lista de objetos com informações de processo de matricula |
| [admissions] id | number | id do processo de matricula |
| [admissions] course_sku | string | código do curso fornecido pela universidade |
| [admissions] status | string | status que se encontra o processo de matricula |

### Significado dos valores em status
| Nome | Descrição |
| ---- | --------- |
| initiated | Inscrição para exame Pendente |
| pre_registered | Agendamento solicitado para exame vestibular |
| registered | Agendamento confirmado no exame vestibular |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |
| dropped_out | Desistente |
| dropping_out | Desistindo |
| drop_out_confirmed | Desistência confirmada |

# Informações de processos de admissão

## Listar todos os processos de admissão

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions
```

> Resposta

```json
{
  "has_more": false,
  "items": [
    {
      "id": 12345,
      "course_sku": "ADM-MANHA-SP",
      "status": "pending_docs",
      "student": {
        "id": 394932,
        "name": "José da Silva",
        "cpf": "111.222.333-44",
        "birth_date": "1991-01-01",
        "emails": [
          "teste@exemplo.com"
        ],
        "phones": [
          "(11) 98888-7777"
        ],
        "address_information": {
          "address": "Rua Sandra",
          "number": "432S",
          "neighborhood": "Chácara Dora",
          "city": "Araçariguama",
          "state": "SP",
          "postal_code": "18147-000"
        }
      },
      "applications": [
        {
          "id": 123456,
          "type": "exam",
          "exam": {
            "id":456,
            "course_skus": [
              "ADM-MANHA-SP",
              "DIR-MANHA-SP",
              "ADM-NOITE-RJ"
            ],
            "exam_location": {
              "address": "Rua Márcia",
              "number": "4231",
              "neighborhood": "Morro do Barreto",
              "city": "São Roque",
              "state": "SP",
              "postal_code": "19110-000"
            },
            "dates": "2016-11-01",
            "times": "18:30",
            "status": "active"
          },
          "result": "approved"
        }
      ]
    }
  ]
}
```

Retorna todas as admissões da faculdade.

Admissões são retornadas em páginas de até 25 elementos, ordenadas pela última atualização realizada. Se houver mais resultados, `has_more` retorna `true` indicando que é possível usar o parâmetro `ending_before` para consultar dados antecessores à lista atual. Para mais informações, consulte a sessão de [paginação](#paginacao).

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo o ID foi indicado. |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo o ID foi indicado. |


### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | indica se há mais elementos disponíveis antes ou após essa página. |
| items | object array | lista de elementos com dados de inscrições de vestibular |
| id | number | id da admissão |
| course_sku | string | código do curso referente a essa matrícula |
| status | string | status da admissão do aluno |
| [student] id | number | id do aluno |
| [student] name | string | nome do aluno |
| [student] cpf | string | cpf do aluno |
| [student] birth_date | string | data de nascimento do aluno |
| [student] emails | array de string | lista de emails do aluno |
| [student] phones | array de string | lista de telefones do aluno |
| [student] address_information | object | objeto com dados onde aluno reside |
| [address_information] address | string | endereço onde aluno reside |
| [address_information] number | string | número onde aluno reside |
| [address_information] neighborhood | string | bairro onde aluno reside |
| [address_information] city | string | cidade onde aluno reside |
| [address_information] state | string | estado onde aluno reside |
| [address_information] postal_code | string | código postal onde aluno reside |
| application | array | lista de objetos de inscrições de exame (pode estar vazio) |
| [application] id | number | id da inscrição para exame |
| [application] type | string | tipo de exame vestibular (exam ou enem) |
| [application] student | object | objeto com os dados do aluno referente a essa matrícula |
| exam | object | objeto com informações do exame referente a essa matrícula |
| [exam] id | number | id do exame vestibular |
| [exam] course_skus | array | lista com os cursos pertencentes a este exame vestibular |
| [exam] local | object | objeto com dados do local do exame vestibular |
| [exam_location] address | string | endereço da localização do exame vestibular |
| [exam_location] number | string | número da localização do exame vestibular |
| [exam_location] neighborhood | string | bairro da localização do exame vestibular |
| [exam_location] city | string | cidade da localização do exame vestibular |
| [exam_location] state | string | estado da localização do exame vestibular |
| [exam_location] postal_code | string | código postal da localização do exame vestibular |
| [exam] dates | string | data da realização do exame vestibular |
| [exam] times | string | hora da realização do exame vestibular |
| [exam] status | string | status do exame vestibular |
| [application] result | string | resultado do exame vestibular |

### Significado dos valores em status
| Nome | Descrição |
| ---- | --------- |
| initiated | Inscrição para exame Pendente |
| pre_registered | Agendamento solicitado para exame vestibular |
| registered | Agendamento confirmado no exame vestibular |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |
| dropped_out | Desistente |
| dropping_out | Desistindo |
| drop_out_confirmed | Desistência confirmada |

### Significado dos valores em result
| Nome | Descrição |
| ---- | --------- |
| null | Inscrição para exame Pendente |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |

## Dados de um único processo de admissão

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions/12345
```

> Resposta

```json
{
  "id": 12345,
  "course_sku": "ADM-MANHA-SP",
  "status": "pending_docs",
  "student": {
    "id": 394932,
    "name": "José da Silva",
    "cpf": "111.222.333-44",
    "birth_date": "1991-01-01",
    "emails": [
      "teste@exemplo.com"
    ],
    "phones": [
      "(11) 98888-7777"
    ],
    "address_information": {
      "address": "Rua Sandra",
      "number": "432S",
      "neighborhood": "Chácara Dora",
      "city": "Araçariguama",
      "state": "SP",
      "postal_code": "18147-000"
    }
  },
  "applications": [
    {
      "id": 123456,
      "type": "exam",
      "exam": {
        "id":456,
        "course_skus": [
          "ADM-MANHA-SP",
          "DIR-MANHA-SP",
          "ADM-NOITE-RJ"
        ],
        "exam_location": {
          "address": "Rua Márcia",
          "number": "4231",
          "neighborhood": "Morro do Barreto",
          "city": "São Roque",
          "state": "SP",
          "postal_code": "19110-000"
        },
        "dates": "2016-11-01",
        "times": "18:30",
        "status": "active"
      },
      "result": "approved"
    }
  ]
}
```

> Resposta quando não encontra nenhuma admissão

```json
{
  "error": true,
  "message": "ID not found",
  "description": "Could not find any admission by given ID."
}
```

Retorna uma admissão específica da faculdade.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | id da admissão |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id da admissão |
| course_sku | string | código do curso referente a essa matrícula |
| status | string | status da admissão do aluno |
| [student] id | number | id do aluno |
| [student] name | string | nome do aluno |
| [student] cpf | string | cpf do aluno |
| [student] birth_date | string | data de nascimento do aluno |
| [student] emails | array de string | lista de emails do aluno |
| [student] phones | array de string | lista de telefones do aluno |
| [student] address_information | object | objeto com dados onde aluno reside |
| [address_information] address | string | endereço onde aluno reside |
| [address_information] number | string | número onde aluno reside |
| [address_information] neighborhood | string | bairro onde aluno reside |
| [address_information] city | string | cidade onde aluno reside |
| [address_information] state | string | estado onde aluno reside |
| [address_information] postal_code | string | código postal onde aluno reside |
| application | array | lista de objetos de inscrição para exame (pode estar vazio) |
| [application] id | number | id da inscrição para exame |
| [application] type | string | tipo de exame vestibular (exam ou enem) |
| [application] student | object | objeto com os dados do aluno referente a essa matrícula |
| exam | object | objeto com informações do exame referente a essa matrícula |
| [exam] id | number | id do exame vestibular |
| [exam] course_skus | array | lista com os cursos pertencentes a este exame vestibular |
| [exam] local | object | objeto com dados do local do exame vestibular |
| [exam_location] address | string | endereço da localização do exame vestibular |
| [exam_location] number | string | número da localização do exame vestibular |
| [exam_location] neighborhood | string | bairro da localização do exame vestibular |
| [exam_location] city | string | cidade da localização do exame vestibular |
| [exam_location] state | string | estado da localização do exame vestibular |
| [exam_location] postal_code | string | código postal da localização do exame vestibular |
| [exam] dates | string | data da realização do exame vestibular |
| [exam] times | string | hora da realização do exame vestibular |
| [exam] status | string | status do exame vestibular |
| [application] result | string | resultado do exame vestibular |

### Significado dos valores em status
| Nome | Descrição |
| ---- | --------- |
| initiated | Inscrição para exame Pendente |
| pre_registered | Agendamento solicitado para exame vestibular |
| registered | Agendamento confirmado no exame vestibular |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |
| dropped_out | Desistente |
| dropping_out | Desistindo |
| drop_out_confirmed | Desistência confirmada |

### Significado dos valores em result
| Nome | Descrição |
| ---- | --------- |
| null | Inscrição para exame Pendente |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |

## Atualizar processo de admissão

> Requisição

```bash
curl -X PUT --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions/12345 \
  --data '{"status": "enrolled"}'
```

> Resposta

```json
{
  "id": 12345,
  "course_sku": "ADM-MANHA-SP",
  "status": "enrolled",
  "student": {
    "id": 394932,
    "name": "José da Silva",
    "cpf": "111.222.333-44",
    "birth_date": "1991-01-01",
    "emails": [
      "teste@exemplo.com"
    ],
    "phones": [
      "(11) 98888-7777"
    ],
    "address_information": {
      "address": "Rua Sandra",
      "number": "432S",
      "neighborhood": "Chácara Dora",
      "city": "Araçariguama",
      "state": "SP",
      "postal_code": "18147-000"
    }
  },
  "applications": [
    {
      "id": 123456,
      "type": "exam",
      "exam": {
        "id":456,
        "course_skus": [
          "ADM-MANHA-SP",
          "DIR-MANHA-SP",
          "ADM-NOITE-RJ"
        ],
        "exam_location": {
          "address": "Rua Márcia",
          "number": "4231",
          "neighborhood": "Morro do Barreto",
          "city": "São Roque",
          "state": "SP",
          "postal_code": "19110-000"
        },
        "dates": "2016-11-01",
        "times": "18:30",
        "status": "active"
      },
      "result": "approved"
    }
  ]
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Unknown status. Please check the API manual at http://docs.queroalunos.com/"
}
```

> Retorno quando não encontra a admissão

```json
{
  "error": true,
  "message": "ID not found",
  "description": "Could not find any admission by given ID."
}
```

Realiza atualização de um processo de admissão específico de um aluno. Para isso é preciso enviar a informação atual dele pelo parâmetro `status`.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| status | form | situação da admissão |

### Possíveis valores para o parâmetro status

| Status | Descrição |
| ------ | --------- |
| initiated | Inscrição para exame Pendente |
| pre_registered | Agendamento solicitado para exame vestibular |
| registered | Agendamento confirmado no exame vestibular |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id da admissão |
| course_sku | string | código do curso referente a essa matrícula |
| status | string | status da admissão do aluno |
| [student] id | number | id do aluno |
| [student] name | string | nome do aluno |
| [student] cpf | string | cpf do aluno |
| [student] birth_date | string | data de nascimento do aluno |
| [student] emails | array de string | lista de emails do aluno |
| [student] phones | array de string | lista de telefones do aluno |
| [student] address_information | object | objeto com dados onde aluno reside |
| [address_information] address | string | endereço onde aluno reside |
| [address_information] number | string | número onde aluno reside |
| [address_information] neighborhood | string | bairro onde aluno reside |
| [address_information] city | string | cidade onde aluno reside |
| [address_information] state | string | estado onde aluno reside |
| [address_information] postal_code | string | código postal onde aluno reside |
| application | array | lista de objetos de inscrição para exame (pode estar vazio) |
| [application] id | number | id da inscrição para exame |
| [application] type | string | tipo de exame vestibular (exam ou enem) |
| [application] student | object | objeto com os dados do aluno referente a essa matrícula |
| exam | object | objeto com informações do exame referente a essa matrícula |
| [exam] id | number | id do exame vestibular |
| [exam] course_skus | array | lista com os cursos pertencentes a este exame vestibular |
| [exam] local | object | objeto com dados do local do exame vestibular |
| [exam_location] address | string | endereço da localização do exame vestibular |
| [exam_location] number | string | número da localização do exame vestibular |
| [exam_location] neighborhood | string | bairro da localização do exame vestibular |
| [exam_location] city | string | cidade da localização do exame vestibular |
| [exam_location] state | string | estado da localização do exame vestibular |
| [exam_location] postal_code | string | código postal da localização do exame vestibular |
| [exam] dates | string | data da realização do exame vestibular |
| [exam] times | string | hora da realização do exame vestibular |
| [exam] status | string | status do exame vestibular |
| [application] result | string | resultado do exame vestibular |

### Significado dos valores em status
| Nome | Descrição |
| ---- | --------- |
| initiated | Inscrição para exame Pendente |
| pre_registered | Agendamento solicitado para exame vestibular |
| registered | Agendamento confirmado no exame vestibular |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |
| dropped_out | Desistente |
| dropping_out | Desistindo |
| drop_out_confirmed | Desistência confirmada |

### Significado dos valores em result
| Nome | Descrição |
| ---- | --------- |
| null | Inscrição para exame Pendente |
| failed | Reprovado no exame vestibular |
| approved | Aprovado no exame vestibular |
