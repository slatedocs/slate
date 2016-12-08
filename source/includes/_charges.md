# Cobrança

```shell
Cobrança

EXEMPLO

  {
    "id":1,
    "type": "billet",
    "charge_config_id": 1,
    "due_date":"2015-02-14",
    "document_kind":"DV",
    "document_date":null,
    "document_number":null,
    "custom_our_number": "true",
    "our_number":"0",
    "our_number_digit":null,
    "charged_amount":"10.07",
    "interest_amount_per_month": "1.02",
    "mulct_type": "percentage",
    "mulct_value": "10.12",
    "instructions":"Pagável em qualquer agência até data do vencimento.",
    "demonstrative":"Não receber após o vencimento.",
    "notification_emails":["myemail@gmail.com"],
    "received":true, # deprecated
    "received_amount":"10.07", # deprecated
    "received_at":"2015-01-30", # deprecated
    "paid_amount":"10.07",
    "paid_at":"2015-01-30",
    "payment_tax":"2.5",
    "processing_date":"2015-01-30",
    "for_homologation":true,
    "registrable": true,
    "payer_national_identifier_type": "cpf",
    "payer_national_identifier": "12345678909",
    "payer_name": "Jonh Doe",
    "payer_number": "43",
    "payer_complement": "8 andar",
    "payer_street": "Rua do Carmo",
    "payer_neighbourhood": "Centro",
    "payer_zipcode": "22230062",
    "payer_city": "Rio de Janeiro",
    "payer_state": "RJ",
    "registration_status": "without_remittance",
    "canceled_at": "2015-01-31T17:46:01.253Z",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"receive","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/receive"},
        {"rel":"deliver","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/deliver_billet"},
        {"rel":"charge_config","method":"GET","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"billet","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1/billet"},
        {"rel":"cancel","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/cancel"}
      ]
  }
```

Cada uma das cobranças criadas serão do mesmo tipo da configuração. Desta forma qualquer Cobrança criada sob uma Configuração de Cobrança do tipo Boleto será uma cobrança do tipo Boleto. Por este motivo os parâmetros, validações e alguns comportamentos serão variáveis de acordo com o tipo de cobrança.

### Boleto

**Parâmetros**

| Campo                          | Tipo             | Comentário                                                                                                                                          |
|--------------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| id                             | integer          |                                                                                                                                                     |
| type                           | string           | indica o tipo da cobrança. Nesse caso, "billet"                                                                                                     |
| charge_config_id               | integer          | identificador da configuração de cobrança a qual esta cobrança pertence                                                                             |
| due_date                       | date             | data de vencimento da cobranca                                                                                                                      |
| document_kind                  | string           | espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos)                       |
| document_date                  | date             | data de emissão do documento                                                                                                                        |
| document_number                | string           | número do documento é o número utilizado e controlado pelo beneficiário para identificar o título de cobrança.                                      |
| our_number                     | string           | nosso número                                                                                                                                        |
| our_number_digit               | integer          | digito do verificador do nosso número                                                                                                               |
| custom_our_number              | boolean          | indica se a cobrança utiliza um "nosso número" customizado. O valor padrão é false, mas caso definido true, o campo 'our_number' se torna requerido |
| charged_amount                 | decimal          | valor cobrado no boleto                                                                                                                             |
| interest_amount_per_month      | decimal          | porcentagem de juros mensal que deve ser aplicado em caso de atraso. No boleto será mostrado o valor diário de juros que será calculado             |
| mulct_type                     | string           | indica o tipo de multa que deve ser aplicada em caso de atraso ("percentage" para porcentagem, "currency" para valor em reais)                      |
| mulct_value                    | decimal          | valor da multa que deve ser aplicada em caso de atraso, com base em seu tipo                                                                        |
| instructions                   | string           | instruções de pagamento do boleto, por padrão "Pagável em qualquer agência até data do vencimento."                                                 |
| demonstrative                  | string           | demonstrativo do Boleto, por padrão "Não receber após o vencimento."                                                                                |
| notification_emails            | array of strings | emails que receberão notificações sobre a cobrança                                                                                                  |
| payer_emails                   | array of strings | (DEPRECATED: use notification_emails) emails que receberão notificações sobre a cobrança                                                            |
| received                       | boolean          | (DEPRECATED: use paid_at) indica se a cobrança foi recebida                                                                                         |
| received_amount                | decimal          | (DEPRECATED: use paid_amount) valor pago                                                                                                            |
| received_at                    | datetime         | (DEPRECATED: use paid_at) date e horário em que a cobrança foi paga                                                                                 |
| paid_amount                    | decimal          | valor pago                                                                                                                                          |
| paid_at                        | datetime         | date e horário em que a cobrança foi paga                                                                                                           |
| payment_tax                    | decimal          | valor taxa cobrada pela instituição financeira para o processamento da cobrança                                                                     |
| processing_date                | date             | data de geração do boleto                                                                                                                           |
| for_homologation               | boolean          | indica se é uma cobrança que foi criada com o objetivo de homologar uma Configuração de cobrança                                                    |
| registrable                    | boolean          | indica se a cobrança é registrável (do tipo que deve ser registrada no banco). Por padrão é o que está definido na Configuração de Cobrança         |
| payer_id                       | integer          | identificador do pagador                                                                                                                            |
| payer_national_identifier_type | string           | tipo do documento do pagador (cpf ou cnpj)                                                                                                          |
| payer_national_identifier      | string           | documento do pagador                                                                                                                                |
| payer_name                     | string           | nome do pagador                                                                                                                                     |
| payer_number                   | string           | número do endereço do pagador                                                                                                                       |
| payer_complement               | string           | complemento do endereço do pagador                                                                                                                  |
| payer_street                   | string           | rua do endereço do pagador                                                                                                                          |
| payer_neighbourhood            | string           | bairro do endereço do pagador                                                                                                                       |
| payer_zipcode                  | string           | cep do endereço do pagador                                                                                                                          |
| payer_city                     | string           | cidade do endereço do pagador                                                                                                                       |
| payer_state                    | string           | sigla do estado do endereço do pagador ("RJ" por exemplo)                                                                                           |
| registration_status            | string           | status de registro em que a cobrança se encontra (without_remittance, remitted, registered, registered_with_error, cancelation_started, canceled)   |
| canceled_at                    | datetime         | data e horário em que a cobrança foi cancelada, se for o caso                                                                                       |
| _links                         | array of object  | links relacionados à cobrança                                                                                                                       |

