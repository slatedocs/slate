# CNAB de Remessa

```shell
CNAB de Remessa

EXEMPLO

  {
    "id": 1,
    "charge_config_id": 1,
    "status": "processed",
    "_links":
      [
        {"rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "charge_config", "method": "GET", "href": "https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel": "file", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1/file"},
        {"rel": "charges", "method": "GET", "href": "http://localhost:3000/api/v1/remittance_cnabs/1/charges"}
      ]
  }
```

Os Arquivos CNAB de Remessa são arquivos enviados para o banco com o objetivo de registrar novos títulos, podendo ser gerado a partir de uma ou mais Cobranças. Se forem enviadas Cobranças de Contas de Cobranças diferentes, será gerado um CNAB de remessa para cada Conta de Cobrança.

<aside class="warning">
A utilização desta API não é autorizada a contas com o plano <strong>Gratuito</strong>, resultando na resposta com o estado <strong>403 Forbidden</strong>!
</aside>

**Parâmetros**

| Campo            | Tipo            | Comentário                                                                                                                         |
|------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------|
| id               | integer         | identificador do CNAB de remessa                                                                                                   |
| charge_config_id | string          | identificador da configuração de cobrança no Cobrato                                                                               |
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
    "charge_config_id": 1,
    "status": "processed",
    "_links":
      [
        {"rel": "self", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "destroy", "method": "DELETE", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1"},
        {"rel": "charge_config", "method": "GET", "href": "https://app.cobrato.com/api/v1/charge_configs/1"},
        {"rel": "file", "method": "GET", "href": "https://app.cobrato.com/api/v1/remittance_cnabs/1/file"},
        {"rel": "charges", "method": "GET", "href": "http://localhost:3000/api/v1/remittance_cnabs/1/charges"}
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
        "charge_ids": [12, 13, 15, 18]
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Criated

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":{
      "charge_ids": ["não pode ficar em branco"],
    }
  }

```

Cria novo(s) Arquivo(s) CNAB de Remessa, retornando as informações do mesmo caso haja sucesso. Se houverem erros, eles serão informados no corpo da resposta. Pode ser gerado a partir de uma ou mais Cobranças. Se forem enviadas Cobranças de Contas de Cobranças diferentes, será gerado um CNAB de remessa para cada Conta de Cobrança.

Os Arquivos CNAB de Remessa podem ser criados a partir de uma ou mais cobraças que ainda não possuem boleto ou outro arquivo de remessa associado.

**Parâmetros**

| Campo      | Tipo              | Comentário                                                                                         |
|------------|-------------------|----------------------------------------------------------------------------------------------------|
| charge_ids | array of integers | **(requerido)** Lista com os ids das cobranças que devem ser associadas ao Arquivo CNAB de Remessa |

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
