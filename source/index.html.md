---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  -

search: true
---

# Começando com API da Quero Alunos
Seja bem vindo a docuentação da Quero Alunos. Aqui você encontrará guias e referencias sobre como usar nossa API. Qualquer dúvida pode estar enviando email para devs-integracao@queroeducacao.com

## Informações básicas

Todas as respostas da API são feitas em JSON

Endpoint utilizado

`https://queroalunos.com/api/{version}/`


# Autentificação

```
POST https://queroalunos.com/api/v1/{action} HTTP/1.1
Content-Type: application/json
authorization: Basic ••••••••••••
```

Todas as requisições são autenticadas por um token adicionado ao header.
Caso não tenha o token solicite-o ao setor de desenvolvimento da QE.

## Requisição sem token
```
Ausência de Token
Status Code: 401 UNAUTHORIZED
www-authenticate: 'Basic realm="University Panel"'
```

Em caso de requisição sem o envio do token será retornado status 401 - UNAUTHORIZED.

## Requisição com token inválido

```
Formato de token inválido
Status Code: 400 NOT FOUND
```

Em caso de token em formato inválido será retornado status 400 - NOT FOUND.

## Requisição com token não autorizado

```
Não autorizado
Status Code: 403 Forbidden
```

Em caso de token não autorizado será retornado erro 403 - Forbidden.

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
    "detail": "You are not authorized to access this resource with this params"
  }]
}
```

Em caso de token válido mas sem permissão de acesso ao recurso especifico

# Informações de alunos

## Busca de alunos por CPF

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/students?cpf=111.222.333-44
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
    "admissions": {
      "id": 12345,
      "course_sku": "ADM-NOITE-EAD",
      "status": "pending_docs"
    }
  }
]
```

> Resposta quando não encontra nenhum aluno

```json
{
  "error": true,
  "message": "CPF não encontrado"
}
```

Encontra um ou mais alunos na base do QueroAlunos a partir de um dado CPF.

Somente busca por usuários que tenham pré-matrícula na faculdade pertencente ao usuário fazendo pesquisa.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| cpf | Query| CPF do aluno procurado. Exige CPF completamente formatado (ex: 123.456.789-10). |

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
| address | string | endereço onde aluno reside |
| number | string | número onde aluno reside |
| neighborhood | string | bairro onde aluno reside |
| city | string | cidade onde aluno reside |
| state | string | estado onde aluno reside |
| postal_code | string | código postal onde aluno reside |
| admissions | object | objeto com informações de processo de matricula |
| id (admissions) | number | id do processo de matricula |
| course_sku | string | código do curso fornecido pela universidade |
| status | string | status que se encontra o processo de matricula |

### Significado dos status
| Nome | Descrição |
| ---- | --------- |
| initiated | Processo Seletivo Pendente |
| pre_registered | Agendamento Solicitado |
| registered | Agendamento Confirmado |
| failed | Reprovado |
| approved | Aprovado |
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
curl --user secretary:password http://queroalunos.com/api/students/{id}
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
  "admissions": {
    "id": 12345,
    "course_sku": "ADM-NOITE-EAD",
    "status": "pending_docs"
  }
}
```
> Resposta quando não encontra nenhum aluno

```json
{
  "error": true,
  "message": "CPF não encontrado"
}
```

Somente busca por usuários que tenham pré-matrícula na faculdade pertencente ao usuário fazendo pesquisa.

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
| address | string | endereço onde aluno reside |
| number | string | número onde aluno reside |
| neighborhood | string | bairro onde aluno reside |
| city | string | cidade onde aluno reside |
| state | string | estado onde aluno reside |
| postal_code | string | código postal onde aluno reside |
| admissions | object | objeto com informações de processo de matricula |
| id (admissions) | number | id do processo de matricula |
| course_sku | string | código do curso fornecido pela universidade |
| status | string | status que se encontra o processo de matricula |

### Significado dos status
| Nome | Descrição |
| ---- | --------- |
| initiated | Processo Seletivo Pendente |
| pre_registered | Agendamento Solicitado |
| registered | Agendamento Confirmado |
| failed | Reprovado |
| approved | Aprovado |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |
| dropped_out | Desistente |
| dropping_out | Desistindo |
| drop_out_confirmed | Desistência confirmada |

# Inscrições em vestibular

## Listar todas inscrições

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/applications
```

