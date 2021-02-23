<span id="errores-y-otros-resultados"></span>

## Errores y otros resultados

**Admetricks utiliza códigos de respuesta HTTP convencionales** para indicar el éxito o el fracaso de una solicitud de API.

**En general:**

<ul class="list__disc text-justify">
  <li>Los códigos en el rango <code>2xx</code> indican éxito</li>
  <li>Los códigos en el rango <code>4xx</code> indican un error ocurrido debido a la información proporcionada (por ejemplo, se omitió un parámetro requerido o se envió un valor inválido)</li>
  <li>Los códigos en el rango <code>5xx</code> indican un error en los servidores de Admetricks (este tipo de error es menos común).</li>
  <li>Algunos errores <code>4xx</code> (que pueden ser manejados de forma programática) incluyen un código de error que explica brevemente lo sucedo</li>
</ul>

<br />

<details class="card p-0" open>
<summary>Detalle de los códigos</summary>
<table>
  <thead>
    <tr>
      <td>Estado</td>
      <td>Significado</td>
      <td>Descripción</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>200, 201</td>
      <td>Ok</td>
      <td>Petición exitosa</td>
    </tr>
    <tr>
      <td>400</td>
      <td>Bad Request</td>
      <td>Tu petición es inaceptable, generalmente debido a parámetros faltantes o valores inválidos</td>
    </tr>
    <tr>
      <td>401</td>
      <td>Unauthorized</td>
      <td>Token inválido o no encontrado</td>
    </tr>
    <tr>
      <td>403</td>
      <td>Forbidden</td>
      <td>Tu token no tiene los permisos para realizar esta acción</td>
    </tr>
    <tr>
      <td>404</td>
      <td>Not Found</td>
      <td>El recurso solicitado no existe</td>
    </tr>
    <tr>
      <td>409</td>
      <td>Conflict</td>
      <td>No se encontraron datos para tu solicitud</td>
    </tr>
    <tr>
      <td>429</td>
      <td>Too Many Requests</td>
      <td>Realizaste <a href="#limite-de-uso">demasiadas peticiones</a> muy rápido</td>
    </tr>
    <tr>
      <td>500, 502, 5xx...</td>
      <td>Errores del servidor</td>
      <td>Algo ha ido mal por nuestra parte. Comunícate tu ejecutivo y lo resolveremos</td>
    </tr>
  </tbody>
</table>

</details>
