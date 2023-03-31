
# Emissão NFSe por arquivo


> Exemplo de um arquivo JSON:

```json
{  
  "prestador":{  
    "cnpj":"18765499000199",
    "inscricao_municipal":"12345",
    "codigo_municipio":"3516200"
  },
  "lista_nfse": [
    {
      "data_emissao": "2019-03-19T12:07:26-03:00",
      "natureza_operacao": 1,
      "servico":{  
        "aliquota":3,
        "discriminacao":"Nota fiscal referente a serviços prestados",
        "iss_retido":"false",
        "item_lista_servico":"0107",
        "codigo_tributario_municipio": "620910000",
        "valor_servicos":1.0
      },
      "tomador":{  
        "cnpj":"07504505000132",
        "razao_social":"Acras Tecnologia da Informação LTDA",
        "email":"contato@acras.com.br",
        "endereco":{  
          "logradouro":"Rua Dias da Rocha Filho",
          "numero":"999",
          "complemento":"Prédio 04 - Sala 34C",
          "bairro":"Alto da XV",
          "codigo_municipio":"4106902",
          "uf":"PR",
          "cep":"80045165"
        }
      }
    }
  ]
}
```

Algumas prefeituras possuem nota fiscal eletrônica de serviços mas não possuem a possibilidade de integrar com outros sistemas através de webservices. Nestes casos a prefeitura disponibiliza uma forma de importar vários RPS (Recibo Provisório de Serviço) que serão convertidos em notas de serviço, evitando o trabalho de digitar e autorizar cada NFSe de forma manual.

A API do Focus NFe atende essas situações fornecendo uma interface padronizada para geração destes arquivos, usando um formato muito similar com o já usado para autorizar NFSe’s individualmente.

A maior mudança é que o campo "prestador" fica em primeiro nível na nota, enquanto campos referentes a nota, como "servico", "tomador", "data_emissao" e demais, ficam aninhados dentro do campo "lista_nfse", que abriga as notas emitidas. Ao lado, mostramos um exemplo de como fica o JSON para gerar o lote.