> Resposta

```json
{
  "items": [
    {
      "id": 123456,
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
      "exam": {
        "course_skus": [
          "ADM-MANHA-SP",
          "DIR-MANHA-SP",
          "ADM-NOITE-RJ"
        ],
        "local": {
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
      "result": "registered",
      "type": "exam"
    }
  ],
  "cursor": "ASAKDSaldlwp20"
}
```

Retorna todas as inscrições de processo seletivo da faculdade.

Inscrições são retornadas em lote de 10, ordenadas pela última atualização realizada no processo seletivo. Se houver mais resultados, retorna um valor `cursor` adicional que deve ser utilizado de parâmetro na próxima requisição para continuar.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
|`cursor` | Query | valor cursor utilizado para continuar uma paginação anterior |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| items | array| lista de objetos com dados de inscrições de vestibular |
| id | number | id do vestibular |
| student | object | objeto com dados do aluno |
| id (student) | number | id do aluno. |
| name | string | nome do aluno |
| cpf | string | cpf do aluno |
| birth_date | string | data de nascimento do aluno |
| emails | array de string | lista de emails do aluno |
| phones | array de string | lista de telefones do aluno |
| address_information | object | objeto com dados onde aluno reside |
| address | string | endereço onde aluno reside |
| number | string | número onde aluno reside |
| neighborhood | string | bairro onde aluno reside |
| city | string | cidade onde aluno reside |
| state | string | estado onde aluno reside |
| postal_code | string | código postal onde aluno reside |
| exam | object | objeto com informações do exame |
| course_skus | array | lista com os cursos pertencentes a este exame |
| local | object | objeto com dados do exame |
| address | string | endereço da localização do vestibular |
| number | string | número da localização do vestibular |
| neighborhood | string | bairro da localização do vestibular |
| city | string | cidade da localização do vestibular |
| state | string | estado da localização do vestibular |
| postal_code | string | código postal da localização do vestibular |
| dates | string | data da realização do vestibular |
| times | string | hora da realização do vestibular |
| status | string | status do vestibular |
| result | string | resultado do vestibular |
| type | string | tipo de exame (exam ou enem) |
| cursor | string | código para pegar os próximos passos |


