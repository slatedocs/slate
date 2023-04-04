# Consulta de CNPJ

O Cadastro Nacional de Pessoa Jurídica - CNPJ - compreende as informações cadastrais das entidades de interesse das administrações tributárias da União, dos estados, do Distrito Federal e dos municípios. Ao cadastro da pessoa jurídica é atribuído a um ou mais números de inscrição no CNPJ. Este número de inscrição é formado por (14) dígitos e composto de três partes e representado usando a seguinte notação:

XX.XXX.XXX/YYYY-ZZ

a) a primeira parte é composta de oito dígitos (XX.XXX.XXX) que formam o número base. Ele identifica a empresa;

b) a segunda parte é composta de quatro dígitos (YYYY) que formam o número de ordem. Ele identifica se o cadastro se refere a matriz ou à filiais (0001 - matriz, ou 0002 - filial 1, 0003 - filial 2,...);

c) a terceira parte é composta de dois dígitos (ZZ) que formam o dígito verificador. Ele tem como função verificar se o conteúdo do número base e de origem são válidos.  


A FocusNFe disponibiliza uma API que permite consultar alguns dos dados presentes no Cadastro Nacional de Pessoa Jurídica.

A API usa como base dados fornecidos trimestralmente pela Receita Federal.

```shell
# Pesquisar dados de cadastro do número de inscrição 07.504.505/0001-32
curl -u <token obtido no cadastro da empresa> https://api.focusnfe.com.br/v2/cnpjs/07504505000132
```

```php
<?php
$ch = curl_init();
$server = "https://api.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/cnpjs/07504505000132");
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

        String server = "https://api.focusnfe.com.br/";

        String url = server.concat("/v2/cnpjs/07504505000132");

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

# endereço da api
servidor = "https://api.focusnfe.com.br/"

url_envio = servidor + "v2/cnpjs/07504505000132"

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Get.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# no envio de notas em produção, é necessário utilizar o protocolo ssl
http.use_ssl = true

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

url = "https://api.focusnfe.com.br/v2/cnpjs/07504505000132"

token="token obtido no cadastro da empresa"

r = requests.get(url, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicão e a mensagem de retorno da API
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


var url = "https://api.focusnfe.com.br/v2/cnpjs/07504505000132"

/*
Use o valor 'false', como terceiro parametro para que a requisição aguarde a resposta da API
Passamos o token como quarto paramâtro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

// Aqui enviamos a requisição.
request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

Para realizar uma consulta cadastro de uma empresa, utilize o endereço abaixo substituindo o "resource ID" INSCRICAO_CNPJ pelo número de inscrição no CNPJ:

`https://api.focusnfe.com.br/v2/cnpjs/INSCRICAO_CNPJ`

Utilize o método HTTP **GET**.

A pesquisa só poderá ser feita usando o número completo de inscrição no CNPJ, com seus 14 dígitos completos. Não é suportado nesse momento uma busca aproximada através de um número de identificação de CNPJ parcial e só é possível executar a consulta ao cadastro de um número de CNPJ por requisição.

Devem ser usados apenas os números que compõem o identificador, sem os ".","/" e "=". Ou seja, se identificador do CNPJ é 02.123.123/0001-56, a requisição seria feita usando a notação 02123123000156.

É necessário ter um token de autenticação emitido pela FocusNFe para poder executar a requisição.

A requisição REST devolve um JSON no corpo (body) da resposta com seguintes dados de cadastro:

## Resposta da API

> Dados de resposta da consulta

```json
{
    "razao_social": "ACRAS TECNOLOGIA DA INFORMACAO LTDA",
    "cnpj": "07504505000132",
    "situacao_cadastral": "ativa",
    "cnae_principal": "6209100",
    "endereco": {
      "codigo_municipio": "7535",
      "nome_municipio": "CURITIBA",
      "logradouro": " XV DE NOVEMBRO",
      "numero": "1234",
      "bairro": "CENTRO",
      "cep": "80060000",
      "uf": "PR"
    }
}
```

Para cada consulta à API de CNPJs a resposta trará um objeto JSON, com os campos como neste exemplo ao lado. Abaixo, a descrição de cada um dos campos:

 * **razao_social**: Razão Social da empresa.
 * **cnpj**: Número de inscrição no CNPJ.
 * **situacao_cadastral**: Situação cadastral da empresa.
 * **cnae_principal**: CNAE Principal.
  * **codigo_municipio**: Código do município onde a empresa está registrada.
  * **nome_municipio**: Nome do município.
  * **logradouro**: Nome do logradouro.
  * **numero**: Número do logradouro, se houver.
  * **bairro**: Bairro.
  * **cep**: CEP.
  * **uf**: UF.