### Gateway de Pagamento

As Cobranças tem o comportamento assíncrono em relação à comunicação com o Gateway de Pagamento. Ou seja, às ações que dependem de efetivação no Gateway de Pagamento não tem resposta na mesma requisição, são feitas em um processo separado e tem suas respostas dadas em payloads via webhook.

**Parâmetros**

| Campo                          | Tipo             | Comentário                                                                                                                                    |
|--------------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| id                             | integer          |                                                                                                                                               |
| type                           | string           | indica o tipo da cobrança. Nesse caso, "payment_gateway"                                                                                      |
| charge_config_id               | integer          | identificador da configuração de cobrança a qual esta cobrança pertece                                                                        |
| charged_amount                 | decimal          | valor cobrado no boleto                                                                                                                       |
| notification_emails            | array of strings | emails que receberão notificações sobre a cobrança                                                                                            |
| payer_emails                   | array of strings | (DEPRECATED: use notification_emails) emails que receberão notificações sobre a cobrança                                                      |
| payer_id                       | integer          | identificador do pagador                                                                                                                      |
| payer_national_identifier_type | string           | tipo do documento do pagador (cpf ou cnpj)                                                                                                    |
| payer_national_identifier      | string           | documento do pagador                                                                                                                          |
| payer_name                     | string           | nome do pagador                                                                                                                               |
| payer_number                   | string           | número do endereço do pagador                                                                                                                 |
| payer_complement               | string           | complemento do endereço do pagador                                                                                                            |
| payer_street                   | string           | rua do endereço do pagador                                                                                                                    |
| payer_neighbourhood            | string           | bairro do endereço do pagador                                                                                                                 |
| payer_zipcode                  | string           | cep do endereço do pagador                                                                                                                    |
| payer_city                     | string           | cidade do endereço do pagador                                                                                                                 |
| payer_state                    | string           | sigla do estado do endereço do pagador ("RJ" por exemplo)                                                                                     |
| credit_card_id                 | integer          | identificador do cartão de crédito utilizado na cobrança                                                                                      |
| description                    | string           | descrição da cobrança                                                                                                                         |
| soft_descriptor                | string           | descritor que irá aparecer na fatura do cartão (no máximo 13 caracteres)                                                                      |
| payment_method                 | string           | método de pagamento (1: pagamento à vista, 2: pagamento parcelado)                                                                            |
| installments                   | integer          | número de parcelas                                                                                                                            |
| for_homologation               | boolean          | indica se é uma cobrança que foi criada com o objetivo de homologar uma Configuração de cobrança ou um Cartão de Crédito                      |
| payment_gateway_status         | string           | status da cobrança em relação ao gateway de pagamento (pending, authorized, captured, canceled, authorize_error, capture_error, cancel_error) |
| payment_gateway_message        | string           | mensagem do gateway de pagamento relacionada ao seu status                                                                                    |
| canceled_at                    | datetime         | data e horário em que a cobrança foi cancelada, se for o caso                                                                                 |
| _links                         | array of object  | links relacionados à cobrança                                                                                                                 |

## Informações da Cobrança

