## Empezar

**Te damos la bienvenida al API de Clientela.**

Clientela es la principal forma para extraer datos de Admetricks.

El API de Clientela se organiza alredededor de [REST](https://es.wikipedia.org/wiki/Transferencia_de_Estado_Representacional), utiliza con URLs orientadas a recursos y entrega respuestas en [formato JSON](http://www.json.org/) a través de códigos de estado y verbos HTTP.

## Frecuencia de actualización

Para mantener la información lo más fresca posible, se recomienda obtener la información del **día de anterior y 5 días hacia atrás**, pues los datos se entregan en tiempo real pero mejora según se aplican ciertos algoritmos de enriquecimiento.

## Límites

Un límite de tarifa (del inglés *rate limit*) es el **número de llamadas** a la API que una aplicación o un usuario puede realizar en un **período de tiempo determinado**. Si se supera este límite o si se superan los límites de tiempo de la CPU o del total, la aplicación o el usuario pueden ser estrangulados. Las solicitudes de API realizadas por un usuario o aplicación estrangulada fallarán.

**El API de Clientela está sujeto a límites de tarifas**. Cada usuario puede realizar máximo 1000 consultas a la API por día y 120 consultas por minuto. Si cualquiera de los dos límites es excedido, podrá volver a realizar consultas una vez termine el periodo sobrepasado.

> A través de este panel lateral recibirás consejos y ejemplos.

```
  echo "Hola mundo!"
```

**URL base:** todas tus peticiones deben ser enviadas a [https://clientela.admetricks.com](https://clientela.admetricks.com)
