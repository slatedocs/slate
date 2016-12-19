# Introdução

Bem-vindo ao guia de referências da API do Fast Notas! É através desta API que você irá integrar seu sistema para emissão/armazenamento de documentos.

<aside class="success">
<strong>https://api.fastnotas.com/v1</strong> é a url base para todos os endpoints.
</aside>


## Endpoints da API

Método | Endpoint | Descrição
-------------- | -------------- | --------------
GET | `/companies`| Retorna todas empresas
GET | `/companies/:id`| Retorna uma empresa específica
GET | `/customers` | Retorna todos clientes
POST | `/customers` | Cria um cliente
GET | `/customers/:id` | Retorna um cliente
PUT | `/customers/:id` | Atualiza os parâmetros
DELETE  | `/customers/:id` | Deleta um cliente
GET | `/document_schemas` | Retorna todos os document_schemas de uma empresa
POST | `/document_schemas` |  Cria um document_schema
GET | `/document_schemas/:id` | Retorna um document_schema
PUT | `/document_schemas/:id` | Atualiza os parâmetros
DELETE | `/document_schemas/:id` | Inativa o document_schema
GET | `/items` | Retorna todos os items de uma empresa
POST | `/items` | Cria um item
GET | `/items/:id` | Retorna um item
PUT | `/items/:id` | Atualiza os parâmetros
DELETE | `/items/:id` | Inativa o item
GET | `/documents` | Retorna todos os documentos de uma empresa
POST | `/documents` | Cria um documento
GET | `/documents/:id` | Retorna um documento
GET | `/documents/:id/operations` | Retorna todas operações do documento
GET | `/operations/:id` | Retorna uma operação
GET | `operations/:id/transactions` | Retorna todas transações da operação
GET | `transactions/:id` | Retorna uma transação