```shell
Mostrar Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA (BOLETO)

  {
    "id":1,
    "type":"billet",
    "charge_config_id": 1,
    "due_date":"2015-02-14",
    "document_kind":"DV",
    "document_date":null,
    "document_number":null,
    "custom_our_number": "true",
    "our_number":"0",
    "our_number_digit":null,
    "charged_amount":"10.07",
    "interest_amount_per_month": "1.02",
    "mulct_type": "percentage",
    "mulct_value": "10.12",
    "instructions":"Pagável em qualquer agência até data do vencimento.",
    "demonstrative":"Não receber após o vencimento.",
    "notification_emails":["myemail@gmail.com"],
    "received":true, # deprecated
    "received_amount":"10.07", # deprecated
    "received_at":"2015-01-30", # deprecated
    "paid_amount":"10.07",
    "paid_at":"2015-01-30",
    "payment_tax":"2.5",
    "processing_date":"2015-01-30",
    "for_homologation":true,
    "registrable": true,
    "payer_national_identifier_type": "cpf",
    "payer_national_identifier": "12345678909",
    "payer_name": "Jonh Doe",
    "payer_number": "43",
    "payer_complement": "8 andar",
    "payer_street": "Rua do Carmo",
    "payer_neighbourhood": "Centro",
    "payer_zipcode": "22230062",
    "payer_city": "Rio de Janeiro",
    "payer_state": "RJ",
    "registration_status": "without_remittance",
    "canceled_at": "2015-01-31T17:46:01.253Z",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"receive","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/receive"},
        {"rel":"deliver","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/deliver_billet"},
        {"rel":"charge_config","method":"GET","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"billet","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1/billet"},
        {"rel":"cancel","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/cancel"}
      ]
  }
```

Retorna as informações detalhadas da cobrança informada em JSON e também a referência a sua configuração de cobrança.

<aside class="notice">
  O conteúdo do nó "_links" irá variar de acordo com o tipo e o status da cobrança. No caso da Cobrança do tipo boleto, além dos itens básicos mostrados no exemplo de resposta ao lado, se a cobrança tiver sido recebida, irá conter o seguinte link:

  <br><br>
  <p>
    <code>
    {"rel":"receive","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/receive"}
    </code>
  </p>

  <p>Caso contrário, irá conter este link:</p>

  <p>
    <code>
    {"rel":"undo_receive","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/undo_receive"}
    </code>
  </p>
</aside>

## Lista de Todas as Cobrança

```shell


DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charges

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charges

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "charges":
      [
        {
          // informações cobrança 1
        },
        {
          // informações cobrança 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos as cobranças que pertencem a sua Conta de Serviço.

## Criação de Cobrança

```shell
Criar Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charges

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charges \
    -d '{
          "charge_config_id": 1,
          "due_date":"2015-02-14",
          "document_kind":"DV",
          "our_number":"12345678",
          "charged_amount":"10.07",
          "notification_emails":["myemail@gmail.com"]
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {
        "charge_config_id":["não pode ficar em branco"],
        "our_number":["não pode ficar em branco"],
        "charged_amount":["não pode ficar em branco"],
        "document_kind":["não pode ficar em branco","não está incluído na lista"],
        "due_date":["não pode ficar em branco"]
      }
  }

