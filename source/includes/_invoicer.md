# Invoicer API

## Companies

### Criar company

> `POST /v1/companies`

```json
[
  {
    "name": "Fast Notas",
    "legal_name": "Fast Notas",
    "email": "exemplo@fastnotas.com",
    "registry_code": "11111111111111",
    "phone": null,
    "api_key": YOUR_API_KEY,
    "address": null
  }
]

```

Para criar uma empresa é necessário ter a [chave de API](http://example.com/developers).

### Index

> `GET /v1/companies`

```json
[
  {
    "id": company_id,
    "name": "Fast Notas",
    "legal_name": "Fast Notas",
    "email": "exemplo@fastnotas.com",
    "registry_code": "11111111111111",
    "status": "active",
    "phone": null,
    "api_key": YOUR_API_KEY,
    "address": null
  }
]

```

### teste


## Customers

## Document Schemes

  1. Ver index
  2. Criar
  3. Visualizar
  4. Deletar

## Items

## Settings

## Documents

## Operations

## Transactions
