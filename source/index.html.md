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

`https://queroalunos.com/api/{version}/`


# Autenticação

```
POST https://queroalunos.com/api/v1/{action} HTTP/1.1
Content-Type: application/json
authorization: Basic ••••••••••••
```

Todas as requisições são autenticadas por um token adicionado ao header.
Caso não tenha o token, solicite-o ao setor de desenvolvimento da Quero Educação.

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
    "detail": "You are not authorized to access this resource with these paramaters"
  }]
}
```

Em caso de token válido mas sem permissão de acesso ao recurso específico


# Informações de alunos

## Busca de alunos por CPF

> Requisição

```bash
curl --header "Authorization: Base ########" --header "Content-Type: application/json" https://queroalunos.com/api/students?cpf=111.222.333-44
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
  "message": "CPF não encontrado"
}
```

Encontra um ou mais alunos a partir de um dado CPF.

Somente busca por alunos que tenham pré-matrícula na faculdade pertencente ao usuário fazendo pesquisa.

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
| [address_information] address | string | endereço onde aluno reside |
| [address_information] number | string | número onde aluno reside |
| [address_information] neighborhood | string | bairro onde aluno reside |
| [address_information] city | string | cidade onde aluno reside |
| [address_information] state | string | estado onde aluno reside |
| [address_information] postal_code | string | código postal onde aluno reside |
| admissions | array | lista de objeto com informações de processo de matricula |
| id (admissions) | number | id do processo de matricula |
| course_sku (admissions) | string | código do curso fornecido pela universidade |
| status (admissions) | string | status que se encontra o processo de matricula |

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
curl --header "Authorization: Base ########" --header "Content-Type: application/json" https://queroalunos.com/api/students/{id}
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
  "message": "ID não encontrado"
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
