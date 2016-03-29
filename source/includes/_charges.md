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
    "total_amount":"10.07",
    "instructions":"Pagável em qualquer agência até data do vencimento.",
    "demonstrative":"Não receber após o vencimento.",
    "payer_emails":["myemail@gmail.com"],
    "received":true,
    "received_amount":"10.07",
    "received_at":"2015-01-30",
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
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"receive","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/receive"},
        {"rel":"deliver","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/deliver_billet"},
        {"rel":"charge_config","method":"GET","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"billet","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1/billet"}
      ]
  }
```

As Cobranças, pertencem as suas Configurações de Cobrança, sendo assim é necessário que sempre haja ao menos uma Configuração de Cobrança homologada para a criação de Cobranças. Ao criar uma Configuração de Cobrança é automaticamente gerada uma Cobrança para homologar a Configuração.

O tipo da Cobrança depende da sua Configuração de Cobrança. Se a Configuração de Cobrança é do tipo Boleto (billet), a cobrança será deste mesmo tipo. Sendo assim, os parâmetros, validações e algums comportamentos irão variar de acordo com o tipo.

**Parâmetros (Boleto)**

| Campo                          | Tipo             | Comentário                                                                                                                                          |
|--------------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| id                             | integer          |                                                                                                                                                     |
| type                           | string           | indica o tipo da cobrança. Valores possíveis: (billet)                                                                                              |
| charge_config_id               | integer          | identificador da configuração de cobrança a qual esta cobraça pertece                                                                               |
| due_date                       | date             | data de vencimento da cobranca                                                                                                                      |
| document_kind                  | string           | espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos)                       |
| document_date                  | date             | data de emissão do documento                                                                                                                        |
| document_number                | string           | número do documento, também chamado de "seu número", é o número utilizado e controlado pelo beneficiário para identificar o título de cobrança      |
| our_number                     | string           | nosso número                                                                                                                                        |
| our_number_digit               | integer          | digito do verificador do nosso número                                                                                                               |
| custom_our_number              | boolean          | indica se a cobrança utiliza um "nosso número" customizado. O valor padrão é false, mas caso definido true, o campo 'our_number' se torna requerido |
| total_amount                   | decimal          | valor total do boleto                                                                                                                               |
| instructions                   | string           | instruções de pagamento do boleto, por padrão "Pagável em qualquer agência até data do vencimento."                                                 |
| demonstrative                  | string           | demonstrativo do Boleto, por padrão "Não receber após o vencimento."                                                                                |
| payer_emails                   | array of strings | emails de quem irá pagar o boleto                                                                                                                   |
| received                       | boolean          | indica se a cobrança foi recebida                                                                                                                   |
| received_amount                | decimal          | valor recebido                                                                                                                                      |
| received_at                    | date             | dia em que a cobraça foi recebida                                                                                                                   |
| processing_date                | date             | data de geração do boleto                                                                                                                           |
| for_homologation               | boolean          | indica se é uma cobrança gerada automaticamente pelo sistema para ser utilizada na homologação da Configuração de cobrança                          |
| registrable                    | boolean          | indica se a cobrança é registrável (do tipo que deve ser registrada no banco). Por padrão é o que está definido na Configuração de Cobrança         |
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
| registration_status            | string           | status de registro em que a cobrança se encontra (without_remittance, remitted, registered, registered_with_error)                                  |
| _links                         | array of object  | links relacionados à cobraça                                                                                                                        |

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
    "total_amount":"10.07",
    "instructions":"Pagável em qualquer agência até data do vencimento.",
    "demonstrative":"Não receber após o vencimento.",
    "payer_emails":["myemail@gmail.com"],
    "received":true,
    "received_amount":"10.07",
    "received_at":"2015-01-30",
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
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"receive","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/receive"},
        {"rel":"deliver","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/deliver_billet"},
        {"rel":"charge_config","method":"GET","href":"https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel":"billet","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1/billet"}
      ]
  }
```

Retorna as informações detalhadas da cobrança informada em JSON e também a referência a sua configuração de cobrança.

