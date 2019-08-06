---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  -

search: true
---

# API de Consultas do Quero Pago

Bem-vindo à documentação da API de Consultas do Quero Pago. Aqui você encontrará guias e referências sobre como utilizar nossa API. Qualquer dúvida, entre em contato pelo email queropago@queroeducacao.com.

## Informações básicas

Todas as respostas da API são feitas em JSON

Endpoint utilizado em ambiente de **produção**: `https://queropago.com.br/api/v1`

Endpoint utilizado em ambiente de **testes**: `https://sandbox.queropago.com.br/api/v1`

# Autenticação

```http
GET https://queropago.com.br/api/v1/RESOURCE HTTP/1.1
Content-Type: application/json
Authorization: Bearer ••••••••••••
```

Todas as requisições são autenticadas por um token adicionado ao header.
Caso não tenha o token, solicite-o ao setor de desenvolvimento da Quero Educação.

## Requisição sem token

```http
HTTP/1.1 401 Unauthorized
www-authenticate: 'Bearer realm="Quero Pago"'
```

Em caso de requisição sem o envio do token será retornado status `401 - Unauthorized`.

## Requisição com token inválido

```http
HTTP/1.1 400 Bad Request
```

Em caso de token em formato inválido será retornado status `400 - Bad Request`.

## Requisição com token não autorizado

```http
HTTP/1.1 403 Forbidden
```

Em caso de token não autorizado será retornado erro `403 - Forbidden`.

## Requisição com token sem permissão

```http
HTTP/1.1 403 Forbidden
```

Em caso de token válido mas sem permissão de acesso ao recurso específico será retornado erro 403 - Forbidden.

# Paginação

## Exemplo de paginação

> Exemplo de requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/enrollments?page=10
```

A API utiliza paginação limitando em 100 o número máximo de registros por requisição. O parâmetro `page` determina a página que deverá ser retornada. Quando não informado o padrão é 0.

### Parâmetros de paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| page | Query | Número da página que deve ser retornada |

### Informações de resultado de dados com paginação

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| page | int | Numero da página atual |
| items | array | Lista dos elementos retornados pela requisição |


# Matrículas

Entidade que representa toda a cobrança de um **Aluno** num **Curso**.

| Campo               | Tipo     | Descrição                                                                                     |
| -----               | ----     | ---------                                                                                     |
| id                  | bigint   | Identificador da matrícula no Quero Pago                                                      |
| external_id         | text     | Identificador da matrícula na instituição de ensino                                           |
| value_without_discount | float | Sim | Valor da mensalidade do aluno sem desconto |
| value_with_discount | float | Valor da mensalidade do aluno com desconto |
| discount_percentage | float | Valor da porcentagem do desconto |
| due_day             | int      | Dia de vencimento das mensalidades                                                            |
| period_installments | int | Quantidade de mensalidades que devem ser geradas para o período atual do aluno. As mensalidades não são geradas todas de uma vez, pois, ao longo de todo o curso, existem prazos de reajuste no valor (nas situações de rematrículas, por exemplo), então elas são geradas por períodos. Ex: Em caso de Graduação, normalmente os períodos são Semestrais, então deve-se passar o número 6, e serão geradas 6 mensalidades. Em caso de Pós-Graduação, normalmente o período é igual a quantidade de meses de duração do curso, então deve-se passar o mesmo número do `duration_in_months`. |
| start_year          | int      | Ano de início das cobranças                                                                   |
| start_month         | int      | Mês de início das cobranças. Valores de 1 a 12, sendo 1 Janeiro e 12 Dezembro                 |
| duration_in_months  | int      | Número total de mensalidades do curso. Exemplo: no caso de um curso de 2 anos deve-se passar 24 |
| enrollment_semester | text | Semestre que o aluno ingressou no curso, deve ser enviado no padrão: `YYYY.NN` ou `YYYY.N` onde Y e N são números. `YYYY` representando o ano e `NN` o período. |
| student | object | Referência a entidade Aluno em que a matrícula pertence |
| course | object | Referência a entidade Curso em que a matrícula pertence |
| created_at          | datetime | Momento da criação da matrícula no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| updated_at          | datetime | Momento da última atualização da matrícula no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |

## Listagem de Matrículas

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/enrollments
```

> Retorno

```json
{
  "page": 1,
  "items": [
    {
      "id": 1234567,
      "external_id": "RA984930527",
      "value_without_discount": 1000.0,
      "value_with_discount": 500.0,
      "discount_percentage": 50.0,
      "due_day": 10,
      "start_month": 7,
      "start_year": 2019,
      "duration_in_months": 24,
      "period_installments": 6,
      "enrollment_semester": "2019.2",
      "student": {
        "id": 1,
        "cpf": "01234567890"
      },
      "course": {
        "id": 1,
        "external_id": "21348329432"
      },
      "created_at": "2019-03-20T22:31:32Z",
      "updated_at": "2019-03-20T22:32:32Z"
    }
  ]
}
```

> Requisição filtrando por CPF do aluno

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/enrollments?student_cpf=00000000000
```


### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/enrollments` |

### Filtros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| page | Query | Número da página que deve ser retornada |
| student_cpf | Query | Retorna as matrículas pertencentes ao aluno com o CPF indicado. Devem ser enviados apenas os números |
| created_at_gte | Query | Retorna as matrículas criadas a partir da data indicada no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| created_at_lte | Query | Retorna as matrículas criadas até a data indicada no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| external_id | Query | Identificador da matrícula na instituição de ensino   |

