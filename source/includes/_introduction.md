# Introdução

Bem-vindo ao guia de referências da API do Fast Notas! É através desta API que você irá integrar seu sistema para emissão/armazenamento de documentos.

<aside class="success">
<strong>https://api.fastnotas.com/v1</strong> é a url base para todos os endpoints.
</aside>


## Endpoints da API

Método | Endpoint | Descrição
-------------- | -------------- | --------------
GET | `/addresses` | Retorna todos endereços
POST | `/addresses` | Cria um endereço
GET | `/addresses/:id` | Retorna um endereço
PUT | `/addresses/:id`  | Atualiza os parâmetros
DELETE | `/addresses/:id` | Deleta um endereço
GET | `/phones` | Retorna todos telefones
POST | `/phones` | Cria um telefone
GET | `/phones/:id` | Retorna um telefone
PUT | `/phones/:id` | Atualiza os parâmetros
DELETE | `/phones/:id` | Deleta um telefone
GET | `/companies`| Retorna todas empresas
GET | `/companies/:id`| Retorna uma empresa específica
GET | `/customers` | Retorna todos clientes
POST | `/customers` | Cria um cliente
GET | `/customers/:id` | Retorna um cliente
PUT | `/customers/:id` | Atualiza os parâmetros
DELETE  | `/customers/:id` | Deleta um cliente
GET | `/document_schemes` | Retorna todos os document_schemes de uma company
POST | `/document_schemes` |  Cria um document_scheme
GET | `/document_schemes/:id` | Retorna um document_scheme
PUT | `/document_schemes/:id` | Atualiza os parâmetros
DELETE | `/document_schemes/:id` | Atualiza o document_scheme para inativo
GET | `/items` | Retorna todos os items de uma company
POST | `/items` | Cria um item
GET | `/items/:id` | Retorna um item
PUT | `/items/:id` | Atualiza os parâmetros
DELETE | `/items/:id` | Atualiza o item para inativo