<aside class="notice">
  O conteúdo do nó "_links" irá variar de acordo com o status da cobrança. Além dos itens básicos mostrados no exemplo de resposta ao lado, se a cobraça tiver sido recebida, irá conter o seguinte link:

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
          "total_amount":"10.07",
          "payer_emails":["myemail@gmail.com"]
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
        "total_amount":["não pode ficar em branco"],
        "document_kind":["não pode ficar em branco","não está incluído na lista"],
        "due_date":["não pode ficar em branco"]
      }
  }

```

Cria um nova cobrança, caso haja sucesso retornará as informações da mesma e será gerado seu boleto. Se houverem erros eles serão informados no corpo da resposta.

**Parâmetros (Boleto)**

| Campo                          | Tipo             | Comentário                                                                                                                                                     |
|--------------------------------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| charge_config_id               | integer          | **(requerido)** código de identificação da configuração de cobrança da qual a cobrança irá pertencer                                                           |
| due_date                       | date             | **(requerido)** data de vencimento da cobrança                                                                                                                 |
| document_kind                  | string           | **(requerido)** espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos)                  |
| total_amount                   | decimal          | **(requerido)** valor total do boleto                                                                                                                          |
| document_number                | string           | **(requerido)** número do documento, também chamado de "seu número", é o número utilizado e controlado pelo beneficiário para identificar o título de cobrança |
| payer_emails                   | array of strings | (opcional) emails de quem irá pagar o boleto                                                                                                                   |
| document_date                  | date             | (opcional) data de emissão do documento                                                                                                                        |
| our_number                     | string           | (opcional) nosso número. Caso não informado, é atribuído automaticamente pelo sistema                                                                          |
| our_number_digit               | integer          | (opcional) digito do verificador do nosso número                                                                                                               |
| custom_our_number              | boolean          | (opcional) indica se a cobrança utiliza um "nosso número" customizado. O valor padrão é false, mas caso definido true, o campo 'our_number' se torna requerido |
| instructions                   | string           | (opcional) instruções de pagamento do boleto, por padrão "Pagável em qualquer agência até data do vencimento." (pode ser linhas separadas por "\n")            |
| demonstrative                  | string           | (opcional) demonstrativo do Boleto, por padrão "Não receber após o vencimento." (pode ser linhas separadas por "\n")                                           |
| registrable                    | boolean          | (opcional) indica se a cobrança é registrável (do tipo que deve ser registrada no banco). Por padrão é o que está definido na Configuração de Cobrança         |
| payer_national_identifier_type | string           | **(requerido)** tipo do documento do pagador (cpf ou cnpj)                                                                                                     |
| payer_national_identifier      | string           | **(requerido)** documento do pagador                                                                                                                           |
| payer_name                     | string           | **(requerido)** nome do pagador                                                                                                                                |
| payer_number                   | string           | (opcional, requerido se registrable for `true`) número do endereço do pagador                                                                                  |
| payer_complement               | string           | (opcional, requerido se registrable for `true`) complemento do endereço do pagador                                                                             |
| payer_street                   | string           | (opcional, requerido se registrable for `true`) rua do endereço do pagador                                                                                     |
| payer_neighbourhood            | string           | (opcional, requerido se registrable for `true`) bairro do endereço do pagador                                                                                  |
| payer_zipcode                  | string           | (opcional, requerido se registrable for `true`) cep do endereço do pagador                                                                                     |
| payer_city                     | string           | (opcional, requerido se registrable for `true`) cidade do endereço do pagador                                                                                  |
| payer_state                    | string           | (opcional, requerido se registrable for `true`) sigla do estado do endereço do pagador ("RJ" por exemplo)                                                      |

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
          "payer_emails":["myemail@gmail.com"]
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

Atualiza a cobrança determinada, caso haja sucesso retornará as informações da mesma e será gerado um novo boleto sobrescrevendo o anterior. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

<aside class="warning">
Não é possível atualizar uma cobrança após seu recebimento, para isso é necessário desfazer o recebimento da mesma!
</aside>

<aside class="notice">
Os campos 'received', 'received_at' e 'received_amount', não são alterados via atualização de cobrança, apenas no recebimento ou desfazendo o recebimento da mesma.
</aside>

**Parâmetros (Boleto)**

| Campo                          | Tipo             | Comentário                                                                                                                                                     |
|--------------------------------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| due_date                       | date             | **(requerido)** data de vencimento da cobrança                                                                                                                 |
| document_kind                  | string           | **(requerido)** espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos)                  |
| total_amount                   | decimal          | **(requerido)** valor total do boleto                                                                                                                          |
| document_number                | string           | **(requerido)** número do documento, também chamado de "seu número", é o número utilizado e controlado pelo beneficiário para identificar o título de cobrança |
| payer_emails                   | array of strings | (opcional) emails de quem irá pagar o boleto                                                                                                                   |
| document_date                  | date             | (opcional) data de emissão do documento                                                                                                                        |
| our_number                     | string           | (opcional) nosso número. Caso não informado, é atribuído automaticamente pelo sistema                                                                          |
| our_number_digit               | integer          | (opcional) digito do verificador do nosso número                                                                                                               |
| custom_our_number              | boolean          | (opcional) indica se a cobrança utiliza um "nosso número" customizado. O valor padrão é false, mas caso definido true, o campo 'our_number' se torna requerido |
| instructions                   | string           | (opcional) instruções de pagamento do boleto, por padrão "Pagável em qualquer agência até data do vencimento." (pode ser linhas separadas por "\n")            |
| demonstrative                  | string           | (opcional) demonstrativo do Boleto, por padrão "Não receber após o vencimento." (pode ser linhas separadas por "\n")                                           |
| registrable                    | boolean          | (opcional) indica se a cobrança é registrável (do tipo que deve ser registrada no banco). Por padrão é o que está definido na Configuração de Cobrança         |
| payer_national_identifier_type | string           | **(requerido)** tipo do documento do pagador (cpf ou cnpj)                                                                                                     |
| payer_national_identifier      | string           | **(requerido)** documento do pagador                                                                                                                           |
| payer_name                     | string           | **(requerido)** nome do pagador                                                                                                                                |
| payer_number                   | string           | (opcional, requerido se registrable for `true`) número do endereço do pagador                                                                                  |
| payer_complement               | string           | (opcional, requerido se registrable for `true`) complemento do endereço do pagador                                                                             |
| payer_street                   | string           | (opcional, requerido se registrable for `true`) rua do endereço do pagador                                                                                     |
| payer_neighbourhood            | string           | (opcional, requerido se registrable for `true`) bairro do endereço do pagador                                                                                  |
| payer_zipcode                  | string           | (opcional, requerido se registrable for `true`) cep do endereço do pagador                                                                                     |
| payer_city                     | string           | (opcional, requerido se registrable for `true`) cidade do endereço do pagador                                                                                  |
| payer_state                    | string           | (opcional, requerido se registrable for `true`) sigla do estado do endereço do pagador ("RJ" por exemplo)                                                      |


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
         "received_at": "2015-02-06",
         "received_amount": "9.57"
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
      "received_at": ["não pode ficar em branco"],
      "received_amount": ["não pode ficar em branco"]
    }
  }
```

Marca determinada cobrança via Boleto como recebida, retornando JSON contendo as informações da cobrança em caso de sucesso ou os erros, caso haja algum.

**Parâmetros (Boleto)**

| Campo           | Tipo    | Comentário                                    |
|-----------------|---------|-----------------------------------------------|
| received_at     | date    | **(requerido)** data de pagamento da cobrança |
| received_amount | decimal | **(requerido)** valor recebido da cobrança    |


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
      "received": [
        "Impossível cancelar o recebimento de uma cobrança não recebida!"
      ]
    }
  }
```

Marca determinada cobrança via Boleto como não recebida, retornando JSON contendo as informações da cobrança em caso de sucesso ou os erros, caso haja algum.


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

Mostra o link da url do boleto de determinada cobraça via Boleto

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
      "payer_emails": ["não pode ficar em branco"]
    }
  }
```

Envia o boleto da cobrança por email, gerando o mesmo caso necessário. É enviado para os emails informados, ou então os cadastrados na cobrança.

**Parâmetros**

| Campo | Tipo            | Comentário                                                                                |
|-------|-----------------|-------------------------------------------------------------------------------------------|
| to    | array of string | **(requerido)** emails que receberão o boleto ao invés dos emails cadastrados na cobrança |
