# Arquivos CNAB de Remessa

<aside class="notice">
Os Arquivos CNAB de Remessa são arquivos enviados para o banco com o objetivo de dar entrada em novos títulos, podendo ser gerado a partir de uma ou mais cobranças.
</aside>

## Criação de Arquivo CNAB de Remessa

```shell
Criar Arquivo CNAB de Remessa

DEFINIÇÃO

  POST https://app.cobrato.com/api/v1/remittances

EXEMPLO DE REQUISIÇÃO

  $ curl -i -u $API_TOKEN:X \
    -H 'User-Agent: My App 1.0' \
    -H 'Accept: application/json' \
    -H 'Content-type: application/json' \
    -X POST https://app.cobrato.com/api/v1/remittances \
    -D '{
        "charge_ids": [12, 13, 15, 18]
      }'

EXEMPLO DE ESTADO DA RESPOSTA COM SUCESSO

    201 Created

EXEMPLO DE ESTADO DA RESPOSTA COM INSUCESSO

    422 Unprocessable Entity

EXEMPLO DE CORPO DA RESPOSTA COM INSUCESSO

  {
    "errors":{
      "charge_ids": ["não pode ficar em branco"],
    }
  }

```

Cria um novo Arquivo CNAB de Remessa, retornando as informações do mesmo caso haja sucesso. Se houverem erros, eles serão informados no corpo da resposta.

Os Arquivos CNAB de Remessa podem ser criados a partir de uma ou mais cobraças que ainda não possuem boleto ou outro arquivo de remessa associado.

Parâmetros

|Campo          | Tipo                  | Comentário                                                                            |
|---------------|-----------------------|---------------------------------------------------------------------------------------|
| charge_ids    | arrray of integers    | Lista com os ids das cobranças que devem ser associadas ao Arquivo CNAB de Remessa    |
