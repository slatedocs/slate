---
title: F1Sales API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='mailto:support@f1sales.zendesk.com'>Dúvidas, sugestões? Entre em contato</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introdução

Bem-vindo a API do F1Sales! Você pode usar os endpoints para inserir leads no sistema.

# Autenticação

Não é nescessário autenticação para inserir leads.

# Endpoint

Para se comunicar com API a aplicação precisa saber o *ID da loja* que é seu subdominio, por exemplo:

<code>https://lojateste.f1sales.org</code>

Possui o ID <strong><code>lojateste</code></strong>.

Endpoint da API:

<code>https://<strong>lojateste</strong>.f1lsales.org/public/api/v1/</code>

<aside class="notice">
Os exemplos utilizam o endpoint da loja de Sandbox, lembre-se que em produção você tem que utilizar o ID do cliente no endpoint.
</aside>

# Leads

## Inserir Leads

```shell
curl -X POST "https://sandbox.f1sales.org/public/api/v1/leads"\
  -H "Content-Type: application/json"\
  -H "accept: application/json"\
  -d "
  {
    \"lead\":{
      \"customer\":{
        \"name\":\"Darth Vader\",
        \"phone\":\"11989889988\",
        \"email\":\"darthvader@deathstar.com\"
      },
      \"product\":{
        \"name\":\"Tie Fighter\"
      },
      \"source\":{
        \"name\":\"Galactic Market - Used Ships\"
      },
      \"message\":\"Hi, my name is vader and would like to know more about..\",
      \"description\":\"Clicked on header banner\"
    }
  }"
```

>  O comando acima retorna o seguinte JSON:

```json
{
  "data": {
    "id": "5f85cb84810ac5e35cceb235",
    "type": "leads",
    "attributes": {
      "created-at": "2008-09-01T10:05:01.183Z",
      "message": "Hi, my name is vader and would like to know more about..",
      "description": "Clicked on header banner"
    },
      "product": {
        "name": "Tie Fighter"
    },
     "included": {
       "customer": {
         "name": "Darth Vader",
         "phone": "11989889988",
         "email": "darthvader@deathstar.com"
       },
       "source": {
         "name": "Galactic Market - Used Ships"
       }
     }
  }
}
```

Esse endpoint insere um lead.

### HTTP Request

`POST http://sandbox.f1sales.org/api/public/leads`

### Paremetros da Query

Parametro | Obrigatório | Tipo | Descrição
--------- | ----------- | ---- |----------
lead | sim | JSON | Chave raiz raiz dos leads
customer | sim | JSON | Dados do consumidor
product | sim | JSON | Dados do produto
source | sim | JSON | Dados da fonte
message | não | String | Mensagem do cliente
description | não | String | Descrição do lead, informação adicional para o vendedor


#### Parametros de `customer`
Parametro | Obrigatório | Tipo | Descrição
--------- | ----------- | ---- | ----------
name | sim | String | Nome do interessado
phone | não | String | Telefone do interessado
email | não | String | Email do interessado

#### Parametros de `product`
Parametro | Obrigatório | Tipo | Descrição
--------- | ----------- | ---- | ----------
name | sim | String | Nome do produto

#### Parametros de `source`
Parametro | Obrigatório | Tipo | Descrição | Observação
--------- | ----------- | ---- | --------- | ----------
name | sim | String | Nome da fonte | **Mantenha sempre o formato: 'Nome do portal - Categoria', ex: 'Mercado de Alderan - Seminovos'**


<aside class="success">
Qualquer dúvida entre em contato! support@f1sales.zendesk.com
</aside>
