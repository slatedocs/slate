# CNAB de Retorno

```shell
CNAB de Retorno

EXEMPLO

  {
    "id": 1,
    "charge_config_id": 9, # DEPRECATED
    "config_id": 9,
    "status": "processed",
    "type": "charge",
    "filename": "CI14058A.RET",
    "_links":
      [
        {"rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/regress_cnabs/1"},
        {"rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/regress_cnabs/1"},
        {"rel": "config", "method": "GET", "href": "https://app.cobrato.com/api/v1/charge_config/1"},
        {"rel": "file", "method": "GET", "href": "https://app.cobrato.com/api/v1/regress_cnabs/1/file"}
      ]
  }
```

Os Arquivos CNAB de retorno são arquivos disponibilizados pelo banco com as informações de ocorrências relacionadas às cobranças/pagamentos. Os arquivos CNABs de retorno é relacionado à uma determinada Configuração e o cobrato tentará encontrar os itens relacionados e aplicar as informações enviadas pelo banco.

<aside class="warning">
Se seu plano não der direito a utilização desta API, a resposta com será com o status <strong>403 Forbidden</strong>!
</aside>

**Parâmetros**

| Campo            | Tipo            | Comentário                                                                                                                              |
|------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| id               | integer         | identificador do CNAB de retorno                                                                                                        |
| type             | string          | indica o tipo de arquivo de remessa ('charge' ou 'payment')                                                                             |
| config_id        | string          | identificador da configuração no Cobrato relacionada ao arquivo de remessa                                                              |
| charge_config_id | string          | (DEPRECATED: use config_id) identificador da configuração de cobrança no Cobrato                                                        |
| filename         | string          | nome do arquivo de retorno                                                                                                              |
| status           | string          | situação do arquivo CNAB, podendo ser "processing" (processando), "processed" (processado) e "processing_error" (erro de processamento) |
| _links           | array of object | links relacionado CNAB de retorno                                                                                                       |

## Informações do CNAB de Retorno

```shell
Mostrar CNAB de Retorno

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/regress_cnabs/:id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/regress_cnabs/:id

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "id": 1,
    "charge_config_id": 9, # DEPRECATED
    "config_id": 9,
    "status": "processed",
    "type": "charge",
    "filename": "CI14058A.RET",
    "_links":
      [
        {"rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/regress_cnabs/1"},
        {"rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/regress_cnabs/1"},
        {"rel": "charge_config", "method": "GET", "href": "https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel": "file", "method": "GET", "href": "https://app.cobrato.com/api/v1/regress_cnabs/1/file"}
      ]
  }

```

Retorna as informações detalhadas em JSON do CNAB de retorno informado.

## Lista de Todos os CNABs de Retorno

```shell
Listar CNABs de Retorno

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/regress_cnabs

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/regress_cnabs

EXEMPLO DE ESTADO DA RESPOSTA

    200 OK

EXEMPLO DE CORPO DA RESPOSTA

  {
    "regress_cnabs":
      [
        {
          // informações do CNAB de retorno 1
        },
        {
          // informações do CNAB de retorno 2
        },
        ...
      ]
  }

```

Retorna uma lista em JSON contendo todos os CNABs de retorno que pertencem a sua Conta de Serviço.

É possível filtrar a lista através dos seguintes parâmetros:

- `type`: Filtra pelo tipo de arquivo de retorno. O valor a ser informado é string com um dos tipos existentes de arquivo de retorno ("charge" ou "payment").
- `config_id`: Filtra pela configuração informada. O valor informado deve ser o id de uma configuração, seja de cobrança ou de pagamento. É **fortemente recomendado** usar sempre o filtro `type` em conjunto com esse para ter os resultados esperados.

## Criação de CNAB de Retorno

```shell
Criar CNAB de Retorno

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/regress_cnabs

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/regress_cnabs \
    -d '{
          "config_id": 1,
          "type": "charge",
          "cnabs": {
            "content":      "MDJSRVRPUk5PMDFDT0JSQU5DQSAgICAgICAzMTMwMDAyMjY5OTAgICA...",
            "content_type": "text/plain"
            "filename":     "example.RET"
          }
        }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    202 Accepted

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":{
      "config_id": ["não pode ficar em branco"],
      "cnabs": ["não pode ficar em branco"]
    }
  }

```

Cria um CNAB de retorno inicia o processamento do arquivo.

**Parâmetros**

| Campo            | Tipo   | Comentário                                                                                                                                                                  |
|------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type             | string | (optional) Define o tipo de arquivo CNAB de Retorno a ser criado. Os possíveis valores são 'charge' para Cobrança e 'payment' para Pagamento, sendo que o padrão é 'charge' |
| config_id        | string | **(requerido)** identificador da configuração à qual o arquivo CNAB de retorno pertence                                                                                     |
| charge_config_id | string | (DEPRECATED: use config_id) **(requerido)** identificador da configuração de cobrança à qual o arquivo CNAB de retorno pertence                                             |
| cnabs            | object | **(requerido)** dados do arquivo CNAB de retorno. O "content" deve ser uma string com o conteúdo do arquivo codificado em Base64                                            |

## Exclusão de CNAB de retorno

```shell
Excluir CNAB de retorno

DEFINIÇÃO

  DELETE https://app.cobrato.com/api/v1/regress_cnabs/:id

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X DELETE https://app.cobrato.com/api/v1/regress_cnabs/:id

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    204 No Content

EXEMPLO DE ESTADO DA RESPOSTA COM ARQUIVO DE RETORNO INEXISTENTE

    404 Not Found

```

Exclui determinado CNAB de retorno. A exclusão é irreversível.

## Arquivo do CNAB de Retorno

```shell
Mostrar Arquivo do CNAB de Retorno (URL)

DEFINIÇÃO

  GET https://app.cobrato.com/api/v1/regress_cnabs/:id/file

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X GET https://app.cobrato.com/api/v1/regress_cnabs/:id/file

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    200 OK

EXEMPLO DE ESTADO DA RESPOSTA COM ARQUIVO DE RETORNO INEXISTENTE

    404 Not Found

EXEMPLO DE CORPO DA RESPOSTA COM SUCESSO

  {
    "url":"https://cobrato-uploads.s3.amazonaws.com/regress_cnabs/cnabs/1/B425065A.RET?AWSAccessKeyId=AKIAIRJFH3YRXV5YRVTQ&Expires=1452277155&Signature=IJ1P%2Bc%2F9vC%2FKlBWuHGIBEl%2BAHKk%3D"
  }
```

Mostra o link da url do arquivo de determinado CNAB de retorno.

<aside class="warning">
As URLs disponibilizadas são válidas por apenas 60 minutos. Sendo assim, não armazene o retorno e sempre que for necessário realize uma nova chamada à API.
</aside>
