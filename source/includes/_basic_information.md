# Informaçães básicas

## Autenticação

Antes de acessar o Cobrato, você deve criar uma conta em: Cobrato. Se você já tiver uma, você precisa ter o seu API token, você pode conseguí-lo nas configurações de sua conta, o token é requerido em todas as requisições via API, o token é usado para identificá-lo.

Autenticação na API do Cobrato é realizada utilizando HTTP Basic, Porem você não vai usar sua senha e login como de costume, você terá que usar o token da API como sendo seu login e a senha em branco, (se o seu cliente HTTP requer uma senha, você pode digitar X).


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

Todos os dados recebidos e enviados através da API do Cobrato é baseado no fuso horário UTC. No entanto um usuário pode ter uma preferência por outro. Este fuso horário vai ser utilizado para apresentar a resposta, isso não afeta o resultado da resposta da API

Formatos de data e hora

Todas as datas e horas são formatadas de acordo com ISO 8601 padrão, e sempre vai ser dada no fuso horário.

Você deve sempre fornecer os seus valores de data e hora no mesmo formato ISO 8601 e no fuso horário UTC.

|Tipo      | Formato                 | Exemplo                |
|----------|-------------------------|------------------------|
|Data      | YYYY-mm-dd              |  2014-11-05            |
|Data hora | YYYY-mm-ddTHH:MM:SSZ    |  2014-11-05T17:28:03Z  |


## Formato numérico

<aside class="notice">Todos os números são fornecidos tanto com números inteiros, ponto flutuante nativos para JSON.</aside>

## Formato numérico

<aside class="notice">Todos os números são fornecidos tanto com números inteiros, ponto flutuante nativos para JSON.</aside>
