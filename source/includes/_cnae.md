# Consulta de CNAE

CNAE significa "Classificação Nacional de Atividades Econômicas " e trata-se de um código numérico responsável por classificar as atividades econômicas no Brasil. 

Nós disponibilizamos uma API que pode ser utilizada para consultar uma base que contém a lista de códigos CNAE do IBGE, assim como a descrição de cada atividade econômica categorizada pelo código.

```shell
# pesquisa por todos os códigos CNAE que possuem 'informática' em sua descrição
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/codigos_cnae?descricao=informatica
```

```php
<?php
$ch = curl_init();
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/codigos_cnae?descricao=informatica");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array());
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "token obtido no cadastro da empresa:");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class ExemploConsultaHook {

    public static void main(String[] args){

        String login = "Token_obtido_no_cadastro_da_empresa";

        /* Para ambiente de produção use a variável abaixo:
        String server = "https://api.focusnfe.com.br/"; */
        String server = "https://homologacao.focusnfe.com.br/";

        String url = server.concat("v2/codigos_cnae?descricao=informatica");

        /* Configuração para realizar o HTTP BasicAuth. */
        Object config = new DefaultClientConfig();
        Client client = Client.create((ClientConfig) config);
        client.addFilter(new HTTPBasicAuthFilter(login, ""));

        WebResource request = client.resource(url);

        ClientResponse resposta = request.get(ClientResponse.class);

        int HttpCode = resposta.getStatus();

        String body = resposta.getEntity(String.class);

        /* As três linhas abaixo imprimem as informações retornadas pela API.
         * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
        System.out.print("HTTP Code: ");
        System.out.print(HttpCode);
        System.out.printf(body);
    }
}
```

```ruby

# encoding: UTF-8

require "net/http"
require "net/https"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/codigos_cnae?descricao=informatica"

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Get.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
puts "Corpo da resposta: " + resposta.body

```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/codigos_cnae?descricao=informatica"

token="token obtido no cadastro da empresa"

r = requests.get(url, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/codigos_cnae?descricao=informatica";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

// Aqui enviamos a requisição.
request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

Disponibilizamos o seguinte método de consulta:

Método | URL (recurso) | Ação
-------|-------|-----
GET |	/v2/codigos_cnae	| Busca todos os códigos CNAE ou filtra-os de acordo com parâmetros

Os parâmetros disponíveis para consulta dos códigos CNAE são atualmente os seguintes:

* codigo: Busca pela código ou trecho do código CNAE.
* descricao: Busca pela descrição ou pelo trecho da descrição.

Caso já saiba o código CNAE exato, você pode efetuar a busca diretamente em:

* /v2/codigos_cnae/CODIGO_CNAE

## Resposta da API

> Exemplo de dados de resposta da consulta

```json
[
  {
    "codigo": "8599603",
    "descricao": "Treinamento em informática"
  },
  {
    "codigo": "4757100",
    "descricao": "Comércio varejista especializado de peças e acessórios para aparelhos eletroeletrônicos para uso doméstico, exceto informática e comunicação"
  },
  {
    "codigo": "4751202",
    "descricao": "Recarga de cartuchos para equipamentos de informática"
  }
]
```

Para cada consulta à nossa API de códigos CNAE a resposta trará um ou mais objetos JSON, com os campos como neste exemplo ao lado. Abaixo, a descrição de cada um dos campos:

* **codigo**: Representa o código CNAE frente ao IBGE
* **descricao**: Representa a descrição da atividade econômica à qual o código faz referência.


## Paginação

Ao fazer uma pesquisa, a API irá devolver o cabeçalho HTTP *X-Total-Count* que representa
o número total de ocorrências da pesquisa, porém a API devolve apenas 50 registros por vez.
Para buscar os demais registros, utilize o parâmetro **offset**. Exemplo:

Vamos supor que a chamada abaixo devolva 123 ocorrências:

`https://homologacao.focusnfe.com.br/v2/codigos_cnae?codigo=2`

A segunda e terceira páginas da consulta poderão ser acessados desta forma:

Registros 51 a 100:
`https://homologacao.focusnfe.com.br/v2/codigos_cnae?codigo=2&offset=50`

Registros 101 a 123:
`https://homologacao.focusnfe.com.br/v2/codigos_cnae?codigo=2&offset=100`