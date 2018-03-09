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
    "detail": "You are not authorized to access this resource with these parameters"
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
      "applications": [ {...} ],
      "created_at": "2016-10-01T02:01:44Z"
    },
    ...,
    {
      "id": 12369,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-15T03:15:44Z"
    }
  ]
}
```

A API utiliza paginação baseada em cursor atráves dos parâmetros `starting_after` e `ending_before`. Ambos recebem um id de um dado existente e retorna uma lista com até 25 elementos no máximo.
O parâmetro `ending_before` faz a requisição retornar elementos cujo id é maior que o indicado pelo parâmetro. Em contrapartida, o parâmetro `starting_after` faz a requisição retornar elementos listados após o dado cujo id foi indicado.
O atributo `has_more` da resposta indica se há mais dados disponíveis depois dessa página. Se for `false`, significa que é o fim da lista e não há mais dados. Se for `true`, significa que há mais dados a serem resgatados. Após uma requisição utilizando o parâmetro `ending_before`, o atributo `has_more` se refere a possibilidade de retornar mais dados anteriores à página atual.

### Parâmetros de paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista dos elementos retornados pela requisição |

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
      "id": 12370,
      "course_sku": "ADM-MANHA-SP",
      "status": "pending_docs",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-16T03:15:44Z"
    },
    ...,
    {
      "id": 12380,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-20T03:15:44Z"
    }
  ]
}
```

No exemplo acima, vimos que `has_more` retornou `true`, portanto existem mais dados a serem resgatados após essa página. Para poder consultá-los, na próxima requisição o parâmetro `starting_after` precisa ter o id do último elemento da lista `items`. A requisição e retorno ao lado são referentes ao exemplo [acima](#exemplo-de-paginacao).

### Parâmetros de paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista dos elementos retornados pela requisição |

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
      "applications": [ {...} ],
      "created_at": "2016-10-01T03:15:44Z"
    },
    ...,
    {
      "id": 12369,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-15T03:15:44Z"
    }
  ]
}
```

Assim como avançamos uma página, é possível facilmente retornar a dados anteriores à página atual. Para fazer isso, na próxima requisição o parâmetro `ending_before` precisa ter o id do primeiro elemento da lista `items`. A requisição e retorno ao lado são referentes ao exemplo [acima](#uso-do-cursor-starting_after).

### Parâmetros de paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista dos elementos retornados pela requisição |

## Uso do filtro start_date

> Exemplo de requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions?start_date=15/10/2016
```

> Retorno

```json
{
  "has_more": false,
  "items": [
    {
      "id": 12369,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-15T03:15:44Z"
    },
    ...,
    {
      "id": 12380,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-20T03:15:44Z"
    }
  ]
}
```

É possível listar os elementos baseado na data de criação. Usando o parâmetro `start_date`, apenas os elementos criados após esta data serão listados. O parâmetro deve estar no formato `dd/mm/aaaa`. Esse filtro poderá ser verificado pelo atributo `created_at` da lista `items`, que segue o formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601).

### Parâmetros de paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista dos elementos retornados pela requisição |

## Uso do filtro end_date

> Exemplo de requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/admissions?end_date=15/10/2016
```

> Retorno

```json
{
  "has_more": false,
  "items": [
    {
      "id": 12345,
      "course_sku": "ADM-MANHA-SP",
      "status": "pending_docs",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-01T03:15:44Z"
    },
    ...,
    {
      "id": 12369,
      "course_sku": "ADM-NOITE-RJ",
      "status": "pre_registered",
      "student": { ... },
      "applications": [ {...} ],
      "created_at": "2016-10-15T03:15:44Z"
    }
  ]
}
```

É possível listar os elementos baseado na data de criação. Usando o parâmetro `end_date`, apenas os elementos criados antes dessa data serão listados. O parâmetro deve estar no formato `dd/mm/aaaa`. Esse filtro poderá ser verificado pelo atributo `created_at` da lista `items`, que segue o formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601).

### Parâmetros de paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista dos elementos retornados pela requisição |

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
        "status": "pending_docs",
        "created_at": "2016-10-01T03:15:44Z"
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
| cpf | Query | CPF do aluno procurado. Exige CPF completamente formatado (ex: 123.456.789-10) |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do aluno |
| name | string | Nome do aluno |
| cpf | string | CPF do aluno |
| birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| emails | array de string | Lista de emails do aluno |
| phones | array de string | Lista de telefones do aluno |
| address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| admissions | array | Lista de objetos com informações de processo de matrícula |
| [admissions] id | number | Id do processo de matrícula |
| [admissions] course_sku | string | Código do curso fornecido pela universidade |
| [admissions] status | string | Status que se encontra o processo de matrícula |
| [admissions] created_at | string | Data da criação do processo de matrícula no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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

## Busca de aluno por id

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
      "status": "pending_docs",
      "created_at": "2016-10-01T03:15:44Z"
    }
  ]
}
```
> Resposta quando não encontra nenhum aluno

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any student by given id."
}
```

Somente busca por alunos que tenham pré-matrícula na faculdade pertencente ao usuário fazendo pesquisa.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | Path | Id do aluno procurado |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do aluno |
| name | string | Nome do aluno |
| cpf | string | CPF do aluno |
| birth_date | string | Data de nascimento do aluno |
| emails | array de string | Lista de emails do aluno |
| phones | array de string | Lista de telefones do aluno |
| address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| admissions | array | Lista de objetos com informações de processo de matrícula |
| [admissions] id | number | Id do processo de matrícula |
| [admissions] course_sku | string | Código do curso fornecido pela universidade |
| [admissions] status | string | Status que se encontra o processo de matrícula |
| [admissions] created_at | string | Data da criação do processo de matrícula no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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
            "status": "active",
            "created_at": "2016-10-01T03:15:44Z"
          },
          "result": "approved",
          "created_at": "2016-10-01T03:15:44Z"
        }
      ],
      "created_at": "2016-10-01T03:15:44Z"
    }
  ]
}
```

Retorna todas as admissões da faculdade.