```

Cria um nova cobrança, caso haja sucesso retornará as informações da mesma e será gerado seu boleto. Se houverem erros eles serão informados no corpo da resposta.

### Boleto

**Parâmetros**

| Campo                          | Tipo             | Comentário                                                                                                                                                                                                                                                                                                                                                     |
|--------------------------------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| charge_config_id               | integer          | **(requerido)** código de identificação da configuração de cobrança da qual a cobrança irá pertencer                                                                                                                                                                                                                                                           |
| due_date                       | date             | **(requerido)** data de vencimento da cobrança                                                                                                                                                                                                                                                                                                                 |
| document_kind                  | string           | **(requerido)** espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos)                                                                                                                                                                                                                  |
| charged_amount                 | decimal          | **(requerido)** valor cobrado no boleto                                                                                                                                                                                                                                                                                                                        |
| document_number                | string           | (opcional) número do documento é o número utilizado e controlado pelo beneficiário para identificar o título de cobrança. Caso não seja informado é atribído automaticamente um valor ateatório de até 10 caracters. Este valor deve ser único para cobranças feitas pelo Banco Bradesco de mesmo valor cobrado, data de vencimento e configuração de cobrança |
| notification_emails            | array of strings | (opcional) emails que receberão notificações sobre a cobrança                                                                                                                                                                                                                                                                                                  |
| payer_emails                   | array of strings | (opcional) (DEPRECATED: use notification_emails) emails que receberão notificações sobre a cobrança                                                                                                                                                                                                                                                            |
| document_date                  | date             | (opcional) data de emissão do documento                                                                                                                                                                                                                                                                                                                        |
| our_number                     | string           | (opcional) nosso número. Caso não informado, é atribuído automaticamente pelo sistema                                                                                                                                                                                                                                                                          |
| our_number_digit               | integer          | (opcional) digito do verificador do nosso número                                                                                                                                                                                                                                                                                                               |
| custom_our_number              | boolean          | (opcional) indica se a cobrança utiliza um "nosso número" customizado. O valor padrão é false, mas caso definido true, o campo 'our_number' se torna requerido                                                                                                                                                                                                 |
| interest_amount_per_month      | decimal          | (opcional) porcentagem de juros mensal que deve ser aplicado em caso de atraso. No boleto será mostrado o valor diário de juros que será calculado                                                                                                                                                                                                             |
| mulct_type                     | string           | (opcional) indica o tipo de multa que deve ser aplicada em caso de atraso ("percentage" para porcentagem, "currency" para valor em reais)                                                                                                                                                                                                                      |
| mulct_value                    | decimal          | (opcional) valor da multa que deve ser aplicada em caso de atraso, com base em seu tipo                                                                                                                                                                                                                                                                        |
| instructions                   | string           | (opcional) instruções de pagamento do boleto, por padrão "Pagável em qualquer agência até data do vencimento." (pode ser linhas separadas por "\n")                                                                                                                                                                                                            |
| demonstrative                  | string           | (opcional) demonstrativo do Boleto, por padrão "Não receber após o vencimento." (pode ser linhas separadas por "\n")                                                                                                                                                                                                                                           |
| charge_template_id             | integer          | (opcional) número do modelo de cobrança a ser utilizado. A cobrança será criada com base nos atributos preestabelecidos do modelo. Contudo, os valores enviados na criação terão preferência                                                                                                                                                                   |
| for_homologation               | boolean          | **(requerido, se a configuração de cobrança não estiver homologada )** indica se é uma cobrança para ser utilizada na homologação da Configuração de cobrança                                                                                                                                                                                                  |
| registrable                    | boolean          | (opcional) indica se a cobrança é registrável (do tipo que deve ser registrada no banco). Por padrão é o que está definido na Configuração de Cobrança                                                                                                                                                                                                         |
| payer_id                       | integer          | **(requerido, se não enviar payer_attributes )** identificador do pagador (caso seja fornecido, o parâmetro payer_attributes será ignorado)                                                                                                                                                                                                                    |
| payer_attributes*              | object           | **(requerido, se não enviar payer_id )** atributos para a criação de um novo pagador ou atualização de um pagador existente com o mesmo documento (national_identifier)                                                                                                                                                                                        |
| auto_send_billet               | boolean          | (opcional) Indica se será enviado email de notificação automaticamente para os emails especificados no campo 'notification_emails'. Caso não seja informada assumirá valor 'false'                                                                                                                                                                             |
| email_sender_name              | string           | (opcional) Nome do remetente do email de notificação a ser enviado caso a opção auto_send_billet estiver com valor 'true'                                                                                                                                                                                                                                      |
| email_subject                  | string           | (opcional) Assunto do email a ser enviado caso a opção auto_send_billet estiver com valor 'true'                                                                                                                                                                                                                                                               |
| email_text                     | string           | (opcional) Texto do email a ser enviado caso a opção auto_send_billet estiver com valor 'true'                                                                                                                                                                                                                                                                 |

**payer_attributes**

| Campo                    | Tipo   | Comentário                                                                                                |
|--------------------------|--------|-----------------------------------------------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo do documento do pagador (cpf ou cnpj)                                                |
| national_identifier      | string | **(requerido)** documento do pagador                                                                      |
| name                     | string | **(requerido)** nome do pagador                                                                           |
| number                   | string | (opcional, requerido se registrable for `true`) número do endereço do pagador                             |
| complement               | string | (opcional, requerido se registrable for `true`) complemento do endereço do pagador                        |
| street                   | string | (opcional, requerido se registrable for `true`) rua do endereço do pagador                                |
| neighbourhood            | string | (opcional, requerido se registrable for `true`) bairro do endereço do pagador                             |
| zipcode                  | string | (opcional, requerido se registrable for `true`) cep do endereço do pagador                                |
| city                     | string | (opcional, requerido se registrable for `true`) cidade do endereço do pagador                             |
| state                    | string | (opcional, requerido se registrable for `true`) sigla do estado do endereço do pagador ("RJ" por exemplo) |

### Gateway de Pagamento

Após a cobrança ser criada com sucesso (sem erros de validação) é iniciado o processo assíncrono para a comunicação com o gateway. Assim que esse processo terminar, um payload de recebimento ou de erro é enviado via webhook.

<aside class="notice">
Em caso de falha da efetivação da cobrança no Gateway de Pagamento, o motivo da falha será disponibilizado no atributo 'payment_gateway_message'.
</aside>

<aside class="notice">
Se for utilizado um cartão já existente (enviando o parâmetro <code>credit_card_id</code>), este deve pertencer a mesma Configuração de Cobrança (parâmetro <code>charge_config_id</code>) utilizada.
</aside>

**Parâmetros**

| Campo                   | Tipo             | Comentário                                                                                                                                                                    |
|-------------------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| charge_config_id        | integer          | **(requerido)** código de identificação da configuração de cobrança da qual a cobrança irá pertencer                                                                          |
| charged_amount          | decimal          | **(requerido)** valor cobrado                                                                                                                                                 |
| payment_method          | string           | **(requerido)** método de pagamento ("credit_card_in_cash" pagamento à vista, "credit_card_financed" pagamento parcelado)                                                     |
| description             | string           | (opcional) descrição da cobrança                                                                                                                                              |
| soft_descriptor         | string           | (opcional) descritor que irá aparecer na fatura do cartão (no máximo 13 caracteres)                                                                                           |
| installments            | integer          | (opcional) número de parcelas (1 por padrão)                                                                                                                                  |
| notification_emails     | array of strings | (opcional) emails que receberão notificações sobre a cobrança                                                                                                                 |
| payer_emails            | array of strings | (opcional) (DEPRECATED: use notification_emails) emails que receberão notificações sobre a cobrança                                                                           |
| payer_id                | integer          | **(requerido, se não enviar payer_attributes )** identificador do pagador (caso seja fornecido, o parâmetro payer_attributes será ignorado)                                   |
| payer_attributes*       | object           | **(requerido, se não enviar payer_id )** atributos para a criação de um novo pagador ou atualização de um pagador existente com o mesmo documento (national_identifier)       |
| credit_card_id          | integer          | **(requerido, se não enviar credit_card_attributes )** identificador do cartão de crédito utilizado na cobrança, que deve pertencer ao mesmo payer e charge_config informados |
| credit_card_attributes* | object           | **(requerido, se não enviar credit_card_id )**  atributos para a criação de um novo cartão de crédito que será ligado ao pagador                                              |

**payer_attributes**

<aside class="notice">
Caso exista um Pagador (Payer) com o mesmo <code>national_identifier</code>, não será criado um novo, mas sim atualizado o existente.
</aside>

| Campo                    | Tipo   | Comentário                                                           |
|--------------------------|--------|----------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo do documento do pagador (cpf ou cnpj)           |
| national_identifier      | string | **(requerido)** documento do pagador                                 |
| name                     | string | **(requerido)** nome do pagador                                      |
| number                   | string | (opcional) número do endereço do pagador                             |
| complement               | string | (opcional) complemento do endereço do pagador                        |
| street                   | string | (opcional) rua do endereço do pagador                                |
| neighbourhood            | string | (opcional) bairro do endereço do pagador                             |
| zipcode                  | string | (opcional) cep do endereço do pagador                                |
| city                     | string | (opcional) cidade do endereço do pagador                             |
| state                    | string | (opcional) sigla do estado do endereço do pagador ("RJ" por exemplo) |

**credit_card_attributes**

| Campo               | Tipo    | Comentário                                                                                                                                                                                  |
|---------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| number              | string  | **(requerido)** número do cartão                                                                                                                                                            |
| cvv                 | string  | **(requerido)** código de segurança                                                                                                                                                         |
| expiration          | string  | **(requerido)** expiração do cartão, no formato "mm/aa"                                                                                                                                     |
| holder_name         | string  | **(requerido)** nome do dono do cartão                                                                                                                                                      |
| brand               | string  | **(requerido)** bandeira do cartão (visa, mastercard, amex, elo, diners, discover, jcb, aura)                                                                                               |
| avs_address         | string  | (opcional) endereço de cobrança do cartão                                                                                                                                                   |
| avs_number          | string  | (opcional) número do endereço de cobrança do cartão                                                                                                                                         |
| avs_complement      | string  | (opcional) complemento endereço de cobrança do cartão                                                                                                                                       |
| avs_district        | string  | (opcional) bairro do endereço de cobrança do cartão                                                                                                                                         |
| avs_zipcode         | string  | (opcional) cep do endereço de cobrança do cartão                                                                                                                                            |
| created_as_reusable | boolean | (opcional) indica se o cartão de crédito deve ser salvo de modo que possa ser re-utilizado futuramente em novas cobranças desde mesmo pagador e configuração de cobrança (false por padrão) |


## Atualização de Cobrança

```shell
Atualizar Cobrança

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charges/:charge_id
  PATCH https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/charges/:charge_id \
    -d '{
          "document_date":"2015-02-02",
          "document_number":"123456789",
          "notification_emails":["myemail@gmail.com"]
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {"document_kind":["não está incluído na lista"]}
  }

