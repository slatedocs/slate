# Informaçães básicas

## Autenticação


Antes de acessar o Cobrato, você deverá criar uma conta e precisará do seu API token, que é requerido em todas as requisições via API e será o identificador de sua conta. Para conseguí-lo, vá em Gerenciamento > Configurações Gerais.

A autenticação na API do Cobrato é realizada utilizando HTTP Basic. Você não usará sua senha e login como o de costume, em vez disso usará o API token como seu login e a senha pode ficar em branco ou, caso seu cliente HTTP peça uma senha, pode ser qualquer valor, a letra X por exemplo.


  ```shell
    Formato JSON

    EXEMPLO DE REQUISIÇÃO

      $ curl -i -u $YOUR_API_TOKEN:X \
        -H 'User-Agent: My App 1.0' \
        -H 'Accept: application/json' \
        -H 'Content-type: application/json' \
        -X GET https://app.cobrato.com/api/v1

    EXEMPLO DE RESPOSTA

    {
      "chave": "valor"
    }

  ```

## Formatos de requisição e resposta

<aside class="notice">O único formato disponível para requisições e respostas é JSON.</aside>


## Fuso horário

Todos os dados recebidos e enviados através da API do Cobrato são baseados no fuso horário UTC. Caso seja necessário utilizar outro fuso horário, este será utilizado somente na apresentação, o que não afeta o resultado da resposta da API.

Formatos de data e hora

Todas as datas e horas são formatadas de acordo com ISO 8601 padrão, e sempre serão dadas no fuso horário.

Você deve sempre fornecer os seus valores de data e hora no mesmo formato ISO 8601 e no fuso horário UTC.

|Tipo      | Formato                 | Exemplo                |
|----------|-------------------------|------------------------|
|Data      | YYYY-mm-dd              |  2014-11-05            |
|Data hora | YYYY-mm-ddTHH:MM:SSZ    |  2014-11-05T17:28:03Z  |


## Formato numérico

<aside class="notice">Todos os números são fornecidos tanto com números inteiros, como ponto flutuante nativos para JSON.</aside>

## Paginação

Todas as listagens são páginadas. Pode-se utilizar os parâmetros `page` (valor padrão 1) e
`per_page` (valor padrão 25) para controlar, respectivamente, a página e a quantidade de
itens por página.

  ```shell
    Formato JSON

    EXEMPLO DE REQUISIÇÃO

      $ curl -i -u $YOUR_API_TOKEN:X \
        -H 'User-Agent: My App 1.0' \
        -H 'Accept: application/json' \
        -H 'Content-type: application/json' \
        -X GET https://app.cobrato.com/api/v1/lista?page=2&per_page=5

    EXEMPLO DE RESPOSTA

    {
      "chave1": "valor 1",
      "chave2": "valor 2",
      "chave3": "valor 3",
      "chave4": "valor 4",
      "chave5": "valor 5"
    }

  ```
## Restrição

Toda resposta de requisição conterá os headers X-RateLimit-Limit, X-RateLimit-Reset e X-RateLimit-Remaining, significando respectivamente o limite de requisições por minuto, a data em que a contagem será resetada e quantas requisições restam.

Cada token de autorização está limitado a 60 requests por minuto. Após atingir a cota, todo acesso irá retornar erro 429 Too Many Requests até que o número de acessos seja resetado. Os acessos são resetados de 1 em 1 minuto, ou seja, se você realizou um request às 17:43:53, o reset acontecerá às 17:44:00 e não 17:44:53.

<aside class="notice">
  O Cobranto ainda está em fase de coleta de dados para analise das requisições, por tanto ainda não está restringindo o acesso à API. Futuramente estes valores poderão ser alterados.
</aside>

```shell

  EXEMPLO DE RESPOSTA

  HTTP/1.1 429 TOO MANY REQUESTS
  Content-Type: application/json; charset=utf-8
  Date: Wed, 26 Jan 2011 12:56:45 GMT
  Retry-After: 60
  X-RateLimit-Limit: 60
  X-RateLimit-Reset: Wed, 26 Jan 2011 12:57:00 GMT
  X-RateLimit-Remaining: -1

```