## Informações de um único vestibular

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/applications/123456
```

> Resposta

```json
{
  "id": 123456,
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
  "exam": {
    "course_skus": [
      "ADM-MANHA-SP",
      "DIR-MANHA-SP",
      "ADM-NOITE-RJ"
    ],
    "address": {
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
  "result": "registered",
  "type": "exam"
}
```

> Resposta quando não encontra nenhum aluno

```json
{
  "error": true,
  "message": "ID não encontrado"
}
```

Retorna uma inscrição específica no processo seletivo da faculdade.

Inscrições são retornadas em lote de 10, ordenadas pela última atualização realizada no processo seletivo. Se houver mais resultados, rota retorna um valor cursor adicional que deve ser utilizado de parâmetro na próxima requisição para continuar.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | Path | ID da inscrição |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do vestibular |
| student | object | objeto com dados do aluno |
| id (student) | number | id do aluno. |
| name | string | nome do aluno |
| cpf | string | cpf do aluno |
| birth_date | string | data de nascimento do aluno |
| emails | array de string | lista de emails do aluno |
| phones | array de string | lista de telefones do aluno |
| address_information | object | objeto com dados onde aluno reside |
| address | string | endereço onde aluno reside |
| number | string | número onde aluno reside |
| neighborhood | string | bairro onde aluno reside |
| city | string | cidade onde aluno reside |
| state | string | estado onde aluno reside |
| postal_code | string | código postal onde aluno reside |
| exam | object | objeto com informações do exame |
| course_skus | array | lista com os cursos pertencentes a este exame |
| local | object | objeto com dados do exame |
| address | string | endereço da localização do vestibular |
| number | string | número da localização do vestibular |
| neighborhood | string | bairro da localização do vestibular |
| city | string | cidade da localização do vestibular |
| state | string | estado da localização do vestibular |
| postal_code | string | código postal da localização do vestibular |
| dates | string | data da realização do vestibular |
| times | string | hora da realização do vestibular |
| status | string | status do vestibular |
| result | string | resultado do vestibular |
| type | string | tipo de exame (exam ou enem) |


## Atualização de processo seletivo

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/applications/123456 \
  -d status="approved"
```

> Resposta

```json
{
  "id": 123456,
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
  "exam": {
    "course_skus": [
      "ADM-MANHA-SP",
      "DIR-MANHA-SP",
      "ADM-NOITE-RJ"
    ],
    "address": {
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
  "result": "approved",
  "type": "exam"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Situação fornecida não é válida"
}
```

> Retorno quando não encontra o vestibular

```json
{
  "error": true,
  "message": "ID não encontrado"
}
```

Atualiza o progresso no processo seletivo de um dado aluno.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| status | Form | Situação do aluno entre `registered`, `approved`, `failed` |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do vestibular |
| student | object | objeto com dados do aluno |
| id (student) | number | id do aluno. |
| name | string | nome do aluno |
| cpf | string | cpf do aluno |
| birth_date | string | data de nascimento do aluno |
| emails | array de string | lista de emails do aluno |
| phones | array de string | lista de telefones do aluno |
| address_information | object | objeto com dados onde aluno reside |
| address | string | endereço onde aluno reside |
| number | string | número onde aluno reside |
| neighborhood | string | bairro onde aluno reside |
| city | string | cidade onde aluno reside |
| state | string | estado onde aluno reside |
| postal_code | string | código postal onde aluno reside |
| exam | object | objeto com informações do exame |
| course_skus | array | lista com os cursos pertencentes a este exame |
| local | object | objeto com dados do exame |
| address | string | endereço da localização do vestibular |
| number | string | número da localização do vestibular |
| neighborhood | string | bairro da localização do vestibular |
| city | string | cidade da localização do vestibular |
| state | string | estado da localização do vestibular |
| postal_code | string | código postal da localização do vestibular |
| dates | string | data da realização do vestibular |
| times | string | hora da realização do vestibular |
| status | string | status do vestibular |
| result | string | resultado do vestibular |
| type | string | tipo de exame (exam ou enem) |

### Significado do retorno de status

| Status | Descrição |
| ------ | --------- |
| registered | Registrado para realizar vestibular |
| approved | Aprovado no vestibular |
| failed | Recusado no vestibular |

# Informações de admissões

## Listar todas admissões

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/admissions
```

> Resposta

```json
{
  "items": [
    {
      "id": 12345,
      "course_sku": "ADM-MANHA-SP",
      "status": "pending_docs",
      "application": {
        "id": 123456,
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
        "exam": {
          "course_skus": [
            "ADM-MANHA-SP",
            "DIR-MANHA-SP",
            "ADM-NOITE-RJ"
          ],
          "local": {
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
        "result": "registered",
        "type": "exam"
      }
    }
  ],
  "cursor": "ASAKDSaldlwp20"
}
```

Retorna todas as admissões da faculdade.

Admissões são retornadas em lote de 10, ordenadas pela última atualização realizada. Se houver mais resultados, retorna um valor `cursor` adicional que deve ser utilizado de parâmetro na próxima requisição para continuar.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| `cursor` | Query | valor cursor utilizado para continuar uma paginação anterior |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| items | array | lista de objetos com dados de inscrições de vestibular |
| id | number | id da admissão |
| course_sku | string | código do curso referente a essa matrícula |
| status | string | status da admissão do aluno |
| application | object | objeto do vestibular referente a essa admissão |
| application[id] | number | id do vestibular |
| application[student] | object | objeto com os dados do aluno referente a essa matrícula |
| student[id] | number | id do aluno |
| student[name] | string | nome do aluno |
| student[cpf] | string | cpf do aluno |
| student[birth_date] | string | data de nascimento do aluno |
| student[emails] | array de string | lista de emails do aluno |
| student[phones] | array de string | lista de telefones do aluno |
| student[address_information] | object | objeto com dados onde aluno reside |
| address_information[address] | string | endereço onde aluno reside |
| address_information[number] | string | número onde aluno reside |
| address_information[neighborhood] | string | bairro onde aluno reside |
| address_information[city] | string | cidade onde aluno reside |
| address_information[state] | string | estado onde aluno reside |
| address_information[postal_code] | string | código postal onde aluno reside |
| exam | object | objeto com informações do exame referente a essa matrícula |
| exam[course_skus] | array | lista com os cursos pertencentes a este exame |
| exam[local] | object | objeto com dados do local do exame |
| local[address] | string | endereço da localização do vestibular |
| local[number] | string | número da localização do vestibular |
| local[neighborhood] | string | bairro da localização do vestibular |
| local[city] | string | cidade da localização do vestibular |
| local[state] | string | estado da localização do vestibular |
| local[postal_code] | string | código postal da localização do vestibular |
| exam[dates] | string | data da realização do vestibular |
| exam[times] | string | hora da realização do vestibular |
| exam[status] | string | status do vestibular |
| application[result] | string | resultado do vestibular |
| application[type] | string | tipo de exame (exam ou enem) |
| cursor | string | código para pegar os próximos passos |

## Informações de uma única admissão

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/admissions/12345
```

> Resposta

```json
{
  "id": 12345,
  "course_sku": "ADM-MANHA-SP",
  "status": "pending_docs",
  "application": {
    "id": 123456,
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
    "exam": {
      "course_skus": [
        "ADM-MANHA-SP",
        "DIR-MANHA-SP",
        "ADM-NOITE-RJ"
      ],
      "local": {
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
    "result": "registered",
    "type": "exam"
  }
}
```

> Resposta quando não encontra nenhuma admissão

```json
{
  "error": true,
  "message": "ID não encontrado"
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
| items | array | lista de objetos com dados de inscrições de vestibular |
| id | number | id da admissão |
| course_sku | string | código do curso referente a essa matrícula |
| status | string | status da admissão do aluno |
| application | object | objeto do vestibular referente a essa admissão |
| application[id] | number | id do vestibular |
| application[student] | object | objeto com os dados do aluno referente a essa matrícula |
| student[id] | number | id do aluno |
| student[name] | string | nome do aluno |
| student[cpf] | string | cpf do aluno |
| student[birth_date] | string | data de nascimento do aluno |
| student[emails] | array de string | lista de emails do aluno |
| student[phones] | array de string | lista de telefones do aluno |
| student[address_information] | object | objeto com dados onde aluno reside |
| address_information[address] | string | endereço onde aluno reside |
| address_information[number] | string | número onde aluno reside |
| address_information[neighborhood] | string | bairro onde aluno reside |
| address_information[city] | string | cidade onde aluno reside |
| address_information[state] | string | estado onde aluno reside |
| address_information[postal_code] | string | código postal onde aluno reside |
| exam | object | objeto com informações do exame referente a essa matrícula |
| exam[course_skus] | array | lista com os cursos pertencentes a este exame |
| exam[local] | object | objeto com dados do local do exame |
| local[address] | string | endereço da localização do vestibular |
| local[number] | string | número da localização do vestibular |
| local[neighborhood] | string | bairro da localização do vestibular |
| local[city] | string | cidade da localização do vestibular |
| local[state] | string | estado da localização do vestibular |
| local[postal_code] | string | código postal da localização do vestibular |
| exam[dates] | string | data da realização do vestibular |
| exam[times] | string | hora da realização do vestibular |
| exam[status] | string | status do vestibular |
| application[result] | string | resultado do vestibular |
| application[type] | string | tipo de exame (exam ou enem) |

## Atualização de admissão

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/admissions/12345 \
  -d status="submitted_docs"
```

> Resposta

```json
{
  "id": 12345,
  "course_sku": "ADM-MANHA-SP",
  "status": "submitted_docs",
  "application": {
    "id": 123456,
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
    "exam": {
      "course_skus": [
        "ADM-MANHA-SP",
        "DIR-MANHA-SP",
        "ADM-NOITE-RJ"
      ],
      "local": {
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
    "result": "registered",
    "type": "exam"
  }
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Situação fornecida não é válida"
}
```

> Retorno quando não encontra a admissão

```json
{
  "error": true,
  "message": "ID não encontrado"
}
```

Atualiza o status admissão específica.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| status | form | situação da admissão |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| items | array | lista de objetos com dados de inscrições de vestibular |
| id | number | id da admissão |
| course_sku | string | código do curso referente a essa matrícula |
| status | string | status da admissão do aluno |
| application | object | objeto do vestibular referente a essa admissão |
| application[id] | number | id do vestibular |
| application[student] | object | objeto com os dados do aluno referente a essa matrícula |
| student[id] | number | id do aluno |
| student[name] | string | nome do aluno |
| student[cpf] | string | cpf do aluno |
| student[birth_date] | string | data de nascimento do aluno |
| student[emails] | array de string | lista de emails do aluno |
| student[phones] | array de string | lista de telefones do aluno |
| student[address_information] | object | objeto com dados onde aluno reside |
| address_information[address] | string | endereço onde aluno reside |
| address_information[number] | string | número onde aluno reside |
| address_information[neighborhood] | string | bairro onde aluno reside |
| address_information[city] | string | cidade onde aluno reside |
| address_information[state] | string | estado onde aluno reside |
| address_information[postal_code] | string | código postal onde aluno reside |
| exam | object | objeto com informações do exame referente a essa matrícula |
| exam[course_skus] | array | lista com os cursos pertencentes a este exame |
| exam[local] | object | objeto com dados do local do exame |
| local[address] | string | endereço da localização do vestibular |
| local[number] | string | número da localização do vestibular |
| local[neighborhood] | string | bairro da localização do vestibular |
| local[city] | string | cidade da localização do vestibular |
| local[state] | string | estado da localização do vestibular |
| local[postal_code] | string | código postal da localização do vestibular |
| exam[dates] | string | data da realização do vestibular |
| exam[times] | string | hora da realização do vestibular |
| exam[status] | string | status do vestibular |
| application[result] | string | resultado do vestibular |
| application[type] | string | tipo de exame (exam ou enem) |

### Significado do retorno de status

| Status | Descrição |
| ------ | --------- |
| initiated | Processo Seletivo Pendente |
| pre_registered | Agendamento Solicitado |
| registered | Agendamento Confirmado |
| failed | Reprovado |
| approved | Aprovado |
| pending_docs | Documentação Pendente |
| submitted_docs | Documentação Enviada |
| rejected_docs | Documentação Rejeitada |
| enrolled | Matriculado |
| dropped_out | Desistente |
| dropping_out | Desistindo |
| drop_out_confirmed | Desistência confirmada |

# Exames em lote

## Listar todos os exames em lote

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/exam_groups
```

> Resposta

```json
{
  "items": [
    {
      "id": 1234,
      "course_skus": [
        "ADM-MANHA-SP",
        "DIR-MANHA-SP",
        "ADM-NOITE-RJ"
      ],
      "addresses": [
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
  ],
  "cursor": "ASAKDSaldlwp20"
}
```

Retorna todos os exames em lote.

Exames em lote são retornados de 10 em 10, ordenadas pela última atualização realizada. Se houver mais resultados, retorna um valor `cursor` adicional que deve ser utilizado de parâmetro na próxima requisição para continuar.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| `cursor` | Query | valor cursor utilizado para continuar uma paginação anterior |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do lote de exames |
| course_skus | array | cursos que usam como entrada algum exame desse lote |
| addresses | object array | lista dos objetos dos endereços dos exames desse lote |
| addresses[address] | string | endereço onde será feito o exame |
| addresses[number] | string | número de onde será feito o exame |
| addresses[neighborhood] | string | bairro onde será feito o exame |
| addresses[city] | string | cidade onde será feito o exame |
| addresses[state] | string | estado onde será feito o exame |
| addresses[postal_code] | string | código postal de onde será feito o exame |
| dates | array | lista das datas dos exames |
| times | array | lista dos horários de aplicações dos exames |
| status | string | situação dos exames entre `active`, `inactive` e `partially_active` |
| kind | string | tipo dos exames desse lote |
| cursor | string | código para pegar os próximos passos |

## Informações de um único lote de exames

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/exam_groups/1234
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
  "addresses": [
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

> Resposta quando não encontra nenhum lote de exames

```json
{
  "error": true,
  "message": "ID não encontrado"
}
```
(No arquivo do ruerro nao tinha id nessa tabela, mas to considerando que tenha, pq essa parte só vai fazer sentido se tiver)
Retorna um lote de exames específico.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | id do lote de exames |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do lote de exames |
| course_skus | array | cursos que usam como entrada algum exame desse lote |
| addresses | object array | lista dos objetos dos endereços dos exames desse lote |
| addresses[address] | string | endereço onde será feito o exame |
| addresses[number] | string | número de onde será feito o exame |
| addresses[neighborhood] | string | bairro onde será feito o exame |
| addresses[city] | string | cidade onde será feito o exame |
| addresses[state] | string | estado onde será feito o exame |
| addresses[postal_code] | string | código postal de onde será feito o exame |
| dates | array | lista das datas dos exames |
| times | array | lista dos horários de aplicações dos exames |
| status | string | situação dos exames entre `active`, `inactive` e `partially_active` |
| kind | string | tipo dos exames desse lote |

## Criação de exames em lote

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/exam_groups/new
  \ -d "data.json"
```

> data.json

```json
{
  "id": 1234,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "addresses": [
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

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "(Mensagem do SQL?)"
}
```

Cria um lote de exames.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| *.json | json | arquivo json com as informações do lote de exames |

### Informações dos argumentos

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do lote de exames |
| course_skus | array | cursos que usam como entrada algum exame desse lote |
| addresses | object array | lista dos objetos dos endereços dos exames desse lote |
| addresses[address] | string | endereço onde será feito o exame |
| addresses[number] | string | número de onde será feito o exame |
| addresses[neighborhood] | string | bairro onde será feito o exame |
| addresses[city] | string | cidade onde será feito o exame |
| addresses[state] | string | estado onde será feito o exame |
| addresses[postal_code] | string | código postal de onde será feito o exame |
| dates | array | lista das datas dos exames |
| times | array | lista dos horários de aplicações dos exames |
| status | string | situação dos exames entre `active`, `inactive` e `partially_active` |
| kind | string | tipo dos exames desse lote |

### Significado dos status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |
| partially_active | Algumas combinações de exame nesse lote não estão ativas para serem escolhidas |

## Suspender lote de exames

> Requisição

```bash
curl -X PUT --user secretary:password http://queroalunos.com/api/exam_groups/1234/status
  \ -d 'inactive'
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
  "addresses": [
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
  "status": "inactive",
  "kind": "scheduled"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "Situação fornecida não é válida"
}
```

> Retorno quando não encontra a admissão

```json
{
  "error": true,
  "message": "ID não encontrado"
}
```

Suspende um lote de exames.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| status | form | novo status do lote de exames |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do lote de exames |
| course_skus | array | cursos que usam como entrada algum exame desse lote |
| addresses | object array | lista dos objetos dos endereços dos exames desse lote |
| addresses[address] | string | endereço onde será feito o exame |
| addresses[number] | string | número de onde será feito o exame |
| addresses[neighborhood] | string | bairro onde será feito o exame |
| addresses[city] | string | cidade onde será feito o exame |
| addresses[state] | string | estado onde será feito o exame |
| addresses[postal_code] | string | código postal de onde será feito o exame |
| dates | array | lista das datas dos exames |
| times | array | lista dos horários de aplicações dos exames |
| status | string | situação dos exames entre `active`, `inactive` e `partially_active` |
| kind | string | tipo dos exames desse lote |

### Significado do retorno de status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |
| partially_active | Algumas combinações de exame nesse lote não estão ativas para serem escolhidas |

# Informações de exames

## Listar todos os exames

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/exams
```

> Resposta

```json
{
  "items": [
    {
      "id": 456,
      "course_skus": [
        "ADM-MANHA-SP",
        "DIR-MANHA-SP",
        "ADM-NOITE-RJ"
      ],
      "address": {
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
    }
  ]
  "cursor": "ASAKDSaldlwp20"
}
```

Retorna todos os exames (ativos e suspensos).

Exames são retornadas em lote de 10, ordenadas pela última atualização realizada. Se houver mais resultados, retorna um valor `cursor` adicional que deve ser utilizado de parâmetro na próxima requisição para continuar.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| `cursor` | Query | valor cursor utilizado para continuar uma paginação anterior |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| items | array | lista de objetos dos exames |
| id | number | id do exame |
| course_skus | array | cursos que usam como entrada esse exame |
| address | object | objeto do endereço onde será feito o exame |
| address[address] | string | endereço onde será feito o exame |
| address[number] | string | número de onde será feito o exame |
| address[neighborhood] | string | bairro onde será feito o exame |
| address[city] | string | cidade onde será feito o exame |
| address[state] | string | estado onde será feito o exame |
| address[postal_code] | string | código postal de onde será feito o exame |
| dates | string | data do exame |
| times | string | horário do exame |
| status | string | situação do exame entre `active` e `inactive` |
| cursor | string | código para pegar os próximos passos |

## Informações de um único exame

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/exams/456
```

> Resposta

```json
{
  "id": 456,
  "course_skus": [
    "ADM-MANHA-SP",
    "DIR-MANHA-SP",
    "ADM-NOITE-RJ"
  ],
  "address": {
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
}
```

> Resposta quando não encontra nenhum exame

```json
{
  "error": true,
  "message": "ID não encontrado"
}
```
(No arquivo do ruerro nao tinha id nessa tabela, mas to considerando que tenha, pq essa parte só vai fazer sentido se tiver)
Retorna um exame específico.

### Parâmetros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | path | id do exame |

### Informações de resultado

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do exame |
| course_skus | array | cursos que usam como entrada esse exame |
| address | object | objeto do endereço onde será feito o exame |
| address[address] | string | endereço onde será feito o exame |
| address[number] | string | número de onde será feito o exame |
| address[neighborhood] | string | bairro onde será feito o exame |
| address[city] | string | cidade onde será feito o exame |
| address[state] | string | estado onde será feito o exame |
| address[postal_code] | string | código postal de onde será feito o exame |
| dates | string | data do exame |
| times | string | horário do exame |
| status | string | situação do exame entre `active` e `inactive` |

## Criação de exame

> Requisição

```bash
curl --user secretary:password http://queroalunos.com/api/exam_groups/new
  \ -d "data.json"
```

> data.json

```json
{
  "id": 1234,
  "course_skus": [ "ADM-MANHA-SP" ],
  "addresses": [
    {
      "address": "Rua Márcia",
      "number": "4231",
      "neighborhood": "Morro do Barreto",
      "city": "São Roque",
      "state": "SP",
      "postal_code": "19110-000"
    }
  ],
  "dates": [ "2016-11-01" ],
  "times": [ "18:30" ],
  "status": "active",
  "kind": "scheduled"
}
```

> Retorno quando parâmetros estão incorretos

```json
{
  "error": true,
  "message": "(Mensagem do SQL?)"
}
```

Cria um exame na estrutura de exames em lote (está certo, mesmo se criar apenas um exame, o que precisa ser criado é um exam_group).

### Informações dos argumentos

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| id | number | id do lote de exames |
| course_skus | array | cursos que usam como entrada algum exame desse lote |
| addresses | object array | lista dos objetos dos endereços dos exames desse lote |
| addresses[address] | string | endereço onde será feito o exame |
| addresses[number] | string | número de onde será feito o exame |
| addresses[neighborhood] | string | bairro onde será feito o exame |
| addresses[city] | string | cidade onde será feito o exame |
| addresses[state] | string | estado onde será feito o exame |
| addresses[postal_code] | string | código postal de onde será feito o exame |
| dates | array | lista das datas dos exames |
| times | array | lista dos horários de aplicações dos exames |
| status | string | situação dos exames entre `active`, `inactive` e `partially_active` |
| kind | string | tipo dos exames desse lote |

### Significado dos status

| Status | Descrição |
| ------ | --------- |
| active | Todas as combinações de exame nesse lote estão ativas para serem escolhidas |
| inactive | Nenhuma combinação de exame nesse lote está ativa para ser escolhida |
| partially_active | Algumas combinações de exame nesse lote não estão ativas para serem escolhidas |

# Notificações

Notificações utilizam uma rota única de callback, que deve ser fornecida pela faculdade, junto de uma combinação usuário/senha para autenticação via HTTP Basic.

A rota deve aceitar JSON.

A rota deve aceitar apenas POSTs.

## Definição base do evento

```
 {
  event_type: string,
  created: timestamp,
  api_version: string,
  data: object
}
```

Estrutura base das notificações:

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| created | string | data que foi criado o evento (timestamp UTC)
| api_version | string | informação da versão atual da API
| event_type | string | tipo de evento |
| data | object | Objeto com informações de acordo com o tipo de evento |

## Notificação de nova inscrição de vestibular

```json
{
  "event_type": "NewApplication",
  "created": "2017-12-15T17:34:26.173",
  "api_version": "1.0.0",
  "data": {
    "application": {
      "id": 123456,
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
      "exam": {
        "course_skus": [
          "ADM-MANHA-SP",
          "DIR-MANHA-SP",
          "ADM-NOITE-RJ"
        ],
        "address": {
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
      "result": "preregistered",
      "type": "exam"
    }
  }
}
```

Indica que uma nova inscrição para vestibular foi feita

### Parametros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| created | string | data que foi criado o evento (timestamp UTC)
| api_version | string | informação da versão atual da API
| event_type | string | tipo de evento, no caso `NewApplication` |
| data | object | Objeto com informações de acordo com o tipo de evento |
| application | object | objeto com informações do vestibular |
| id | number | id do vestibular |
| student | object | objeto com dados do aluno |
| id (student) | number | id do aluno. |
| name | string | nome do aluno |
| cpf | string | cpf do aluno |
| birth_date | string | data de nascimento do aluno |
| emails | array de string | lista de emails do aluno |
| phones | array de string | lista de telefones do aluno |
| address_information | object | objeto com dados onde aluno reside |
| address | string | endereço onde aluno reside |
| number | string | número onde aluno reside |
| neighborhood | string | bairro onde aluno reside |
| city | string | cidade onde aluno reside |
| state | string | estado onde aluno reside |
| postal_code | string | código postal onde aluno reside |
| exam | object | objeto com informações do exame |
| course_skus | array | lista com os cursos pertencentes a este exame |
| local | object | objeto com dados do exame |
| address | string | endereço da localização do vestibular |
| number | string | número da localização do vestibular |
| neighborhood | string | bairro da localização do vestibular |
| city | string | cidade da localização do vestibular |
| state | string | estado da localização do vestibular |
| postal_code | string | código postal da localização do vestibular |
| dates | string | data da realização do vestibular |
| times | string | hora da realização do vestibular |
| status | string | status do vestibular |
| result | string | resultado do vestibular |
| type | string | tipo de exame (exam ou enem) |
