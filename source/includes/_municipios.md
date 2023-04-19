# Consulta de Municípios (beta)

Utilizamos a base de municípios do IBGE para identificar os municípios em nossa API. Desta forma disponibilizamos uma API para busca dos municípios cadastrados, seja para localizá-los pelo nome, para recuperar o código do município, verificar se o município tem a NFSe implementada em nosso sistema ou demais especificidades de cada município.
Ainda, é possível verificar se determinado município apresenta a necessidade de informar o código tributário do município e/ou item da lista de serviço para emissão de uma nota fiscal de serviço. Com isso, é possível verificar os valores que esses campos devem receber através de uma consulta relacionada ao próprio município.


```shell
# pesquisa por todos os municípios do PR
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/municipios?sigla_uf=PR

# pesquisa pelos itens da lista de serviço que contém a descrição "informática" por um município onde esse campo seja obrigatório.
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/municipios/4307807/itens_lista_servico?descricao=informatica
```

```php
<?php
$ch = curl_init();
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/municipios?sigla_uf=PR");
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

        String url = server.concat("v2/municipios?sigla_uf=PR");

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
url_envio = servidor_homologacao + "v2/municipios?sigla_uf=PR"

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
url = "https://homologacao.focusnfe.com.br/v2/municipios?sigla_uf=PR"

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
var url = "https://homologacao.focusnfe.com.br/v2/municipios?sigla_uf=PR";

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

Disponibilizamos os seguintes métodos de consulta:

Método | URL (recurso) | Ação
-------|-------|-----
GET | /v2/municipios  | Busca todos os municípios ou filtra-os de acordo com parâmetros
GET | /v2/municipios/CODIGO_MUNICIPIO | Busca um município único pelo seu código
GET | /v2/municipios/CODIGO_MUNICIPIO/itens_lista_servico | Busca todos os itens da lista de serviço de acordo com o município ou filtra-os de acordo com parâmetros
GET | /v2/municipios/CODIGO_MUNICIPIO/itens_lista_servico/CODIGO  | Busca um item da lista de serviço único pelo seu código de acordo com o município
GET | /v2/municipios/CODIGO_MUNICIPIO/codigos_tributarios_municipio | Busca todos os códigos tributários municípais de acordo com o município ou filtra-os de acordo com parâmetros
GET | /v2/municipios/CODIGO_MUNICIPIO/codigos_tributarios_municipio/CODIGO  | Busca um código tributário municipal único pelo seu código de acordo com o município

Os parâmetros disponíveis para consulta dos municípios são atualmente os seguintes:

* sigla_uf: Busca pela sigla do estado, ex: PR
* nome_municipio: Busca pelo nome exato do município. Ex: Curitiba irá devolver apenas um registro
* nome: Busca por parte do nome do município. Ex: Curitiba irá devolver os municípios "Curitiba" e "Curitibanos"

Caso já saiba o código exato do município, você pode efetuar a busca diretamente em:

* /v2/municipios/CODIGO_MUNICIPIO


Os parâmetros disponíveis para consulta dos itens da lista de serviço e códigos tributários municipais de acordo com o município são atualmente os seguintes:

* codigo: Busca pela código, ex: "14.01". Busca pelo trecho de codigo. ex: "14."
* descricao: Busca pelo trecho da descrição. Ex: "Aula"

Caso já saiba o código exato do item da lista de serviço ou do código tributário municipal, você pode efetuar a busca diretamente em:

* /v2/municipios/CODIGO_MUNICIPIO/itens_lista_servico/CODIGO
* /v2/municipios/CODIGO_MUNICIPIO/codigos_tributarios_municipio/CODIGO


## Resposta da API

> Exemplo de dados de resposta da consulta aos municípios

```json
[
  {
    "codigo_municipio": "4204806",
    "nome_municipio": "Curitibanos",
    "sigla_uf": "SC",
    "nome_uf": "Santa Catarina",
    "nfse_habilitada": false
  },
  {
    "codigo_municipio": "4106902",
    "nome_municipio": "Curitiba",
    "sigla_uf": "PR",
    "nome_uf": "Paraná",
    "nfse_habilitada": true,
    "requer_certificado_nfse": true,
    "possui_ambiente_homologacao_nfse": true,
    "possui_cancelamento_nfse": true,
    "provedor_nfse": "Tecnos",
    "endereco_obrigatorio_nfse": null,
    "cpf_cnpj_obrigatorio_nfse": null,
    "codigo_cnae_obrigatorio_nfse": true,
    "item_lista_servico_obrigatorio_nfse": false,
    "codigo_tributario_municipio_obrigatorio_nfse": false
  }
]
```

> Exemplo de dados de resposta da consulta aos itens da lista de serviço de um determinado município

```json
[
  {
    "codigo": "1.06",
    "descricao": "Assessoria e consultoria em informática.",
    "tax_rate": null
  },
  {
    "codigo": "1.07",
    "descricao": "Suporte técnico em informática, inclusive instalação, configuração e manutenção de programas de computação e bancos de dados.",
    "tax_rate": null
  }
]
```


Para cada consulta à nossa API de municípios a resposta trará um ou mais objetos JSON, com os campos como neste exemplo ao lado. Abaixo, a descrição de cada um dos campos:

* **codigo_municipio**: Representa o código do município frente ao IBGE
* **nome_municipio**: Nome completo do município segundo o IBGE. Podem haver pequenas diferenças de outras bases, como a dos Correios.
* **sigla_uf**: Sigla do estado do município
* **nome_uf**: Nome completo do estado onde se encontra o município
* **nfse_habilitada**: Verdadeiro se já implementamos a NFSe para este município, e falso caso contrário
* **requer_certificado_nfse**: Se a NFSe para este município está implementada, este campo irá indicar se o município precisa de um certificado digital para emissão deste documento. Caso contrário, alguma combinação de token e/ou usuário e senha deverá ser usado.
* **possui_ambiente_homologacao_nfse**: Se a NFSe para este município está implementada, este campo irá indicar se existe ambiente de homologação neste município
* **possui_cancelamento_nfse**: Se a NFSe para este município está implementada, este campo irá indicar se é possível o cancelamento de NFSe via API neste município. Caso contrário pode ser possível o cancelamento pela própria interface da prefeitura
* **provedor_nfse**: Se a NFSe para este município está implementada, este campo irá indicar o nome do provedor do município.
* **endereco_obrigatorio_nfse**: Se a NFSe para este município está implementada, esse campo irá indicar se o município precisa informar o endereço para emissão deste documento. O valor 'true' indica a obrigatoriedade, o valor 'false' indica a não obrigatoriedade e o valor 'null' indica a ausência dessa informação no sistema.
* **cpf_cnpj_obrigatorio_nfse**: Se a NFSe para este município está implementada, esse campo irá indicar se o município precisa informar o cpf/cnpj para emissão deste documento. O valor 'true' indica a obrigatoriedade, o valor 'false' indica a não obrigatoriedade e o valor 'null' indica a ausência dessa informação no sistema.
* **codigo_cnae_obrigatorio_nfse**: Se a NFSe para este município está implementada, esse campo irá indicar se o município precisa informar o código cnae para emissão deste documento. O valor 'true' indica a obrigatoriedade, o valor 'false' indica a não obrigatoriedade e o valor 'null' indica a ausência dessa informação no sistema.
* **item_lista_servico_obrigatorio_nfse**: Se a NFSe para este município está implementada, esse campo irá indicar se o município precisa informar o item da lista de serviço para emissão deste documento. Caso seu valor seja 'true', a busca pelos possíveis valores pode ser feita como exemplificada anteriormente.  O valor 'true' indica a obrigatoriedade, o valor 'false' indica a não obrigatoriedade e o valor 'null' indica a ausência dessa informação no sistema.
* **codigo_tributario_municipio_obrigatorio_nfse**: Se a NFSe para este município está implementada, esse campo irá indicar se o município precisa informar o código tributário do município para emissão deste documento. Caso seu valor seja 'true', a busca pelos possíveis valores pode ser feita como exemplificada anteriormente.  O valor 'true' indica a obrigatoriedade, o valor 'false' indica a não obrigatoriedade e o valor 'null' indica a ausência dessa informação no sistema.

Considere que novos campos poderão ser adicionados nesta API.

## Paginação

Ao fazer uma pesquisa, a API irá devolver o cabeçalho HTTP *X-Total-Count* que representa
o número total de ocorrências da pesquisa, porém a API devolve apenas 100 registros por vez.
Para buscar os demais registros, utilize o parâmetro **offset**. Exemplo:

Vamos supor que a chamada abaixo devolva 223 ocorrências:

`https://homologacao.focusnfe.com.br/v2/municipios?sigla_uf=PR`

A segunda e terceira páginas da consulta poderão ser acessados desta forma:

Registros 101 a 200:
`https://homologacao.focusnfe.com.br/v2/municipios?sigla_uf=PR&offset=100

Registros 201 a 223:
`https://homologacao.focusnfe.com.br/v2/municipios?sigla_uf=PR&offset=200
