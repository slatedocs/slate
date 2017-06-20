# Rate Limit

Por padrão a API do Fast Notas possui um limite de 120 requisições por minuto por empresa.
Para obter o status do limite, consulte os cabeçalhos abaixo no retorno de qualquer chamada à API:
Os `headers` abaixo

  * `Rate-Limit-Limit`: *Limite de requisições por minuto*
  * `Rate-Limit-Remaining`: *Número de requisições restantes antes de atingir o limite*
  * `Rate-Limit-Reset`: *Horário em que o limite será reiniciado no formato Unix Time, fuso horário UTC*

Caso o limite de requisições seja atingido (`Rate-Limit-Remaining` igual à zero), a plataforma irá rejeitar a requisição seguinte e retornar o status `HTTP status code` `429 - Too Many Requests`, incluindo o header `Retry-After`, que indica o número de segundos restantes para realizar uma nova tentativa.

O limite contempla todos os tipos de requisição, inclusive requisições inválidas do tipo `HTTP status code 4xx`.

## Boas práticas

Em condições normais de operação dificilmente esse limite será atingido, porém más práticas de integração podem comprometer o limite rapidamente.

### Evite polling

Polling é o nome do procedimento usado para buscar o status de determinada informação em intervalos de tempo consecutivos. Sabemos que é comum implementar rotinas diárias de consulta de status. Enquanto este procedimento funciona satisfatoriamente com um número baixo de registros, você poderá ultrapassar o limite de requisições caso o número de consultas aumente.

É justamente por isso que a plataforma Fast Notas oferece os [webhooks](#webhooks). Em vez de gastar recursos computacionais com polling, configure a plataforma Fast Notas para avisar seu backend via POST imediatamente quando um evento ocorrer. Com isso você não desperdiça recursos e garante que sua plataforma estará com os dados sempre atualizados. Se você precisar de um tipo de webhook que ainda não esteja disponível, converse com nossa equipe e ficaremos felizes em criar um novo tipo de disparo que ajude você a se manter dentro do limite de requisições.

### Use cache

Recursos que não são atualizados frequentemente podem ser armazenados em cache localmente. Por exemplo, em vez de efetuar uma requisição de [listagem de documentos](#retornando-documentos) toda vez que um cliente quiser visualizar o status da sua nota fiscal, faça uma única consulta à API e armazene o resultado, configurando o tempo de expiração que julgar necessário. Soluções baseadas em memcache ou Redis funcionam muito bem nesses casos.