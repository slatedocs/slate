# Introdução

Bem-vindo ao guia de referências da API do Fast Notas! É através desta API que você irá integrar seu sistema para emissão de Notas Fiscais de Serviço.

<aside class="success">
Usamos <strong>https://api.fastnotas.com/v1/</strong> como endpoint.
</aside>


## Endpoints da API

Método | Endpoint | Descrição
-------------- | -------------- | --------------
GET | `/v1/addresses` | Retorna todos endereços
POST | `/v1/addresses` | Cria um endereço
GET | `/v1/addresses/:id` | Retorna um endereço
PUT | `/v1/addresses/:id`  | Atualiza os parâmetros
DELETE | `/v1/addresses/:id` | Deleta um endereço
GET | `/v1/phones` | Retorna todos telefones
POST | `/v1/phones` | Cria um telefone
GET | `/v1/phones/:id` | Retorna um telefone
PUT | `/v1/phones/:id` | Atualiza os parâmetros
DELETE | `/v1/phones/:id` | Deleta um telefone
GET | `/v1/companies`| Retorna todas empresas
POST | `/v1/companies`| Cria uma empresa
GET | `/v1/companies/:id`| Retorna uma empresa específica
PUT | `/v1/companies/:id` | Atualiza os parâmetros
DELETE | `/v1/companies/:id` | Deleta uma empresa específica
GET | `/v1/customers` | Retorna todos clientes
POST | `/v1/customers` | Cria um cliente
GET | `/v1/customers/:id` | Retorna um cliente
PUT | `/v1/customers/:id` | Atualiza os parâmetros
DELETE  | `/v1/customers/:id` | Deleta um cliente
GET | `/v1/document_schemes` | Retorna todos os document_schemes de uma company
POST | `/v1/document_schemes` |  Cria um document_scheme
GET | `/v1/document_schemes/:id` | Retorna um document_scheme
PUT | `/v1/document_schemes/:id` | Atualiza os parâmetros
DELETE | `/v1/document_schemes/:id` | Atualiza o document_scheme para inativo
GET | `/v1/items` | Retorna todos os items de uma company
POST | `/v1/items` | Cria um item
GET | `/v1/items/:id` | Retorna um item
PUT | `/v1/items/:id` | Atualiza os parâmetros
DELETE | `/v1/items/:id` | Atualiza o item para inativo
