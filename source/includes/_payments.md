# Pagamento

<aside class="warning">
Por enquanto, esta API está disponível apenas para contas beta.
</aside>

```shell
Pagamentos

EXEMPLO

  {
    "id": 10,
    "amount": "456.78",
    "date": "2017-12-07",
    "our_number": null,
    "payment_method": "ted_same_ownership",
    "payment_type": "benefit",
    "account": "12345",
    "account_digit": "9",
    "agency": "4321",
    "bank_code": "033",
    "doc_goal": null,
    "payee_document": "123.456.789-09",
    "payee_name": "John Doe",
    "ted_goal": "00300",
    "_links": [
      { "rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/payments/10" },
      { "rel": "update", "method": "PUT", "href": "https://app.cobrato.com/api/v1/payments/10" },
      { "rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/payments/10" },
      { "rel": "payment_config", "method": "GET", "href": "https://app.cobrato.com/api/v1/payment_configs/1" }
    ]
  }

```

**Parâmetros**

| Campo                     | Tipo    | Comentário                                                                                                                                                                                                                                                                                             |
|---------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| payment_config_id         | integer | código de identificação da configuração de pagamento à qual o pagamento irá pertencer                                                                                                                                                                                                                  |
| amount                    | decimal | valor do pagamento                                                                                                                                                                                                                                                                                     |
| date                      | date    | data do pagamento                                                                                                                                                                                                                                                                                      |
| payment_method            | string  | forma de pagamento ('credit_other_ownership', 'credit_same_ownership', 'credit_savings_account', 'doc_other_ownership', 'doc_same_ownership', 'ted_other_ownership', 'ted_same_ownership')                                                                                                             |
| payment_type              | string  | tipo de pagamento. Os possíveis valores variam de acordo com o "payment_method" (vide tabela 1)                                                                                                                                                                                                        |
| bank_code                 | string  | código de 3 dígitos do banco da conta bancária para o pagamento                                                                                                                                                                                                                                        |
| account                   | string  | número da conta bancária para o pagamento                                                                                                                                                                                                                                                              |
| account_digit             | string  | dígito da conta bancária para fazer o pagamento                                                                                                                                                                                                                                                        |
| agency                    | string  | número da agência da conta bancária para fazer o pagamento                                                                                                                                                                                                                                             |
| payee_name                | string  | nome do beneficiário                                                                                                                                                                                                                                                                                   |
| payee_document_type       | string  | tipo do documento do beneficiário                                                                                                                                                                                                                                                                      |
| payee_document            | string  | número do documento do beneficiário                                                                                                                                                                                                                                                                    |
| doc_goal                  | string  | código referente ao objetivo do DOC. Possíveis valores na tabela 2                                                                                                                                                                                                                                     |
| ted_goal                  | string  | código referente ao objetivo do TED. Possíveis valores na tabela 3                                                                                                                                                                                                                                     |
| our_number                | string  | número que identifica o pagamento no banco                                                                                                                                                                                                                                                             |
| registration_status       | string  | status de registro do pagamento ('without_remittance', 'remitted', 'registered', 'canceled', 'edit_amount_started', 'edit_date_started', 'registered_with_error', 'cancelation_started', 'canceled_awaiting_confirmation', 'amount_edited_awaiting_confirmation', 'date_edited_awaiting_confirmation') |

## Informações do Pagamento

```shell
Mostrar Pagamento

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payments/:payment_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payments/:payment_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id": 10,
    "amount": "456.78",
    "date": "2017-12-07",
    "our_number": null,
    "payment_method": "ted_same_ownership",
    "payment_type": "benefit",
    "account": "12345",
    "account_digit": "9",
    "agency": "4321",
    "bank_code": "033",
    "doc_goal": null,
    "payee_document": "123.456.789-09",
    "payee_name": "John Doe",
    "ted_goal": "00300",
    "_links": [
      { "rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/payments/10" },
      { "rel": "update", "method": "PUT", "href": "https://app.cobrato.com/api/v1/payments/10" },
      { "rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/payments/10" },
      { "rel": "payment_config", "method": "GET", "href": "https://app.cobrato.com/api/v1/payment_configs/1" }
    ]
  }

```

Retorna em JSON as informações detalhadas do Pagamento informado e também suas referências.

## Lista de todos os Pagamentos

```shell
Listar Pagamentos

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/payments

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/payments

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "payments":
      [
        {
          // informações pagamento 1
        },
        {
          // informações pagamento 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos os Pagamentos que pertencem a sua Conta de Serviço.

## Criação de Pagamento

```shell
Criar Pagamento

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/payments

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/payments \
    -d '{
          "payment_config_id": "1",
          "payment_type": "provider",
          "payment_method": "ted_other_ownership",
          "date": "2017-10-22",
          "amount": "255.99",
          "bank_code": "341",
          "agency": "9358",
          "account": "21500",
          "account_digit": "3",
          "payee_document_type": "cpf",
          "payee_document": "123.456.789-09",
          "payee_name": "Jane Doe"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "payment_config_id":["não pode ficar em branco"],
        "payment_type":["não pode ficar em branco"]
      }
  }