Admissões são retornadas em páginas de até 25 elementos, ordenadas pela última atualização realizada. Se houver mais resultados, `has_more` retorna `true` indicando que é possível usar o parâmetro `ending_before` para consultar objetos antecessores à lista atual. Para mais informações, consulte a seção de [paginação](#paginacao).

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista de elementos com dados de inscrições de vestibular |
| id | number | Id da admissão |
| course_sku | string | Código do curso referente a essa matrícula |
| status | string | Status da admissão do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| application | array | Lista de objetos de inscrições de exame (pode estar vazio) |
| [application] id | number | Id da inscrição para exame |
| [application] type | string | Tipo de exame vestibular (exam ou enem) |
| [application] student | object | Objeto com os dados do aluno referente a essa matrícula |
| exam | object | Objeto com informações do exame referente a essa matrícula |
| [exam] id | number | Id do exame vestibular |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] local | object | Objeto com dados do local do exame vestibular |
| [exam_location] address | string | Endereço da localização do exame vestibular |
| [exam_location] number | string | Número da localização do exame vestibular |
| [exam_location] neighborhood | string | Bairro da localização do exame vestibular |
| [exam_location] city | string | Cidade da localização do exame vestibular |
| [exam_location] state | string | Estado da localização do exame vestibular |
| [exam_location] postal_code | string | Código postal da localização do exame vestibular |
| [exam] dates | string | Data da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] times | string | Hora da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] status | string | Status do exame vestibular |
| [exam] created_at | string | Data da criação do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [application] result | string | Resultado do exame vestibular |
| [application] created_at | string | Data de criação da inscrição para exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| created_at | string | Data de criação da admissão no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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
        "status": "active",
        "created_at": "2016-10-01T03:15:44Z"
      },
      "result": "approved",
      "created_at": "2016-10-01T03:15:44Z"
    }
  ],
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Resposta quando não encontra nenhuma admissão

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any admission by given id."
}
```

Retorna uma admissão específica da faculdade.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | Id da admissão |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id da admissão |
| course_sku | string | Código do curso referente a essa matrícula |
| status | string | Status da admissão do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| application | array | Lista de objetos de inscrição para exame (pode estar vazio) |
| [application] id | number | Id da inscrição para exame |
| [application] type | string | Tipo de exame vestibular (exam ou enem) |
| [application] student | object | Objeto com os dados do aluno referente a essa matrícula |
| exam | object | Objeto com informações do exame referente a essa matrícula |
| [exam] id | number | Id do exame vestibular |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] local | object | Objeto com dados do local do exame vestibular |
| [exam_location] address | string | Endereço da localização do exame vestibular |
| [exam_location] number | string | Número da localização do exame vestibular |
| [exam_location] neighborhood | string | Bairro da localização do exame vestibular |
| [exam_location] city | string | Cidade da localização do exame vestibular |
| [exam_location] state | string | Estado da localização do exame vestibular |
| [exam_location] postal_code | string | Código postal da localização do exame vestibular |
| [exam] dates | string | Data da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] times | string | Hora da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] status | string | Status do exame vestibular |
| [exam] created_at | string | Data da criação do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [application] result | string | Resultado do exame vestibular |
| [application] created_at | string | Data de criação da inscrição para exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| created_at | string | Data de criação da admissão no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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
        "status": "active",
        "created_at": "2016-10-01T03:15:44Z"
      },
      "result": "approved",
      "created_at": "2016-10-01T03:15:44Z"
    }
  ],
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Unknown status. Please check the API manual at http://docs.queroalunos.com/#atualizar-processo-de-admissao"
}
```

> Retorno quando não encontra a admissão

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any admission by given id."
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
| id | number | Id da admissão |
| course_sku | string | Código do curso referente a essa matrícula |
| status | string | Status da admissão do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| application | array | Lista de objetos de inscrição para exame (pode estar vazio) |
| [application] id | number | Id da inscrição para exame |
| [application] type | string | Tipo de exame vestibular (exam ou enem) |
| [application] student | object | Objeto com os dados do aluno referente a essa matrícula |
| exam | object | Objeto com informações do exame referente a essa matrícula |
| [exam] id | number | Id do exame vestibular |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] local | object | Objeto com dados do local do exame vestibular |
| [exam_location] address | string | Endereço da localização do exame vestibular |
| [exam_location] number | string | Número da localização do exame vestibular |
| [exam_location] neighborhood | string | Bairro da localização do exame vestibular |
| [exam_location] city | string | Cidade da localização do exame vestibular |
| [exam_location] state | string | Estado da localização do exame vestibular |
| [exam_location] postal_code | string | Código postal da localização do exame vestibular |
| [exam] dates | string | Data da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] times | string | Hora da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] status | string | Status do exame vestibular |
| [exam] created_at | string | Data da criação do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [application] result | string | Resultado do exame vestibular |
| [application] created_at | string | Data de criação da inscrição para exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| created_at | string | Data de criação da admissão no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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

# Informações de inscrição para exame

## Listar todas as inscrições de exame

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/applications
```

> Resposta

```json
{
  "has_more": false,
  "items": [
    {
      "id": 123456,
      "type": "exam",
      "admission": {
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
        "created_at": "2016-10-01T03:15:44Z"
      },
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
        "status": "active",
        "created_at": "2016-10-01T03:15:44Z"
      },
      "result": "approved",
      "created_at": "2016-10-01T03:15:44Z"
    }
  ]
}
```

Retorna todas as inscrições de exame da faculdade.

Inscrições são retornadas em páginas de até 25 elementos, ordenadas pela última atualização realizada. Se houver mais resultados, `has_more` retorna `true` indicando que é possível usar o parâmetro `ending_before` para consultar objetos antecessores à lista atual. Para mais informações, consulte a seção de [paginação](#paginacao).

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista de elementos com dados de inscrições de vestibular |
| id | number | Id da inscrição para exame |
| type | string | Tipo de exame vestibular (exam ou enem) |
| admission | object | Objeto com dados do processo de admissão do aluno |
| [admission] id | number | Id do processo de admissão |
| [admission] course_sku | string | Código do curso referente a essa matrícula |
| [admission] status | string | Status da admissão do aluno |
| [admission] student | object | Objeto com dados do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| [admission] created_at | string | Data de criação da admissão no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| exam | object | Objeto com informações do exame vestibular |
| [exam] id | number | Id do exame vestibular |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] exam_location | object | Objeto com dados do exame vestibular |
| [exam_location] address | string | Endereço da localização do exame vestibular |
| [exam_location] number | string | Número da localização do exame vestibular |
| [exam_location] neighborhood | string | Bairro da localização do exame vestibular |
| [exam_location] city | string | Cidade da localização do exame vestibular |
| [exam_location] state | string | Estado da localização do exame vestibular |
| [exam_location] postal_code | string | Código postal da localização do exame vestibular |
| [exam] date | string | Data da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] time | string | Hora da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] status | string | Status do exame vestibular |
| [exam] created_at | string | Data da criação do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| result | string | Resultado do exame vestibular |
| created_at | string | Data de criação da inscrição para exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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

## Dados de uma única inscrição para exame

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/applications/123456
```

