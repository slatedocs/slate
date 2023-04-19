# NFSes recebidas (beta)

Da mesma forma que a manifestação de NFe, a API para busca de NFSes recebidas do sistema Focus permite que você consulte as notas de serviço onde sua empresa é a tomadora do serviço nos municípios onde isso é possível. No caso da NFSe, não existe a operação de manifestação. No momento a busca de notas está sendo possível apenas no município de São Paulo.

Através desta documentação deverá ser possível fazer a integração com a API do Focus NFe, caso alguma dúvida permaneça você pode entrar em contato com o suporte através do e-mail suporte@focusnfe.com.br. Através deste canal você pode também solicitar a implementação de algum município que possibilite a busca de notas recebidas de forma automática.

## URLs


Método | URL (recurso) | Ação
-------|---------------|------
GET|/v2/nfses_recebidas?cnpj=CNPJ|Busca os dados de todas as NFSes recebidas.

## Status API

Aqui você encontra os status possíveis para MDe.

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
400 - bad request | requisicao_invalida | CNPJ do emitente não autorizado ou não informado. | Verifique no Painel API se esse emitente está habilitado para realizar a busca de NFSes recebidas. Verifique se o CNPJ foi informado no JSON de envio.
400 - bad request | requisicao_invalida | CNPJ/UF do emitente não autorizado ou não informado. | Verifique no Painel API se esse emitente está habilitado para realizar a busca de NFSes recebidas. Verifique se o CNPJ foi informado no JSON de envio.
403 - forbidden | permissao_negada | CNPJ do emitente não autorizado. | O emitente utilizado não está autorizado a realizar a operação de busca ou foi informado o CNPJ do emitente incorretamente no JSON.

## Consulta de NFSe Recebidas

Uma NFSe pode ser cancelada após ter sido recebida. Por este motivo as NFSes recebidas possuem um campo chamado “**versao**” que é único entre todos os documentos do mesmo CNPJ e que é atualizado a cada alteração nesta NFSe. Isto facilita a busca apenas dos documentos que seu sistema ainda não conhece, sendo necessário que você armazene apenas um número por CNPJ.

Por exemplo, se você recebe uma NFSe com versao = 60, e ela posteriormente for cancelada, sua versão será atualizada para algum número maior que 60.

A API busca as últimas atualizações das prefeituras uma vez ao dia.

### Método de consulta

> Exemplo de como consultar todas as notas recebidas de uma empresa.

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfses_recebidas?cnpj="

token="token obtido no cadastro da empresa"

cnpj = "cnpj_do_destinatario_da_nota"