```

Atualiza a cobrança determinada, caso haja sucesso retornará as informações da mesma. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

### Boleto

<aside class="warning">
Para cobranças do tipo <strong>Boleto</strong> não é possível atualizar uma cobrança após seu recebimento, para isso é necessário desfazer o recebimento da mesma! Além disso, caso seja alterado com sucesso e será gerado um novo boleto sobrescrevendo o anterior.
</aside>

<aside class="notice">
Para cobranças do tipo <strong>Boleto</strong> os campos 'paid_at', 'paid_amount' e 'payment_tax', não são alterados via atualização de cobrança, apenas no recebimento ou desfazendo o recebimento da mesma.
</aside>

**Parâmetros**

| Campo                          | Tipo             | Comentário                                                                                                                                                                                                                                                                                                                                                     |
|--------------------------------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| due_date                       | date             | **(requerido)** data de vencimento da cobrança                                                                                                                                                                                                                                                                                                                 |
| document_kind                  | string           | **(requerido)** espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos)                                                                                                                                                                                                                  |
| charged_amount                 | decimal          | **(requerido)** valor cobrado no boleto                                                                                                                                                                                                                                                                                                                        |
| document_number                | string           | (opcional) número do documento é o número utilizado e controlado pelo beneficiário para identificar o título de cobrança. Caso não seja informado é atribído automaticamente um valor ateatório de até 10 caracters. Este valor deve ser único para cobranças feitas pelo Banco Bradesco de mesmo valor cobrado, data de vencimento e configuração de cobrança |
| notification_emails            | array of strings | (opcional) emails que receberão notificações sobre a cobrança                                                                                                                                                                                                                                                                                                  |
| payer_emails                   | array of strings | (opcional) (DEPRECATED: use notification_emails) emails que receberão notificações sobre a cobrança                                                                                                                                                                                                                                                            |
| document_date                  | date             | (opcional) data de emissão do documento                                                                                                                                                                                                                                                                                                                        |
| our_number                     | string           | (opcional) nosso número. Caso não informado, é atribuído automaticamente pelo sistema                                                                                                                                                                                                                                                                          |
| our_number_digit               | integer          | (opcional) digito do verificador do nosso número                                                                                                                                                                                                                                                                                                               |
| custom_our_number              | boolean          | (opcional) indica se a cobrança utiliza um "nosso número" customizado. O valor padrão é false, mas caso definido true, o campo 'our_number' se torna requerido                                                                                                                                                                                                 |
| interest_amount_per_month      | decimal          | (opcional) porcentagem de juros mensal que deve ser aplicado em caso de atraso. No boleto será mostrado o valor diário de juros que será calculado                                                                                                                                                                                                             |
| mulct_type                     | string           | (opcional) indica o tipo de multa que deve ser aplicada em caso de atraso ("percentage" para porcentagem, "currency" para valor em reais)                                                                                                                                                                                                                      |
| mulct_value                    | decimal          | (opcional) valor da multa que deve ser aplicada em caso de atraso, com base em seu tipo                                                                                                                                                                                                                                                                        |
| instructions                   | string           | (opcional) instruções de pagamento do boleto, por padrão "Pagável em qualquer agência até data do vencimento." (pode ser linhas separadas por "\n")                                                                                                                                                                                                            |
| demonstrative                  | string           | (opcional) demonstrativo do Boleto, por padrão "Não receber após o vencimento." (pode ser linhas separadas por "\n")                                                                                                                                                                                                                                           |
| registrable                    | boolean          | (opcional) indica se a cobrança é registrável (do tipo que deve ser registrada no banco). Por padrão é o que está definido na Configuração de Cobrança                                                                                                                                                                                                         |
| payer_id                       | integer          | **(requerido, se não enviar payer_attributes )** identificador do pagador (caso seja fornecido, o parâmetro payer_attributes será ignorado)                                                                                                                                                                                                                    |
| payer_attributes*              | object           | **(requerido, se não enviar payer_id )** atributos para a criação de um novo pagador ou atualização de um pagador existente com o mesmo documento (national_identifier)                                                                                                                                                                                        |

**payer_attributes**

| Campo                    | Tipo   | Comentário                                                                                                |
|--------------------------|--------|-----------------------------------------------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo do documento do pagador (cpf ou cnpj)                                                |
| national_identifier      | string | **(requerido)** documento do pagador                                                                      |
| name                     | string | **(requerido)** nome do pagador                                                                           |
| number                   | string | (opcional, requerido se registrable for `true`) número do endereço do pagador                             |
| complement               | string | (opcional, requerido se registrable for `true`) complemento do endereço do pagador                        |
| street                   | string | (opcional, requerido se registrable for `true`) rua do endereço do pagador                                |
| neighbourhood            | string | (opcional, requerido se registrable for `true`) bairro do endereço do pagador                             |
| zipcode                  | string | (opcional, requerido se registrable for `true`) cep do endereço do pagador                                |
| city                     | string | (opcional, requerido se registrable for `true`) cidade do endereço do pagador                             |
| state                    | string | (opcional, requerido se registrable for `true`) sigla do estado do endereço do pagador ("RJ" por exemplo) |

### Gateway de Pagamento

<aside class="notice">
Para cobranças do tipo <strong>Gateway de Pagamento</strong>, a atualização só é permitida caso o status no gateway de pagamento (atributo 'payment_gateway_status') seja de erro.
</aside>

Uma cobrança com o status de erro no gateway de pagamento pode ser editada com o objetivo de corrigir este error (descrito no atributo 'payment_gateway_message'). Sendo atualizada com sucesso, é feita uma re-tentativa de efetivação da cobrança no gateway de pagamento.

**Parâmetros**

| Campo                          | Tipo             | Comentário                                                                                                                                                              |
|--------------------------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| charged_amount                 | decimal          | **(requerido)** valor cobrado no boleto                                                                                                                                 |
| payment_method                 | string           | **(requerido)** método de pagamento (1: pagamento à vista, 2: pagamento parcelado)                                                                                      |
| description                    | string           | (opcional) descrição da cobrança                                                                                                                                        |
| soft_descriptor                | string           | (opcional) descritor que irá aparecer na fatura do cartão (no máximo 13 caracteres)                                                                                     |
| installments                   | integer          | (opcional) número de parcelas (1 por padrão)                                                                                                                            |
| generate_token                 | boolean          | (opcional) indica se deve ser gerado token para utilização do cartão de crédito no pagamento recorrente (false por padrão)                                              |
| notification_emails            | array of strings | (opcional) emails que receberão notificações sobre a cobrança                                                                                                           |
| payer_emails                   | array of strings | (opcional) (DEPRECATED: use notification_emails) emails que receberão notificações sobre a cobrança                                                                     |
| payer_id                       | integer          | **(requerido, se não enviar payer_attributes )** identificador do pagador (caso seja fornecido, o parâmetro payer_attributes será ignorado)                             |
| payer_attributes*              | object           | **(requerido, se não enviar payer_id )** atributos para a criação de um novo pagador ou atualização de um pagador existente com o mesmo documento (national_identifier) |
| credit_card_id                 | integer          | **(requerido, se não enviar credit_card_attributes )** identificador do cartão de crédito utilizado na cobrança                                                         |
| credit_card_attributes*        | object           | **(requerido, se não enviar credit_card_id )**  atributos para a criação de um novo cartão de crédito que será ligado ao pagador                                        |

**payer_attributes**

| Campo                    | Tipo   | Comentário                                                           |
|--------------------------|--------|----------------------------------------------------------------------|
| national_identifier_type | string | **(requerido)** tipo do documento do pagador (cpf ou cnpj)           |
| national_identifier      | string | **(requerido)** documento do pagador                                 |
| name                     | string | **(requerido)** nome do pagador                                      |
| number                   | string | (opcional) número do endereço do pagador                             |
| complement               | string | (opcional) complemento do endereço do pagador                        |
| street                   | string | (opcional) rua do endereço do pagador                                |
| neighbourhood            | string | (opcional) bairro do endereço do pagador                             |
| zipcode                  | string | (opcional) cep do endereço do pagador                                |
| city                     | string | (opcional) cidade do endereço do pagador                             |
| state                    | string | (opcional) sigla do estado do endereço do pagador ("RJ" por exemplo) |

**credit_card_attributes**

| Campo               | Tipo    | Comentário                                                                                                                                                                                  |
|---------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| number              | string  | **(requerido)** número do cartão                                                                                                                                                            |
| cvv                 | string  | **(requerido)** código de segurança                                                                                                                                                         |
| expiration          | string  | **(requerido)** expiração do cartão, no formato "mm/aa"                                                                                                                                     |
| holder_name         | string  | **(requerido)** nome do dono do cartão                                                                                                                                                      |
| brand               | string  | **(requerido)** bandeira do cartão (visa, mastercard, amex, elo, diners, discover, jcb, aura)                                                                                               |
| avs_address         | string  | (opcional) endereço de cobrança do cartão                                                                                                                                                   |
| avs_number          | string  | (opcional) número do endereço de cobrança do cartão                                                                                                                                         |
| avs_complement      | string  | (opcional) complemento endereço de cobrança do cartão                                                                                                                                       |
| avs_district        | string  | (opcional) bairro do endereço de cobrança do cartão                                                                                                                                         |
| avs_zipcode         | string  | (opcional) cep do endereço de cobrança do cartão                                                                                                                                            |
| created_as_reusable | boolean | (opcional) indica se o cartão de crédito deve ser salvo de modo que possa ser re-utilizado futuramente em novas cobranças desde mesmo pagador e configuração de cobrança (false por padrão) |


## Re-tentativa de efetivar de Cobrança (Gateway de pagamento)

```shell
Re-tentativa de efetivação de Cobrança

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charges/:charge_id/retry
  PATCH https://app.cobrato.com/api/v1/charges/:charge_id/retry

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/charges/:charge_id/retry

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {"message":["Esta Cobrança não suporta retentativa"]}
  }

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found
```

Quando uma Cobrança do tipo Gateway de Pagamento tem um erro que não necessita correção (atualização) da mesma, é possível fazer uma re-tentativa de efetivação dessa Cobrança.


## Exclusão de Cobrança

```shell
Excluir Cobrança

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