> Resposta

```json
{
  "id": 123456,
  "type": "exam",
  "admission": {
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
    "created_at": "2016-10-01T03:15:44Z"
  },
  "exam": {
    "id": 456,
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
    "date": "2016-11-01",
    "time": "18:30",
    "status": "active",
    "created_at": "2016-10-01T03:15:44Z"
  },
  "result": "approved",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Resposta quando não encontra nenhuma inscrição para exame

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any application by given id."
}
```

Retorna uma inscrição específica na inscrição do exame da faculdade.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | Path | Id da inscrição para exame |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id da inscrição para exame |
| type | string | Tipo de exame vestibular (exam ou enem) |
| admission | object | Objeto com dados do processo de admissão do aluno |
| [admission] id | number | Id do processo de admissão |
| [admission] course_sku | string | Código do curso referente a essa matrícula |
| [admission] status | string | Status da admissão do aluno |
| [admission] student | object | Objeto com dados do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| [admission] created_at | string | Data de criação da admissão no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| exam | object | Objeto com informações do exame vestibular |
| [exam] id | number | Id do exame vestibular |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] exam_location | object | Objeto com dados do exame vestibular |
| [exam_location] address | string | Endereço da localização do exame vestibular |
| [exam_location] number | string | Número da localização do exame vestibular |
| [exam_location] neighborhood | string | Bairro da localização do exame vestibular |
| [exam_location] city | string | Cidade da localização do exame vestibular |
| [exam_location] state | string | Estado da localização do exame vestibular |
| [exam_location] postal_code | string | Código postal da localização do exame vestibular |
| [exam] date | string | Data da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] time | string | Hora da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] status | string | Status do exame vestibular |
| [exam] created_at | string | Data da criação do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| result | string | Resultado do exame vestibular |
| created_at | string | Data de criação da inscrição para exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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

## Atualizar inscrição para exame

> Requisição

```bash
curl -X PUT --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/applications/123456 \
  --data '{"result":"approved"}'
```

> Resposta

```json
{
  "id": 123456,
  "type": "exam",
  "admission": {
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
    "created_at": "2016-10-01T03:15:44Z"
  },
  "exam": {
    "id": 456,
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
    "date": "2016-11-01",
    "time": "18:30",
    "status": "active",
    "created_at": "2016-10-01T03:15:44Z"
  },
  "result": "approved",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Unknown result. Please check the API manual at http://docs.queroalunos.com/#atualizar-inscricao-para-exame"
}
```

> Retorno quando não encontra a inscrição para exame

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any application by given id."
}
```

Atualiza a situação de agendamento ou resultado de uma inscrição para exame.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| result | Form | Situação do aluno entre `approved` e `failed` |

### Possíveis valores para o parâmetro result

| Status | Descrição |
| ------ | --------- |
| approved | Aprovado no vestibular |
| failed | Reprovado no vestibular |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id da inscrição para exame |
| type | string | Tipo de exame vestibular (exam ou enem) |
| admission | object | Objeto com dados do processo de admissão do aluno |
| [admission] id | number | Id do processo de admissão |
| [admission] course_sku | string | Código do curso referente a essa matrícula |
| [admission] status | string | Status da admissão do aluno |
| [admission] student | object | Objeto com dados do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| [admission] created_at | string | Data de criação da admissão no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| exam | object | Objeto com informações do exame vestibular |
| [exam] id | number | Id do exame vestibular |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] exam_location | object | Objeto com dados do exame vestibular |
| [exam_location] address | string | Endereço da localização do exame vestibular |
| [exam_location] number | string | Número da localização do exame vestibular |
| [exam_location] neighborhood | string | Bairro da localização do exame vestibular |
| [exam_location] city | string | Cidade da localização do exame vestibular |
| [exam_location] state | string | Estado da localização do exame vestibular |
| [exam_location] postal_code | string | Código postal da localização do exame vestibular |
| [exam] date | string | Data da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] time | string | Hora da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] status | string | Status do exame vestibular |
| [exam] created_at | string | Data da criação do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| result | string | Resultado do exame vestibular |
| created_at | string | Data de criação da inscrição para exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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

# Exames em lote

## Listar todos os exames em lote

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exam_groups
```

> Resposta

```json
{
  "has_more": false,
  "items": [
    {
      "id": 1234,
      "course_skus": [
        "ADM-MANHA-SP",
        "DIR-MANHA-SP",
        "ADM-NOITE-RJ"
      ],
      "exam_locations": [
        {
          "address": "Rua Márcia",
          "number": "4231",
          "neighborhood": "Morro do Barreto",
          "city": "São Roque",
          "state": "SP",
          "postal_code": "19110-000"
        }
      ],
      "dates": [
        "2016-11-01", "2016-11-01",
        "2016-11-01", "2016-11-01"
      ],
      "times": [ "18:30", "19:30"],
      "status": "active",
      "kind": "scheduled",
      "created_at": "2016-10-01T03:15:44Z"
    }
  ]
}
```

Retorna todos os exames em lote.

