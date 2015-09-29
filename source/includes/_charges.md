# Cobrança

<aside class="notice">
As Cobranças, pertencem as suas contas de cobrança, sendo assim é necessário que sempre haja ao menos uma conta de cobrança homologada para a criação de cobranças. Ao criar uma conta de cobrança é automaticamente gerada uma cobrança para homologar a conta.
</aside>

Parâmetros

|Campo                    | Tipo             | Comentário                                                                                |
|-------------------------|-----------       |-------------------------------------------------------------------------------------------|
| id                      | integer          |                                                                                           |
| charge_account_id       | integer          | identificador da conta de cobrança                                                        |
| due_date                | date             | data de vencimento da cobranca                                                            |
| document_kind           | string           | espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória)  ou DV (Diversos)                                                                                                           |
| document_date           | date             | data de emissão do documento                                                              |
| document_number         | string           |                                                                                           |
| our_number              | string           |                                                                                           |
| our_number_digit        | integer          | digito do verificador do nosso número                                                     |
| custom_our_number       |  boolean         | caso true, o nosso número é atribuído pelo usuário, caso contrário, é atribuído automaticamente pelo Cobrato                                                                                                                             |
| total_amount            |  decimal         | valor total do boleto                                                                     |
| instructions            |  string          | instruções de pagamento do boleto, por padrão "Pago em qualquer agência até data do vencimento."                                                                                                                                          |
| demonstrative           |   string         | demonstrativo do Boleto, por padrão, contém a taxa bancária                               |
| payer_emails            |  array of strings  | emails de quem irá pagar o boleto                                                       |
| received                |  boolean         | caso for true, o boleto já foi marcado como recebido                                      |
| received_amount         |   decimal        | valor recebido do boleto bancário                                                         |
| received_at             |   date           | dia do pagamento do boleto                                                                |
| processing_date         |   date           | data de geração do boleto                                                                 |
| for_homologation        |  boolean         | caso for true, é uma cobrança gerada automaticamente pelo sistema e utilizada para homologação da sua conta de cobrança |
| billet                  |  object          | link com expiração em uma hora para download do boleto caso já tenha sido gerado          |
| _links                  |  array of object | links da conta de cobrança e de sua conta bancária |


## Lista de Todos as Cobrança

Retorna uma lista em JSON contendo todos as cobranças que pertencem a sua Conta de Serviço.


```shell
Listar Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charges

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
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
          //informações cobrança 1
        },
        {
          //informações cobrança 2
        },
        ...
      ]
  }

```


## Informações da Cobrança


```shell
Informar Cobrança

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id":1,
    "charge_account_id": 1,
    "due_date":"2015-02-14",
    "document_kind":"DV",
    "document_date":null,
    "document_number":null,
    "custom_our_number": "true",
    "our_number":"0",
    "our_number_digit":null,
    "total_amount":"10.07",
    "instructions":"Pagável em qualquer agência até data do vencimento",
    "demonstrative":"Demonstrativo",
    "payer_emails":["myemail@gmail.com"],
    "received":true,
    "received_amount":"10.07",
    "received_at":"2015-01-30",
    "processing_date":"2015-01-30",
    "for_homologation":true,
    "billet":"https://cobrato-billet-storage.s3.amazonaws.com/billets/1/0269_0008961_1422621964.pdf?AWSAccessKeyId=AKIAJZYRPE7LUTTBNALQ\u0026Expires=1422650715\u0026Signature=JXdko57tCsKRWSy473zQXYUxVfg%3D",
    "_links":
      [
        {"rel":"self","method":"GET","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"update","method":"PUT","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"destroy","method":"DELETE","href":"https://app.cobrato.com/api/v1/charges/1"},
        {"rel":"receive","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/receive"},
        {"rel":"deliver","method":"POST","href":"https://app.cobrato.com/api/v1/charges/1/deliver_billet"},
        {"rel":"charge_account","method":"GET","href":"https://app.cobrato.com/api/v1/charge_accounts/1"}
      ]
  }


```


Retorna as informações detalhadas da cobrança informada em JSON e também a referência a sua conta de cobrança.

