# Consulta de CFOP

CFOP significa "Código Fiscal de Operações e Prestações" e trata-se de um código de quatro dígitos que serve para identificar operações que envolvam a incidência de ICMS ou IPI. 

Nós disponibilizamos uma API que você poderá utilizar para fornecer ao seu usuário final uma pesquisa de qual o código CFOP correto para a operação realizada.

O código CFOP é formato por 4 dígitos, sendo que o primeiro digito indica se a operação é de entrada ou saída e também a localização da contraparte: mesma UF, outra UF ou exterior. Exemplo:

Entradas

* 1.000 – Entrada e/ou Aquisições de Serviços do Estado
* 2.000 – Entrada e/ou Aquisições de Serviços de outros Estados
* 3.000 – Entrada e/ou Aquisições de Serviços do Exterior

Saídas

* 5.000 – Saídas ou Prestações de Serviços para o Estado
* 6.000 – Saídas ou Prestações de Serviços para outros Estados
* 7.000 – Saídas ou Prestações de Serviços para o Exterior

Por exemplo, o código 5101 refere-se a venda de produção do estabelecimento para um cliente do mesmo estado.

```shell
# pesquisa por CFOPs que iniciam com o dígito 2
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/cfops?codigo=2
```

```php
<?php
$ch = curl_init();
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/cfops?codigo=2");
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

        String url = server.concat("v2/cfops?codigo=2");

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
url_envio = servidor_homologacao + "v2/cfops?codigo=2"

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
url = "https://homologacao.focusnfe.com.br/v2/cfops?codigo=2"

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
var url = "https://homologacao.focusnfe.com.br/v2/cfops?codigo=2";

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

> Dados de resposta da consulta

```json
[
 {
    "codigo": "2151",
    "descricao": "2151 - Transferência p/ industrialização ou produção rural"
  },
  {
    "codigo": "2152",
    "descricao": "2152 - Transferência p/ comercialização"
  },
  {
    "codigo": "2153",
    "descricao": "2153 - Transferência de energia elétrica p/ distribuição"
  },
  {
    "codigo": "2154",
    "descricao": "2154 - Transferência p/ utilização na prestação de serviço"
  },
  {
    "codigo": "2159",
    "descricao": "2159 - Entrada decorrente do fornecimento de produto ou mercadoria de ato cooperativo"
  },
  {
    "codigo": "2201",
    "descricao": "2201 - Devolução de venda de produção do estabelecimento"
  },
  {
    "codigo": "2202",
    "descricao": "2202 - Devolução de venda de mercadoria adquirida ou recebida de terceiros"
  }
]
```

Para consultar os CFOPs disponíveis, utilize o endereço abaixo:

`https://homologacao.focusnfe.com.br/v2/cfops`


Utilize o método HTTP **GET**. São aceitos os seguintes parâmetros de pesquisa:

* **codigo**: Pesquise **pela parte inicial** do código CFOP
* **descricao**: Pesquisa por parte da descrição do código CFOP.

Caso já saiba o código CFOP exato, e queira apenas recuperar sua descrição, utilize o link
abaixo, substituindo CODIGO_CFOP pelo código.

`https://homologacao.focusnfe.com.br/v2/cfops/CODIGO_CFOP`


## Paginação

Ao fazer uma pesquisa, a API irá devolver o cabeçalho HTTP *X-Total-Count* que representa
o número total de ocorrências da pesquisa, porém a API devolve apenas 50 registros por vez.
Para buscar os demais registros, utilize o parâmetro **offset**. Exemplo:

Vamos supor que a chamada abaixo devolva 123 ocorrências:

`https://homologacao.focusnfe.com.br/v2/cfops?codigo=2`

A segunda e terceira páginas da consulta poderão ser acessados desta forma:

Registros 51 a 100:
`https://homologacao.focusnfe.com.br/v2/cfops?codigo=2&offset=50`

Registros 101 a 123:
`https://homologacao.focusnfe.com.br/v2/cfops?codigo=2&offset=100`