Exames em lote são retornados em páginas de até 25 elementos, ordenadas pela última atualização realizada. Se houver mais resultados, `has_more` retorna `true` indicando que é possível usar o parâmetro `ending_before` para consultar dados antecessores à lista atual. Para mais informações, consulte a seção de [paginação](#paginacao).

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista de elementos com dados de inscrições de vestibular |
| id | number | Id do lote de exames |
| course_skus | array | Cursos que usam como entrada algum exame desse lote |
| exam_locations | array | Lista dos objetos dos endereços dos exames desse lote |
| [exam_locations] address | string | Endereço onde será feito o exame vestibular |
| [exam_locations] number | string | Número de onde será feito o exame vestibular |
| [exam_locations] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_locations] city | string | Cidade onde será feito o exame vestibular |
| [exam_locations] state | string | Estado onde será feito o exame vestibular |
| [exam_locations] postal_code | string | Código postal de onde será feito o exame vestibular |
| dates | array | Lista das datas dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| times | array | Lista dos horários de aplicações dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação dos exames entre `active` e `inactive` |
| kind | string | Tipo dos exames desse lote |
| created_at | string | Data de criação do lote de exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Significado dos status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |

## Informações de um único lote de exames

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exam_groups/1234
```

> Resposta

```json
{
  "id": 1234,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "exam_locations": [
    {
      "address": "Rua Márcia",
      "number": "4231",
      "neighborhood": "Morro do Barreto",
      "city": "São Roque",
      "state": "SP",
      "postal_code": "19110-000"
    }
  ],
  "dates": [
    "2016-11-01", "2016-11-01",
    "2016-11-01", "2016-11-01"
  ],
  "times": [ "18:30", "19:30"],
  "status": "active",
  "kind": "scheduled",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Resposta quando não encontra nenhum lote de exames

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any exam group by given id."
}
```
Retorna um lote de exames específico.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | Id do lote de exames |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do lote de exames |
| course_skus | array | Cursos que usam como entrada algum exame desse lote |
| exam_locations | array | Lista dos objetos dos endereços dos exames desse lote |
| [exam_locations] address | string | Endereço onde será feito o exame vestibular |
| [exam_locations] number | string | Número de onde será feito o exame vestibular |
| [exam_locations] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_locations] city | string | Cidade onde será feito o exame vestibular |
| [exam_locations] state | string | Estado onde será feito o exame vestibular |
| [exam_locations] postal_code | string | Código postal de onde será feito o exame vestibular |
| dates | array | Lista das datas dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| times | array | Lista dos horários de aplicações dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação dos exames entre `active` e `inactive` |
| kind | string | Tipo dos exames desse lote |
| created_at | string | Data de criação do lote de exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Significado dos status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |

## Criação de exames em lote

> Requisição

```bash
curl -X POST --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exam_groups \
  --file "data.json"
```

> estrutura de data.json

```json
{
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "exam_locations": [
    {
      "address": "Rua Márcia",
      "number": "4231",
      "neighborhood": "Morro do Barreto",
      "city": "São Roque",
      "state": "SP",
      "postal_code": "19110-000"
    }
  ],
  "dates": [
    "2016-11-01", "2016-11-01",
    "2016-11-01", "2016-11-01"
  ],
  "times": [ "18:30", "19:30" ],
  "status": "active",
  "kind": "scheduled"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Could not validate json file. Make sure you are following the keys and values as described by the API manual on the link http://docs.queroalunos.com/#criacao-de-exames-em-lote"
}
```

Cria um lote de exames.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| *.json | json | Arquivo json com as informações do lote de exames |

### Informações dos argumentos

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| course_skus | array | Cursos que usam como entrada algum exame desse lote |
| exam_locations | array | Lista dos objetos dos endereços dos exames desse lote |
| [exam_locations] address | string | Endereço onde será feito o exame vestibular |
| [exam_locations] number | string | Número de onde será feito o exame vestibular |
| [exam_locations] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_locations] city | string | Cidade onde será feito o exame vestibular |
| [exam_locations] state | string | Estado onde será feito o exame vestibular |
| [exam_locations] postal_code | string | Código postal de onde será feito o exame vestibular |
| dates | array | Lista das datas dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| times | array | Lista dos horários de aplicações dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação dos exames entre `active` e `inactive` |
| kind | string | Tipo dos exames desse lote |

### Significado dos status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |

> Resposta

```json
{
  "id": 123,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "exam_locations": [
    {
      "address": "Rua Márcia",
      "number": "4231",
      "neighborhood": "Morro do Barreto",
      "city": "São Roque",
      "state": "SP",
      "postal_code": "19110-000"
    }
  ],
  "dates": [
    "2016-11-01", "2016-11-01",
    "2016-11-01", "2016-11-01"
  ],
  "times": [ "18:30", "19:30"],
  "status": "active",
  "kind": "scheduled"
}
```

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do lote de exames |
| course_skus | array | Cursos que usam como entrada algum exame desse lote |
| exam_locations | array | Lista dos objetos dos endereços dos exames desse lote |
| [exam_locations] address | string | Endereço onde será feito o exame vestibular |
| [exam_locations] number | string | Número de onde será feito o exame vestibular |
| [exam_locations] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_locations] city | string | Cidade onde será feito o exame vestibular |
| [exam_locations] state | string | Estado onde será feito o exame vestibular |
| [exam_locations] postal_code | string | Código postal de onde será feito o exame vestibular |
| dates | array | Lista das datas dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| times | array | Lista dos horários de aplicações dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação dos exames entre `active` e `inactive` |
| kind | string | Tipo dos exames desse lote |

## Suspender ou ativar lote de exames

> Requisição

```bash
curl -X PUT --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exam_groups/1234 \
  --data '{"status": "active"}'
```

> Resposta

```json
{
  "id": 1234,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "exam_locations": [
    {
      "address": "Rua Márcia",
      "number": "4231",
      "neighborhood": "Morro do Barreto",
      "city": "São Roque",
      "state": "SP",
      "postal_code": "19110-000"
    }
  ],
  "dates": [
    "2016-11-01", "2016-11-01",
    "2016-11-01", "2016-11-01"
  ],
  "times": [ "18:30", "19:30"],
  "status": "active",
  "kind": "scheduled",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Unknown status. Please check the API manual at http://docs.queroalunos.com/#suspender-ou-ativar-lote-de-exames"
}
```

> Retorno quando não encontra o grupo de exame

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any exam group by given id."
}
```

Suspende ou ativa um lote de exames.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | Id do grupo de exame vestibular |
| status | string | status a ser alterado |