```

Cria um novo Pagamento, retornando as informações do mesmo em caso de sucesso. Se houverem erros eles serão informados no corpo da resposta.

### Transferências (DOC, TED, Crédito)

**Parâmetros**

| Campo                     | Tipo    | Comentário                                                                                                                                                                                                 |
|---------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| payment_config_id         | integer | **(requerido)** código de identificação da configuração de pagamento à qual o pagamento irá pertencer                                                                                                      |
| amount                    | decimal | **(requerido)** valor do pagamento                                                                                                                                                                         |
| date                      | date    | **(requerido)** data do pagamento                                                                                                                                                                          |
| payment_method            | string  | **(requerido)** forma de pagamento ('credit_other_ownership', 'credit_same_ownership', 'credit_savings_account', 'doc_other_ownership', 'doc_same_ownership', 'ted_other_ownership', 'ted_same_ownership') |
| payment_type              | string  | **(requerido)** tipo de pagamento. Os possíveis valores variam de acordo com o "payment_method" (vide tabela 1)                                                                                            |
| bank_code                 | string  | **(requerido)** código de 3 dígitos do banco da conta bancária para o pagamento                                                                                                                            |
| account                   | string  | **(requerido)** número da conta bancária para o pagamento                                                                                                                                                  |
| account_digit             | string  | **(requerido)** dígito da conta bancária para fazer o pagamento                                                                                                                                            |
| agency                    | string  | **(requerido)** número da agência da conta bancária para fazer o pagamento                                                                                                                                 |
| payee_name                | string  | **(requerido)** nome do beneficiário                                                                                                                                                                       |
| payee_document_type       | string  | **(requerido)** tipo do documento do beneficiário                                                                                                                                                          |
| payee_document            | string  | **(requerido)** número do documento do beneficiário                                                                                                                                                        |
| doc_goal                  | string  | (opcional e apenas utilizado quando payment_method é 'doc_other_ownership' ou 'doc_same_ownership') código referente ao objetivo do DOC. Possíveis valores na tabela 2                                     |
| ted_goal                  | string  | (opcional e apenas utilizado quando payment_method é 'ted_other_ownership') código referente ao objetivo do TED. Possíveis valores na tabela 3                                                             |

## Atualização de Pagamento

```shell
Atualizar Pagamento

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/payments/:id
  PATCH https://app.cobrato.com/api/v1/payments/:id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/payents/:id \
    -d '{
          "amount": "125.99"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM PAGAMENTO INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "amount": ["não pode ficar em branco"]
      }
  }

```

Atualiza um determinado Pagamento, retornando as informações do mesmo em caso de sucesso. Se houverem erros, eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

**Parâmetros**

| Campo                     | Tipo    | Comentário                                                                                                                                                                                                 |
|---------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| amount                    | decimal | **(requerido)** valor do pagamento                                                                                                                                                                         |
| date                      | date    | **(requerido)** data do pagamento                                                                                                                                                                          |
| bank_code                 | string  | **(requerido)** código de 3 dígitos do banco da conta bancária para o pagamento                                                                                                                            |
| account                   | string  | **(requerido)** número da conta bancária para o pagamento                                                                                                                                                  |
| account_digit             | string  | **(requerido)** dígito da conta bancária para fazer o pagamento                                                                                                                                            |
| agency                    | string  | **(requerido)** número da agência da conta bancária para fazer o pagamento                                                                                                                                 |
| payee_name                | string  | **(requerido)** nome do beneficiário                                                                                                                                                                       |
| payee_document_type       | string  | **(requerido)** tipo do documento do beneficiário                                                                                                                                                          |
| payee_document            | string  | **(requerido)** número do documento do beneficiário                                                                                                                                                        |
| doc_goal                  | string  | (opcional e apenas utilizado quando payment_method é 'doc_other_ownership' ou 'doc_same_ownership') código referente ao objetivo do DOC. Possíveis valores na tabela 2                                     |
| ted_goal                  | string  | (opcional e apenas utilizado quando payment_method é 'ted_other_ownership') código referente ao objetivo do TED. Possíveis valores na tabela 3                                                             |

## Exclusão de Pagamento

```shell
Excluir Pagamento

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/payment/:id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/payment/:id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM PAGAMENTO INEXISTENTE

    404 Not Found