```

Exclui determinada cobrança. As mudanças são irreversíveis, e não será mais possível receber o boleto da cobrança excluída!


## Recebimento de Cobrança (Boleto)

```shell
Receber Cobrança (Boleto)

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charges/:charge_id/receive

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charges/:charge_id/receive \
    -d '{
         "paid_at": "2015-02-06",
         "paid_amount": "9.57",
         "payment_tax": "2.5"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors": {
      "paid_at": ["não pode ficar em branco"],
      "paid_amount": ["não pode ficar em branco"]
    }
  }
```

Marca determinada cobrança via Boleto como recebida, retornando JSON contendo as informações da cobrança em caso de sucesso ou os erros, caso haja algum.

**Parâmetros (Boleto)**

| Campo           | Tipo     | Comentário                                                                                 |
|-----------------|----------|--------------------------------------------------------------------------------------------|
| received_amount | decimal  | **(requerido)** (DEPRECATED: use paid_amount) valor pago                                   |
| received_at     | datetime | **(requerido)** (DEPRECATED: use paid_at) date e horário em que a cobrança foi paga        |
| paid_amount     | decimal  | **(requerido)** valor pago                                                                 |
| paid_at         | datetime | **(requerido)** date e horário em que a cobrança foi paga                                  |
| payment_tax     | decimal  | (opcional) valor taxa cobrada pela instituição financeira para o processamento da cobrança |


## Desfazer Recebimento de Cobrança (Boleto)

```shell
Desfazer Recebimento de Cobrança (Boleto)

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charges/:charge_id/undo_receive

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charges/:charge_id/undo_receive

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors": {
      "paid_amount": [
        "Impossível cancelar o recebimento de uma cobrança não recebida!"
      ]
    }
  }
