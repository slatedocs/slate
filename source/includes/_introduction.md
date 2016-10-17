# Introdução

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.



## Endpoints da API

Método | Endpoint | Decrição
-------------- | -------------- | --------------
GET | `/v1/addresses` | Retorna todos endereços
POST | `/v1/addresses` | Cria um endereço
GET | `/v1/addresses/:id` | Retorna um endereço
PATCH | `/v1/addresses/:id`  | Atualiza os parâmetros
DELETE | `/v1/addresses/:id` | Deleta um endereço
GET | `/v1/phones` | Retorna todos telefones
POST | `/v1/phones` | Cria um telefone
GET | `/v1/phones/:id` | Retorna um telefone
PATCH | `/v1/phones/:id` | Atualiza os parâmetros
DELETE | `/v1/phones/:id` | Deleta um telefone
GET | `/v1/companies`| Retorna todas empresas
POST | `/v1/companies`| Cria uma empresa
GET | `/v1/companies/:id`| Retorna uma empresa específica
PATCH | `/v1/companies/:id` | Atualiza os parâmetros
DELETE | `/v1/companies/:id` | Deleta uma empresa específica
GET | `/v1/customers` | Retorna todos clientes
POST | `/v1/customers` | Cria um cliente
GET | `/v1/customers/:id` | Retorna um cliente
PATCH | `/v1/customers/:id` | Atualiza os parâmetros
DELETE  | `/v1/customers/:id` | Deleta um cliente
GET | `/v1/document_schemes` | Retorna todos os document_schemes de uma company
POST | `/v1/document_schemes` |  Cria um document_scheme
GET | `/v1/document_schemes/:id` | Retorna um document_scheme
PATCH | `/v1/document_schemes/:id` | Atualiza os parâmetros
DELETE | `/v1/document_schemes/:id` | Atualiza o document_scheme para inativo
GET | `/v1/items` | Retorna todos os items de uma company
POST | `/v1/items` | Cria um item
GET | `/v1/items/:id` | Retorna um item
PATCH | `/v1/items/:id` | Atualiza os parâmetros
DELETE | `/v1/items/:id` | Atualiza o item para inativo
