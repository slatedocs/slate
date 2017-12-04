# CNAB de Remessa

```shell
CNAB de Remessa

EXEMPLO

  {
    "id": 1,
    "config_id": 1,
    "type": "charge",
    "status": "processed",
    "_links":
      [
        {"rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "config", "method": "GET", "href": "https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel": "file", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1/file"},
        {"rel": "items", "method": "GET", "href": "http://localhost:3000/api/v1/remittance_cnabs/1/items"}
      ]
  }
```

Os Arquivos CNAB de Remessa são arquivos enviados para o banco com o objetivo de registrar novos títulos/pagamentos, podendo ser gerado a partir de um ou mais items (Cobranças ou Pagamentos). Se forem enviados items de Configurações diferentes, será gerado um CNAB de remessa para cada Configuração.

<aside class="warning">
Se seu plano não er direito a utilização desta API, a resposta com será com o status <strong>403 Forbidden</strong>!
</aside>

**Parâmetros**

| Campo            | Tipo            | Comentário                                                                                                                         |
|------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------|
| id               | integer         | identificador do CNAB de remessa                                                                                                   |
| type             | string          | indica o tipo de arquivo de remessa ('charge' ou 'payment')                                                                        |
| config_id        | string          | identificador da configuração no Cobrato relacionada ao arquivo de remessa                                                         |
| charge_config_id | string          | (DEPRECATED: use config_id) identificador da configuração de cobrança no Cobrato                                                   |
| status           | string          | situação da remessa, podendo ser "processing" (processando), "processed" (processado) e "processing_error" (erro de processamento) |
| _links           | array of object | links relacionado CNAB de remessa                                                                                                  |

## Informações do CNAB de Remessa

```shell
Mostrar CNAB de Remessa

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/remittance_cnabs/:id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/remittance_cnabs/:id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id": 1,
    "config_id": 1,
    "type": "charge",
    "status": "processed",
    "_links":
      [
        {"rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "config", "method": "GET", "href": "https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel": "file", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1/file"},
        {"rel": "items", "method": "GET", "href": "http://localhost:3000/api/v1/remittance_cnabs/1/items"}
      ]
  }

```

Retorna as informações detalhadas em JSON do CNAB de remessa informado.

## Lista de Todas as CNABs de Remessa

```shell
Listar CNABs de Remessa

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/remittance_cnabs

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/remittance_cnabs

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "remittance_cnabs":
      [
        {
          // informações do CNAB de remessa 1
        },
        {
          // informações do CNAB de remessa 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos os CNABs de remessa que pertencem a sua Conta de Serviço.

## Criação de Arquivo CNAB de Remessa

```shell
Criar Arquivo CNAB de Remessa

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/remittance_cnabs

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/remittance_cnabs \
    -D '{
        "item_ids": [12, 13, 15, 18]
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":{
      "item_ids": ["não pode ficar em branco"],
    }
  }

```

Cria novo(s) Arquivo(s) CNAB de Remessa, retornando as informações do mesmo caso haja sucesso. Se houverem erros, eles serão informados no corpo da resposta.

Um Arquivo de remessa sempre está associado à uma Configuração. Sendo assim, será gerado um CNAB de remessa para cada Configuração envolvida na solicitação de criação, e esse arquivo irá incluir todos os items passíveis de remessa, seja para registrar a inclusão, cancelamento ou alteração.

**Parâmetros**

<aside class="warning">
  Com exceção do parâmetro <i>type</i>, o menos um dos parâmetros abaixo é requerido. Se mais de um for enviado, será considerado apenas um deles, sendo a ordem de precedência a mesma em que aparecem na lista abaixo.
</aside>

| Campo                      | Tipo              | Comentário                                                                                                                                                                            |
|----------------------------|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type                       | string            | (optional) Define o tipo de arquivo(s) CNAB de Remessa a ser(em) criado(s). Os possíveis valores são 'charge' para Cobrança e 'payment' para Pagamento, sendo que o padrão é 'charge' |
| item_ids                   | array of integers | **(requerido, veja a nota acima)** Lista com os ids dos itens (cobranças ou pagamentos) que devem estar incluídos no(s) arquivo(s) CNAB de Remessa                                    |
| charge_ids                 | array of integers | (DEPRECATED: use item_ids) **(requerido, veja a nota acima)** Lista com os ids das cobranças que devem estar incluídas no(s) arquivo(s) CNAB de Remessa                               |
| config_ids                 | array of integers | **(requerido, veja a nota acima)** Lista com os ids das configurações para as quais devem ser criados os Arquivos CNAB de Remessa                                                     |
| charge_config_ids          | array of integers | (DEPRECATED: use config_ids) **(requerido, veja a nota acima)** Lista com os ids das configurações de cobranças para as quais devem ser criados os Arquivos CNAB de Remessa           |
| payee_ids                  | array of integers | **(requerido, veja a nota acima)** Lista com os ids dos beneficiários das configurações para as quais devem ser criados os Arquivos CNAB de Remessa                                   |
| payee_national_identifiers | array of strings  | **(requerido, veja a nota acima)** Lista com os números de documento dos beneficiários das configurações para as quais devem ser criados os Arquivos CNAB de Remessa                  |

## Exclusão de CNAB de Remessa

```shell
Excluir CNAB de Remessa

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/remittance_cnabs/:id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/remittance_cnabs/:id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM CNAB DE REMESSA INEXISTENTE

    404 Not Found

```

Exclui determinado CNAB de remessa. A exclusão é irreversível.

## Arquivo do CNAB de Remessa

```shell
Mostrar Arquivo do CNAB de Remessa (URL)

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/remittance_cnabs/:id/file

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/remittance_cnabs/:id/file

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM CNAB DE REMESSA INEXISTENTE

    404 Not Found

EXEMPLO DE CORPO DA RESPOSTA COM SUCESSO

  {
    "url":"https://cobrato-uploads.s3.amazonaws.com/remittance_cnabs/cnabs/1/B425065A.RET?AWSAccessKeyId=AKIAIRJFH3YRXV5YRVTQ&Expires=1452277155&Signature=IJ1P%2Bc%2F9vC%2FKlBWuHGIBEl%2BAHKk%3D"
  }
```

Mostra o link da url do arquivo de determinado CNAB de remessa.

<aside class="warning">
As URLs disponibilizadas são válidas por apenas 60 minutos. Sendo assim, não armazene o remessa e sempre que for necessário realize uma nova chamada à API.
</aside>

## Lista de Todas as Cobrança do Arquivo de Remessa

<aside class="warning">
<b>DEPRECATED</b>: usar o endpoint <i>/api/v1/remittance_cnabs/:id/items</i> para listar os <b>items</b>
</aside>


```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/remittance_cnabs/:id/charges

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/remittance_cnabs/:id/charges

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

Retorna uma lista em JSON contendo todos as cobranças que pertencem ao CNAB de remessa informado.

## Lista de Todos os items do Arquivo de Remessa

```shell
DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/remittance_cnabs/:id/items

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/remittance_cnabs/:id/items

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA (COBRANÇAS)

  {
    "charges":
      [
        {
          // informações do item 1 (charge)
        },
        {
          // informações do item 2 (charge)
        },
        ...
      ]
  }

EXEMPLO DE CORPO DA RESPOSTA (PAGAMENTOS)

  {
    "payments":
      [
        {
          // informações do item 1 (payment)
        },
        {
          // informações do item 2 (payment)
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos os items que pertencem ao CNAB de remessa informado.
