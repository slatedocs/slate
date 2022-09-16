---
title: API Knowledge USB - Documentación

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.usbbog.edu.co/'>Universidad San Buenaventura</a>
  - <a href='https://github.com/slatedocs/slate'>Documentación hecha en Slate</a>

includes:
  - errors

search: false

code_clipboard: true

meta:
  - name: description
    content: Documentación Knowledge USB API
---

# Introducción

¡Saludos! En este documento vamos a mostrar una guia correspondiente a los servicios web que están desarrollados para la aplicación Knowledge USB. Dashboard que permitirá a la universidad tomar decisiones con respecto a la gestión de conocimiento de la institución. Está diseñado este proyecto a manera de prototipo, en donde esto se puede editar a futuro y además, de ser un entregable del proyecto, es una guia necesaria para las personas que editen el proyecto a futuro, o necesiten de los servicios web.

Este proyecto ha sido desarrollado con Laravel (PHP) debido a la facilidad de desarrollo y la simple sintaxis del lenguaje de programación. Para editar los servicios, es necesario que la persona conozca PHP y sepa como funciona este framework, que está diseñado bajo el patrón de arquitectura MVC y es orientado a objetos.

Se usará MySQL como sistema gestor de base de datos.

Se mostrará en este documento los parametros a enviar a cada servicio, el cuerpo de las respuestas, los posibles errores generados por el API y su interpretación.

Esta documentación se ha creado gracias a [Slate](https://github.com/slatedocs/slate).

# Autenticación

Es necesario iniciar sesión en el sistema para poder hacer uso de los servicios web disponibles en esta documentación. Para la autenticación, utilizamos [Laravel Passport] (https://laravel.com/docs/9.x/passport), que implementa la autenticación OAuth 2.0. Recibimos un token que servirá como parametro de seguridad obligatorio al hacer las peticiones al API, debido a que debemos asegurar nuestra aplicación de peticiones indeseadas. Para esto, TODAS las peticiones exceptuando las del siguiente listado deben ser enviadas con el siguiente header;

`Authorization: Bearer <MI_API_KEY>`

<b>Listado de servicios excluidos:</b>

`POST http://localhost:8000/api/auth/prevLogin`

`POST http://localhost:8000/api/auth/login`

<aside class="notice">
Se recomienda SIEMPRE crear un interceptor para validar que el token que se está enviando, no se haya expirado.<br>
TIEMPO DE EXPIRACIÓN DE TOKEN: 1 Semana.
</aside>

## Obtener roles para iniciar sesión

> Para autenticarse: Debes hacer esta petición:

```shell
# Copia este enlace y agrega los parametros requeridos
curl "http://localhost:8000/api/auth/prevLogin"

```

> Petición correcta:

```json

{
    "roles": [
        {
            "id": 1,
            "nombre": "nombre_rol",
            "descripcion": "",
        },
        {
            "id": 2,
            "nombre": "nombre_rol",
            "descripcion": ""
        }
        ...
    ]
}

```

> Petición con error:

```json

{
    "error_code": "INVALID_CREDENTIALS",
    "mensaje": "Error, usuario o contraseña incorrectas."
}

```

Esta petición retorna todos los roles disponibles de un usuario. 

### Petición HTTP

`POST http://localhost:8000/api/auth/prevLogin`

### Parametros

Parametro | Default | Requerido | Descripción
--------- | ------- | --------- | -----------
correo_est | No aplica | Si |  Correo institucional del usuario que obtendrá sus roles. Se espera una dirección de correo valida.
password | No aplica | Si | Contraseña del correo.

<aside class="notice">
Se debe hacer esta petición primero, debido a que cada usuario puede tener asignado más de un rol. Debemos verificar que roles tiene disponibles el usuario para así poderse autenticar y acceder a partes específicas del sistema para el rol seleccionado.
</aside>

## Iniciar sesión

> Para autenticarse: Debes hacer esta petición:

```shell
# Copia este enlace y agrega los parametros requeridos
curl "http://localhost:8000/api/autho/login"

```

> Petición correcta:

```json

{
    "access_token": "TOKEN_RECIBIDO",
    "token_type": "Bearer",
    "expires_at": "FECHA_Y_HORA_DE_EXPIRACION"
}

```

> Petición con error:

```json

{
    "error_code": "INVALID_CREDENTIALS",
    "mensaje": "Error, usuario o contraseña incorrectas."
}

```

Esta petición nos retorna el token de autenticación.

### Petición HTTP

`POST http://localhost:8000/api/auth/login`

### Parametros

Parametro | Default | Requerido | Descripción
--------- | ------- | --------- | -----------
correo_est | No aplica | Si | Correo institucional del usuario que obtendrá sus roles. Se espera una dirección de correo valida.
password | No aplica | Si | Contraseña del correo.

<aside class = "notice">
El token recibido en este servicio es el que debemos enviar en el header de cada una de las peticiones realizadas a los endpoint diferentes a la lista anteriormente especificada. Sin este token, obtendremos error de permisos por parte del servidor. Se recomienda guardarlo en un estado o en LocalStorage en nuestro front-end.
</aside>


## Aceptar politicas de privacidad

> Persistencia para aceptación de politica de tratamiento de datos:

```shell
# Copia este enlace y agrega los parametros requeridos
curl "http://localhost:8000/api/auth/aceptar-politicas/{id}"

```

> Petición correcta:

```json

{
    "mensaje": "Politica de tratamiento de datos aceptada"
}

```

> Petición con error:

```json

{
    "error_code": "NO_EXISTING_USER",
    "mensaje": "El usuario que acepta la política de tratamiento de datos no existe en nuestro sistema."
}

```

Esta petición nos retorna el token de autenticación.

### Petición HTTP

`GET http://localhost:8000/api/auth/aceptar-politicas/{id}`

### Parametros

Parametro | Default | Requerido | Descripción
--------- | ------- | --------- | -----------
id | No aplica | Si | Correo institucional del usuario que obtendrá sus roles. Se espera una dirección de correo valida.

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -X DELETE \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

