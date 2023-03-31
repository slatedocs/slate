# Consulta de CEP (beta)

O Código de Endereçamento Postal - CEP - é um código utilizado pelo Correrios para fins de encaminhamento, tratamento e distribuição de postagens. O código, formado por oito digitos numéricos, é dividio em duas partes:

a) a primeira é composta por 5 (cinco) dígitos que representam Região, Sub-região, Setor, Subsetor e Divisor de Subsetor;

b) a segunda é composta por 3 (três) dígitos, separada por um traço da primeira, que representa os Identificadores de Distribuição.

Os 8 dígitos do CEP seguem o seguinte formato:

RSRSSSD-PREFIXO, sendo:

* R = Regisão
* RS = Sub-Região
* S  = Setor
* SS  = Sub-setor
* D = Divisor
* PREFIXO = 3 dígitos que identificam localidades, logradouros e outros
<sub>fonte:https://www.correios.com.br/a-a-z/cep-codigo-de-enderecamento-postal</sub>


Nós disponibilizamos uma API para consultar uma descrição detalhada das informações do CEP.

```shell
# pesquisa por CFOPs que iniciam com o dígito 2
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/ceps?uf=AC&logradouro=colinas
```

```php
<?php
$ch = curl_init();
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/ceps?uf=AC&logradouro=colinas");
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

        String url = server.concat("v2/ceps?uf=AC&logradouro=colinas");

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
url_envio = servidor_homologacao + "v2/ceps?uf=AC&logradouro=colinas"

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
url = "https://homologacao.focusnfe.com.br/v2/ceps?uf=AC&logradouro=colinas"

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
var url = "https://homologacao.focusnfe.com.br/v2/ceps?uf=AC&logradouro=colinas";

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

Para realizar uma consulta de CEP, utilize o endereço abaixo:

`https://homologacao.focusnfe.com.br/v2/ceps`


Utilize o método HTTP **GET**. São aceitos os seguintes parâmetros de pesquisa:

* **codigo_ibge**: Pesquisa pelo CEP referente a uma localidade, conforme o código IBGE do município
* **uf**: Pesquisa utilizando os dois caractêres referente a Unidade da Federação. Ex: 'PR', para o Estado do Paraná.
* **logradouro**: Pesquisa pelo logradouro completo ou por parte dele. Mínimo de 3 caracteres.
* **localidade**: Pesquisa pelo nome completo da localidade ou por parte dele.

É necessário informar ao menos _dois_ parâmetros para consulta.

No caso especial de Municípios que possuem um único CEP (não dividido em logradouros), é possível realizar a consulta informando apenas o `codigo_ibge` como parâmetro.

Caso já saiba o CEP exato, e queira apenas recuperar sua descrição, utilize o link
abaixo, substituindo CODIGO_CEP pelo código.

`https://api.focusnfe.com.br/v2/ceps/CODIGO_CEP`


## Resposta da API

> Dados de resposta da consulta

```json
[
  {
    "cep": "69909032",
    "tipo": "logradouro",
    "nome": "",
    "uf": "AC",
    "nome_localidade": "Rio Branco",
    "codigo_ibge": "1200401",
    "tipo_logradouro": "Rua",
    "nome_logradouro": "Colinas",
    "nome_bairro_inicial": "Rosa Linda",
    "descricao": "Rua Colinas, Rio Branco, AC"
  }
]
```

Para cada consulta à nossa API de CEP a resposta trará um ou mais objetos JSON, com os campos como neste exemplo ao lado. Abaixo, a descrição de cada um dos campos:

* **cep**: Código CEP, conforme base dos Correios.
* **tipo**: Informa qual o tipo do CEP, que pode ser:
  * localidade - se refere a um município, povoado ou distrito.
  * logradouro - são localizações em vias de tráfego de áreas urbanas ou rurais
  * unidade_operacional - designa uma unidade do Correios que possue CEP próprio
  * grande_usuario -  é utilizado para instituições, privadas ou públicas, que são referência pelo seu tamanho ou importância no local, tendo CEP próprio
* **nome**: Para CEPs do tipo "unidade_operacional" ou "grande_usuario", o campo retorna o nome dos estabelecimentos.
* **uf**: A sigla do Estado (Unidade da Federação) a qual pertence a localização do CEP.
* **nome_localidade**: O nome do local, seja ele uma localidade, unidade operacional ou grande usuário.
* **codigo_município**: Código de identificação utilizado pelo IBGE, caso a localidade seja um município.
* **tipo_logradouro**: Informa o tipo do logradouro. Exs: 'Rua', 'Avenida', 'Viela', etc.
* **nome_logradouro**: Nome do logradouro correspondente à consulta.
* **bairro**: Nome do bairro onde inicia o CEP retornado na consulta.
* **descricao**: Junção dos valores retornados nos campos 'tipo_logradouro', 'nome_logradouro', 'nome_localidade' e 'uf'.