```

Marca determinada cobrança via Boleto como não recebida, retornando JSON contendo as informações da cobrança em caso de sucesso ou os erros, caso haja algum.


## Renovação de Cobrança (Boleto)

```shell
Renovar Cobrança (Boleto)

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charges/:charge_id/renew
  PATCH https://app.cobrato.com/api/v1/charges/:charge_id/renew

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PUT https://app.cobrato.com/api/v1/charges/:charge_id/renew \
    -d '{
         "new_due_date": "2015-02-06"
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors": {
      "due_date": ["não pode ficar em branco"]
    }
  }
```

Atualiza a data de vencimento do boleto bancário. É importante ressaltar que **é necessária a criação e envio de um novo arquivo de remessa para efetivar a renovação junto ao banco**.

A renovação só será permitida caso a cobrança seja do tipo registrada e já esteja registrada junto ao banco. Caso contrário, é possível nenovar editando a data de vencimento da cobrança.

Retorna um JSON contento informações atualizadas da cobrança em caso de sucesso ou erros caso haja algum.

**Parâmetros (Boleto)**

| Campo           | Tipo    | Comentário                                          |
|-----------------|---------|-----------------------------------------------------|
| new_due_date    | date    | **(requerido)** nova data de vencimento da cobrança |


## Boleto da Cobrança

```shell
Mostrar Boleto da Cobrança (URL)

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charges/:charge_id/billet

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charges/:charge_id/billet

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE CORPO DA RESPOSTA COM SUCESSO

  {
    "url":"https://cobrato-uploads.s3.amazonaws.com/billets/1/6186_08033_1445001056.pdf?Expires=1445034829"
  }