```shell
Criar Cobrança

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/charges

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/charges
    -D '{
          "charge_account_id": 1,
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
        "charge_account_id":["não pode ficar em branco"],
        "our_number":["não pode ficar em branco"],
        "total_amount":["não pode ficar em branco"],
        "document_kind":["não pode ficar em branco","não está incluído na lista"],
        "due_date":["não pode ficar em branco"]
      }
  }

```

## Criação de Cobrança

Cria um nova cobrança, caso haja sucesso retornará as informações da mesma e será gerado seu boleto. Se houverem erros eles serão informados no corpo da resposta.

Parâmetros

|Campo                    | Tipo      | Comentário  |
|-------------------------|-----------|--------------|
| charge_account_id |  integer  | requirido código de identificação da conta bancária em que a conta de cobrança irá pertencer |
| due_date | date  | requirido  data de vencimento da cobrança |
| document_kind |  string  | requirido espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos) |
| document_date |  date | data de emissão do documento |
| document_number |  string |
| our_number | string | Caso não informado, é atribuído automaticamente pelo sistema |
| our_number_digit | integer | digito do verificador do nosso número |
| custom_our_number |  boolean | Preenchido automaticamente, mas caso informado true, o campo 'our_number' se torna requirido |
| total_amount | decimal |  requirido valor total do boleto |
| instructions | string | instruções de pagamento do boleto, por padrão "Pago em qualquer agência até data do vencimento." |
| demonstrative |  string | demonstrativo do Boleto, por padrão, contém a taxa bancária |
| payer_emails | array of strings | Semails de quem irá pagar o boleto |


## Atualização de Cobrança

```shell
Atualizar Cobrança

DEFINIÇÃO

  PUT https://app.cobrato.com/api/v1/charges/:charge_id
  PATCH https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X PATCH https://app.cobrato.com/api/v1/charges/:charge_id
    -D '{
          "document_date":"2015-02-02",
          "document_number":"123456789",
          "payer_emails":["myemail@gmail.com"]
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA DE COBRANÇA INEXISTENTE

    404 Not Found

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":
      {"document_kind":["não está incluído na lista"]}
  }

Exclusão de Cobrança

Exclui determinada cobrança. As mudanças são irreversíveis, e não será mais possível receber o boleto da cobrança excluída!


```

Atualiza a cobrança determinada, caso haja sucesso retornará as informações da mesma e será gerado um novo boleto sobrescrevendo o anterior. Se houverem erros eles serão informados no corpo da resposta. A requisição não diferencia a utilização dos verbos PUT e PATCH.

Não é possível atualizar uma cobrança após seu recebimento, para isso é necessário desfazer o recebimento da mesma!

Observação: Os campos 'recived', 'recived_at' e 'recived_amount', não são alterados via atualização de cobrança, apenas no recebimento ou desfazendo o recebimento da mesma.

Parâmetros

|Campo                    | Tipo      | Comentário  |
|-------------------------|-----------|-------------|
| due_date|  date | data de vencimento da cobrança |
| document_kind |   string  | espécie do documento, podendo ser DM (Duplicata Mercantil), DS (Duplicata de Serviço), NP (Nota Promissória) ou DV (Diversos) |
| document_date|   date | data de emissão do documento |
| document_number|   string  | |
| our_number|  string | requirido caso o 'custom_our_number' for informado como true |
| our_number_digit|  integer | digito do verificador do nosso número |
| custom_our_number|   boolean | Informe 'true' se desejar utilizar um nosso número personalizado, informe 'false' se estiver usando nosso número personalizado e deseja alterar para um nosso número atribuído pelo Cobrato |
| total_amount|  decimal | valor total do boleto |
| instructions|  string | instruções de pagamento do boleto, por padrão "Pago em qualquer agência até data do vencimento." |
| demonstrative|   string | demonstrativo do Boleto, por padrão, contém a taxa bancária |
| payer_emails|  array of strings  | emails de quem irá pagar o boleto |



## Exclusão de Cobrança

```shell
Excluir Conta de Cobrança

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/charges/:charge_id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM CONTA DE COBRANÇA INEXISTENTE

    404 Not Found

```

Exclui determinada cobrança. As mudanças são irreversíveis, e não será mais possível receber o boleto da cobrança excluída!