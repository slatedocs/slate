# NFCom (beta)

Através da API NFCom é possível:

* Emitir NFCom (Nota Fiscal de Serviço de Comunicação Eletrônica) utilizando dados simplificados.
* Consultar o status de NFCom emitidas.
* Cancelar uma NFCom.

Todos os processos envolvendo NFCom são **síncronos**. Ou seja, a emissão não é feita em segundo plano, ao contrário da NFe
e NFSe.

## URLs


Método | URL (recurso) | Ação
-------|-------|-----
POST |  /v2/nfcom?ref=REFERENCIA  | Emite uma NFCom.
GET  | /v2/nfcom/REFERENCIA | Consulta a NFCom com a referência informada e o seu status de processamento.
DELETE |  /v2/nfcom/REFERENCIA  | Cancela uma NFCom com a referência informada.

## Campos de um NFCom


A NFCom possui vários campos para os mais variados tipos e formas de operações, por isso, criamos uma página exclusiva que mostra todos os campos da nossa API para o envio de NFCom. Nela, você pode buscar os campos pela TAG XML ou pela nossa tradução para API.

[Documentação completa dos campos NFCom](https://campos.focusnfe.com.br/nfcom/NotaFiscalComunicacaoXML.html)

## Status API

Aqui você encontra os status possíveis para NFCom.

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
422 - unprocessable entity | erro_validacao_schema | Erro na validação do Schema XML. | Verifique o detalhamento do erro na resposta da API.
422 - unprocessable entity | nao_autorizado | NFCom não autorizada. | O cancelamento só é possível para NFCom's autorizadas.
404 - not found | nao_encontrado | Utilize o método POST. | O método de envio usado é diferente de POST, por favor, use o HTTP POST.
404 - not found | nao_encontrado | NFCom não encontrada. | Verifique se a nota a ser cancelada realmente existe antes de enviar o cancelamento.
400 - bad request | requisicao_invalida | Parâmetro "justificativa" não informado. | Você precisa usar o parâmetro 'justificativa'. Consulte a nossa documentação.
400 - bad request | requisicao_invalida | Parâmetro "justificativa" deve ter entre 15 e 255 caracteres. | A sua justificativa não possui de 15 à 255 careacteres.
400 - bad request | requisicao_invalida | Parâmetro X não informado. | Onde X é o campo que não foi informado em sua requisição.
400 - bad request | requisicao_invalida | Não existe série com os critérios informados. | Os critérios de inutilização não existem. Verifique a nossa documentação.
400 - bad request | requisicao_invalida | CNPJ do emitente não autorizado ou não informado. | Verifique o campo "cnpj_emitente" em seu JSON. É preciso habilitar a emissão de NFCom no cadastro do emitente(Painel API).
400 - bad request | requisicao_invalida | CNPJ/UF do emitente não autorizado ou não informado. | Verifique os campos "cnpj_emitente" e "uf_emitente". É preciso habilitar a emissão de NFCom no cadastro do emitente(Painel API).
403 - forbidden | permissao_negada | CNPJ do emitente não autorizado. | O emitente utilizado não está autorizado a emitir NFCom ou foi informado o CNPJ do emitente incorretamente no JSON.

## Envio

```shell
# arquivo.json deve conter os dados da NFCom
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T nfcom.json https://homologacao.focusnfe.com.br/v2/nfcom?ref=12345
```

```java
import java.util.HashMap;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFComAutorizar {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfcom?ref="+ref);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    /* Aqui são criados as hash's que receberão os dados da nota. */
    HashMap<String, String> nfcom = new HashMap<String, String>();
    HashMap<String, String> itens = new HashMap<String, String>();

    nfcom.put("data_emissao", "2023-05-04T16:57:42-03:00");
    nfcom.put("numero_site", "0");
    nfcom.put("tipo_faturamento", "0");
    nfcom.put("finalidade_nfcom", "0");
    nfcom.put("cnpj_emitente", "51916585000125");
    nfcom.put("ie_virtual_emitente", "123");
    nfcom.put("nome_emitente", "ACME LTDA");
    nfcom.put("nome_fantasia_emitente", "ACME TESTES");
    nfcom.put("logradouro_emitente", "R. Padre Natal Pigato");
    nfcom.put("numero_emitente", "100 ");
    nfcom.put("bairro_emitente", "Santa Felicidade");
    nfcom.put("municipio_emitente", "Curitiba");
    nfcom.put("uf_emitente", "PR");
    nfcom.put("cep_emitente", "82320030");
    nfcom.put("inscricao_estadual_emitente", "101942171617");
    nfcom.put("nome_destinatario", "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL");
    nfcom.put("cnpj_destinatario", "85904290000150");
    nfcom.put("indicador_ie_destinatario", "2");
    nfcom.put("logradouro_destinatario", "Rua Fictícia");
    nfcom.put("numero_destinatario", "2");
    nfcom.put("bairro_destinatario", "Centro");
    nfcom.put("municipio_destinatario", "Curitiba");
    nfcom.put("uf_destinatario", "PR");
    nfcom.put("cep_destinatario", "82320030");
    nfcom.put("codigo_assinante", "1");
    nfcom.put("tipo_assinante", "3");
    nfcom.put("tipo_servico", "5");
    itens.put("numero_item","1");
    itens.put("codigo_produto","123");
    itens.put("descricao","Teste NFCom");
    itens.put("classificacao","0100401");
    itens.put("unidade_medida","4");
    itens.put("quantidade_fatura","1");
    itens.put("valor_item","139.90");
    itens.put("valor_produtos","139.90");

    /* Depois de fazer o input dos dados, são criados os objetos JSON já com os valores das hash's. */
    JSONObject json = new JSONObject (nfcom);
    JSONObject jsonItens = new JSONObject (itens);

    /* Aqui adicionamos os objetos JSON nos campos da API como array no JSON principal. */
    json.append("items", jsonItens);

    /* É recomendado verificar como os dados foram gerados em JSON e se ele está seguindo a estrutura especificada em nossa documentação.
    System.out.print(json); */

    WebResource request = client.resource(url);

    ClientResponse resposta = request.post(ClientResponse.class, json);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

    /* As três linhas a seguir exibem as informações retornadas pela nossa API.
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

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfcom?ref=" + ref

# altere os campos conforme a nota que será enviada
dados_da_nota = {
  data_emissao: "2023-05-04T16:57:42-03:00",
  numero_site: "0",
  tipo_faturamento: "0",
  finalidade_nfcom: "0",
  cnpj_emitente: "51916585000125",
  ie_virtual_emitente: "123",
  nome_emitente: "ACME LTDA",
  nome_fantasia_emitente: "ACME LTDA",
  logradouro_emitente: "R. Padre Natal Pigato",
  numero_emitente: "100",
  bairro_emitente: "Santa Felicidade",
  municipio_emitente: "Curitiba",
  uf_emitente: "PR",
  cep_emitente: "82320030",
  inscricao_estadual_emitente: "101942171617",
  nome_destinatario: "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  cnpj_destinatario: "85904290000150",
  indicador_ie_destinatario: "2",
  logradouro_destinatario: "Rua Fictícia",
  numero_destinatario: "2",
  bairro_destinatario: "Centro",
  municipio_destinatario: "Curitiba",
  cep_destinatario: "82320030",
  uf_destinatario: "PR",
  codigo_assinante: "1",
  tipo_assinante: "3",
  tipo_servico: "5",
  itens: [
    {
      numero_item: "1",
      codigo_produto: "123",
      descricao: "Teste NFCom",
      classificacao: "0100401",
      unidade_medida: "4",
      quantidade_fatura: "1",
      valor_item: "139.90",
      valor_produtos: "139.90"
    }
  ]
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, "")

# convertemos os dados da nota para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = dados_da_nota.to_json

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

```javascript
/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfcom?ref=" + ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var nfcom = {
  "data_emissao": "2023-05-04T16:57:42-03:00",
  "numero_site": "0",
  "tipo_faturamento": "0",
  "finalidade_nfcom": "0",
  "cnpj_emitente": "51916585000125",
  "ie_virtual_emitente": "123",
  "nome_emitente": "ACME LTDA",
  "nome_fantasia_emitente": "ACME LTDA",
  "logradouro_emitente": "R. Padre Natal Pigato",
  "numero_emitente": "100",
  "bairro_emitente": "Santa Felicidade",
  "municipio_emitente": "Curitiba",
  "uf_emitente": "PR",
  "cep_emitente": "82320030",
  "inscricao_estadual_emitente": "101942171617",
  "nome_destinatario": "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  "cnpj_destinatario": "85904290000150",
  "indicador_ie_destinatario": "2",
  "logradouro_destinatario": "Rua Fictícia",
  "numero_destinatario": "2",
  "bairro_destinatario": "Centro",
  "municipio_destinatario": "Curitiba",
  "cep_destinatario": "82320030",
  "uf_destinatario": "PR",
  "codigo_assinante": "1",
  "tipo_assinante": "3",
  "tipo_servico": "5",
  "itens": [
    {
      "numero_item": "1",
      "codigo_produto": "123",
      "descricao": "Teste NFCom",
      "classificacao": "0100401",
      "unidade_medida": "4",
      "quantidade_fatura": "1",
      "valor_item": "139.90",
      "valor_produtos": "139.90"
    }
  ]
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(nfcom));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$nfcom = array (
  "data_emissao" => "2023-05-04T16:57:42-03:00",
  "numero_site" => "0",
  "tipo_faturamento" => "0",
  "finalidade_nfcom" => "0",
  "cnpj_emitente" => "51916585000125",
  "ie_virtual_emitente" => "123",
  "nome_emitente" => "ACME LTDA",
  "nome_fantasia_emitente" => "ACME LTDA",
  "logradouro_emitente" => "R. Padre Natal Pigato",
  "numero_emitente" => "100",
  "bairro_emitente" => "Santa Felicidade",
  "municipio_emitente" => "Curitiba",
  "uf_emitente" => "PR",
  "cep_emitente" => "82320030",
  "inscricao_estadual_emitente" => "101942171617",
  "nome_destinatario" => "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  "cnpj_destinatario" => "85904290000150",
  "indicador_ie_destinatario" => "2",
  "logradouro_destinatario" => "Rua Fictícia",
  "numero_destinatario" => "2",
  "bairro_destinatario" => "Centro",
  "municipio_destinatario" => "Curitiba",
  "cep_destinatario" => "82320030",
  "uf_destinatario" => "PR",
  "codigo_assinante" => "1",
  "tipo_assinante" => "3",
  "tipo_servico" => "5",
  "itens" => array(
    array(
      "numero_item" => "1",
      "codigo_produto" => "123",
      "descricao" => "Teste NFCom",
      "classificacao" => "0100401",
      "unidade_medida" => "4",
      "quantidade_fatura" => "1",
      "valor_item" => "139.90",
      "valor_produtos" => "139.90"
    )
  ),
);
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfcom?ref=" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($nfcom));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfcom"