```

Mostra o link da url do boleto de determinada cobrança via Boleto

<aside class="warning">
As URLs disponibilizadas são válidas por apenas 60 minutos. Sendo assim, não armazene o retorno e sempre que for necessário realize uma nova chamada à API.
</aside>


## Envio de Boleto da Cobrança

```shell
Enviar Boleto da Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charges/:charge_id/deliver_billet

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charges/:charge_id/deliver_billet \
    -d '{
         "to": ["email1@host.com","email1@host.com"]
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM EMAIL NÃO CADASTRADO E NÃO INFORMADO

      422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors": {
      "notification_emails": ["não pode ficar em branco"]
    }
  }
```

Envia o boleto da cobrança por email, gerando o mesmo caso necessário. É enviado para os emails informados, ou então os cadastrados na cobrança.

**Parâmetros**

| Campo | Tipo            | Comentário                                                                                |
|-------|-----------------|-------------------------------------------------------------------------------------------|
| to    | array of string | **(requerido)** emails que receberão o boleto ao invés dos emails cadastrados na cobrança |


## Cancelar cobrança

```shell
Cancela Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charges/:charge_id/cancel

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charges/:charge_id/cancel

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors": {
      "message": "Esta Cobrança não pode ser cancelada"
    }
  }

```

Enfileira uma determinada cobrança para cancelamento.
