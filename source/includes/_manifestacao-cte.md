# Manifestação - CTe

Da mesma forma que a manifestação de NFe, a API para manifestação de CTe do sistema Focus permite que você consulte todos os conhecimentos de transporte recebidos pela sua empresa e permite que você realize a manifestação frente a receita. No caso da CTe, é necessário realizar a manifestação apenas se houver algum desacordo com a CTe emitida. A API faz ainda a guarda de todos os documentos recebidos para que você consulte quando precisar e recupera todas as MDFes associadas a CTe.

Através desta documentação deverá ser possível fazer a integração com a API do Focus NFe, caso alguma dúvida permaneça você pode entrar em contato com o suporte especializado através do e-mail suporte@focusnfe.com.br.

## URLs


Método | URL (recurso) | Ação
-------|---------------|------
GET|/v2/ctes_recebidas?cnpj=CNPJ|Busca os dados resumidos de todas as CTes recebidas.
POST|/v2/ctes_recebidas/CHAVE/desacordo|Informa um desacordo na CTe recebida
GET|/v2/ctes_recebidas/CHAVE/desacordo|Consulta o último desacordo válido para o CTe informado
GET|/v2/ctes_recebidas/CHAVE.json|Consulta a informações da CTe em formato JSON.
GET|/v2/ctes_recebidas/CHAVE.xml|Consulta as informações da CTe em formato XML.
GET|/v2/ctes_recebidas/CHAVE/cancelamento.xml|Se existir, baixa o XML de cancelamento da CTe informada.
GET|/v2/ctes_recebidas/CHAVE/carta_correcao.xml|Se existir, baixa o XML da última carta de correção da CTe informada.

## Status API

Aqui você encontra os status possíveis para MDe.

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
400 - bad request | requisicao_invalida | Desacordo já registrado para este Documento Fiscal | Não é possível informar o desacordo mais de uma vez
400 - bad request | requisicao_invalida | Parâmetro "observacoes" não informado | Ao informar um desacordo é necessário informar o campo "observacoes" informando o motivo do desacordo
400 - bad request | requisicao_invalida | Parâmetro "observacoes" deve ter entre 15 e 255 caracteres | Informe o número de caracteres correto para este campo
400 - bad request | requisicao_invalida | CNPJ do emitente não autorizado ou não informado. | Verifique no Painel API se esse emitente está habilitado para realizar a manifestação. Verifique se o CNPJ foi informado no JSON de envio.
400 - bad request | requisicao_invalida | CNPJ/UF do emitente não autorizado ou não informado. | Verifique no Painel API se esse emitente está habilitado para realizar MDe. Verifique se o CNPJ foi informado no JSON de envio.
404 - not found | nao_encontrado | Documento Fiscal não encontrado | Verifique se a chave está correta
403 - forbidden | permissao_negada | CNPJ do emitente não autorizado. | O emitente utilizado não está autorizado a realizar a manifestação ou foi informado o CNPJ do emitente incorretamente no JSON.

## Informar desacordo

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/"

token="token obtido no cadastro da empresa"

chave = "chave_da_nota_fiscal"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
manifesto = {}
manifesto["observacoes"] = "Observações referente ao desacordo informado"

r = requests.post(url+chave+"/desacordo", data=json.dumps(manifesto), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```



```shell

# substitua CHAVE pela chave da nota
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"observacoes":"Observações referente ao desacordo informado"}' \
  https://homologacao.focusnfe.com.br/v2/ctes_recebidas/CHAVE/desacordo
```

```java
import java.util.HashMap;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class Manifestar {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";
    String chave = "Chave_de_identificação_da_NFe";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";
    String url = server.concat("v2/ctes_recebidas/"+chave+"/desacordo");

    /* Aqui criamos um hashmap para receber a chave "tipo" e o valor que pode ser: ciencia, confirmacao, desconhecimento ou nao_realizada. */
    HashMap<String, String> tipoManifestacao = new HashMap<String, String>();
    tipoManifestacao.put("observacoes", "Observações referente ao desacordo informado");

    /* Criamos um objeto JSON para receber a hash com os dados esperado pela API. */
    JSONObject json = new JSONObject(TipoManifestacao);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request =  client.resource(url);
    ClientResponse resposta = request.post(ClientResponse.class, json);
    int httpCode = resposta.getStatus();
    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
    System.out.printf(body);
  }
}
```

```ruby