```

Exclui determinado Pagamento. As mudanças são irreversíveis.

## Tabelas

### Possíveis valores para payment_type (tabela 1)

| payment_type ⟶ <br> payment_method ↴ | salary <br>&nbsp; | dividend <br>&nbsp; | debenture <br>&nbsp; | traveling_expense <br>&nbsp; | authorized_representative <br>&nbsp; | provider <br>&nbsp; | benefit <br>&nbsp; | insurance_claim <br>&nbsp; | investment_fund <br>&nbsp; | other <br>&nbsp; | tribute <br>&nbsp; |
|---------------------------------------:|:-----------------:|:-------------------:|:--------------------:|:----------------------------:|:------------------------------------:|:-------------------:|:------------------:|:--------------------------:|:--------------------------:|:----------------:|:------------------:|
| credit_other_ownership                 | X                 | X                   | X                    | X                            | X                                    | X                   | X                  | X                          | X                          | X     |                    |
| credit_same_ownership                  |                   |                     |                      |                              |                                      | X                   |                    |                            |                            | X     |                    |
| credit_savings_account                 |                   | X                   |                      |                              |                                      | X                   | X                  | X                          |                            | X     |                    |
| doc_other_ownership                    |                   | X                   | X                    | X                            | X                                    | X                   | X                  | X                          |                            | X     |                    |
| doc_same_ownership                     |                   |                     |                      |                              |                                      | X                   |                    |                            |                            | X     |                    |
| ted_other_ownership                    |                   | X                   | X                    | X                            | X                                    | X                   | X                  | X                          |                            | X     |                    |
| ted_same_ownership                     |                   |                     |                      |                              |                                      | X                   |                    |                            |                            | X     |                    |

### Possíveis valores para doc_goal (tabela 2)

Quando *payment_method* for 'doc_other_ownership' todos os valores são aceitos. Contudo, quando *payment_method* for 'doc_same_ownership', apenas os valores '01' e '11' são aceitos.

| Código | Descrição                                                                  |
|--------|----------------------------------------------------------------------------|
| 01     | Crédito em Conta                                                           |
| 02     | Pagamento de Aluguel / Condomínio                                          |
| 03     | Pagamento de Duplicata / Títulos                                           |
| 04     | Pagamento de Dividendos                                                    |
| 05     | Pagamento de Mensalidade Escolar                                           |
| 06     | Pagamento de Salários                                                      |
| 07     | Pagamento de Fornecedores / Honorários                                     |
| 08     | Operações de Câmbio / Fundos                                               |
| 09     | Repasse de Arrecadação / Pagamento de Tributos                             |
| 10     | Transferência Internacional de Reais                                       |
| 11     | DOC para Poupança                                                          |
| 12     | DOC para Depósito Judicial                                                 |
| 13     | Pensão Alimentícia                                                         |
| 99     | Outros                                                                     |

### Possíveis valores para ted_goal (tabela 3)

| Código | Descrição                                                                  |
|--------|----------------------------------------------------------------------------|
| 00001  | Pagamento de Impostos, Tributos e Taxas                                    |
| 00002  | Pagamento a Concessionárias de Serviço Público                             |
| 00003  | Pagamento de Dividendos                                                    |
| 00004  | Pagamento de Salários                                                      |
| 00005  | Pagamento de Fornecedores                                                  |
| 00006  | Pagamento de Honorários                                                    |
| 00007  | Pagamento de Aluguéis e Taxas e Condomínio                                 |
| 00008  | Pagamento de Duplicatas e Títulos                                          |
| 00009  | Pagamento de Honorários                                                    |
| 00010  | Crédito em Conta                                                           |
| 00011  | Pagamento a Corretoras                                                     |
| 00016  | Crédito em Conta Investimento                                              |
| 00100  | Depósito Judicial                                                          |
| 00101  | Pensão Alimentícia                                                         |
| 00200  | Transferência Internacional de Reais                                       |
| 00201  | Ajuste Posição Mercado Futuro                                              |
| 00204  | Compra/Venda de Ações - Bolsas de Valores e Mercado de Balcão              |
| 00205  | Contrato referenciado em Ações/Índices de Ações - BV/BMF                   |
| 00300  | Restituição de Imposto de Renda                                            |
| 00500  | Restituição de Prêmio de Seguros                                           |
| 00501  | Pagamento de indenização de Sinistro de Seguro                             |
| 00502  | Pagamento de Prêmio de Co-seguro                                           |
| 00503  | Restituição de prêmio de Co-seguro                                         |
| 00504  | Pagamento de indenização de Co-seguro                                      |
| 00505  | Pagamento de prêmio de Resseguro                                           |
| 00506  | Restituição de prêmio de Resseguro                                         |
| 00507  | Pagamento de Indenização de Sinistro de Resseguro                          |
| 00508  | Restituição de Indenização de Sinistro de Resseguro                        |
| 00509  | Pagamento de Despesas com Sinistros                                        |
| 00510  | Pagamento de Inspeções/Vistorias Prévias                                   |
| 00511  | Pagamento de Resgate de Título de Capitalização                            |
| 00512  | Pagamento de Sorteio de Título de Capitalização                            |
| 00513  | Pagamento de Devolução de Mensalidade de Título de Capitalização           |
| 00514  | Restituição de Contribuição de Plano Previdenciário                        |
| 00515  | Pagamento de Benefício Previdenciário de Pecúlio                           |
| 00516  | Pagamento de Benefício Previdenciário de Pensão                            |
| 00517  | Pagamento de Benefício Previdenciário de Aposentadoria                     |
| 00518  | Pagamento de Resgate Previdenciário                                        |
| 00519  | Pagamento de Comissão de Corretagem                                        |
| 00520  | Pagamento de Transferências/Portabilidade de Reserva de Seguro/Previdência |
