# Consulta de NCM

NCM significa "Nomenclatura Comum do Mercosul" e trata-se de um código de oito dígitos estabelecido através da convenção de categorização de mercadorias adotada desde 1995 pelo Uruguai, Paraguai, Brasil e Argentina e que toma por base o Sistema Harmonizado (SH). Este código é utilizado na emissão de NFe e de NFCe.

Nós disponibilizamos uma API que você poderá utilizar para fornecer ao seu usuário final uma pesquisa de qual o código NCM correto do seu produto.

O código NCM é formato por 8 dígitos no seguinte formato:

CCPPSÇII, sendo:

* CC = Capitulo
* PP = Posição
* S  = Subposição 1
* Ç  = Subposição 2
* II = Item 1 e 2

```shell
# pesquisa por códigos NCM do capítulo 90
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/ncms?capitulo=90
```

```php
<?php
$ch = curl_init();
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/ncms?capitulo=90");
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

        String url = server.concat("v2/ncms?capitulo=90");

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
url_envio = servidor_homologacao + "v2/ncms?capitulo=90"

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
url = "https://homologacao.focusnfe.com.br/v2/ncms?capitulo=90"

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
var url = "https://homologacao.focusnfe.com.br/v2/ncms?capitulo=90";

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
   "codigo": "90049090",
   "descricao_completa": "Óculos para correção, proteção ou outros fins, e artigos semelhantes. Outros Outros",
   "capitulo": "90",
   "posicao": "04",
   "subposicao1": "9",
   "subposicao2": "0",
   "item1": "9",
   "item2": "0"
 },
 {
   "codigo": "90051000",
   "descricao_completa": "Binóculos, lunetas, incluindo as astronômicas, telescópios ópticos, e suas armações, outros instrumentos de astronomia e suas armações, exceto os aparelhos de radioastronomia. Binóculos",
   "capitulo": "90",
   "posicao": "05",
   "subposicao1": "1",
   "subposicao2": "0",
   "item1": "0",
   "item2": "0"
 },
 {
   "codigo": "90058000",
   "descricao_completa": "Binóculos, lunetas, incluindo as astronômicas, telescópios ópticos, e suas armações, outros instrumentos de astronomia e suas armações, exceto os aparelhos de radioastronomia. Outros instrumentos",
   "capitulo": "90",
   "posicao": "05",
   "subposicao1": "8",
   "subposicao2": "0",
   "item1": "0",
   "item2": "0"
 },
 {
   "codigo": "90059010",
   "descricao_completa": "Binóculos, lunetas, incluindo as astronômicas, telescópios ópticos, e suas armações, outros instrumentos de astronomia e suas armações, exceto os aparelhos de radioastronomia. Partes e acessórios (incluindo as armações) De binóculos",
   "capitulo": "90",
   "posicao": "05",
   "subposicao1": "9",
   "subposicao2": "0",
   "item1": "1",
   "item2": "0"
 }
]
```

Para consultar os NCMs disponíveis, utilize o endereço abaixo:

`https://homologacao.focusnfe.com.br/v2/ncms`


Utilize o método HTTP **GET**. São aceitos os seguintes parâmetros de pesquisa:

* **codigo**: Pesquise **pela parte inicial** do código NCM
* **descricao**: Pesquisa por parte da descrição do código NCM.
* **capitulo**,**posicao**,**subposicao1**,**subposicao2**,**item1** e **item2**: Pesquisa exata informando qualquer uma das partes do código NCM.

Caso já saiba o código NCM exato, e queira apenas recuperar sua descrição, utilize o link
abaixo, substituindo CODIGO_NCM pelo código.

`https://homologacao.focusnfe.com.br/v2/ncms/CODIGO_NCM`


## Paginação

Ao fazer uma pesquisa, a API irá devolver o cabeçalho HTTP *X-Total-Count* que representa
o número total de ocorrências da pesquisa, porém a API devolve apenas 50 registros por vez.
Para buscar os demais registros, utilize o parâmetro **offset**. Exemplo:

Vamos supor que a chamada abaixo devolva 123 ocorrências:

`https://homologacao.focusnfe.com.br/v2/ncms?codigo=7022`

A segunda e terceira páginas da consulta poderão ser acessados desta forma:

Registros 51 a 100:
`https://homologacao.focusnfe.com.br/v2/ncms?codigo=7022&offset=50`

Registros 101 a 123:
`https://homologacao.focusnfe.com.br/v2/ncms?codigo=7022&offset=100`