# encoding: UTF-8

require "net/http"
require "net/https"
require "json"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

chave = "chave_de_identificacao_da_NFe"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/ctes_recebidas/" + chave + "/desacordo"

# altere os campos conforme a nota que será enviada
tipo_manifestacao = {
  observacoes: "Observações referente ao desacordo informado",
}

# criamos uma objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos a hash de justificativa do cancelamento para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = tipo_manifestacao.to_json

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

```php
<?php
// Solicite o seu token para realizar as requisições com nossa equipe de suporte.
 $login = "Token_obtido_no_cadastro_da_empresa";
 $chave = "Chave_de_identificação_da_NFe";
/* Aqui enviamos o tipo de manifestação que desejamos realizar.
   Consulte nossa documentação, para conhecer os demais tipos possíveis: https://goo.gl/a9o7hm */
 $tipo = array("observacoes" => "Observações referente ao desacordo informado");
// Para ambiente de Produção, utilize a URL: https://api.focusnfe.com.br/.
 $server = "https://homologacao.focusnfe.com.br/";
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."v2/ctes_recebidas/".$chave."/desacordo");
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_POST, 1);
 curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($tipo));

/* Métodos para realizar a autenticação básica do HTTP.
   Não é necessário informar campo senha, apenas o campo login. */
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login");
 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// Mostra na tela o HTTP Code da sua requisição.
 print($http_code);
// Mostra na tela a mensagem de retorno da API.
 print($body);
 curl_close($ch);
?>
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

var chave = "chave_da_nota_fiscal";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/" + chave + "/desacordo";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var manifesto = {

  "observacoes": "Observações referente ao desacordo informado"
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(manifesto));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```


> Exemplo de dados enviados

```json
{
  "observacoes":"Observações referente ao desacordo informado"
}
```

No momento é possível informar apenas o desacordo da operações de conhecimento de transporte. É obrigatório informar o campo "observacoes" contendo os detalhes que motivaram o desacordo.

Para informar o desacordo, utilize a URL:

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE/desacordo`

Utilize o método **HTTP POST** para enviar os parâmetros à API.

Na URL, informe em **CHAVE** a chave da CTe recebida. No corpo da requisição, informe objeto JSON com os seguintes parâmetros:

* **observacoes**: detalhes que motivaram o desacordo (mínimo de 15 caracteres e máximo de 255).

> Exemplo de dados de resposta:

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a CT-e",
  "status": "evento_registrado",
  "protocolo": "891170005150285",
}
```

**Dados devolvidos**

A API irá devolver um objeto JSON com os seguintes parâmetros:

* **status_sefaz**:Código de status da SEFAZ.
* **mensagem_sefaz**: Mensagem da SEFAZ.
* **status**: erro se não foi possível fazer a manifestação (consulte a mensagem de erro em mensagem_sefaz) ou evento_registrado se a manifestação foi registrada com sucesso à NFe.
* **protocolo**: Protocolo do recebimento na SEFAZ.


Caso queria consultar o desacordo realizado, utilize o seguinte endereço:

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE/manifesto`

Utilize o método **HTTP GET** para consultar os dados da nota fiscal.

Na URL, informe em **CHAVE** a chave da CTe recebida. O retorno será o mesmo que a operação de manifestação.

**OBS**: Conforme definido pela SEFAZ na NT 2022.001 do CT-e, se o tomador/destinatário for pessoa física (CPF cadastrado em nossa API para a manifestação do CT-e) não pode registrar o evento de desacordo desse tipo de documento via webservice. Essa ação deve ser realizada exclusivamente através da plataforma gov.br conforme procedimento a seguir:

* Acessar o site: https://dfe-portal.svrs.rs.gov.br/CTE/PrestacaoServicoDesacordo
* Selecionar a segunda opção: Login pela Plataforma gov.br (Tomador Pessoa Física)
* Realizar o login na plataforma gov.br com o certificado digital do tomador/destinatário ou com o CPF e senha de seu cadastrado nesta plataforma.
* Inserir a chave do CT-e que desejar manifestar o desacordo, e também o motivo, em seus respectivos campos.
* Registar o desacordo.
Ao final do processo receberá uma mensagem informando o sucesso do registro.

> Exemplo de como consultar o desacordo de uma CTe

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/"

token="token obtido no cadastro da empresa"

chave = "chave_da_nota_fiscal"

r = requests.get(url+chave+"/desacordo", auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```


