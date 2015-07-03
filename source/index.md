---
title: "OmbuShop REST API: Referencia"

language_tabs:
  - http
  - shell

toc_footers:
  - <a href='http://www.ombushop.com/partners'>Registrate en OmbuShop</a>

includes:
  - errors

search: true
---

# Introducción

Bienvenido a la API REST de OmbuShop. Aquí puedes ver la documentación para
todos los endpoints de la API de OmbuShop.

# Para hacer pedidos

Para realizar pedidos a la API REST, se debe pasar la API key de tu tienda
como parámetro `secret`. La API key la encontraras en el panel de administración
de tu tienda, en la sección "Mi Cuenta".

# Productos

## Obtener todos los productos

```http
GET /products HTTP/1.1
Host: api.ombushop.com
```

```shell
curl "http://api.ombushop.com/products"
```

> Devuelve un JSON con la siguiente estructura:

```json
[
  {
    "id": 120,
    "name": "Zapatillas",
    "description": "<p>Zapatillas de ultima moda</p>",
    "created_at": "2015-06-25 14:43:51 -0300",
    "updated_at": "2015-07-03 17:17:40 -0300",
    "permalink": "zapatillas",
    "deleted_at": null,
    "meta_description": "Descripción",
    "meta_keywords": "Palabras clave",
    "count_on_hand": 10,
    "seller_id": 24,
    "currency": "ARS"
  },
  {
    "id": 121,
    "name": "Remera",
    "description": "<p>Remera blanca</p>",
    "created_at": "2015-06-25 14:43:51 -0300",
    "updated_at": "2015-07-03 17:17:40 -0300",
    "permalink": "remera",
    "deleted_at": null,
    "meta_description": "Descripción",
    "meta_keywords": "Palabras clave",
    "count_on_hand": 20,
    "seller_id": 24,
    "currency": "ARS"
  }
]
```

Obtener un JSON con todos los productos.

### Atributos

Atributo | Descripción
--------- | -----------
id | Identificador del producto
name | Nombre del producto
description | Descripción del producto
created_at | Fecha de creación del producto
updated_at | Fecha de ultima información del producto
permalink | Nombre amigable utilizado para la URL del producto
deleted_at | Fecha de borrado del producto, si este hubiera sido borrado
meta_description | Descripción que puede ayudar a los buscadores web a tener informacion relevante sobre el producto
meta_keywords | Palabras clave que pueden ayudar en la búsqueda del producto
count_on_hand | Cantidad de unidades disponibles del producto
seller_id | Identificador del vendedor del producto
currency | Moneda utilizada por la tienda

### Pedido HTTP

`GET http://api.ombushop.com/products`

### Parámetros de la URL

Parámetro | Descripción
--------- | -----------
secret | API key del vendedor, la encontraras [aquí].

# Categorías

## Obtener todas las categorías

```http
GET /taxons HTTP/1.1
Host: api.ombushop.com
```

```shell
curl "http://api.ombushop.com/taxons"
```

> Devuelve un JSON con la siguiente estructura:

```json
[
  {
    "id": 15,
    "parent_id": null,
    "name": "Calzado",
    "created_at": "2015-07-03 13:03:27 -0300",
    "updated_at": "2015-07-03 13:03:27 -0300",
    "permalink": "calzado/"
  },
  {
    "id": 16,
    "parent_id": 15,
    "name": "Calzado Casual",
    "created_at": "2015-07-03 13:14:40 -0300",
    "updated_at": "2015-07-03 13:14:40 -0300",
    "permalink": "calzado/calzado-casual/"
  },
  {
    "id": 17,
    "parent_id": 15,
    "name": "Calzado Deportivo",
    "created_at": "2015-07-03 13:14:44 -0300",
    "updated_at": "2015-07-03 13:14:44 -0300",
    "permalink": "calzado/calzado-deportivo/"
  },
  {
    "id": 18,
    "parent_id": null,
    "name": "Remeras",
    "created_at": "2015-07-03 13:14:57 -0300",
    "updated_at": "2015-07-03 13:14:57 -0300",
    "permalink": "remeras/"
  }
]
```

Obtener un JSON con todas las categorías.

### Atributos

Atributo | Descripción
--------- | -----------
id | Identificador de la categoría
parent_id | Identificador de la categoria padre
name | Nombre de la ategoría
created_at | Fecha de creación de la categoría
updated_at | Fecha de ultima actualización de la categoría
permalink | Nombre amigable utilizado para la URL de la categoría

### Pedido HTTP

`GET http://api.ombushop.com/taxons`

### Parámetro de la URL

Parámetro | Descripción
--------- | -----------
secret | API key del vendedor, la encontraras [aquí].