r = requests.get(url+cnpj, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```


```shell
curl -u "token obtido no cadastro da empresa:" \
  "https://homologacao.focusnfe.com.br/v2/nfses_recebidas?cnpj=SEU_CNPJ"
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
    String url = server.concat("v2/nfses_recebidas?cnpj="+cnpj);

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
url_envio = servidor_homologacao + "v2/nfses_recebidas?cnpj=" + cnpj

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
   curl_setopt($ch, CURLOPT_URL, $server."v2/nfses_recebidas?cnpj=".$cnpj);
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
var url = "https://homologacao.focusnfe.com.br/v2/nfses_recebidas?cnpj=" + cnpj;

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

`https://api.focusnfe.com.br/v2/nfses_recebidas?cnpj=CNPJ`

Utilize o método **HTTP GET** para consultar as notas. Esta requisição aceita os seguintes parâmetros que deverão ser enviados na URL:

* **cnpj**(*): CNPJ da empresa. Campo obrigatório.
* **versao**: Se informado, irá buscar apenas os documentos cuja versão seja maior que o parâmetro recebido. Utilize este parâmetro para buscar apenas as notas que seu sistema ainda não conhece.
* **completa**: Se informado com o valor "1" irá devolver os dados completos do XML da nota, seguindo o padrão dos dados enviados para emissão de NFSe. Caso contrário, irá devolver os dados de forma resumida conforme descrito na próxima seção.

Serão devolvidas as 100 primeiras notas encontradas. Para recuperar as demais notas você deverá fazer uma nova requisição alterando o campo versão.

> Exemplo dos dados de resposta:

```json
[
  {
    "numero": 3240,
    "numero_rps": 3187,
    "serie_rps": "UNICA",
    "data_emissao": "2019-11-01T09:53:01-03:00",
    "data_emissao_rps": "2019-11-01T00:00:00-03:00",
    "valor_total": 63.5,
    "situacao": "autorizada",
    "documento_prestador": "11131112000133",
    "nome_prestador": null,
    "inscricao_municipal_prestador": "12224222",
    "versao": 123,
    "codigo_verificacao": "IAAAXAAB",
    "url": "https://nfe.prefeitura.sp.gov.br/contribuinte/notaprint.aspx?inscricao=12224222&nf=3240&verificacao=IAAAXAAA",
    "url_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos/11110100000111/201911/NFSeRecebidas/NFSe111101000001113220308-12224222-3240-IAAAXAAA.xml",
    "nome_municipio": "São Paulo",
    "sigla_uf": "SP",
    "codigo_municipio": "3550308"
  }
]
```

### Dados devolvidos

A API irá devolver os seguintes cabeçalhos HTTP:

* **X-Total-Count**: O número total de registros (incluindo aqueles que não foram devolvidos pelo limite de 100 registros)
* **X-Max-Version**: Valor máximo da versão dos documentos devolvidos. Utilize este cabeçalho para utilizar na próxima busca de versão, caso seja necessário.

Os dados devolvidos podem vir em dois formatos: modo simplificado (default) e completo.
Se utilizado o formato simplificado o corpo da resposta será um array de objetos em JSON no seguinte formato:

* **numero**: Número da NFSe.
* **numero_rps**: Número do RPS, se existir.
* **serie_rps**: Série do RPS, se existir.
* **data_emissao**: Data de emissão da NFSe.
* **data_emissao_rps**: Data de emissão do RPS, se existir.
* **valor_total**: Valor total da NFSe.
* **situacao**: Situação da NFSe. Pode ser: autorizada ou cancelada.
* **documento_prestador**: CNPJ ou CPF do emitente do documento fiscal.
* **inscricao_municipal_prestador**: CNPJ ou CPF do emitente do documento fiscal.
* **versao**: Versão do documento fiscal. Este número irá mudar apenas se o documento for alterado de alguma forma.
* **codigo_verificacao**: Código de verificação da NFSe.
* **url**: URL para visualização da NFSe no site da prefeitura.
* **url_xml**: URL para download do XML da NFSe.
* **nome_municipio**: Nome do município do prestador.
* **sigla_uf**: UF do prestador.
* **codigo_municipio**: Código IBGE do município do prestador.

Você pode também configurar o gatilho "nfse_recebida" para receber estes dados resumidos diretamente em sua aplicação assim que estiverem disponíveis na API. Consulte a seção de [Gatilhos / Webhooks](#gatilhos-webhooks).

> Exemplo dos dados de resposta usando o parâmetro completa=1:

```json
[
  {
    "numero": "3240",
    "codigo_verificacao": "HT9MPFM1",
    "numero_rps": "3187",
    "serie_rps": "1",
    "tipo_rps":  "RPS",
    "status": "N",
    "situacao": "autorizada",
    "versao": 123,
    "prestador": {
      "cnpj": "11131112000133",
      "inscricao_municipal": "12224222"
    },
    "tomador": {
      "razao_social": "Tomador Ltda",
      "cnpj": "11131112000134",
      "inscricao_municipal": null,
      "endereco": {
        "nome_municipio": "Florianópolis",
        "bairro": "Bom Retiro",
        "cep": "89223001",
        "codigo_municipio": null,
        "logradouro": "AV Santos Dumont",
        "numero": "22",
        "uf": "SC"
      }
    },
    "data_emissao": "2019-11-01T09:53:01-03:00",
    "optante_simples_nacional": "",
    "incentivador_cultural": "",
    "valor_liquido": "450",
    "servico": {
      "valor_servicos": "450",
      "valor_deducoes": null,
      "valor_pis": "2.93",
      "valor_cofins": "13.5",
      "valor_inss": null,
      "valor_ir": null,
      "valor_csll": "4.5",
      "valor_iss": 22.5,
      "item_lista_servico": "3123",
      "aliquota": "0.0500",
      "iss_retido": "false",
      "discriminacao": "Prestação de serviço",
      "codigo_municipio": null
    }
  }
]
```

Caso utilize o argumento "completa=1" os dados serão devolvidos no mesmo
[formato de emissão de NFSe](#nfse_campos). Acrescentado dos campos "versao" e
"situacao" descritos acima.
