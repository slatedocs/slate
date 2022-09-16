# Errores

<aside class="notice">
<b>Errores HTTP:</b>
Es vital para el desarrollador conocer los posibles errores HTTP que va a recibir de nuestra API. En la siguiente tabla explicaremos el código del error, el nombre de mismo y su descripción. Esto puede orientar a los desarrolladores que consuman nuestros servicios y se encuentren con esto.
</aside>

El API de Knowledge USB, utiliza los siguientes códigos de error:


Código | Nombre | Descripción
---------- | ------- | ----------
400 | Bad Request | Petición invalida.
401 | Unauthorized | API KEY Erronea o no tienes permiso para consumir ese servicio.
403 | Forbidden | No puedes consumir este servicio por permisos.
404 | Not Found | Respuesta sin resultados.
405 | Method Not Allowed | Método HTTP inapropiado para la petición.
406 | Not Acceptable | Solo se aceptan peticiones en formato JSON.
410 | Gone | Petición eliminada del servidor.
429 | Too Many Requests | Cantidad muy alta de peticiones, espere por favor.
500 | Internal Server Error | Error de servidor, intente más tarde por favor.
503 | Service Unavailable | Estamos en mantenimiento, por favor intente más tarde.