## Envio

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br/v2/lotes_rps"
'''
url = "https://homologacao.focusnfe.com.br/v2/lotes_rps"

# Substituir pela sua identificação interna da nota
ref = {"ref":"12345"}

token="token obtido no cadastro da empresa"

'''
Usamos dicionarios para armazenar os campos e valores que em seguida,
serao convertidos em JSON e enviados para nossa API
'''
lote_nfse = {}
lote_nfse["prestador"] = {}
lote_nfse["lista_nfse"] = []
lote_nfse["prestador"]["cnpj"] = "99999999999999"
lote_nfse["prestador"]["inscricao_municipal"] = "99999999"
lote_nfse["prestador"]["codigo_municipio"] = "9999999"

nfse = {}
nfse["data_emissao"] = "2018-02-26T12:00:00-03:00"
nfse["natureza_operacao"] = "1"
nfse["tomador"] = {}
nfse["tomador"]["cnpj"] = "99999999999999"
nfse["tomador"]["razao_social"] = "Parkinson da silva coelho JR"
nfse["tomador"]["endereco"] = {}
nfse["tomador"]["endereco"]["bairro"] = "São Miriti"
nfse["tomador"]["endereco"]["cep"] = "31999-000"
nfse["tomador"]["endereco"]["codigo_municipio"] = "9999999"
nfse["tomador"]["endereco"]["logradouro"] = "João Batista Netos"
nfse["tomador"]["endereco"]["numero"] = "34"
nfse["tomador"]["endereco"]["uf"] = "MG"  
nfse["servico"] = {}
nfse["servico"]["aliquota"] = "2.92"
nfse["servico"]["base_calculo"] = "1.00"
nfse["servico"]["discriminacao"] = "SERVICOS E MAO DE OBRA"
nfse["servico"]["iss_retido"] = "0"
nfse["servico"]["item_lista_servico"] = "1412"
nfse["servico"]["valor_iss"] = "11.68"
nfse["servico"]["valor_liquido"] = "1.00"
nfse["servico"]["valor_servicos"] = "1.00"

lote_nfse["lista_nfse"].append(nfse)

#print (json.dumps(nfse))
resposta = requests.post(url, params=ref, data=json.dumps(lote_nfse), auth=(token,""))

# Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura

arquivo_lote_rps = open('arquivo_lote_rps.txt', 'w')
arquivo_lote_rps.write(resposta.text)
arquivo_lote_rps.close()


```

```shell
# arquivo.json deve conter os dados da NFSe
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T arquivo.json https://homologacao.focusnfe.com.br/v2/lotes_rps > arquivo_lote_rps.txt
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

public class NFSeAutorizar {

  public static void main(String[] args) throws Exception{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/lotes_rps?ref="+ref);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    /* Aqui são criados as hash's que receberão os dados da nota. */
    HashMap<String, String> nfse = new HashMap<String, String>();
    HashMap<String, String> prestador = new HashMap<String, String>();
    HashMap<String, String> tomador = new HashMap<String, String>();
    HashMap<String, String> tomadorEndereco = new HashMap<String, String>();
    HashMap<String, String> servico = new HashMap<String, String>();

    dadosNfse.put("data_emissao", "2018-01-15T17:40:00");
    dadosNfse.put("natureza_operacao", "1");
    dadosPrestador.put("cnpj", "51916585000125");
    dadosPrestador.put("inscricao_municipal", "123456");
    dadosPrestador.put("codigo_municipio", "4128104");
    dadosTomador.put("cpf", "51966818092");
    dadosTomador.put("razao_social", "ACME LTDA");
    dadosTomador.put("email", "email-do-tomador@google.com.br");
    dadosTomadorEndereco.put("bairro", "Jardim America");
    dadosTomadorEndereco.put("cep", "82620150");
    dadosTomadorEndereco.put("codigo_municipio", "4106902");
    dadosTomadorEndereco.put("logradouro", "Rua Paulo Centrone");
    dadosTomadorEndereco.put("numero", "168");
    dadosTomadorEndereco.put("uf", "PR");
    dadosServico.put("discriminacao", "Teste de servico");
    dadosServico.put("aliquota", "3.00");
    dadosServico.put("base_calculo", "1.0");
    dadosServico.put("valor_iss", "0");
    dadosServico.put("iss_retido", "false");
    dadosServico.put("codigo_tributario_municipio", "080101");
    dadosServico.put("item_lista_servico", "0801");
    dadosServico.put("valor_servicos", "1.0");
    dadosServico.put("valor_liquido", "1.0");

    /* Depois de fazer o input dos dados, são criados os objetos JSON já com os valores das hash's. */
    JSONObject  loteNfse = new JSONObject ();
    JSONArray   listaNfse = new JSONArray();
    JSONObject  nfse = new JSONObject (dadosNfse);
    JSONObject  prestador = new JSONObject (dadosPrestador);
    JSONObject  tomador = new JSONObject (dadosTomador);
    JSONObject  tomadorEndereco = new JSONObject (dadosTomadorEndereco);
    JSONObject  servico = new JSONObject (dadosServico);

    /* Aqui adicionamos os objetos JSON nos campos da API como array no JSON principal. */
    listaNfse.put(nfse)
    loteNfse.put("prestador", prestador);
    loteNfse.put("listaNfse", listaNfse)
    tomador.put("endereco", tomadorEndereco);
    nfse.put("tomador", tomador);
    nfse.put("servico", servico);

    /* É recomendado verificar como os dados foram gerados em JSON e se ele está seguindo a estrutura especificada em nossa documentação.
    System.out.print(json); */

    WebResource request = client.resource(url);

    ClientResponse resposta = request.post(ClientResponse.class, json);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

    /* Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura. */
    BufferedWriter writer = new BufferedWriter(new FileWriter("arquivo_lote_rps.txt"));
    writer.write(body);
    writer.close();
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
url_envio = servidor_homologacao + "v2/lotes_rps?ref=" + ref

# altere os campos conforme a nota que será enviada
lote_nfse = {  
  prestador: {  
    cnpj: "18765499000199",
    inscricao_municipal: "12345",
    codigo_municipio: "3516200"
  },
  "lista_nfse": [
    {
      data_emissao: "2017-09-21T22:15:00",
      natureza_operacao: 1,
      tomador: {  
        cnpj: "07504505000132",
        razao_social: "Acras Tecnologia da Informação LTDA",
        email: "contatoacras.com.br",
        endereco: {  
          logradouro: "Rua Dias da Rocha Filho",
          numero: "999",
          complemento: "Prédio 04 - Sala 34C",
          bairro: "Alto da XV",
          codigo_municipio: "4106902",
          uf: "PR",
          cep: "80045165"
        }
      },
      servico: {  
        aliquota: 3,
        discriminacao: "Nota fiscal referente a serviços prestados",
        iss_retido: "false",
        item_lista_servico: "0107",
        codigo_tributario_municipio: "620910000",
        valor_servicos: 1.0
      }
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
requisicao.basic_auth(token, '')

# convertemos os dados da nota para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = lote_nfse.to_json

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura.
File.open('arquivo_lote_rps.txt', 'w') { |arquivo| arquivo.puts resposta.body }

```

```php
<?php
 // Você deve definir isso globalmente para sua aplicação
 // Para ambiente de produção use a variável abaixo:
 // $server = "https://api.focusnfe.com.br";
 $server = "https://homologacao.focusnfe.com.br";
 // Substituir pela sua identificação interna da nota
 $ref = "12345";
 $login = "token obtido no cadastro da empresa";
 $password = "";
 $lote_nfse = array (
   "prestador" => array(
     "cnpj" => "51916585000125",
      "inscricao_municipal" => "12345",
      "codigo_municipio" => "4119905"
    ),
    "lista_nfse" => array(
      array(
        "data_emissao" => "2017-12-27T17:43:14-3:00",
        "natureza_operacao" => "1",
        "tomador" => array(
          "cnpj" => "07504505000132",
          "razao_social" => "Acras Tecnologia da Informação LTDA",
          "email" => "contato@acras.com.br",
          "endereco" => array(
            "bairro" => "Jardim America",
            "cep" => "81530900",
            "codigo_municipio" => "4119905",
            "logradouro" => "Rua ABC",
            "numero" => "16",
            "uf" => "PR"
          )
        ),
        "servico" => array(
          "discriminacao" => "Exemplo Serviço",
          "iss_retido" => "false",
          "item_lista_servico" => "106",
          "codigo_cnae" => "6319400",
          "valor_servicos" => "1.00"
        )
      )
    )
  );
 // Inicia o processo de envio das informações usando o cURL
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."/v2/lotes_rps?ref=" . $ref);
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_POST, 1);
 curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($lote_nfse));
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
 $body = curl_exec($ch);
 $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

  // Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura.
  $arquivo_lote_rps = fopen("arquivo_lote_rps.txt", "w") or die("Não foi possível abrir o arquivo!");
  fwrite($arquivo_lote_rps, $body);
  fclose($arquivo_lote_rps);
 ?>
```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
let XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
let fs = require('fs')

let request = new XMLHttpRequest();

const token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota
let ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
let url = "https://homologacao.focusnfe.com.br/v2/lotes_rps?ref=" + ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

let lote_nfse = {  
  "prestador":{  
    "cnpj":"51916585000125",
    "inscricao_municipal":"12345",
    "codigo_municipio":"3518800"
  },
  "lista_nfse": [
    {
      "data_emissao":"2018-03-21",
      "natureza_operacao":"1",
      "tomador":{  
        "cnpj":"07504505000132",
        "razao_social":"Acras Tecnologia da Informacao LTDA",
        "email":"contato@acras.com.br",
        "endereco":{  
          "logradouro":"Rua Filho da Rocha Bage",
          "numero":"750",
          "complemento":"Sala 07",
          "bairro":"Alto da Rua XV",
          "codigo_municipio":"4106902",
          "uf":"PR",
          "cep":"80045165"
        }
      },
      "servico":{  
        "aliquota":3,
        "discriminacao":"Nota fiscal referente a servicos prestados",
        "iss_retido":"false",
        "item_lista_servico":"1401",
        "codigo_tributario_municipio": "452000100",
        "valor_servicos":1.0
      }
    }
  ]
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(lote_nfse));

// Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura.
fs.writeFile('arquivo_lote_rps.txt', request.responseText);

```
Para gerar o arquivo do lote RPS, o envio dos dados é feito utilizando a URL abaixo (caso o envio seja em homologação, alterar para a URL correspondente):

`https://api.focusnfe.com.br/v2/lotes_rps?ref=REFERENCIA`

Os dados que devem ir no POST é um arquivo JSON muito similar ao arquivo de autorização de NFSe. Caso não haja nenhuma falha, a API retornará os dados para geração do arquivo. As informações que devem ser enviadas consistem nos seguintes campos:

- **prestador**:
  - **cnpj**: CNPJ do prestador de serviços.
  - **codigo_municipio**: Código IBGE do município do prestador
  - **inscricao_municipal**: Inscrição municipal do prestador de serviços.
- **lista_nfse**:
  - Array com  as notas a serem geradas, usando o mesmo formato do arquivo de NFSe omitindo apenas a seção “prestador”.

A solicitação é síncrona e pode retornar os seguintes status HTTP:

HTTP CODE/STATUS | Descrição
---|---|
 HTTP status 201 (Created) | Arquivo de importação gerado. É devolvido o conteúdo do arquivo como resposta
 HTTP status 415 (Unsupported Media Type) | Formato de arquivo YAML inválido
 HTTP status 422 (Unprocessable Entity) | Campos obrigatórios não preenchidos ou em formato incorreto
 HTTP status 400 (Bad Request ) | Requisição rejeitada devido a CNPJ ou token inválido (mensagem de erro apropriada é exibida)


## Consulta

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/lotes_rps/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

r = requests.get(url+ref, auth=(token,""))

# Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura

arquivo_lote_rps = open('arquivo_lote_rps.txt', 'w')
arquivo_lote_rps.write(resposta.text)
arquivo_lote_rps.close()


```



```shell
curl -u "token obtido no cadastro da empresa:" \
  -X GET https://homologacao.focusnfe.com.br/v2/lotes_rps/12345 > arquivo_lote_rps.txt
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFSeConsulta {

  public static void main(String[] args) throws Exception{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/lotes_rps/"+ref);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = (ClientResponse) request.get(ClientResponse.class);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

    /* Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura. */
    BufferedWriter writer = new BufferedWriter(new FileWriter("arquivo_lote_rps.txt"));
    writer.write(body);
    writer.close();
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
url_envio = servidor_homologacao + "v2/lotes_rps/" + ref

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

# Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura.
File.open('arquivo_lote_rps.txt', 'w') { |arquivo| arquivo.puts resposta.body }

```

```php
<?php
 // Você deve definir isso globalmente para sua aplicação
 //Substituir pela sua identificação interna da nota
 $ref = "12345";
 $login = "token obtido no cadastro da empresa";
 $password = "";
 // Para ambiente de produção use a variável abaixo:
 // $server = "https://api.focusnfe.com.br";
 $server = "https://homologacao.focusnfe.com.br"; // Servidor de homologação
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."/v2/lotes_rps/" . $ref);
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_HTTPHEADER, array());
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
 $body = curl_exec($ch);

  // Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura.
  $arquivo_lote_rps = fopen("arquivo_lote_rps.txt", "w") or die("Não foi possível abrir o arquivo!");
  fwrite($arquivo_lote_rps, $body);
  fclose($arquivo_lote_rps);
 ?>
```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
let XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
let fs = require('fs')

let request = new XMLHttpRequest();

let token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota
let ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
let url = "https://homologacao.focusnfe.com.br/v2/lotes_rps/" + ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

request.send();

// Salvar os dados da resposta em arquivo destino a importação no sistima da prefeitura.
fs.writeFile('arquivo_lote_rps.txt', request.responseText);

```
Para os lotes que já foram gerados, é possível fazer a consulta do mesmo. O retorno para a requisição será igual ao do envio, ou seja, serão retornardo os dados para gerar o arquivo para realizar a importação no site da prefeitura.

Esta operação está disponível na URL abaixo:

`https://api.focusnfe.com.br/v2/lotes_rps/REFERENCIA`

- **retorno:**
  - **HTTP status 200 (OK)** – É devolvido o conteúdo do arquivo de importação como resposta
  - **HTTP status 404 (Not found)** – Lote não encontrado com referência informada


## Resposta (opcional)

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
ref = "12345"
url = "https://homologacao.focusnfe.com.br/v2/lotes_rps/" + ref + "/resposta"

# Substituir pela sua identificação interna da nota

token="token obtido no cadastro da empresa"

# Aqui é feita a leitura do conteúdo do arquivo de retorno baixado no site da prefeitura
arquivo = open("caminho/arquivo_retorno.txt", "r")

r = requests.post(url, data=arquivo.read(), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```



```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST https://homologacao.focusnfe.com.br/v2/lotes_rps/12345/resposta -T caminho/arquivo_retorno.txt
```

```java
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class LoteNFSeConsulta {

  public static void main(String[] args) throws IOException {

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/lotes_rps/"+ref);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    // Aqui é feita a leitura do conteúdo do arquivo de retorno baixado no site da prefeitura
    String retorno = new String(Files.readAllBytes(Paths.get("caminho/arquivo_retorno.txt")));

    WebResource request = client.resource(url, retorno);

    ClientResponse resposta = (ClientResponse) request.post(ClientResponse.class);

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
url_envio = servidor_homologacao + "v2/lotes_rps/" + ref

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

// Aqui é feita a leitura do conteúdo do arquivo de retorno baixado no site da prefeitura
retorno = File.read('caminho/arquivo_retorno.txt', 'r')

requisicao.body = retorno.to_s

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
puts "Corpo da resposta: " + resposta.body

```

```php
<?php
  // Você deve definir isso globalmente para sua aplicação
  //Substituir pela sua identificação interna da nota
  $ref = "12345";
  $login = "token obtido no cadastro da empresa";
  $password = "";

  // Aqui é feita a leitura do conteúdo do arquivo de retorno baixado no site da prefeitura
  $retorno = file_get_contents("caminho/arquivo_retorno.txt");

  // Para ambiente de produção use a variável abaixo:
  // $server = "https://api.focusnfe.com.br";
  $server = "https://homologacao.focusnfe.com.br"; // Servidor de homologação
  $ch = curl_init();
  curl_setopt($ch, CURLOPT_URL, $server."/v2/lotes_rps/" . $ref . "/resposta");
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($ch, CURLOPT_POST, 1);
  curl_setopt($ch, CURLOPT_POSTFIELDS, $retorno);
  curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
  curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
  $body = curl_exec($ch);
  $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
  //as três linhas abaixo imprimem as informações retornadas pela API, aqui o seu sistema deverá
  //interpretar e lidar com o retorno
  print($http_code."\n");
  print($body."\n\n");
  print("");
  curl_close($ch);
?>
```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
let XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
let fs = require('fs');

let request = new XMLHttpRequest();

let token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota
let ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
let url = "https://homologacao.focusnfe.com.br/v2/lotes_rps/" + ref + "/resposta";

// Aqui é feita a leitura do conteúdo do arquivo de retorno baixado no site da prefeitura
let retorno = fs.readFile('caminho/arquivo_retorno.txt');

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

request.send(retorno);

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

Algumas prefeituras disponibilizam um arquivo de resposta, que poderá informar erros no arquivo enviado ou informar dados da nota fiscal gerada (por exemplo número e código de verificação). Quando implementado, é possível enviar a resposta da prefeitura para nossa API, utilizando a URL abaixo, e iremos gerar a resposta de acordo com o padrão da nossa API:

`https://api.focusnfe.com.br/v2/lotes_rps/REFERENCIA/resposta`

- **retorno:**
 - **HTTP status 201 (Created)** – Arquivo de importação gerado. É devolvido o status de cada nota enviada. Nenhuma nota é processada se alguma nota tiver algum erro.
 - **HTTP status 415 (Unsupported Media Type)** – Formato de arquivo inválido
 - **HTTP status 400 (Bad Request )** – Requisição rejeitada devido a CNPJ ou token inválido (mensagem de erro apropriada é exibida)


> Exemplo de resposta para o envio do arquivo de retorno do Lote NFSe:

```json
{
  "status":"autorizado",
  "numero":"9999",
  "codigo_verificacao":"311299647",
  "data_emissao":"2017-09-09T10:20:00-03:00",
  "uri":"https://www.barueri.sp.gov.br/nfe/",
  "caminho_xml_nota_fiscal":"/notas_fiscais_servico/NFSe191517072001883518800-1898781-9999-312276647.xml"
}
```