```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class ConsultarUltimaManifestacao {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";
    String chave = "Chave_de_identificação_da_NFe";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";
    String url = server.concat("v2/ctes_recebidas/"+chave+"/desacordo");

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request =  client.resource(url);
    ClientResponse resposta = request.get(ClientResponse.class);
    int httpCode = resposta.getStatus();
    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
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

chave = "chave_de_identificacao_da_NFe"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/ctes_recebidas/" + chave + "/desacordo"

# criamos uma objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
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

```php
<?php
// Solicite o seu token para realizar as requisições com nossa equipe de suporte.
 $login = "Token_obtido_no_cadastro_da_empresa";
 $chave = "Chave_de_identificação_da_NFe";
// Para ambiente de Produção, utilize a URL: https://api.focusnfe.com.br/.
 $server = "https://homologacao.focusnfe.com.br/";

 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."v2/ctes_recebidas/".$chave."/desacordo");
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_HTTPHEADER, array());
/* Métodos para realizar a autenticação básica do HTTP.
   Não é necessário informar campo senha, apenas o campo login. */
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login");
 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// Mostra na tela o HTTP Code da sua requisição.
 print($http_code);
// Mostra na tela a mensagem de retorno da API.
 print($body);
 curl_close($ch);
?>
```

## Consulta de CTe Recebidas

Uma CTe recebida pode ter suas informações atualizadas ao longo do tempo. Quando a receita informa que uma CTe foi emitida contra a empresa, recebemos o XML completa desta CTe e a receita poderá posteriormente notificar quando a CTe recebe uma carta de correção ou quando ela é cancelada.

As CTes recebidas possuem um campo chamado “**versao**” que é único entre todos os documentos do mesmo CNPJ e que é atualizado a cada alteração nesta CTe. Isto facilita a busca apenas dos documentos que seu sistema ainda não conhece, sendo necessário que você armazene apenas um número por CNPJ.

Por exemplo, se você recebe uma CTe com versao = 60, e ela posteriormente receber uma carta de correção ou for cancelada, sua versão será atualizada para algum número maior que 60.

A API busca as últimas atualizações da SEFAZ a cada duas horas.

**Método de consulta**

> Exemplo de como consultar todas as notas recebidas de uma empresa.

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas?cnpj="

token="token obtido no cadastro da empresa"

cnpj = "cnpj_do_destinatario_da_nota"

r = requests.get(url+cnpj, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```


```shell
curl -u "token obtido no cadastro da empresa:" \
  "https://homologacao.focusnfe.com.br/v2/ctes_recebidas?cnpj=SEU_CNPJ"
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class ConsultarTodosManifestos {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";
    String cnpj = "CNPJ_da_sua_empresa";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";
    String url = server.concat("v2/ctes_recebidas?cnpj="+cnpj);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request =  client.resource(url);
    ClientResponse resposta = request.get(ClientResponse.class);
    int httpCode = resposta.getStatus();
    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
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

cnpj = "CNPJ_da_sua_empresa"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/ctes_recebidas?cnpj=" + cnpj

# criamos uma objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
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

```php
<?php
// Solicite o seu token para realizar as requisições com nossa equipe de suporte.
 $login = "Token_obtido_no_cadastro_da_empresa";
 $cnpj = "CNPJ_da_sua_empresa";
// Para ambiente de Produção, utilize a URL: https://api.focusnfe.com.br/.
 $server = "https://homologacao.focusnfe.com.br/";

 $ch = curl_init();
   curl_setopt($ch, CURLOPT_URL, $server."v2/ctes_recebidas?cnpj=".$cnpj);
   curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
   curl_setopt($ch, CURLOPT_HTTPHEADER, array());
/* Métodos para realizar a autenticação básica do HTTP.
   Não é necessário informar campo senha, apenas o campo login. */
   curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
   curl_setopt($ch, CURLOPT_USERPWD, "$login");

 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// Mostra na tela o HTTP Code da sua requisição.
   print($http_code);