## Busca de uma matrícula
Busca de uma matrícula utilizando o ID Quero Pago

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/enrollments/1234567
```

> Resposta

```json
{
  "id": 1234567,
  "external_id": "RA984930527",
  "value_without_discount": 1000.0,
  "value_with_discount": 500.0,
  "discount_percentage": 50.0,
  "due_day": 10,
  "start_month": 7,
  "start_year": 2019,
  "duration_in_months": 24,
  "period_installments": 6,
  "enrollment_semester": "2019.2",
  "student": {
    "id": 1,
    "cpf": "01234567890"
  },
  "course": {
    "id": 1,
    "external_id": "21348329432"
  },
  "created_at": "2019-03-20T22:31:32Z",
  "updated_at": "2019-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/enrollments/{id}` |

## Update de uma matrícula
Faz o update de uma matrícula no sistema do Quero Pago e retorna o objeto atualizado

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     -d external_id=RA1234 \
     -X PUT \
     https://queropago.com.br/api/v1/enrollments/1234567
```

> Resposta

```json
{
  "id": 1234567,
  "external_id": "RA1234",
  "value_without_discount": 1000.0,
  "value_with_discount": 500.0,
  "discount_percentage": 50.0,
  "due_day": 10,
  "start_month": 7,
  "start_year": 2019,
  "duration_in_months": 24,
  "period_installments": 6,
  "enrollment_semester": "2019.2",
  "student": {
    "id": 1,
    "cpf": "01234567890"
  },
  "course": {
    "id": 1,
    "external_id": "21348329432"
  },
  "created_at": "2019-03-20T22:31:32Z",
  "updated_at": "2019-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/enrollments/{id}` |

### Possíveis atributos para realizar o update

| Atributo | Tipo | Descrição |
| ---- | ---- | --------- |
| external_id | text | Identificador da matrícula na instituição de ensino |
| due_day | int | Dia de vencimento das mensalidades, tem que estar entre 1 e 31. Ao atualizar o dia de vencimento das mensalidades, são gerados novos boletos começando a partir do próximo mês, ou seja, não é possível alterar a data de vencimento da mensalidade atual via API |

## Criação de uma matrícula

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     -d "@request_body.json" \
     -X POST \
     https://queropago.com.br/api/v1/enrollments
```

> request_body.json

```json
{
  "student": {
    "name": "Aluno Quero Pago",
    "gender": "M",
    "cpf": "01234567890",
    "birthday": "1996-04-10",
    "identity_card": "42134567X",
    "identity_card_emissor": "SSP",
    "city_id": 1,
    "state_id": 1,
    "address": "Rua Quero Pago",
    "address_number": "123",
    "address_complement": "Perto da quero",
    "neighborhood": "Bairro Quero Pago",
    "postal_code": "12345620",
    "cellphone": "12912345678",
    "email": "queropago@queropago.com"
  },
  "enrollment": {
    "value_without_discount": 1000,
    "value_with_discount": 500,
    "discount_percentage": 50,
    "duration_in_months": 24,
    "course_id": 1,
    "due_day": 10,
    "start_month": 7,
    "start_year": 2019,
    "period_installments": 6,
    "enrollment_semester": "2019.2",
    "external_id": "RA1234"
  }
}
```

> Resposta

```json
{
  "id": 1234567,
  "external_id": "RA1234",
  "value_without_discount": 1000.0,
  "value_with_discount": 500.0,
  "discount_percentage": 50.0,
  "due_day": 10,
  "start_month": 7,
  "start_year": 2019,
  "duration_in_months": 24,
  "period_installments": 6,
  "enrollment_semester": "2019.2",
  "student": {
    "id": 1,
    "cpf": "01234567890",
    "name": "Aluno Quero Pago",
    "email": "queropago@queropago.com",
    "gender": "M",
    "birthday": "1996-04-10",
    "identity_card": "42134567X",
    "identity_card_emissor": "SSP",
    "cellphone": "12912345678",
    "address": {
      "street": "Rua Quero Pago",
      "number": "123",
      "neighborhood": "Bairro Quero Pago",
      "postal_code": "12345620",
      "complement": "Perto da quero",
      "city": {
        "id": 1,
        "ibge_code": "123456"
      }
    },
    "created_at": "2018-03-20T22:31:32Z",
    "updated_at": "2018-03-20T22:32:32Z"
  },
  "course": {
    "id": 1,
    "external_id": "1234",
    "name": "Curso Quero Pago",
    "shift": "Manhã",
    "kind": "Presencial",
    "level": "Graduação",
    "campus": {
      "id": 1,
      "external_id": "1234"
    },
    "created_at": "2018-03-20T22:31:32Z",
    "updated_at": "2018-03-20T22:32:32Z"
  },
  "created_at": "2019-03-20T22:31:32Z",
  "updated_at": "2019-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `POST` |
| Body | JSON com os parâmetros para a criação |
| URL | `https://queropago.com.br/api/v1/enrollments` |

### Parâmetros do body da request

| Atributo | Tipo | Obrigatório | Descrição |
| ---- | ---- | ---- | --------- |
| student | objeto | Sim | Objeto com os dados do aluno para criarmos a matrícula. Caso já exista um aluno na nossa base com o mesmo CPF, iremos atualizar apenas os dados que não estão presentes do nosso lado. Exemplo: Já existe um aluno com o CPF `012.345.678-90` do nosso lado, mas ele não tem telefone e tem email cadastrado. Caso a IES envie uma notificação para criar uma matrícula para este aluno contendo dados do email e do telefone, nós iremos apenas atualizar os dados do telefone  |
| enrollment | objeto | Sim | Objeto com os dados da cobrança para criarmos a matrícula |


### Parâmetros do body da request - Student

| Atributo | Tipo | Obrigatório | Descrição |
| ---- | ---- | ---- | --------- |
| name | text | Sim | Nome do aluno, deve conter apenas letras e espaços |
| cpf | text | Sim | CPF do aluno, contendo apenas números |
| email | text | Sim | E-mail do aluno, deve ser um e-mail válido |
| gender | text | Não | Sexo do aluno, deve estar entre `M` ou `F` |
| birthday | date | Não | Data de nascimento do aluno no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| identity_card | text | Não | RG do aluno |
| identity_card_emissor | text | Não | Orgão emissor do RG |
| city_id | int | Não | Identificador Quero Pago da cidade do aluno |
| state_id | int | Não | Identificador Quero Pago do estado do aluno |
| address | text | Não | Rua do endereço do aluno |
| address_number | text | Não | Número do endereço do aluno |
| address_complement | text | Não | Complemento do endereço do aluno |
| neighborhood | text | Não | Bairro do aluno |
| postal_code | text | Não | CEP do aluno |
| cellphone | text | Não | Telefone celular do aluno |

### Parâmetros do body da request - Enrollment

| Atributo | Tipo | Obrigatório | Descrição |
| ---- | ---- | ---- | --------- |
| value_without_discount | float | Sim | Valor da mensalidade do aluno sem desconto |
| value_with_discount | float | Sim | Valor da mensalidade do aluno com desconto |
| discount_percentage | float | Sim | Valor da porcentagem do desconto |
| duration_in_months | int | Sim | Duração total do curso do aluno, em meses |
| course_id | int | Sim | Identificador Quero Pago do curso |
| due_day | int | Sim | Dia de vencimento das mensalidades |
| start_month | int | Sim | Mês de ínicio da cobrança |
| start_year | int | Sim | Ano de ínicio da cobrança |
| period_installments | int | Sim | Quantidade de mensalidades que devem ser geradas para o período atual do aluno. As mensalidades não são geradas todas de uma vez, pois, ao longo de todo o curso, existem prazos de reajuste no valor (nas situações de rematrículas, por exemplo), então elas são geradas por períodos. Ex: Em caso de Graduação, normalmente os períodos são Semestrais, então deve-se passar o número 6, e serão geradas 6 mensalidades. Em caso de Pós-Graduação, normalmente o período é igual a quantidade de meses de duração do curso, então deve-se passar o mesmo número do `duration_in_months`. |
| enrollment_semester | text | Sim | Semestre que o aluno ingressou no curso |
| external_id | text | Não | Identificador externo da matrícula na instituição |

## Interrupção de matrícula

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     -d "@request_body.json" \
     -X POST \
     https://queropago.com.br/api/v1/enrollments/1/interrupt
```

> request_body.json

```json
{
  "interruption_reason": "dropout",
  "remaining_value": 1000,
  "installments": 10,
  "first_due_date": "2019-10-10"
}
```

> Resposta

```json
{
  "message": "Matrícula interrompida com sucesso"
}
```

Interrompe a matrícula de acordo com os parâmetros passados

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `POST` |
| Body | JSON com os parâmetros para a criação |
| URL | `https://queropago.com.br/api/v1/enrollments/{id}/interrupt` |

### Parâmetros do body da request

| Atributo | Tipo | Obrigatório | Descrição |
| ---- | ---- | ---- | --------- |
| interruption_reason | text | Sim | Razão da interrupção da cobrança, podendo ser `cancellation`, `transfer`, `dropout` ou `pause` |
| remaining_value | float | Não | Valor restante a ser pago, necessário somente se o aluno estiver com saldo devedor |
| installments | int | Não | Quantidade de mensalidades em que o aluno pode dividir o saldo devedor, necessário somente se o aluno estiver com saldo devedor |
| first_due_date | date | Não | Data da primeira mensalidade no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601), necessário somente se o aluno estiver com saldo devedor  |

**Razões de interrupção**

| Atributo | Descrição |
| ---- | --------- |
| cancellation | Motivo genérico para interrupção |
| transfer | Aluno fez transferência de instituição |
| dropout | Aluno desistiu do curso |
| pause | Aluno trancou o curso |

# Mensalidades

Entidade que representa a cobrança de um determinado mês relacionada a uma **Matrícula**. Toda mensalidade possui um
boleto, mesmo sendo paga com cartão de crédito.

| Campo                  | Tipo   | Descrição                                                           |
|------------------------|--------|---------------------------------------------------------------------|
| id                     | bigint | Identificador da mensalidade no Quero Pago                          |
| external_id            | text   | Identificador da mensalidade na instituição de ensino               |
| status                 | text   | Estado atual da mensalidade                                         |
| year                   | int    | Ano de referência                                                   |
| month                  | int    | Mês de referência                                                   |
| due_date               | date   | Data de vencimento                                                  |
| value_with_discount    | float  | Valor da mensalidade com desconto                                   |
| value_without_discount | float  | Valor da mensalidade sem desconto                                   |
| interest               | float  | Valor de juros aplicado                                             |
| penalty                | float  | Valor de multa aplicado                                             |
| paid_value             | float  | Valor pago                                                          |
| paid_date              | date   | Data do pagamento, formatado no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| payment_methods        | array  | Lista de métodos de pagamento utilizados                               |
| boleto_barcode         | text   | Código de barras do boleto                                          |
| boleto_url             | text   | URL para download do boleto                                         |
| created_at             | datetime | Momento da criação da mensalidade no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| updated_at             | datetime | Momento da última atualização da mensalidade no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |

**Estados possíveis de uma Mensalidade**

| Nome | Descrição |
| ---- | --------- |
| open | Mensalidade em aberto/disponível para pagamento |
| paid | Mensalidade paga |
| overdue | Mensalidade em atraso |
| exempted | Mensalidade isenta |

**Atributos dos Métodos de Pagamento utilizados**

| Campo | Tipo | Descrição |
| ----- | ---- | --------- |
| method_name | text | Nome do método de pagamento utilizado podendo variar entre `boleto` e `credit_card` |
| status | text | Status do método de pagamento, podendo variar entre `waiting_payment`, `inactive`, `paid`, `partial`, `refused`, `refunded` e `chargedback` |
| paid_at | datetime | Momento do pagamento no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC, caso o método de pagamento esteja pago ou parcialmente pago |
| full_value | float | Valor total do método de pagamento |
| paid_value | float | Valor pago do método de pagamento |
| refunded_value | float | Valor reembolsado do método de pagamento |
| installments | int | Quantidades de parcelas em que o método de pagamento foi dividido, caso o `method_name` seja `boleto` vai ser sempre 1 |
| boleto_barcode | text | Código de barras do boleto, irá existir somente se o `method_name` for `boleto` |
| boleto_url | text | URL do boleto, irá existir somente se o `method_name` for `boleto` |
| boleto_expiry_date | text | Data de expiração do boleto no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601), irá existir somente se o `method_name` for `boleto` |
| created_at             | datetime | Momento da criação do método de pagamento no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| updated_at             | datetime | Momento da última atualização do método de pagamento no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |

**Status dos Métodos de Pagamento utilizados**

| Status | Descrição |
| ----- | ---- |
| waiting_payment | Utilizado quando método de pagamento está aguardando ser pago, ou seja, ainda não foi pago. Existirá no máximo 1 método de pagamento com esse status |
| inactive | Quando o método de pagamento foi inativado. Um método de pagamento pode ser inativado quando outro mais atualizado é criado. Exemplo: reajustes no valor da mensalidade gerando a necessidade de se criar um novo boleto com outro valor. |
| paid | Quando o método de pagamento foi pago por completo, ou seja, `full_value` é igual ao `paid_value` |
| partial | Quando o método de pagamento foi pago parcialmente, ou seja, `paid_value` é maior que zero mas é menor que o `full_value` |
| refused | Quando o método de pagamento é recusado, por exemplo um pagamento em um cartão que não tinha saldo |
| refunded | Caso um pagamento seja reembolsado por completo, ou seja, o `paid_value` é igual ao `refunded_value` |
| chargedback | Caso aconteça um Chargeback (aluno sinalizou a operadora que a cobrança foi indevida e negou a cobrança), nesse caso o `paid_value` é atualizado para 0 |

## Listagem de mensalidades

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/bills
```

> Resposta

```json
{
  "page": 1,
  "items": [
    {
      "id": 1,
      "external_id": "1728934017293477",
      "status": "paid",
      "year": 2018,
      "month": 12,
      "due_date": "2018-12-28",
      "value_without_discount": 1000.0,
      "value_with_discount": 400.0,
      "interest": 0.0,
      "penalty": 0.0,
      "paid_value": 400.0,
      "paid_date": "2018-12-27",
      "payment_methods": [
        {
          "method_name": "boleto",
          "status": "paid",
          "paid_at": "2018-12-27T22:31:32Z",
          "full_value": 400.0,
          "paid_value": 400.0,
          "refunded_value": 0.0,
          "installments": 1,
          "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
          "boleto_url": "https://boleto-url.com",
          "boleto_expiry_date": "2018-12-28",
          "created_at": "2018-03-21T22:31:32Z",
          "updated_at": "2018-03-21T22:32:32Z",
        }
      ],
      "enrollment": {
        "id": 123456,
        "external_id": "RA984930527"
      },
      "created_at": "2018-03-20T22:31:32Z",
      "updated_at": "2018-03-20T22:32:32Z"
    }
  ]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/bills` |

### Filtros

> Exemplo de requisição filtrando por enrollment_id

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/bills?enrollment_id=123456
```

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| enrollment_id | Query | Identificador da matrícula no Quero Pago |
| external_enrollment_id | Query | Identificador da matrícula na instituição de ensino |
| due_date_gte | Query | Retorna as mensalidades com vencimento maior ou igual à data indicada. Deve ser formatada no padrão [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| due_date_lte | Query | Retorna as mensalidades com vencimento menor ou igual à data indicada. Deve ser formatada no padrão [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| external_id | Query | Identificador da mensalidade na instituição de ensino |

## Busca de uma mensalidade
Busca de uma mensalidade utilizando o ID Quero Pago

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/bills/1
```

> Resposta

```json
{
  "id": 1,
  "external_id": "1728934017293477",
  "status": "paid",
  "year": 2018,
  "month": 12,
  "due_date": "2018-12-28",
  "value_without_discount": 1000.0,
  "value_with_discount": 400.0,
  "interest": 0.0,
  "penalty": 0.0,
  "paid_value": 400.0,
  "paid_date": "2018-12-27",
  "payment_methods": [
    {
      "method_name": "boleto",
      "status": "paid",
      "paid_at": "2018-12-27T22:31:32Z",
      "full_value": 400.0,
      "paid_value": 400.0,
      "refunded_value": 0.0,
      "installments": 1,
      "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
      "boleto_url": "https://boleto-url.com",
      "boleto_expiry_date": "2018-12-28",
      "created_at": "2018-03-21T22:31:32Z",
      "updated_at": "2018-03-21T22:32:32Z",
    }
  ],
  "enrollment": {
    "id": 123456,
    "external_id": "RA984930527"
  },
  "created_at": "2018-03-20T22:31:32Z",
  "updated_at": "2018-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/bills/{id}` |

## Update de uma mensalidade
Faz o update de uma mensalidade no sistema do Quero Pago e retorna o objeto atualizado

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     -d external_id=12345 \
     -X PUT \
     https://queropago.com.br/api/v1/bills/1
```

> Resposta

```json
{
 "id": 1,
 "external_id": "12345",
 "status": "paid",
 "year": 2018,
 "month": 12,
 "due_date": "2018-12-28",
 "value_without_discount": 1000.0,
 "value_with_discount": 400.0,
 "interest": 0.0,
 "penalty": 0.0,
 "paid_value": 400.0,
 "paid_date": "2018-12-27",
 "payment_methods": [
    {
       "method_name": "boleto",
       "status": "paid",
       "paid_at": "2018-12-27T22:31:32Z",
       "full_value": 400.0,
       "paid_value": 400.0,
       "refunded_value": 0.0,
       "installments": 1,
       "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
       "boleto_url": "https://boleto-url.com",
       "boleto_expiry_date": "2018-12-28",
       "created_at": "2018-03-21T22:31:32Z",
       "updated_at": "2018-03-21T22:32:32Z"
    }
 ],
 "enrollment": {
    "id": 123456,
    "external_id": "RA984930527"
 },
 "created_at": "2018-03-20T22:31:32Z",
 "updated_at": "2018-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/bills/{id}` |

### Possíveis atributos para realizar o update

| Atributo | Tipo | Descrição |
| ---- | ---- | --------- |
| external_id | text | Identificador da mensalidade na instituição de ensino |

# Campus
Entidade que representa o **Campus** da instituição no sistema do Quero Pago.

| Campo | Tipo | Descrição |
| ---- | ---- | --------- |
| id | int | Identificador do campus no Quero Pago  |
| external_id | text | Identificador do campus no na instituição de ensino  |
| name | text | Nome do campus  |
| address | text | Endereço do campus |
| address_number | text | Número do campus |
| address_complement | text | Complemento do campus |
| lat | float | Latitude do campus |
| lat | float | Longitude do campus |
| city | object | Referência a entidade Cidade em que o campus pertence |
| created_at | datetime | Momento da criação do campus no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| updated_at | datetime | Momento da última atualização do campus no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |

## Listagem de campus

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/campuses
```

> Resposta

```json
{
  "page": 1,
  "items": [
    {
      "id": 1,
      "external_id": "1234",
      "name": "Campus Quero Pago",
      "address": "Rua Quero Pago",
      "address_number": "123",
      "address_complement": "",
      "lat": -8.81108100,
      "lng": -70.23221200,
      "city": {
        "id": 1,
        "ibge_code": "123456"
      },
      "created_at": "2018-03-20T22:31:32Z",
      "updated_at": "2018-03-20T22:32:32Z"
    }
  ]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/campuses` |

### Filtros

> Exemplo de requisição filtrando por city_id

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/campuses?city_id=1
```

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| state_id | Query | Identificador do estado no Quero Pago |
| city_id | Query | Identificador da cidade no Quero Pago |
| name | Query | Nome do campus |
| external_id | Query | Identificador do campus na instituição de ensino |

## Busca de um campus
Busca de um campus utilizando o ID Quero Pago

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/campuses/1
```

> Resposta

```json
{
  "id": 1,
  "external_id": "1234",
  "name": "Campus Quero Pago",
  "address": "Rua Quero Pago",
  "address_number": "123",
  "address_complement": "",
  "lat": -8.81108100,
  "lng": -70.23221200,
  "city": {
    "id": 1,
    "ibge_code": "123456"
  },
  "created_at": "2018-03-20T22:31:32Z",
  "updated_at": "2018-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/campuses/{id}` |


## Update de um campus

Faz o update de um campus no sistema do Quero Pago e retorna o objeto atualizado

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     -d external_id=123 \
     -X PUT \
     https://queropago.com.br/api/v1/campuses/1
```

> Resposta

```json
{
  "id": 1,
  "external_id": "123",
  "name": "Campus Quero Pago",
  "address": "Rua Quero Pago",
  "address_number": "123",
  "address_complement": "",
  "lat": -8.81108100,
  "lng": -70.23221200,
  "city": {
    "id": 1,
    "ibge_code": "123456"
  },
  "created_at": "2018-03-20T22:31:32Z",
  "updated_at": "2018-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/campuses/{id}` |

### Possíveis atributos para realizar o update

| Atributo | Tipo | Descrição |
| ---- | ---- | --------- |
| external_id | text | Identificador do campus na instituição de ensino |

# Cidades
Entidade que representa a **Cidade** no sistema do Quero Pago.

| Campo | Tipo | Descrição |
| ---- | ---- | --------- |
| id | int | Identificador da cidade no Quero Pago  |
| ibge_code | text | Identificador da cidade no sistema do IBGE |
| name | text | Nome da cidade  |
| lat | float | Latitude da cidade |
| lat | float | Longitude da cidade |
| state | object | Referência a entidade Estado em que a cidade pertence |

## Listagem de cidades

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/cities
```

> Resposta

```json
{
  "page": 1,
  "items": [
    {
      "id": 1,
      "ibge_code": "3549904",
      "name": "São José dos Campos",
      "lat": -23.21184000,
      "lng": -45.88259700,
      "state": {
        "id": 26,
        "acronym": "SP"
      }
    }
  ]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/cities` |

### Filtros

> Exemplo de requisição filtrando por ibge_code

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/cities?ibge_code=3549904
```

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| state_id | Query | Identificador do estado no Quero Pago |
| ibge_code | Query | Identificador da cidade no sistema do IBGE |

## Busca de uma cidade
Busca de uma cidade utilizando o ID Quero Pago

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/cities/1
```

> Resposta

```json
{
  "id": 1,
  "ibge_code": "3549904",
  "name": "São José dos Campos",
  "lat": -23.21184000,
  "lng": -45.88259700,
  "state": {
    "id": 26,
    "acronym": "SP"
  }
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/cities/{id}` |

# Estados
Entidade que representa o **Estado** no sistema do Quero Pago.

| Campo | Tipo | Descrição |
| ---- | ---- | --------- |
| id | int | Identificador da cidade no Quero Pago  |
| acronym | text | Acrônimo do Estado |
| name | text | Nome do Estado |
| lat | float | Latitude do Estado |
| lat | float | Longitude do Estado |

## Listagem de Estados

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/states
```

> Resposta

```json
{
  "page": 1,
  "items": [
    {
      "id": 26,
      "acronym": "SP",
      "name": "São Paulo",
      "lat": -22.69073900,
      "lng": -47.48442700
    }
  ]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/states` |

## Busca de um Estado
Busca de um Estado utilizando o ID Quero Pago

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/states/1
```

> Resposta

```json
{
  "id": 26,
  "acronym": "SP",
  "name": "São Paulo",
  "lat": -22.69073900,
  "lng": -47.48442700
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/states/{id}` |

# Curso
Entidade que representa o **Curso** da instituição no sistema do Quero Pago.

| Campo | Tipo | Descrição |
| ---- | ---- | --------- |
| id | int | Identificador do curso no Quero Pago  |
| external_id | text | Identificador do curso no na instituição de ensino  |
| name | text | Nome do curso  |
| shift | text | Turno do curso, podendo ser: `Virtual`, `Outro`, `Noite`, `Manhã`, `Integral` ou `Tarde` |
| kind | text | Modalidade do curso, podendo ser: `EaD`, `Presencial` ou `Semipresencial` |
| level | text | Nível do curso, podendo ser: `Pós-graduação Lato Sensu`, `Bacharelado (graduação)`, `Técnico`, `Tecnólogo (graduação)`, `Licenciatura (graduação)`, `Profissionalizante`, `Pós Graduação`, `Segunda Graduação`, `Pos-Graduação`, `Graduação`, `Curso Livre` ou `Bootcamp` |
| campus | object | Referência a entidade Campus em que o curso pertence |
| created_at | datetime | Momento da criação do curso no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| updated_at | datetime | Momento da última atualização do curso no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |

## Listagem de cursos

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/courses
```

> Resposta

```json
{
  "page": 1,
  "items": [
    {
      "id": 1,
      "external_id": "1234",
      "name": "Curso Quero Pago",
      "shift": "Manhã",
      "kind": "Presencial",
      "level": "Graduação",
      "campus": {
        "id": 1,
        "external_id": "1234"
      },
      "created_at": "2018-03-20T22:31:32Z",
      "updated_at": "2018-03-20T22:32:32Z"
    }
  ]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/courses` |

### Filtros

> Exemplo de requisição filtrando por name

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/courses?name=quero
```

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| campus_id | Query | Identificador do campus no Quero Pago |
| name | Query | Nome do curso |
| external_id | Query | Identificador do curso na instituição de ensino |

## Busca de um curso
Busca de um curso utilizando o ID Quero Pago

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/courses/1
```

> Resposta

```json
{
  "id": 1,
  "external_id": "1234",
  "name": "Curso Quero Pago",
  "shift": "Manhã",
  "kind": "Presencial",
  "level": "Graduação",
  "campus": {
    "id": 1,
    "external_id": "1234"
  },
  "created_at": "2018-03-20T22:31:32Z",
  "updated_at": "2018-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/courses/{id}` |


## Update de um curso

Faz o update de um curso no sistema do Quero Pago e retorna o objeto atualizado

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     -d external_id=123 \
     -X PUT \
     https://queropago.com.br/api/v1/course/1
```

> Resposta

```json
{
  "id": 1,
  "external_id": "123",
  "name": "Curso Quero Pago",
  "shift": "Manhã",
  "kind": "Presencial",
  "level": "Graduação",
  "campus": {
    "id": 1,
    "external_id": "1234"
  },
  "created_at": "2018-03-20T22:31:32Z",
  "updated_at": "2018-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/courses/{id}` |

### Possíveis atributos para realizar o update

| Atributo | Tipo | Descrição |
| ---- | ---- | --------- |
| external_id | text | Identificador do curso na instituição de ensino |

# Alunos
Entidade que representa o **Aluno** no sistema do Quero Pago.

| Campo | Tipo | Descrição |
| ---- | ---- | --------- |
| id | int | Identificador do Aluno no Quero Pago  |
| cpf | text | CPF do aluno, apenas números |
| name | text | Nome do aluno |
| email | text | Email do aluno |
| gender | text | Sexo do aluno, podendo variar entre `M` ou `F` |
| birthday | date | Data de nascimento do aluno no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| identity_card | text | RG do aluno |
| identity_card_emissor | text | Orgão emissor do RG do aluno |
| cellphone | text | Celular do aluno |
| address | text | Objeto de endereço do aluno |
| created_at | datetime | Momento da criação do curso no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |
| updated_at | datetime | Momento da última atualização do curso no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |


**Atributos do endereço do aluno**

| Campo | Tipo | Descrição |
| ---- | ---- | --------- |
| street | text | Rua do endereço |
| number | text | Número |
| neighborhood | text | Bairro |
| postal_code | texto | CEP da residência |
| complement | texto | Complemento do endereço |
| city | object | Referência a entidade Cidade em que o endereço pertence |

## Listagem de alunos

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/students
```

> Resposta

```json
{
  "page": 1,
  "items": [
    {
      "id": 1,
      "cpf": "01234567890",
      "name": "Aluno Quero Pago",
      "email": "queropago@queropago.com",
      "gender": "M",
      "birthday": "1996-04-10",
      "identity_card": "42134567X",
      "identity_card_emissor": "SSP",
      "cellphone": "12912345678",
      "address": {
        "street": "Rua Quero Pago",
        "number": "123",
        "neighborhood": "Bairro Quero Pago",
        "postal_code": "12345620",
        "complement": "Perto da quero",
        "city": {
          "id": 1,
          "ibge_code": "123456"
        }
      },
      "created_at": "2018-03-20T22:31:32Z",
      "updated_at": "2018-03-20T22:32:32Z"
    }
  ]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/students` |

### Filtros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| cpf | Query | CPF do aluno, contendo apenas números |

## Busca de um Aluno
Busca de um Aluno utilizando o ID Quero Pago

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/students/1
```

> Resposta

```json
{
  "id": 1,
  "cpf": "01234567890",
  "name": "Aluno Quero Pago",
  "email": "queropago@queropago.com",
  "gender": "M",
  "birthday": "1996-04-10",
  "identity_card": "42134567X",
  "identity_card_emissor": "SSP",
  "cellphone": "12912345678",
  "address": {
    "street": "Rua Quero Pago",
    "number": "123",
    "neighborhood": "Bairro Quero Pago",
    "postal_code": "12345620",
    "complement": "Perto da quero",
    "city": {
      "id": 1,
      "ibge_code": "123456"
    }
  },
  "created_at": "2018-03-20T22:31:32Z",
  "updated_at": "2018-03-20T22:32:32Z"
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/students/{id}` |

## Criação de um aluno
A criação de um aluno ocorre junto com a criação da **Matrícula**.

# Webhooks

Com webhooks você poderá receber informações sobre eventos que ocorrem no Quero Pago. Consiste basicamente de um endereço onde enviamos requisições HTTP com os dados de eventos. Por exemplo, dados referente a um evento de mensalidade paga.
Na criação dos webhooks será necessário informar a URL para receber os requisições e também quais eventos devem ser enviados.


## Entregas de eventos
A entrega de eventos ocorrerá apenas para endereços https por motivo de segurança, portanto seu webhook deve estar preparado para isso.

É esperado que toda resposta para um entrega de evento tenha algum código de status de sucesso HTTP 2xx, qualquer código de status diferente desse será considerado como uma falha na entrega. Caso alguma falha de entrega ocorra faremos tentativas de entrega por até 3 dias após a ocorrência do evento em tempos crescentes.

O corpo de toda requisição será sempre no formato JSON (`application/json`).

### Possíveis eventos

| Evento | Descrição |
| ---- | --------- |
| enrollment_created | Quando uma matrícula de um aluno é criada, é retornado os dados do aluno, curso, matrícula e mensalidades |
| enrollment_canceled | Quando uma matrícula de um aluno é cancelada, é retornado a matrícula que foi cancelada |
| bill_created | Quando uma mensalidade de um aluno é criada, é retornado a mensalidade que foi criada |
| bill_paid | Quando uma mensalidade de um aluno é paga, é retornado a mensalidade que foi paga |
| bill_overdue | Quando uma mensalidade de um aluno é marcada como vencida, é retornado a mensalidade que foi vencida |
| bill_due_date_changed | Quando a data de vencimento de uma mensalidade é alterada, é retornado a mensalidade que teve a data de vencimento alterada |
| boleto_updated | Quando um novo boleto é gerado, é retornado a mensalidade que teve seu boleto atualizado |


## Verificando autenticidade das entregas

> Exemplo em Ruby

```ruby
def authentic_delivery?(secret_key, signature, delivery_id, request_body)
  digest = OpenSSL::Digest.new('sha256')
  text_to_sign = "#{delivery_id};#{request_body}"
  OpenSSL::HMAC.hexdigest(digest, secret_key, text_to_sign) == signature
end
```

Ao criar o seu webhook será informada uma chave secreta que servirá para validar a autenticidade das entregas realizadas. Em caso de vazamento dessa chave você deve entrar em contato conosco para que invalidemos a mesma.

Toda entrega realizada conterá um cabeçalho `X-QP-Signature` contendo a assinatura da combinação do corpo da requisição e do identificador da entrega que o Quero Pago cria utilizando a chave secreta do seu webhook utilizando o padrão [HMAC-SHA256](https://en.wikipedia.org/wiki/HMAC).

Para verificar se a requisição é autêntica você pode seguir o seguinte passo a passo:
 - Pegue o cabeçalho `X-QP-Delivery` e o corpo da requisição e concatene ambos os valores utilizando um ponto e vírgula (`;`) como separador;
 - Utilizando a implementação de HMAC SHA256 em sua liguagem de programação, construa o hash da string obtida no passo anterior usando sua chave secreta;
 - Compare com a assinatura presente no cabeçalho `X-QP-Signature`, se forem iguais a requisição é autêntica.


### Bibliotecas HMAC em algumas linguagens:
 - [Java/Scala](https://docs.oracle.com/javase/8/docs/api/index.html?javax/crypto/Mac.html)
 - [Ruby](http://ruby-doc.org/stdlib-2.1.0/libdoc/openssl/rdoc/OpenSSL/HMAC.html)
 - [Node.js](https://nodejs.org/api/crypto.html#crypto_class_hmac)
 - [Python](https://docs.python.org/2/library/hmac.html)
 - [PHP](http://php.net/manual/pt_BR/function.hash-hmac.php)

## Listagem de eventos

Retorna a lista de todos os eventos cadastratos para a sua instituição

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     https://queropago.com.br/api/v1/webhooks
```

> Resposta

```json
{
  "events": [
    "enrollment_created",
    "enrollment_canceled",
    "bill_created",
    "bill_paid",
    "bill_overdue",
    "bill_due_date_changed",
    "boleto_updated"
  ]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `GET` |
| URL | `https://queropago.com.br/api/v1/webhooks` |

## Update de eventos

Atualiza os eventos cadastrados da sua instituição, caso seja atualizado com sucesso é retornado um json com o status 200

> Requisição

```bash
curl --header "Authorization: Bearer ########" \
     --header "Content-Type: application/json" \
     -d "@request_body.json" \
     -X PUT \
     https://queropago.com.br/api/v1/webhooks
```

> request_body.json

```json
{
  "events": ["enrollment_created", "bill_created"]
}
```

### Parâmetros da request

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/webhooks` |

### Possíveis atributos para realizar o update

| Atributo | Tipo | Descrição |
| ---- | ---- | --------- |
| events | array de strings | Lista de eventos que sua instituição deseja ser notificada |

# Eventos

## Matrícula criada (enrollment_created)
Ocorre quando a [**Matrícula**](#matriculas) do aluno é criada. Apenas em eventos desse tipo serão enviados os dados detalhado do curso e do aluno. Utilize esse evento para relacionar a matrícula do Quero Pago com a matrícula na instituição de ensino caso o identificador da matrícula não tenha sido informado anteriormente.

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: enrollment_created
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: 01074956-543a-4045-ad7c-b39831a45646

{
 "id": 1234567,
 "external_id": "RA1234",
 "value_without_discount": 1000.0,
 "value_with_discount": 500.0,
 "discount_percentage": 50.0,
 "due_day": 10,
 "start_month": 7,
 "start_year": 2019,
 "duration_in_months": 24,
 "period_installments": 6,
 "enrollment_semester": "2019.2",
 "student": {
    "id": 1,
    "cpf": "01234567890",
    "name": "Aluno Quero Pago",
    "email": "queropago@queropago.com",
    "gender": "M",
    "birthday": "1996-04-10",
    "identity_card": "42134567X",
    "identity_card_emissor": "SSP",
    "cellphone": "12912345678",
    "address": {
       "street": "Rua Quero Pago",
       "number": "123",
       "neighborhood": "Bairro Quero Pago",
       "postal_code": "12345620",
       "complement": "Perto da quero",
       "city": {
          "id": 1,
          "ibge_code": "123456"
       }
    },
    "created_at": "2018-03-20T22:31:32Z",
    "updated_at": "2018-03-20T22:32:32Z"
 },
 "course": {
    "id": 1,
    "external_id": "1234",
    "name": "Curso Quero Pago",
    "shift": "Manhã",
    "kind": "Presencial",
    "level": "Graduação",
    "campus": {
       "id": 1,
       "external_id": "1234"
    },
    "created_at": "2018-03-20T22:31:32Z",
    "updated_at": "2018-03-20T22:32:32Z"
 },
 "bills": [
    {
       "id": 1,
       "external_id": "1728934017293477",
       "status": "open",
       "year": 2018,
       "month": 12,
       "due_date": "2018-12-28",
       "value_without_discount": 1000.0,
       "value_with_discount": 400.0,
       "interest": 0.0,
       "penalty": 0.0,
       "paid_value": 0.0,
       "paid_date": null,
       "payment_methods": [
          {
             "method_name": "boleto",
             "status": "waiting_payment",
             "paid_at": null,
             "full_value": 400.0,
             "paid_value": 0.0,
             "refunded_value": 0.0,
             "installments": 1,
             "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
             "boleto_url": "https://boleto-url.com",
             "boleto_expiry_date": "2018-12-28",
             "created_at": "2018-03-21T22:31:32Z",
             "updated_at": "2018-03-21T22:32:32Z"
          }
       ],
       "enrollment": {
          "id": 1234567,
          "external_id": "RA1234"
       },
       "created_at": "2018-03-20T22:31:32Z",
       "updated_at": "2018-03-20T22:32:32Z"
    }
 ],
 "created_at": "2019-03-20T22: 31: 32Z",
 "updated_at": "2019-03-20T22: 32: 32Z"
}
```

**Ambiente de testes**

É possível simular esse evento no seu ambiente de testes, batendo na rota de [Criação de matriculas](#criacao-de-uma-matricula).


## Matrícula cancelada (enrollment_canceled)

Ocorre quando a [**Matrícula**](#matriculas) do aluno é cancelada.

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: enrollment_canceled
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: cc63acc3-9721-4633-8286-737199c01a75

{
  "id": 1234567,
  "external_id": "RA1234",
  "value_without_discount": 1000.0,
  "value_with_discount": 500.0,
  "discount_percentage": 50.0,
  "due_day": 10,
  "start_month": 7,
  "start_year": 2019,
  "duration_in_months": 24,
  "period_installments": 6,
  "enrollment_semester": "2019.2",
  "student": {
    "id": 1,
    "cpf": "01234567890"
  },
  "course": {
    "id": 1,
    "external_id": "21348329432"
  },
  "created_at": "2019-03-20T22:31:32Z",
  "updated_at": "2019-03-20T22:32:32Z"
}
```

**Ambiente de testes**

É possível simular esse evento no seu ambiente de testes, batendo na seguinte rota:

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/test-events/enrollment-canceled/{id}` |

Passando como parâmetro o Identificador da matrícula Quero Pago que deseja cancelar.

## Mensalidade criada (bill_created)

Ocorre quando uma [**Mensalidade**](#mensalidades) é criada.

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: bill_created
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: 39f196c0-c745-41e9-9e7e-835eb0eb3435

{
 "id": 1,
 "external_id": "1728934017293477",
 "status": "open",
 "year": 2018,
 "month": 12,
 "due_date": "2018-12-28",
 "value_without_discount": 1000.0,
 "value_with_discount": 400.0,
 "interest": 0.0,
 "penalty": 0.0,
 "paid_value": 0.0,
 "paid_date": null,
 "payment_methods": [
    {
       "method_name": "boleto",
       "status": "waiting_payment",
       "paid_at": null,
       "full_value": 400.0,
       "paid_value": 0.0,
       "refunded_value": 0.0,
       "installments": 1,
       "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
       "boleto_url": "https://boleto-url.com",
       "boleto_expiry_date": "2018-12-28",
       "created_at": "2018-03-21T22:31:32Z",
       "updated_at": "2018-03-21T22:32:32Z"
    }
 ],
 "enrollment": {
    "id": 1234567,
    "external_id": "RA1234"
 },
 "created_at": "2018-03-20T22:31:32Z",
 "updated_at": "2018-03-20T22:32:32Z"
}
```

**Ambiente de testes**

É possível simular esse evento no seu ambiente de testes, batendo na rota de [Criação de matriculas](#criacao-de-uma-matricula), ao criar a matrícula nós criamos automáticamente as mensalidades.

## Mensalidade paga (bill_paid)

Ocorre quando uma [**Mensalidade**](#mensalidades) é dada como paga.

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: bill_paid
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: 5980475a-c875-4f00-bb9d-d94059b7a4af

{
 "id": 1,
 "external_id": "1728934017293477",
 "status": "paid",
 "year": 2018,
 "month": 12,
 "due_date": "2018-12-28",
 "value_without_discount": 1000.0,
 "value_with_discount": 400.0,
 "interest": 0.0,
 "penalty": 0.0,
 "paid_value": 400.0,
 "paid_date": "2018-12-27",
 "payment_methods": [
    {
       "method_name": "boleto",
       "status": "paid",
       "paid_at": "2018-12-27T22: 31: 32Z",
       "full_value": 400.0,
       "paid_value": 400.0,
       "refunded_value": 0.0,
       "installments": 1,
       "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
       "boleto_url": "https://boleto-url.com",
       "boleto_expiry_date": "2018-12-28",
       "created_at": "2018-03-21T22:31:32Z",
       "updated_at": "2018-03-21T22:32:32Z"
    }
 ],
 "enrollment": {
    "id": 1234567,
    "external_id": "RA1234"
 },
 "created_at": "2018-03-20T22:31:32Z",
 "updated_at": "2018-03-20T22:32:32Z"
}
```

**Ambiente de testes**

É possível simular esse evento no seu ambiente de testes, batendo na seguinte rota:

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/test-events/bill-paid/{id}` |

Passando como parâmetro o Identificador da mensalidade Quero Pago que deseja marcar como paga.

## Mensalidade vencida (bill_overdue)

Ocorre quando uma [**Mensalidade**](#mensalidades) é dada como vencida. Isso ocorre sempre no terceiro dia útil após a data de vencimento da mensalidade caso a mensalidade não seja paga.

> Exemplo

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: bill_overdue
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: c58812c8-139f-40b0-8aff-2df4845f401f

{
 "id": 1,
 "external_id": "1728934017293477",
 "status": "overdue",
 "year": 2018,
 "month": 12,
 "due_date": "2018-12-28",
 "value_without_discount": 1000.0,
 "value_with_discount": 400.0,
 "interest": 0.0,
 "penalty": 0.0,
 "paid_value": 0.0,
 "paid_date": null,
 "payment_methods": [
    {
       "method_name": "boleto",
       "status": "waiting_payment",
       "paid_at": null,
       "full_value": 400.0,
       "paid_value": 0.0,
       "refunded_value": 0.0,
       "installments": 1,
       "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
       "boleto_url": "https://boleto-url.com",
       "boleto_expiry_date": "2018-12-28",
       "created_at": "2018-03-21T22:31:32Z",
       "updated_at": "2018-03-21T22:32:32Z"
    }
 ],
 "enrollment": {
    "id": 1234567,
    "external_id": "RA1234"
 },
 "created_at": "2018-03-20T22:31:32Z",
 "updated_at": "2018-03-20T22:32:32Z"
}
```

**Ambiente de testes**

É possível simular esse evento no seu ambiente de testes, batendo na seguinte rota:

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/test-events/bill-overdue/{id}` |

Passando como parâmetro o Identificador da mensalidade Quero Pago que deseja marcar como vencida.

## Vencimento da mensalidade alterado (bill_due_date_changed)

Ocorre quando a data de vencimento de uma [**Mensalidade**](#mensalidades) é alterada.

> Exemplo

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: bill_due_date_changed
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: 33940f46-5eb0-4400-812e-1b78018151c8

{
  "id": 1,
  "external_id": "1728934017293477",
  "status": "open",
  "year": 2018,
  "month": 12,
  "due_date": "2019-10-10",
  "value_without_discount": 1000.0,
  "value_with_discount": 400.0,
  "interest": 0.0,
  "penalty": 0.0,
  "paid_value": 0.0,
  "paid_date": null,
  "payment_methods": [
    {
      "method_name": "boleto",
      "status": "waiting_payment",
      "paid_at": null,
      "full_value": 400.0,
      "paid_value": 0.0,
      "refunded_value": 0.0,
      "installments": 1,
      "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000004321",
      "boleto_url": "https://boleto-url.com",
      "boleto_expiry_date": "2019-10-10",
      "created_at": "2018-03-21T22:31:32Z",
      "updated_at": "2018-03-21T22:32:32Z"
    },
    {
      "method_name": "boleto",
      "status": "inactive",
      "paid_at": null,
      "full_value": 400.0,
      "paid_value": 0.0,
      "refunded_value": 0.0,
      "installments": 1,
      "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
      "boleto_url": "https://boleto-url.com",
      "boleto_expiry_date": "2018-12-28",
      "created_at": "2018-03-21T22:31:32Z",
      "updated_at": "2018-03-21T22:32:32Z"
    }
  ],
  "enrollment": {
    "id": 1234567,
    "external_id": "RA1234"
  },
  "created_at": "2018-03-20T22:31:32Z",
  "updated_at": "2018-03-20T22:32:32Z"
}
```

**Ambiente de testes**

É possível simular esse evento no seu ambiente de testes, batendo na rota de [Update de matrícula](#update-de-uma-matricula), passando como parâmetro o dia de vencimento (`due_day`).

## Boleto atualizado (boleto_updated)

Ocorre quando é criado um novo boleto para uma [**Mensalidade**](#mensalidades).

> Exemplo

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: boleto_updated
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: 33940f46-5eb0-4400-812e-1b78018151c8

{
 "id": 1,
 "external_id": "1728934017293477",
 "status": "open",
 "year": 2018,
 "month": 12,
 "due_date": "2019-10-10",
 "value_without_discount": 1000.0,
 "value_with_discount": 400.0,
 "interest": 0.0,
 "penalty": 0.0,
 "paid_value": 0.0,
 "paid_date": null,
 "payment_methods": [
    {
       "method_name": "boleto",
       "status": "waiting_payment",
       "paid_at": null,
       "full_value": 400.0,
       "paid_value": 0.0,
       "refunded_value": 0.0,
       "installments": 1,
       "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000004321",
       "boleto_url": "https://boleto-url.com",
       "boleto_expiry_date": "2019-10-10",
       "created_at": "2018-03-21T22:31:32Z",
       "updated_at": "2018-03-21T22:32:32Z"
    },
    {
       "method_name": "boleto",
       "status": "inactive",
       "paid_at": null,
       "full_value": 400.0,
       "paid_value": 0.0,
       "refunded_value": 0.0,
       "installments": 1,
       "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
       "boleto_url": "https://boleto-url.com",
       "boleto_expiry_date": "2018-12-28",
       "created_at": "2018-03-21T22:31:32Z",
       "updated_at": "2018-03-21T22:32:32Z"
    }
 ],
 "enrollment": {
    "id": 1234567,
    "external_id": "RA1234"
 },
 "created_at": "2018-03-20T22:31:32Z",
 "updated_at": "2018-03-20T22:32:32Z"
}
```
**Ambiente de testes**

É possível simular esse evento no seu ambiente de testes, batendo na seguinte rota:

| Parâmetro | Conteúdo |
| ---- | --------- |
| Header | `"Authorization: Bearer ########"` |
| Header | `"Content-Type: application/json"` |
| Método HTTP | `PUT` |
| URL | `https://queropago.com.br/api/v1/test-events/boleto-updated/{id}` |

Passando como parâmetro o Identificador da mensalidade Quero Pago que deseja gerar um novo boleto.