# Substituir pela sua identificação interna da nota
ref = {"ref":"12345"}

token="token obtido no cadastro da empresa"

'''
Usamos dicionarios para armazenar os campos e valores que em seguida,
serao convertidos em JSON e enviados para nossa API
'''
nfcom = {}
itens = {}

nfcom["data_emissao"] = "2023-05-04T16:57:42-03:00"
nfcom["numero_site"] = "0"
nfcom["tipo_faturamento"] = "0"
nfcom["finalidade_nfcom"] = "0"
nfcom["cnpj_emitente"] = "51916585000125"
nfcom["ie_virtual_emitente"] = "123"
nfcom["nome_emitente"] = "ACME LTDA"
nfcom["nome_fantasia_emitente"] = "ACME TESTES"
nfcom["logradouro_emitente"] = "R. Padre Natal Pigato"
nfcom["numero_emitente"] = "100 "
nfcom["bairro_emitente"] = "Santa Felicidade"
nfcom["municipio_emitente"] = "Curitiba"
nfcom["uf_emitente"] = "PR"
nfcom["cep_emitente"] = "82320030"
nfcom["inscricao_estadual_emitente"] = "101942171617"
nfcom["nome_destinatario"] = "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL"
nfcom["cnpj_destinatario"] = "85904290000150"
nfcom["indicador_ie_destinatario"] = "2"
nfcom["logradouro_destinatario"] = "Rua Fictícia"
nfcom["numero_destinatario"] = "2"
nfcom["bairro_destinatario"] = "Centro"
nfcom["municipio_destinatario"] = "Curitiba"
nfcom["uf_destinatario"] = "PR"
nfcom["cep_destinatario"] = "82320030"
nfcom["codigo_assinante"] = "1"
nfcom["tipo_assinante"] = "3"
nfcom["tipo_servico"] = "5"
itens["numero_item"] = "1"
itens["codigo_produto"] = "123"
itens["descricao"] = "Teste NFCom"
itens["classificacao"] = "0100401"
itens["unidade_medida"] = "4"
itens["quantidade_fatura"] = "1"
itens["valor_item"] = "139.90"
itens["valor_produtos"] = "139.90"