// Mostra na tela a mensagem de retorno da API.
   print($body);
   curl_close($ch);
?>
```

```javascript

/*
A orientacao a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

var cnpj = "cnpj_do_destinatario_da_nota";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas?cnpj=" + cnpj;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

Para consultar os documentos fiscais recebidos, utilize o endereço abaixo:

`https://api.focusnfe.com.br/v2/ctes_recebidas?cnpj=CNPJ`

Utilize o método **HTTP GET** para consultar as notas. Esta requisição aceita os seguintes parâmetros que deverão ser enviados na URL:

* **cnpj**(*): CNPJ da empresa. Campo obrigatório.
* **versao**: Se informado, irá buscar apenas os documentos cuja versão seja maior que o parâmetro recebido. Utilize este parâmetro para buscar apenas as notas que seu sistema ainda não conhece.

Serão devolvidas as 100 primeiras notas encontradas. Para recuperar as demais notas você deverá fazer uma nova requisição alterando o campo versão.

> Exemplo dos dados de resposta:

```json
[
  {
    "nome_emitente": "Empresa emitente Ltda.",
    "documento_emitente": "79160190000193",
    "chave":"35191008165642000152570020004201831004201839",
    "valor_total":"295.66",
    "data_emissao":"2019-10-07T23:44:00-03:00",
    "situacao":"autorizado",
    "tipo_cte":"0",
    "versao":1709,
    "digest_value":"Xa/AO4zX/qSMh13ILIh1V7GTAQ3=",
    "cnpj_destinatario":"24178617000110"
  }
]
```

**Dados devolvidos**

A API irá devolver os seguintes cabeçalhos HTTP:

* **X-Total-Count**: O número total de registros (incluindo aqueles que não foram devolvidos pelo limite de 100 registros)
* **X-Max-Version**: Valor máximo da versão dos documentos devolvidos. Utilize este cabeçalho para utilizar na próxima busca de versão, caso seja necessário.

Os dados devolvidos no corpo da requisição serão um array de objetos em JSON no seguinte formato:

* **nome_emitente**: Nome do emitente do documento fiscal.
* **documento_emitente**: CNPJ ou CPF do emitente do documento fiscal.
* **cnpj_destinatario**: CNPJ do destinatário do documento (o CNPJ de sua empresa).
* **chave**: Chave do documento fiscal.
* **valor_total**: Valor total da NFe.
* **data_emissao**: Data de emissão da NFe.
* **situacao**: Situação do documento. Pode ser: autorizada, cancelada ou denegada.
- **tipo_cte**:
  - **0**: CT-e normal;
  - **1**: CT-e de complementação de valores;
  - **2**: CT-e de anulação;
  - **3**: CT-e substituto.
* **versao**: Versão do documento fiscal. Este número irá mudar apenas se o documento for alterado de alguma forma.
* **digest_value**: Valor do resumo digital do XML do documento.
* **carta_correcao**: Conteúdo da carta de correção, se houver.
* **data_carta_correcao**: Data da carta de correção, se houver.
* **data_cancelamento**: Data do cancelamento, se o documento estiver cancelado.
* **justificativa_cancelamento**: Justificativa do cancelamento, se o documento estiver cancelado.

## Consulta de CTe individuais


Disponibilizamos diversos métodos para obter mais informações de um documento recebido conforme mostramos a seguir:

**Pesquisa de um documento por chave**

Para pesquisar as informações específicas de uma CTe, consulte:

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE`

Utilize o método **HTTP GET** para consultar os dados da nota fiscal.

Isto irá devolver os mesmos campos descritos no item 2.2. Quando você tiver muitas empresas cadastradas, pode desambiguar o documento informando o parâmetro **cnpj=CNPJ**, da seguinte forma:

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE?cnpj=CNPJ`

Isto irá devolver os mesmos campos descritos no item 2.2. Você pode solicitar também os dados completos do documento informando o parâmetro **completa=1**, da seguinte forma:

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE?completa=1`

Utilize o método **HTTP GET** para consultar os dados da nota fiscal.

Isto irá adicionar os seguintes campos:

* **mdfes**: Lista de todas as MDFes associadas a CTe, se aplicável.
* **requisicao**: Dados completos do documento em formato JSON.
* **protocolo**: Dados completos do retorno do SEFAZ em formato JSON.

## Download de DACTe e XML

> Exemplo de como realizar o download do XML de um documento específico.


```javascript
/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

var chave = "chave_da_nota_fiscal";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/" + chave + ".xml";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```


```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/"

token="token obtido no cadastro da empresa"

chave = "chave_da_nota_fiscal"

r = requests.get(url+chave+".xml", auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/ctes_recebidas/CHAVE.xml
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class DownloadNotaEspecificaXml {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";
    String chave = "Chave_de_identificação_da_NFe";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";
    String url = server.concat("v2/ctes_recebidas/"+chave+".xml");

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request =  client.resource(url);
    ClientResponse resposta = request.get(ClientResponse.class);
    int httpCode = resposta.getStatus();
    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
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

chave = "chave_de_identificacao_da_NFe"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/ctes_recebidas/" + chave + ".xml"

# criamos uma objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
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

```php
<?php
// Solicite o seu token para realizar as requisições com nossa equipe de suporte.
 $login = "Token_obtido_no_cadastro_da_empresa";
 $chave = "Chave_de_identificação_da_NFe";
// Para ambiente de Produção, utilize a URL: https://api.focusnfe.com.br/.
 $server = "https://homologacao.focusnfe.com.br/";
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."v2/ctes_recebidas/".$chave.".xml");
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_HTTPHEADER, array());
/* Métodos para realizar a autenticação básica do HTTP.
   Não é necessário informar campo senha, apenas o campo login. */
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login");
 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// Mostra na tela o HTTP Code da sua requisição.
 print($http_code);