### Possíveis valores para o parâmetro status

| Nome | Descrição |
| ---- | --------- |
| active | status ativado |
| inactive | status inativo |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do lote de exames |
| course_skus | array | Cursos que usam como entrada algum exame desse lote |
| exam_locations | array | Lista dos objetos dos endereços dos exames desse lote |
| [exam_locations] address | string | Endereço onde será feito o exame vestibular |
| [exam_locations] number | string | Número de onde será feito o exame vestibular |
| [exam_locations] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_locations] city | string | Cidade onde será feito o exame vestibular |
| [exam_locations] state | string | Estado onde será feito o exame vestibular |
| [exam_locations] postal_code | string | Código postal de onde será feito o exame vestibular |
| dates | array | Lista das datas dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| times | array | Lista dos horários de aplicações dos exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação dos exames entre `active` e `inactive` |
| kind | string | Tipo dos exames desse lote |
| created_at | string | Data de criação do lote de exames no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Significado do retorno de status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |

# Informações de exames

## Listar todos os exames

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exams
```

> Resposta

```json
{
  "has_more": false,
  "items": [
    {
      "id": 456,
      "exam_group_id": 123,
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
      "date": "2016-11-01",
      "time": "18:30",
      "status": "active",
      "created_at": "2016-10-01T03:15:44Z"
    }
  ]
}
```

Retorna todos os exames (ativos e suspensos).

Exames são retornados em páginas de até 25 elementos, ordenadas pela última atualização realizada. Se houver mais resultados, `has_more` retorna `true` indicando que é possível usar o parâmetro `ending_before` para consultar dados antecessores à lista atual. Para mais informações, consulte a seção de [paginação](#paginacao).

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista de elementos com dados dos exames |
| id | number | Id do exame vestibular |
| exam_group_id | number | Id referente ao grupo de exame pertencente |
| course_skus | array | Cursos que usam como entrada esse exame vestibular |
| exam_location | object | Objeto do endereço onde será feito o exame vestibular |
| [exam_location] address | string | Endereço onde será feito o exame vestibular |
| [exam_location] number | string | Número de onde será feito o exame vestibular |
| [exam_location] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_location] city | string | Cidade onde será feito o exame vestibular |
| [exam_location] state | string | Estado onde será feito o exame vestibular |
| [exam_location] postal_code | string | Código postal de onde será feito o exame vestibular |
| date | string | Data do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| time | string | Horário do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação do exame entre `active` e `inactive` |
| created_at | string | Data de criação do exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

## Informações de um único exame

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exams/456
```

> Resposta

```json
{
  "id": 456,
  "exam_group_id": 1234,
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
  "date": "2016-11-01",
  "time": "18:30",
  "status": "active",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Resposta quando não encontra nenhum exame

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any exam by given id."
}
```

Retorna um exame específico.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | Id do exame vestibular |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do exame vestibular |
| exam_group_id | number | Id referente ao grupo de exame pertencente |
| course_skus | array | Cursos que usam como entrada esse exame vestibular |
| exam_location | object | Objeto do endereço onde será feito o exame vestibular |
| [exam_location] address | string | Endereço onde será feito o exame vestibular |
| [exam_location] number | string | Número de onde será feito o exame vestibular |
| [exam_location] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_location] city | string | Cidade onde será feito o exame vestibular |
| [exam_location] state | string | Estado onde será feito o exame vestibular |
| [exam_location] postal_code | string | Código postal de onde será feito o exame vestibular |
| date | string | Data do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| time | string | Horário do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação do exame entre `active` e `inactive` |
| created_at | string | Data de criação do exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

## Criação de exame

> Requisição

```bash
curl -X POST --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exams \
  --file "data.json"
```

> estrutura de data.json

```json
{
  "course_skus": [ "ADM-MANHA-SP" ],
  "exam_location": [
    {
      "address": "Rua Márcia",
      "number": "4231",
      "neighborhood": "Morro do Barreto",
      "city": "São Roque",
      "state": "SP",
      "postal_code": "19110-000"
    }
  ],
  "date": "2016-11-01",
  "time": "18:30",
  "status": "active",
  "kind": "scheduled"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Could not validate json file. Make sure you are following the keys and values as described by the API manual on the link http://docs.queroalunos.com/#criacao-de-exame"
}
```

Cria um novo exame.

### Informações dos argumentos

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| course_skus | array | Cursos que usam como entrada algum exame desse lote |
| exam_location | array | Lista dos objetos dos endereços dos exames desse lote |
| [exam_location] address | string | Endereço onde será feito o exame vestibular |
| [exam_location] number | string | Número de onde será feito o exame vestibular |
| [exam_location] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_location] city | string | Cidade onde será feito o exame vestibular |
| [exam_location] state | string | Estado onde será feito o exame vestibular |
| [exam_location] postal_code | string | Código postal de onde será feito o exame vestibular |
| date | string | Data do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| time | string | Horário do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação dos exames entre `active` ou `inactive` |
| kind | string | Tipo dos exames desse lote |

> Resposta

```json
{
  "id": 456,
  "exam_group_id": 1234,
  "course_skus": [ "ADM-MANHA-SP" ],
  "exam_location": [
    {
      "address": "Rua Márcia",
      "number": "4231",
      "neighborhood": "Morro do Barreto",
      "city": "São Roque",
      "state": "SP",
      "postal_code": "19110-000"
    }
  ],
  "date": "2016-11-01",
  "time": "18:30",
  "status": "active",
  "kind": "scheduled"
}
```

### Informações da resposta

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do lote de exames |
| exam_group_id | number | Id referente ao grupo de exame pertencente |
| course_skus | array | Cursos que usam como entrada algum exame desse lote |
| exam_location | array | Lista dos objetos dos endereços dos exames desse lote |
| [exam_location] address | string | Endereço onde será feito o exame vestibular |
| [exam_location] number | string | Número de onde será feito o exame vestibular |
| [exam_location] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_location] city | string | Cidade onde será feito o exame vestibular |
| [exam_location] state | string | Estado onde será feito o exame vestibular |
| [exam_location] postal_code | string | Código postal de onde será feito o exame vestibular |
| date | string | Data do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| time | string | Horário do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação dos exames entre `active` ou `inactive` |
| kind | string | Tipo dos exames desse lote |

