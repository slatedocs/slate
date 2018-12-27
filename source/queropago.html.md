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

Endpoint utilizado

`https://queropago.com.br/api/v1`

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
| discount_percentage | float    | Porcentagem de desconto da bolsa adquirida                                                    |
| due_day             | int      | Dia de vencimento das mensalidades                                                            |
| start_year          | int      | Ano de início das cobranças                                                                   |
| start_month         | int      | Mês de início das cobranças. Valores de 1 a 12, sendo 1 Janeiro e 12 Dezembro                 |
| duration_in_months  | int      | Número total de mensalidades do curso                                                         |
| created_at          | datetime | Momento da criação da matrícula no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) em UTC |

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
      "created_at": "2018-12-27T17:01:18Z",
      "discount_percentage": 0.4,
      "due_day": 15,
      "start_year": 2018,
      "start_month": 7,
      "duration_in_months": 24,
      "course": {
        "id": 1,
        "external_id": "21348329432"
      },
      "student": {
        "id": 1,
        "cpf": "00000000000"
      }
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

### Filtros

| Nome | Tipo | Descrição |
| ---- | ---- | --------- |
| page | Query | Número da página que deve ser retornada |
| student_cpf | Query | Retorna as matrículas pertencentes ao aluno com o CPF indicado. Pode ser enviado com ou sem formato, apenas os dígitos serão considerados |
| created_at_gte | Query | Retorna as matrículas criadas a partir da data indicada no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |
| created_at_lte | Query | Retorna as matrículas criadas até a data indicada no formato [ISO 8601](https://pt.wikipedia.org/wiki/ISO_8601) |

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
| paid_date              | date   | Data do pagamento, formatado no padrão ISO8601                      |
| paid_with              | array  | Lista de meios de pagamento utilizados, vazio se ainda não foi pago |
| boleto_barcode         | text   | Código de barras do boleto                                          |
| boleto_url             | text   | URL para download do boleto                                         |

**Estados possíveis de uma Mensalidade**

| Nome | Descrição |
| ---- | --------- |
| open | Mensalidade em aberto/disponível para pagamento |
| paid | Mensalidade paga |
| overdue | Mensalidade em atraso |

**Atributos dos Métodos de Pagamento utilizados**

| Campo | Tipo | Descrição |
| ----- | ---- | --------- |
| method_name | text | Nome do meio de pagamento utilizado |
| paid_at | datetime | Momento do pagamento, formatado no padrão ISO8601 em UTC |
| paid_value | float | Valor pago |

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
  "total_pages": 1,
  "items": [
    {
      "id": 1,
      "external_id": "1728934017293477",
      "status": "paid",
      "year": 2018,
      "month": 6,
      "due_date": "2018-06-15",
      "value_without_discount": 1000.00,
      "value_with_discount": 400.00,
      "paid_value": 0.00,
      "paid_date": "2018-12-27",
      "interest": 0.00,
      "penalty": 0.00,
      "paid_with": [
          {
              "method_name": "credit_card",
              "paid_at": "2018-12-27T19:07:03Z",
              "paid_value": 400.00
          }
      ],
      "boleto_url": "https://boleto-url.com",
      "boleto_barcode": "12345.12345 12345.123456 12345.123456 1 12300000001234",
      "enrollment": {
        "id": 1,
        "external_id": "RA984930527"
      }
    }
  ]
}
```

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

# Webhooks

Com webhooks você poderá receber informações sobre eventos que ocorrem no Quero Pago. Consiste basicamente de um endereço onde enviamos requisições HTTP com os dados de eventos. Por exemplo, dados referente a um evento de mensalidade paga.
Na criação dos webhooks será necessário informar a URL para receber os requisições e também quais eventos devem ser enviados.


## Entregas de eventos
A entrega de eventos ocorrerá apenas para endereços https por motivo de segurança, portanto seu webhook deve estar preparado para isso.

É esperado que toda resposta para um entrega de evento tenha algum código de status de sucesso HTTP 2xx, qualquer código de status diferente desse será considerado como uma falha na entrega. Caso alguma falha de entrega ocorra faremos tentativas de entrega por até 3 dias após a ocorrência do evento em tempos crescentes.

O corpo de toda requisição será sempre no formato JSON (`application/json`).


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
  "external_id": "RA984930527",
  "discount_percentage": 0.4,
  "due_day": 15,
  "start_year": 2018,
  "start_month": 7,
  "duration_in_months": 24,
  "course": {
    "id": 1,
    "external_id": "21348329432",
    "name": "Administração",
    "shift": "Manhã",
    "kind": "EaD",
    "level": "Graduação"
  },
  "student": {
    "id": 1,
    "cpf": "00000000000",
    "name": "Cauê Matheus Santos",
    "birthday": "2000-01-01",
    "address": {
      "street": "Rua Curuca",
      "number": "717",
      "neighborhood": "Tabajara",
      "city_name": "Olinda",
      "city_ibge_code": 123456,
      "state_acronym": "PE",
      "state_ibge_code": 123456
    }
  }
}
```

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
  "external_id": "RA984930527",
  "discount_percentage": 0.4,
  "due_day": 15,
  "start_year": 2018,
  "start_month": 7,
  "duration_in_months": 24,
  "course": {
    "id": 1,
    "external_id": "21348329432"
  },
  "student": {
    "id": 1,
    "cpf": "00000000000"
  }
}
```

## Matrícula finalizada (enrollment_finished)

Ocorre quando é pago todo o valor devido de uma [**Matrícula**](#matriculas).

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: enrollment_finished
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: faf10161-dc56-4173-9751-b08da5f57d61

{
  "id": 1234567,
  "external_id": "RA984930527",
  "discount_percentage": 0.4,
  "due_day": 15,
  "start_year": 2018,
  "start_month": 7,
  "duration_in_months": 24,
  "course": {
    "id": 1,
    "external_id": "21348329432"
  },
  "student": {
    "id": 1,
    "cpf": "00000000000"
  }
}
```

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
  "month": 6,
  "due_date": "2018-06-15",
  "value_without_discount": 1000.00,
  "value_with_discount": 400.00,
  "paid_value": 0.00,
  "paid_at": null,
  "interest": 0.00,
  "penalty": 0.00,
  "paid_with": [],
  "boleto_url": "",
  "enrollment": {
    "id": 1,
    "external_id": "RA984930527"
  }
}
```

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
  "month": 6,
  "due_date": "2018-06-15",
  "value_without_discount": 1000.00,
  "value_with_discount": 400.00,
  "paid_value": 400.00,
  "paid_at": "2018-04-18T15:04:31Z",
  "interest": 0.00,
  "penalty": 0.00,
  "paid_with": [
    { "method_name": "credit_card", "paid_at": "2018-04-18T15:04:31Z", "paid_value": 100.00 },
    { "method_name": "boleto", "paid_at": "2018-04-17T00:00:00Z", "paid_value": 300.00 },
  ],
  "enrollment": {
    "id": 1,
    "external_id": "RA984930527"
  }
}
```

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
  "month": 6,
  "due_date": "2018-06-15",
  "value_without_discount": 1000.00,
  "value_with_discount": 400.00,
  "paid_value": 0.00,
  "paid_at": null,
  "interest": 0.00,
  "penalty": 0.00,
  "paid_with": [],
  "enrollment": {
    "id": 1,
    "external_id": "RA984930527"
  }
}
```

## Vencimento da mensalidade alterada (bill_due_date_changed)

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
  "status": "overdue",
  "year": 2018,
  "month": 6,
  "due_date": "2018-06-20",
  "value_without_discount": 1000.00,
  "value_with_discount": 400.00,
  "paid_value": 0.00,
  "paid_at": null,
  "interest": 0.00,
  "penalty": 0.00,
  "paid_with": [],
  "enrollment": {
    "id": 1,
    "external_id": "RA984930527"
  }
}
```

## Encargos da mensalidade alteradas (bill_charges_changed)
Ocorre quando os valores de juros e/ou multa da [**Mensalidade**](#mensalidades) são alterados.

> Exemplo

```http
POST /your-webhook HTTP/1.1
Content-Type: application/json; charset=utf-8
X-QP-Event: bill_charges_changed
X-QP-Signature: f0a62682f54860925766a26b302cdd973cfaad9f71d375e99ca6d287fa109193
X-QP-Delivery: d10663b9-f755-4f52-8b52-46777d861b1c

{
  "id": 1,
  "external_id": "1728934017293477",
  "status": "overdue",
  "year": 2018,
  "month": 6,
  "due_date": "2018-06-15",
  "value_without_discount": 1000.00,
  "value_with_discount": 400.00,
  "paid_value": 0.00,
  "paid_at": null,
  "interest": 1.50,
  "penalty": 4.00,
  "paid_with": [],
  "enrollment": {
    "id": 1,
    "external_id": "RA984930527"
  }
}
```