// Converte os dados de XML para objeto, mostrando o retorno bruto.
 var_dump(simplexml_load_string($body));
 curl_close($ch);
?>
```

> Exemplo de como fazer o download, no formato JSON, do XML de uma Nota Fiscal Eletrônica especifica.


```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

var chave = "chave_da_nota_fiscal";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/" + chave + ".json?completa=1";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```


```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/"

token="token obtido no cadastro da empresa"

chave = "chave_da_nota_fiscal"

r = requests.get(url+chave+".json?completa=1", auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)l

```



```shell
curl -u "token obtido no cadastro da empresa:" \
  "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/CHAVE.json?completa=1"
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class DownloadNotaEspecifica {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";
    String chave = "Chave_de_identificação_da_NFe";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";
    String url = server.concat("v2/ctes_recebidas/"+chave+".json?completa=1");

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request =  client.resource(url);
    ClientResponse resposta = request.get(ClientResponse.class);
    int httpCode = resposta.getStatus();
    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
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

chave = "chave_de_identificacao_da_NFe"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/ctes_recebidas/" + chave + ".json?completa=1"

# criamos uma objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
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

```php
<?php
// Solicite o seu token para realizar as requisições com nossa equipe de suporte.
 $login = "Token_obtido_no_cadastro_da_empresa";
 $chave = "Chave_de_identificação_da_NFe";
// Para ambiente de Produção, utilize a URL: https://api.focusnfe.com.br/.
 $server = "https://homologacao.focusnfe.com.br/";
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."v2/ctes_recebidas/".$chave.".json?completa=1");
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_HTTPHEADER, array());
/* Métodos para realizar a autenticação básica do HTTP.
   Não é necessário informar campo senha, apenas o campo login. */
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login");
 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// Mostra na tela o HTTP Code da sua requisição.
 print($http_code);
// Mostra na tela a mensagem de retorno da API.
 print($body);
 curl_close($ch);
?>
```

> Exemplo de como fazer o download do XML de cancelamento de um documento

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

var chave = "chave_da_nota_fiscal";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/" + chave + "/cancelamento.xml";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```