### Significado dos status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |

## Suspender ou ativar um exame

> Requisição

```bash
curl -X PUT --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/exams/456 \
  --data '{"status":"active"}'
```

> Resposta

```json
{
  "id": 456,
  "exam_group_id": 123,
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
  "date": "2016-11-01",
  "time": "18:30",
  "status": "active",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Unknown status. Please check the API manual at http://docs.queroalunos.com/#suspender-ou-ativar-um-exame"
}
```

> Resposta quando não encontra nenhum exame

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any exam by given id."
}
```

Suspende ou ativa um exame.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | Id do exame vestibular |
| status | string | status a ser alterado |

### Possíveis valores para o parâmetro status

| Nome | Descrição |
| ---- | --------- |
| active | status ativado |
| inactive | status inativo |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do exame vestibular |
| exam_group_id | number | Id referente ao grupo de exame pertencente |
| course_skus | array | Cursos que usam como entrada esse exame vestibular |
| exam_location | object | Objeto do endereço onde será feito o exame vestibular |
| [exam_location] address | string | Endereço onde será feito o exame vestibular |
| [exam_location] number | string | Número de onde será feito o exame vestibular |
| [exam_location] neighborhood | string | Bairro onde será feito o exame vestibular |
| [exam_location] city | string | Cidade onde será feito o exame vestibular |
| [exam_location] state | string | Estado onde será feito o exame vestibular |
| [exam_location] postal_code | string | Código postal de onde será feito o exame vestibular |
| date | string | Data do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| time | string | Horário do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| status | string | Situação do exame entre `active` e `inactive` |
| created_at | string | Data de criação do exame no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

# Exame de Enem

## Listar todos os exames de Enem

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/enem_exams
```

> Resposta

```json
{
  "has_more": false,
  "items": [
    {
      "id": 789,
      "course_skus": [
        "ADM-MANHA-SP",
        "DIR-MANHA-SP",
        "ADM-NOITE-RJ"
      ],
      "minimum_grades": {
        "redacao": 600.0,
        "humanas": 600.0,
        "natureza": 600.0,
        "linguagens": 600.0,
        "matematica": 600.0
      },
      "status": "active",
      "created_at": "2016-10-01T03:15:44Z"
    }
  ]
}
```

Retorna todos os exames de enem.