# Adicionamos os dados da variavel itens como listas ao dicionario principal.
nfcom["items"] = [itens]

r = requests.post(url, params=ref, data=json.dumps(nfcom), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

Para enviar uma NFCom utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste. 

Envia uma NFCom para autorização:

`https://api.focusnfe.com.br/v2/nfcom?ref=REFERENCIA`

Utilize o comando **HTTP POST** para enviar a sua nota para nossa API. Envie como corpo do POST os dados em formato JSON da nota fiscal.

A numeração da nota (número e série) pode ser definido automaticamente pela API, nós recomendamos que deixe a sua numeração sob nossa responsabilidade, por questões de simplicidade. Entretanto, você pode controlar o envio destas informações pela sua aplicação, basta informar os campos **“numero”** e **“serie”** nos dados de envio.

O envio de uma NFCom é um processo **síncrono**, ou seja, diferente da NFe a nota é autorizada ou rejeitada na mesma requisição. A resposta da requisição irá conter o mesmo resultado que a operação da consulta, descrita a seguir.

## Consulta

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/nfcom/12345
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFComConsulta {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfcom/"+ref+"?completa=1");

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

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

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfcom/" + ref

# criamos um objeto uri para envio da nota
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

```javascript
/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfcom/" + ref + "?completa=1";

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

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfcom/" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array());
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfcom/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

# Use este parametro para obter mais informacoes em suas consultas
completa = "completa=1"

r = requests.get(url+ref, params=completa, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

Para consultar uma NFCom utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Consultar as informações de uma NFCom:

`https://api.focusnfe.com.br/v2/nfcom/REFERENCIA?completa=(0|1)`

Utilize o comando **HTTP GET** para consultar a sua nota para nossa API.

Parâmetro Opcional | Ação
-------|-------|-----
completa = 0 ou 1 | Habilita a API há mostrar campos adicionais na requisição de consulta.

Campos de retorno:

* **status**: A situação da NFCom, podendo ser:
  - **processando_autorizacao**: A nota ainda está em processamento pela API. Você deverá aguardar o processamento pela SEFAZ.
  - **autorizado**: A nota foi autorizada, neste caso é fornecido os dados completos da nota como chave e arquivos para download.
  - **cancelado**: O documento foi cancelado, neste caso é fornecido o caminho para download do XML de cancelamento (caminho_xml_cancelamento).
  - **erro_autorizacao**: Houve um erro de autorização por parte da SEFAZ. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. É possível fazer o reenvio da nota com a mesma referência se ela estiver neste estado.
  - **denegado**: O documento foi denegado. Uma SEFAZ pode denegar uma nota se houver algum erro cadastral nos dados do destinatário ou do emitente. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. Não é possível reenviar a nota caso este estado seja alcançado pois é gerado um número, série, chave de NFCom e XML para esta nota. O XML deverá ser armazenado pelo mesmo período de uma nota autorizada ou cancelada.
* **status_sefaz**: O status da nota na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **serie**: A série da nota fiscal, caso ela tenha sido autorizada.
* **numero**: O número da nota fiscal, caso ela tenha sido autorizada.
* **cnpj_emitente**: O CNPJ emitente da nota fiscal (o CNPJ de sua empresa).
* **ref**: A referência da emissão.
* **chave_nfcom**: A chave da NFCom, caso ela tenha sido autorizada.
* **caminho_xml_nota_fiscal**: Caso a nota tenha sido autorizada, retorna o caminho para download do XML.
* **caminho_danfecom**: Caso a nota tenha sido autorizada retorna o caminho para download do DANFe-COM.
* **caminho_xml_cancelamento**: Caso a nota esteja cancelada, é fornecido o caminho para fazer o download do XML de cancelamento.

Caso na requisição seja passado o parâmetro `completa=1` será adicionado mais 4 campos:

* **requisicao_nota_fiscal**: Inclui os dados completos da requisição da nota fiscal, da mesma forma que constam no XML da nota.
* **protocolo_nota_fiscal**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_cancelamento**: Inclui os dados completos da requisição de cancelamento da nota fiscal.
* **protocolo_cancelamento**: Inclui os dados completos do protocolo devolvido pela SEFAZ.

## Cancelamento

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X DELETE -d '{"justificativa":"Informe aqui a sua justificativa para realizar o cancelamento da NFCom."}' \
  https://homologacao.focusnfe.com.br/v2/nfcom/12345
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

public class NFComCancelamento {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfcom/"+ref);
    /* Aqui criamos um hashmap para receber a chave "justificativa" e o valor desejado. */
    HashMap<String, String> justificativa = new HashMap<String, String>();
    justificativa.put("justificativa", "Informe aqui a sua justificativa para realizar o cancelamento da NFCom.");

    /* Criamos um objeto JSON para receber a hash com os dados esperado pela API. */
    JSONObject json = new JSONObject(justificativa);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = request.delete(ClientResponse.class, json);

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

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfcom/" + ref

# altere os campos conforme a nota que será enviada
justificativa_cancelamento = {
  justificativa: "Informe aqui a sua justificativa para realizar o cancelamento da NFCom."
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Delete a partir da uri de requisição
requisicao = Net::HTTP::Delete.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos a hash de justificativa do cancelamento para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = justificativa_cancelamento.to_json

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

```javascript
/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfcom/"+ ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('DELETE', url, false, token);

var cancelar = {
  "justificativa": "Informe aqui a sua justificativa para realizar o cancelamento da NFCom."
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(cancelar));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$justificativa = array ("justificativa" => "Informe aqui a sua justificativa para realizar o cancelamento da NFCom.");
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server . "/v2/nfcom/" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($justificativa));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfcom/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
justificativa={}
justificativa["justificativa"] = "Informe aqui a sua justificativa para realizar o cancelamento da NFCom."

r = requests.delete(url+ref, data=json.dumps(justificativa), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

Para cancelar uma NFCom, basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Cancelar uma NFCom já autorizada:

`https://api.focusnfe.com.br/v2/nfcom/REFERENCIA`

Utilize o comando **HTTP DELETE** para cancelar a sua nota para nossa API. 

O parâmetro de cancelamento deverá ser enviado da seguinte forma:

* **justificativa**: Justificativa do cancelamento. Deverá conter de 15 a 255 caracteres.

A API irá em seguida devolver os seguintes campos:

* **status**: cancelado, se a nota pode ser cancelada, ou erro_cancelamento, se houve algum erro ao cancelar a nota.
* **status_sefaz**: O status do cancelamento na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml_cancelamento**: Caso a nota tenha sido cancelada, será informado aqui o caminho para download do XML de cancelamento.

### Prazo de cancelamento
A NFCom poderá ser cancelada em até 24 horas após a emissão. No entanto, alguns estados podem permitir um prazo maior para o cancelamento.