```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/"

token="token obtido no cadastro da empresa"

chave = "chave_da_nota_fiscal"

r = requests.get(url+chave+"/cancelamento.xml", auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/ctes_recebidas/CHAVE/cancelamento.xml
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class DownloadCancelamentoXml {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";
    String chave = "Chave_de_identificação_da_NFe";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";
    String url = server.concat("v2/ctes_recebidas/"+chave+"/cancelamento.xml");

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request =  client.resource(url);
    ClientResponse resposta = request.get(ClientResponse.class);
    int httpCode = resposta.getStatus();
    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
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

chave = "chave_de_identificacao_da_NFe"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/ctes_recebidas/" + chave + "/cancelamento.xml"

# criamos uma objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
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

```php
<?php
// Solicite o seu token para realizar as requisições com nossa equipe de suporte.
 $login = "Token_obtido_no_cadastro_da_empresa";
 $chave = "Chave_de_identificação_da_NFe";
// Para ambiente de Produção, utilize a URL: https://api.focusnfe.com.br/.
 $server = "https://homologacao.focusnfe.com.br/";
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."v2/ctes_recebidas/".$chave."/cancelamento.xml");
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_HTTPHEADER, array());
/* Métodos para realizar a autenticação básica do HTTP.
   Não é necessário informar campo senha, apenas o campo login. */
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login");
 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// Mostra na tela o HTTP Code da sua requisição.
 print($http_code);
// Converte os dados de XML para objeto, mostrando o retorno bruto.
 var_dump(simplexml_load_string($body));
 curl_close($ch);
?>
```

> Exemplo de como realizar o download do XML de um documento específico com Carta de Correção Eletrônica.

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

var chave = "chave_da_nota_fiscal";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/" + chave + "/carta_correcao.xml";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/ctes_recebidas/"

token="token obtido no cadastro da empresa"

chave = "chave_da_nota_fiscal"

r = requests.get(url+chave+"/carta_correcao.xml", auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```


```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/ctes_recebidas/CHAVE/carta_correcao.xml
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class DownloadXmlCce {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";
    String chave = "Chave_de_identificação_da_NFe";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";
    String url = server.concat("v2/ctes_recebidas/"+chave+"/carta_correcao.xml");

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request =  client.resource(url);
    ClientResponse resposta = request.get(ClientResponse.class);
    int httpCode = resposta.getStatus();
    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
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

chave = "chave_de_identificacao_da_NFe"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/ctes_recebidas/" + chave + "/carta_correcao.xml"

# criamos uma objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
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

```php
<?php
// Solicite o seu token para realizar as requisições com nossa equipe de suporte.
 $login = "Token_obtido_no_cadastro_da_empresa";
 $chave = "Chave_de_identificação_da_NFe";
// Para ambiente de Produção, utilize a URL: https://api.focusnfe.com.br/.
 $server = "https://homologacao.focusnfe.com.br/";
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."v2/ctes_recebidas/".$chave."/carta_correcao.xml");
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_HTTPHEADER, array());
// Métodos para realizar a autenticação básica do HTTP.
// Não é necessário informar campo senha, apenas o campo login.
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login");
 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// Mostra na tela o HTTP Code da sua requisição.
 print($http_code);
// Converte os dados de XML para objeto, mostrando o retorno bruto.
 var_dump(simplexml_load_string($body));

   curl_close($ch);
?>
```

Também é possível fazer o download do XML e do DACTe das notas fiscais através da API, basta informar a chave de identificação da respectiva nota no parâmetro CHAVE:

**Baixar o XML de um CTe especifico:**

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE.xml`

Utilize o método **HTTP GET** para obter os dados no formato XML.

**Baixar o DACTe de um CTe especifico:**

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE.pdf`

Utilize o método **HTTP GET** para obter os dados no formato PDF. Esta requisição irá redirecionar para o endereço onde é salvo o PDF. Caso a sua biblioteca HTTP não consiga seguir requisições de redirecionamento você pode capturar a URL completa no cabeçalho "Location" devolvido pela API.

**Baixar o XML, em formato json, de uma nota fiscal especifica:**

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE.json?completa=1`

Utilize o método **HTTP GET** para obter os dados das notas no formato XML.

**Baixar o XML de cancelamento de uma nota fiscal:**

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE/cancelamento.xml`

Utilize o método **HTTP GET** para obter os dados das notas no formato XML.

**Baixar o XML da última Carta de Correção Eletrônica de uma nota fiscal:**

`https://api.focusnfe.com.br/v2/ctes_recebidas/CHAVE/carta_correcao.xml`

Utilize o método **HTTP GET** para obter os dados das notas no formato XML.