Exames de ENEM são retornados em páginas de até 25 elementos, ordenadas pela última atualização realizada. Se houver mais resultados, `has_more` retorna `true` indicando que é possível usar o parâmetro `ending_before` para consultar dados antecessores à lista atual. Para mais informações, consulte a seção de [paginação](#paginacao).

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| starting_after | cursor | Cursor para uso em paginação. Retorna elementos listados após o dado cujo id foi indicado |
| ending_before | cursor | Cursor para uso em paginação. Retorna elementos listados antes do dado cujo id foi indicado |
| start_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados a partir da data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date | string | Data para filtrar a listagem de elementos. Lista apenas elementos criados até a data indicada no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean | Indica se há mais elementos disponíveis antes ou após essa página |
| items | array | Lista de elementos com dados de inscrições de vestibular |
| id | number | Id do exame de enem |
| course_skus | array | Cursos que usam como entrada esse exame de enem |
| minimum_grades | object | Objeto com informações de nota mínima exigida pela faculdade |
| [minimum_grades] redacao | float | Nota mínima de redação exigida pela faculdade |
| [minimum_grades] humanas | float | Nota mínima de humanas exigida pela faculdade |
| [minimum_grades] natureza | float | Nota mínima de natureza exigida pela faculdade |
| [minimum_grades] linguagens | float | Nota mínima de linguagens exigida pela faculdade |
| [minimum_grades] matematica | float | Nota mínima de matemática exigida pela faculdade |
| status | string | Situação do exame de enem entre `active` e `inactive` |
| created_at | string | Data de criação do exame de enem no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

## Informações de um único exame de Enem

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/enem_exams/789
```

> Resposta

```json
{
  "id": 789,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "minimum_grades": {
    "redacao": 600.0,
    "humanas": 600.0,
    "natureza": 600.0,
    "linguagens": 600.0,
    "matematica": 600.0
  },
  "status": "active",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Retorno quando não encontra o exame de enem

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any enem exam by given id."
}
```

Retorna um exame de enem específico.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do exame de enem |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do exame de enem |
| course_skus | array | Cursos que usam como entrada esse exame de enem |
| minimum_grades | object | Objeto com informações de nota mínima exigida pela faculdade |
| [minimum_grades] redacao | float | Nota mínima de redação exigida pela faculdade |
| [minimum_grades] humanas | float | Nota mínima de humanas exigida pela faculdade |
| [minimum_grades] natureza | float | Nota mínima de natureza exigida pela faculdade |
| [minimum_grades] linguagens | float | Nota mínima de linguagens exigida pela faculdade |
| [minimum_grades] matematica | float | Nota mínima de matemática exigida pela faculdade |
| status | string | Situação do exame de enem entre `active` e `inactive` |
| created_at | string | Data de criação do exame de enem no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

## Criação de exame de Enem

> Requisição

```bash
curl -X POST --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/enem_exams \
  --file "data.json"
```

> estrutura de data.json

```json
{
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "minimum_grades": {
    "redacao": 600.0,
    "humanas": 600.0,
    "natureza": 600.0,
    "linguagens": 600.0,
    "matematica": 600.0
  },
  "status": "active"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Could not validate json file. Make sure you are following the keys and values as described by the API manual on the link http://docs.queroalunos.com/#criacao-de-exame-de-enem"
}
```

Cria um exame de enem.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| *.json | json | Arquivo json com as informações do exame de enem |

### Informações dos argumentos

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| course_skus | array | Cursos que usam como entrada esse exame de enem |
| minimum_grades | object | Objeto com informações de nota mínima exigida pela faculdade |
| [minimum_grades] redacao | float | Nota mínima de redação exigida pela faculdade |
| [minimum_grades] humanas | float | Nota mínima de humanas exigida pela faculdade |
| [minimum_grades] natureza | float | Nota mínima de natureza exigida pela faculdade |
| [minimum_grades] linguagens | float | Nota mínima de linguagens exigida pela faculdade |
| [minimum_grades] matematica | float | Nota mínima de matemática exigida pela faculdade |
| status | string | Situação do exame de enem entre `active` e `inactive` |

> Resposta

```json
{
  "id": 789,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "minimum_grades": {
    "redacao": 600.0,
    "humanas": 600.0,
    "natureza": 600.0,
    "linguagens": 600.0,
    "matematica": 600.0
  },
  "status": "active"
}
```

### Informações da resposta

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do exame de enem |
| course_skus | array | Cursos que usam como entrada esse exame de enem |
| minimum_grades | object | Objeto com informações de nota mínima exigida pela faculdade |
| [minimum_grades] redacao | float | Nota mínima de redação exigida pela faculdade |
| [minimum_grades] humanas | float | Nota mínima de humanas exigida pela faculdade |
| [minimum_grades] natureza | float | Nota mínima de natureza exigida pela faculdade |
| [minimum_grades] linguagens | float | Nota mínima de linguagens exigida pela faculdade |
| [minimum_grades] matematica | float | Nota mínima de matemática exigida pela faculdade |
| status | string | Situação do exame de enem entre `active` e `inactive` |

## Suspender um exame de Enem inteiro

> Requisição

```bash
curl -X PUT --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/enem_exams/789 \
  --data '{"status":"inactive"}'
```

> Resposta

```json
{
  "id": 789,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "minimum_grades": {
    "redacao": 600.0,
    "humanas": 600.0,
    "natureza": 600.0,
    "linguagens": 600.0,
    "matematica": 600.0
  },
  "status": "inactive",
  "created_at": "2016-10-01T03:15:44Z"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Unknown status. Please check the API manual at http://docs.queroalunos.com/#suspender-um-exame-de-enem-inteiro"
}
```

> Retorno quando não encontra o exame de enem

```json
{
  "error": true,
  "message": "id not found",
  "description": "Could not find any enem exam by given id."
}
```

Suspende um exame de Enem específico.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do exame de enem |
| status | string | Situação do exame de enem |

### Informações do resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | Id do exame de enem |
| course_skus | array | Cursos que usam como entrada esse exame de enem |
| minimum_grades | object | Objeto com informações de nota mínima exigida pela faculdade |
| [minimum_grades] redacao | float | Nota mínima de redação exigida pela faculdade |
| [minimum_grades] humanas | float | Nota mínima de humanas exigida pela faculdade |
| [minimum_grades] natureza | float | Nota mínima de natureza exigida pela faculdade |
| [minimum_grades] linguagens | float | Nota mínima de linguagens exigida pela faculdade |
| [minimum_grades] matematica | float | Nota mínima de matemática exigida pela faculdade |
| status | string | Situação do exame de enem entre `active` e `inactive` |
| created_at | string | Data de criação do exame de enem no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

## Suspender um exame de Enem parcialmente

> Requisição

```bash
curl --header "Authorization: Token ########" --header "Content-Type: application/json" https://queroalunos.com/api/v1/enem_exams/suspend \
  --file "data.json"
```

> estrutura de data.json

```json
{
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP"
  ]
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Invalid parameters",
  "description": "Could not validate json file. Make sure you are following the keys and values as described by the API manual on the link http://docs.queroalunos.com/#suspender-um-exame-de-enem-parcialmente"
}
```

Suspende um exame de Enem específico.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| *.json | json | Id do exame de enem |

### Informações dos argumentos

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| course_skus | array | Cursos que usam como entrada esse exame de enem |

# Notificações

Notificações utilizam uma rota única de callback, que deve ser fornecida pela faculdade, de um token para autenticação via HTTP Basic.

A rota deve aceitar JSON.

A rota deve aceitar apenas POSTs.

## Definição base do evento

Estrutura base das notificações:

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| created | string | Data que foi criado o evento no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| api_version | string | Informação da versão atual da API |
| event_type | string | Tipo de evento |
| data | object | Objeto com informações de acordo com o tipo de evento |

## Notificar novo processo de admissão

```json
{
  "event_type": "NewAdmission",
  "created": "2017-12-15T17:34:26.173",
  "api_version": "1.0.0",
  "data": {
    "admission": {
      "id": 12345,
      "course_sku": "ADM-MANHA-SP",
      "status": "initiated",
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
      }
    }
  }
}
```

Esta notificação informando uma novo aluno para o processo de admissão na universidade.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| created | string | Data que foi criado o evento no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| api_version | string | Informação da versão atual da API |
| event_type | string | Tipo de evento, no caso `NewAdmission` |
| data | object | Objeto com informações de acordo com o tipo de evento |
| admission | object | Objeto com dados do processo de admissão do aluno |
| [admission] id | number | Id do processo de admissão |
| [admission] course_sku | string | Código do curso referente a essa matrícula |
| [admission] status | string | Status da admissão do aluno |
| [admission] student | object | Objeto com dados do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |

### Significado dos valores em status

| Nome | Descrição |
| ---- | --------- |
| initiated | Inscrição para exame Pendente |
| pending_docs | Documentação Pendente |

## Nova "inscrição para exame" (Vestibular)

```json
{
  "event_type": "NewApplication",
  "created": "2017-12-15T17:34:26.173",
  "api_version": "1.0.0",
  "data": {
    "application": {
      "id": 123456,
      "type": "exam",
      "admission": {
        "id": 12345,
        "course_sku": "ADM-MANHA-SP",
        "status": "pre-registered",
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
      },
      "exam": {
        "id": 456,
        "exam_group_id": 123,
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
        "date": "2016-11-01",
        "time": "18:30",
        "status": "active"
      },
      "result": null
    }
  }
}
```

Esta notificação informando uma nova inscrição para exame via vestibular.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| created | string | Data que foi criado o evento no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| api_version | string | Informação da versão atual da API |
| event_type | string | Tipo de evento, no caso `NewApplication` |
| data | object | Objeto com informações de acordo com o tipo de evento |
| application | object | Objeto com informações do vestibular |
| [application] id | number | Id da inscrição para exame |
| [application] type | string | Tipo de exame vestibular (_neste evento o valor sempre será `exam`_) |
| [application] admission | object | Objeto com dados do processo de admissão do aluno |
| [admission] id | number | Id do processo de admissão |
| [admission] course_sku | string | Código do curso referente a essa matrícula |
| [admission] status | string | Status da admissão do aluno (_neste evento o valor sempre será `pre-registered`_) |
| [admission] student | object | Objeto com dados do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| [application] exam | object | Objeto com informações do exame vestibular|
| [exam] id | number | Id do exame vestibular |
| [exam] exam_group_id | number | Id referente ao grupo de exame pertencente |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] exam_location | object | Objeto com dados do exame vestibular|
| [exam_location] address | string | Endereço da localização do exame vestibular |
| [exam_location] number | string | Número da localização do exame vestibular |
| [exam_location] neighborhood | string | Bairro da localização do exame vestibular |
| [exam_location] city | string | Cidade da localização do exame vestibular |
| [exam_location] state | string | Estado da localização do exame vestibular |
| [exam_location] postal_code | string | Código postal da localização do exame vestibular |
| [exam] date | string | Data da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] time | string | Hora da realização do exame vestibular no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [exam] status | string | Status do exame vestibular |
| [application] result | string | Resultado do exame vestibular (_neste evento o valor sempre será `null`_) |

## Nova "inscrição para exame" (ENEM)

```json
{
  "event_type": "NewApplication",
  "created": "2017-12-15T17:34:26:44Z",
  "api_version": "1.0.0",
  "data": {
    "application": {
      "id": 123456,
      "type": "enem",
      "admission": {
        "id": 12345,
        "course_sku": "ADM-MANHA-SP",
        "status": "pre-registered",
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
      },
      "exam_application_info": {
        "grades": {
          "redacao": 600.0,
          "humanas": 600.0,
          "natureza": 600.0,
          "linguagens": 600.0,
          "matematica": 600.0
        }
      },
      "exam": {
        "id": 456,
        "exam_group_id": 123,
        "course_skus": [
          "ADM-MANHA-SP",
          "DIR-MANHA-SP",
          "ADM-NOITE-RJ"
        ],
        "minimum_grades": {
          "redacao": 600.0,
          "humanas": 600.0,
          "natureza": 600.0,
          "linguagens": 600.0,
          "matematica": 600.0
        },
        "status": "active"
      },
      "result": "pre-registered"
    }
  }
}
```

Esta notificação informa uma nova inscrição para exame via ENEM.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| created | string | Data que foi criado o evento no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| api_version | string | Informação da versão atual da API |
| event_type | string | Tipo de evento, no caso `NewApplication` |
| data | object | Objeto com informações de acordo com o tipo de evento |
| application | object | Objeto com informações do vestibular |
| [application] id | number | Id da inscrição para exame |
| [application] type | string | Tipo de exame vestibular (_neste evento o valor sempre será `enem`_) |
| [application] admission | object | Objeto com dados do processo de admissão do aluno |
| [admission] id | number | Id do processo de admissão |
| [admission] course_sku | string | Código do curso referente a essa matrícula |
| [admission] status | string | Status da admissão do aluno (_neste evento o valor sempre será `pre-registered`_) |
| [admission] student | object | Objeto com dados do aluno |
| [student] id | number | Id do aluno |
| [student] name | string | Nome do aluno |
| [student] cpf | string | CPF do aluno |
| [student] birth_date | string | Data de nascimento do aluno no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| [student] emails | array de string | Lista de emails do aluno |
| [student] phones | array de string | Lista de telefones do aluno |
| [student] address_information | object | Objeto com dados onde aluno reside |
| [address_information] address | string | Endereço onde aluno reside |
| [address_information] number | string | Número onde aluno reside |
| [address_information] neighborhood | string | Bairro onde aluno reside |
| [address_information] city | string | Cidade onde aluno reside |
| [address_information] state | string | Estado onde aluno reside |
| [address_information] postal_code | string | Código postal onde aluno reside |
| [application] exam_application_info | object | Objeto com informações da grade de notas obtida pelo aluno no enem |
| [exam_application_info] grades | object | Objeto com informações de notas obtida pelo aluno no enem |
| [grades] redacao | float | Nota obtida pelo aluno na redação |
| [grades] humanas | float | Nota obtida pelo aluno em humanas |
| [grades] natureza | float | Nota obtida pelo aluno em natureza |
| [grades] linguagens | float | Nota obtida pelo aluno em linguagens |
| [grades] matematica | float | Nota obtida pelo aluno em matemática |
| [application] exam | object | Objeto com informações do exame vestibular|
| [exam] id | number | Id do exame vestibular |
| [exam] exam_group_id | number | Id referente ao grupo de exame pertencente |
| [exam] course_skus | array | Lista com os cursos pertencentes a este exame vestibular |
| [exam] minimum_grades | object | Objeto com informações de nota mínima exigida pela faculdade |
| [minimum_grades] redacao | float | Nota mínima de redação exigida pela faculdade |
| [minimum_grades] humanas | float | Nota mínima de humanas exigida pela faculdade |
| [minimum_grades] natureza | float | Nota mínima de natureza exigida pela faculdade |
| [minimum_grades] linguagens | float | Nota mínima de linguagens exigida pela faculdade |
| [minimum_grades] matematica | float | Nota mínima de matemática exigida pela faculdade |
| [exam] status | string | Status do exame vestibular |
| [application] result | string | Resultado do exame vestibular (_neste evento o valor sempre será `null`_) |

## Listagem de notificações

> Requisição

```bash
curl --header "Authorization: Base ########" --header "Content-Type: application/json" https://queroalunos.com/api/{version}/notifications/search
```

> Resposta

```json
{
  "has_more": true,
  "notifications": [
    {...}
  ]
}
```

Lista eventos enviados

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| start_date     | string | Data inicial do filtro no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| end_date       | string | Data final do filtro no formato UTC [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| starting_after | string | Cursor para a próxima página
| ending_before  | string | Cursor para a página anterior

### Informações de retorno

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| has_more | boolean          | indica a existência de outras páginas |
| items    | array de objetos | lista de notificações: [referência](#definicao-base-do-evento)
