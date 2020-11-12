## Introducción

> ¡Te damos la bienvenida!

Extrae información, crea reportes y analiza estadísticas para descubrir dónde y cuánto dinero están invirtiendo las marcas en sus campañas digitales. **Clientela es la mejor forma de interactuar con Admetricks** de manera automática.

El API de Clientela se organiza alredededor de [REST](https://es.wikipedia.org/wiki/Transferencia_de_Estado_Representacional). Implementa URLs orientadas a recursos y entrega respuestas en [formato JSON](http://www.json.org/) a través de códigos de estado y verbos HTTP.

## Actualización de datos

Para mantener la información lo más fresca posible, se recomienda obtener la información de los **últimos cinco días**, pues los datos se recopilan diariamente pero mejoran a medida que se aplican ciertos algoritmos de enriquecimiento.

Adicionalmente, existe un proceso de refinamiento (conocido como **reproceso**) donde pueden cambiar ciertas métricas de la campaña, o aparecer campañas nuevas, o eliminarse campañas existentes. Todo esto se realiza para **depurar la información** y entregar los resultados más apegados a la realidad.

El reproceso es programado y ocurre en las siguientes fechas.

- **Día 15 de cada mes:** se reprocesa el mes pasado. Ejemplo: el 15 de enero se reprocesa diciembre
- **Cada 3 meses**: el día 15 de cada trimestre, se reprocesa el trimestre pasado. Al terminar el reproceso trimestral, **la información se cierra** y no deberían existir cambios para ninguna campaña. Ejemplo: el 15 de enero se reprocesan octubre, noviembre y diciembre

## Límite de actualización

Un límite de actualización (del inglés *rate limit*) es el **número de llamadas** a la API que una aplicación o un usuario puede realizar en un **período de tiempo determinado**. Si se supera este límite o, la aplicación o el usuario pueden ser limitados. Las solicitudes de API realizadas por una aplicación o un usuario limitados, fallarán.

> A través de este panel lateral recibirás consejos y ejemplos.

```
  echo "Hola mundo!"
```

**El API de Clientela está sujeto a límites de tarifas**. Cada usuario puede realizar **máximo 1000 consultas a la API por día y 120 consultas por minuto**. Si cualquiera de los dos límites es excedido, podrá volver a realizar consultas una vez termine el periodo sobrepasado.

**URL base:** todas tus peticiones deben ser enviadas a [https://clientela.admetricks.com](https://clientela.admetricks.com)
