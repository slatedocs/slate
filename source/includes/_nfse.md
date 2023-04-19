# NFSe

Através da API NFSe é possível:

 * Emitir NFSe para qualquer município utilizando um único modelo de dados. Este processo é **assíncrono**. Ou seja, após a emissão a nota será enfileirada para processamento.
 * Cancelar NFSe
 * Consultar NFSe’s emitidas
 * Encaminhar uma NFSe autorizada por email

## URLs

Método | URL (recurso) | Ação
-------|---------------|------
POST|/v2/nfse?ref=REFERENCIA | Cria uma nota fiscal e a envia para processamento.
GET|/v2/nfse/REFERENCIA | Consulta a nota fiscal com a referência informada e o seu status de processamento
DELETE|/v2/nfse/REFERENCIA | Cancela uma nota fiscal com a referência informada
POST|/v2/nfse/REFERENCIA/email | Envia um email com uma cópia da nota fiscal com a referência informada


## Campos

Cada prefeitura pode utilizar um formato diferente de XML, mas utilizando nossa API você utiliza
um formato único de campos para todas as prefeituras. A listagem dos campos segue abaixo.
Os campos denotados com (*) são obrigatórios.

### Geral

> Exemplo de um arquivo JSON:

```json
{
   "data_emissao":"2017-09-21T22:15:00",
   "prestador":{
      "cnpj":"18765499000199",
      "inscricao_municipal":"12345",
      "codigo_municipio":"3516200"
   },
   "tomador":{
      "cnpj":"07504505000132",
      "razao_social":"Acras Tecnologia da Informação LTDA",
      "email":"contato@focusnfe.com.br",
      "endereco":{
         "logradouro":"Rua Dias da Rocha Filho",
         "numero":"999",
         "complemento":"Prédio 04 - Sala 34C",
         "bairro":"Alto da XV",
         "codigo_municipio":"4106902",
         "uf":"PR",
         "cep":"80045165"
      }
   },
   "servico":{
      "aliquota":3,
      "discriminacao":"Nota fiscal referente a serviços prestados",
      "iss_retido":"false",
      "item_lista_servico":"0107",
      "codigo_tributario_municipio": "620910000",
      "valor_servicos":1.0
   }
}
```

- **data_emissao**(*): (Data) Data/hora de emissão da NFSe. Alguns municípios não utilizam hora e ela será descartada caso seja fornecida. Formato padrão ISO, exemplo: “2016-12-25T12:00-0300”.
- **natureza_operacao**(*): (String) Natureza da operação. Informar um dos códigos abaixo. Valor padrão: 1. Campo ignorado em alguns municípios.
  - **1**: Tributação no município;
  - **2**: Tributação fora do município;
  - **3**: Isenção;
  - **4**: Imune;
  - **5**: Exigibilidade suspensa por decisão judicial;
  - **6**: Exigibilidade suspensa por procedimento administrativo.
- **regime_especial_tributacao**: (String) Informar o código de identificação do regime especial de tributação conforme abaixo. Campo ignorado em alguns municípios.
  - **1**: Microempresa municipal;
  - **2**: Estimativa;
  - **3**: Sociedade de profissionais;
  - **4**: Cooperativa;
  - **5**: MEI - Simples Nacional;
  - **6**: ME EPP- Simples Nacional.
* **optante_simples_nacional**(*): (Boolean) Informar true (verdadeiro) ou false (falso) se a empresa for optante pelo Simples Nacional. Campo ignorado por alguns municípios
* **incentivador_cultural**: (Boolean) Informe true (verdadeiro) ou false (falso). Valor padrão: false. Campo ignorado em alguns municípios.
* **codigo_obra**: (String) Código da obra quando construção civil. Tamanho: 15 caracteres.
* **art**: (String) Código ART quando construção civil. Este campo é ignorado em alguns municípios.
* **numero_rps_substituido**: (String) Caso o município permita a substituição de notas, aqui você poderá
informar o número do RPS que será substituído. Municípios que seguem o padrão ABRASF poderão usar esta operação.
* **serie_rps_substituido**: (String) Obrigatório se informado o campo numero_rps_substituido. Indica a série do RPS a ser substituído.
* **tipo_rps_substituido**: (String) Obrigatório se informado o campo numero_rps_substituido. Indica o tipo do RPS a ser substituído. Caso desconheça este valor, utiliza o valor "1".


### Prestador

- **prestador**:
  - **cnpj**(*): (String). CNPJ do prestador de serviços. Caracteres não numéricos são ignorados.
  - **codigo_municipio**(*): (String). Código IBGE de 7 dígitos do município do prestador.
  - **inscricao_municipal**(*): (String). Inscrição municipal do prestador de serviços. Caracteres não numéricos são ignorados.

### Tomador
- **tomador**:
  - **cpf**(*): (String) CPF do tomador, se aplicável. Caracteres não numéricos são ignorados.
  - **cnpj**(*): (String) CNPJ do tomador, se aplicável. Caracteres não numéricos são ignorados.
  - **inscricao_municipal**: (String) Inscrição municipal do tomador. Caracteres não numéricos são ignorados.
  - **razao_social**: (String) Razão social ou nome do tomador. Tamanho: 115 caracteres.
  - **telefone**: (String) Telefone do tomador. Tamanho: 11 caracteres.
  - **email**: (String) Email do tomador. Tamanho: 80 caracteres.
  - **endereco**:
      - **logradouro**: (String) Nome do logradouro. Tamanho: 125 caracteres.
      - **tipo_logradouro**: (String) Tipo do logradouro. Usado apenas para alguns municípios. Valor padrão: os 3 primeiros caracteres do logradouro. Tamanho: 3 caracteres.
      - **numero**: (String) Número do endereço. Tamanho: 10 caracteres.
      - **complemento**: (String) Complemento do endereço. Tamanho: 60 caracteres.
      - **bairro**: Bairro. (String) Tamanho: 60 caracteres.
      - **codigo_municipio**: (String) Código IBGE do município.
      - **uf**: (String) UF do endereço. Tamanho: 2 caracteres.
      - **cep**: (String) CEP do endereço. Caracteres não numéricos são ignorados.

### Serviço

- **servico**:
  - **valor_servicos**(*): (Decimal) Valor dos serviços.
  - **valor_deducoes**: (Decimal) Valor das deduções.
  - **valor_pis**: (Decimal) Valor do PIS.
  - **valor_cofins**: (Decimal) Valor do COFINS.
  - **valor_inss**: (Decimal) Valor do INSS.
  - **valor_ir**: (Decimal) Valor do IRRF.
  - **valor_csll**: (Decimal) Valor do CSLL
  - **iss_retido**(*): (Boolean) Informar true (verdadeiro) ou false (falso) se o ISS foi retido.
  - **valor_iss**: (Decimal) Valor do ISS. Campo ignorado por alguns municípios que realizam seu próprio cálculo.
  - **valor_iss_retido**: (Decimal) Valor do ISS Retido. Campo ignorado em alguns municípios.
  - **outras_retencoes**: (Decimal) Valor de outras retenções. Campo ignorado em alguns municípios.
  - **base_calculo**: (Decimal) Base de cálculo do ISS, valor padrão igual ao valor_servicos. Campo ignorado em alguns municípios.
  - **aliquota**: (Decimal) Aliquota do ISS. Algumas cidades permitem usar 4 dígitos decimais.
  - **desconto_incondicionado**: (Decimal) Valor do desconto incondicionado. Campo ignorado em alguns municípios.
  - **desconto_condicionado**: (Decimal) Valor do desconto condicionado. Campo ignorado em alguns municípios.
  - **item_lista_servico**(*): (String) Informar o código da lista de serviços, normalmente de acordo com a Lei Complementar 116/2003.
  - **codigo_cnae**: (String) Informar o código CNAE de 7 dígitos. Campo ignorado em alguns municípios.
  - **codigo_tributario_municipio**: (String) Informar o código tributário de acordo com a tabela de cada município (não há um padrão).
  - **discriminacao**(*): (String) Discriminação dos serviços. Tamanho: Varia por município.
  - **codigo_municipio**(*): (String) Informar o código IBGE de 7 dígitos do município de prestação do serviço.
  - **percentual_total_tributos**: (Decimal) Percentual aproximado de todos os impostos, de acordo com a Lei da Transparência. No momento disponível apenas alguns municípios.
  - **fonte_total_tributos**: (String) Fonte de onde foi retirada a informação de total de impostos, por exemplo, “IBPT”. No momento disponível apenas para alguns municípios.

### Intermediário
- **intermediario** (esta seção é ignorada se não suportada pelo município)
  - **razao_social**: (String) Razão social do intermediário do serviço. Tamanho: 115 caracteres.
  - **cpf**: (String) CPF do intermediário do serviço, se aplicável. Caracteres não numéricos são ignorados.
  - **cnpj**: (String) CNPJ do intermediário do serviço, se aplicável. Caracteres não numéricos são ignorados.
  - **inscricao_municipal**: (String) Inscrição municipal do intermediário do serviço, se aplicável. Caracteres não numéricos são ignorados.

Alguns municípios podem ter campos adicionais ou algumas regras específicas para preenchimento de campos. Uma boa prática é consultar a nossa [lista de municípios atendidos](https://focusnfe.com.br/cidades-atendidas/) e ver se existe algum artigo escrito sobre especificidades do seu município.

## Status API

Aqui você encontra os status possíveis para NFSe.

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
404 - not found | nao_encontrado | Nota fiscal não encontrada | Verifique o método utilizado (deve-se usar POST) ou a nota fiscal não foi encontrada.
400 - bad request | nfe_cancelada| Nota fiscal já cancelada| Não é possível realizar a operação solicitada, pois a nota fiscal já foi cancelada.
400 - bad request | nfe_nao_autorizada | Nota fiscal não autorizada não pode ser cancelada | O cancelamento só é possível para NFSe's autorizadas.
400 - bad request | requisicao_invalida | | Sua requisição é inválida porque alguns dos paramêtros básicos não foram cumpridos. Consulte a nossa documentação.
400 - bad request | empresa_nao_habilitada | Emitente ainda não habilitado para emissão de NFSe | Configure a emissão de NFSe através do Painel API e tente novamente.
400 - bad request | certificado_vencido | O certificado do emitente está vencido | É necessário renovar ou adquirir um novo certificado digital modelo A1.
422 - unprocessable entity | nfe_autorizada | Nota fiscal já autorizada | A operação solicitada não pode ser realizada, pois a NFSe já foi autorizada.
422 - unprocessable entity | em_processamento | Nota fiscal em processamento | Sua nota está sendo processada pela prefeitura, aguarde alguns minutos antes de consultá-la novamente.

## Envio
```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfse"

# Substituir pela sua identificação interna da nota
ref = {"ref":"12345"}

token="token obtido no cadastro da empresa"

'''
Usamos dicionarios para armazenar os campos e valores que em seguida,
serao convertidos em JSON e enviados para nossa API
'''
nfse = {}
nfse["prestador"] = {}
nfse["servico"] = {}
nfse["tomador"] = {}
nfse["tomador"]["endereco"] = {}

nfse["razao_social"] = "ACME INK"
nfse["data_emissao"] = "2018-02-26T12:00:00-03:00"
nfse["incentivador_cultural"] =  "false"
nfse["natureza_operacao"] = "1"
nfse["optante_simples_nacional"] = "true"
nfse["status"] = "1"
nfse["prestador"]["cnpj"] = "99999999999999"
nfse["prestador"]["inscricao_municipal"] = "99999999"
nfse["prestador"]["codigo_municipio"] = "9999999"
nfse["servico"]["aliquota"] = "2.92"
nfse["servico"]["base_calculo"] = "1.00"
nfse["servico"]["discriminacao"] = "SERVICOS E MAO DE OBRA"
nfse["servico"]["iss_retido"] = "0"
nfse["servico"]["item_lista_servico"] = "1412"
nfse["servico"]["valor_iss"] = "11.68"
nfse["servico"]["valor_liquido"] = "1.00"
nfse["servico"]["valor_servicos"] = "1.00"
nfse["tomador"]["cnpj"] = "99999999999999"
nfse["tomador"]["razao_social"] = "Parkinson da silva coelho JR"
nfse["tomador"]["endereco"]["bairro"] = "São Miriti"
nfse["tomador"]["endereco"]["cep"] = "31999-000"
nfse["tomador"]["endereco"]["codigo_municipio"] = "9999999"
nfse["tomador"]["endereco"]["logradouro"] = "João Batista Netos"
nfse["tomador"]["endereco"]["numero"] = "34"
nfse["tomador"]["endereco"]["uf"] = "MG"

#print (json.dumps(nfse))
r = requests.post(url, params=ref, data=json.dumps(nfse), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```

```shell
# arquivo.json deve conter os dados da NFSe
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T arquivo.json https://homologacao.focusnfe.com.br/v2/nfse
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

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfse?ref="+ref);

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

    nfse.put("data_emissao", "2018-01-15T17:40:00");
    nfse.put("natureza_operacao", "1");
    prestador.put("cnpj", "51916585000125");
    prestador.put("inscricao_municipal", "123456");
    prestador.put("codigo_municipio", "4128104");
    tomador.put("cpf", "51966818092");
    tomador.put("razao_social", "ACME LTDA");
    tomador.put("email", "email-do-tomador@google.com.br");
    tomadorEndereco.put("bairro", "Jardim America");
    tomadorEndereco.put("cep", "82620150");
    tomadorEndereco.put("codigo_municipio", "4106902");
    tomadorEndereco.put("logradouro", "Rua Paulo Centrone");
    tomadorEndereco.put("numero", "168");
    tomadorEndereco.put("uf", "PR");
    servico.put("discriminacao", "Teste de servico");
    servico.put("aliquota", "3.00");
    servico.put("base_calculo", "1.0");
    servico.put("valor_iss", "0");
    servico.put("iss_retido", "false");
    servico.put("codigo_tributario_municipio", "080101");
    servico.put("item_lista_servico", "0801");
    servico.put("valor_servicos", "1.0");
    servico.put("valor_liquido", "1.0");

    /* Depois de fazer o input dos dados, são criados os objetos JSON já com os valores das hash's. */
    JSONObject json = new JSONObject (nfse);
    JSONObject jsonPrestador = new JSONObject (prestador);
    JSONObject jsonTomador = new JSONObject (tomador);
    JSONObject jsonTomadorEndereco = new JSONObject (tomadorEndereco);
    JSONObject jsonServico = new JSONObject (servico);

    /* Aqui adicionamos os objetos JSON nos campos da API como array no JSON principal. */
    json.accumulate("prestador", jsonPrestador);
    json.accumulate("tomador", jsonTomador);
    jsonTomador.accumulate("endereco", jsonTomadorEndereco);
    json.accumulate("servico", jsonServico);

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
url_envio = servidor_homologacao + "v2/nfse?ref=" + ref

# altere os campos conforme a nota que será enviada
dados_da_nota = {
  data_emissao: "2017-09-21T22:15:00",
  prestador: {
      cnpj: "18765499000199",
      inscricao_municipal: "12345",
      codigo_municipio: "3516200"
  },
  tomador: {
      cnpj: "07504505000132",
      razao_social: "Acras Tecnologia da Informação LTDA",
      email: "contato@focusnfe.com.br",
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

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

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
 $nfse = array (
    "data_emissao" => "2017-12-27T17:43:14-3:00",
    "incentivador_cultural" => "false",
    "natureza_operacao" => "1",
    "optante_simples_nacional" => "false",
    "prestador" => array(
        "cnpj" => "51916585000125",
        "inscricao_municipal" => "12345",
        "codigo_municipio" => "4119905"
        ),
    "tomador" => array(
      "cnpj" => "07504505000132",
        "razao_social" => "Acras Tecnologia da Informação LTDA",
        "email" => "contato@focusnfe.com.br",
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
           "discriminacao" => "Exemplo Servi\u00e7o",
           "iss_retido" => "false",
           "item_lista_servico" => "106",
           "codigo_cnae" => "6319400",
           "valor_servicos" => "1.00"
    ),
  );
 // Inicia o processo de envio das informações usando o cURL
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."/v2/nfse?ref=" . $ref);
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_POST, 1);
 curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($nfse));
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
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfse?ref=" + ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var nfse = {
   "data_emissao":"2018-03-21",
   "prestador":{
      "cnpj":"51916585000125",
      "inscricao_municipal":"12345",
      "codigo_municipio":"3518800"
   },
   "tomador":{
      "cnpj":"07504505000132",
      "razao_social":"Acras Tecnologia da Informacao LTDA",
      "email":"contato@focusnfe.com.br",
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
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(nfse));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```


> Exemplos de respostas da API por **status** para a requisição de envio:

> **processando_autorizacao** (requisição enviada com sucesso para API)

```json
{
  "cnpj_prestador": "CNPJ_PRESTADOR",
  "ref": "REFERENCIA",
  "status": "processando_autorizacao"
}
```

> **requisicao_invalida** (requisição com campos faltantes/erro de estrutura no JSON)

```json
{
  "codigo": "requisicao_invalida",
  "mensagem": "Parâmetro \"prestador.codigo_municipio\" não informado"
}
```

Para enviar uma NFSe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Envia uma NFSe para autorização:

`https://api.focusnfe.com.br/v2/nfse?ref=REFERENCIA`

Utilize o comando **HTTP POST** para enviar a sua nota para nossa API.

Nesta etapa, é feita uma primeira validação dos dados da nota. Caso ocorra algum problema, por exemplo, algum campo faltante, formato incorreto
ou algum problema com o prestador a nota **não será aceita para processamento** e será devolvida a mensagem de erro apropriada. Veja a seção [erros](#introducao_erros).

Caso a nota seja validada corretamente, a nota será **aceita para processamento**. Isto significa que a nota irá para uma fila de processamento
onde eventualmente será processada (processamento assíncrono). Com isto, a nota poderá ser autorizada ou ocorrer um erro na autorização de acordo com a validação da prefeitura.

Para verificar se a nota já foi autorizada, você terá que efetuar uma [consulta](#nfse_consulta) ou se utilizar de [gatilhos / webhooks](#gatilhos-webhooks).

## Consulta
```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfse/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

r = requests.get(url+ref, params=completa, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/nfse/12345
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFSeConsulta {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfse/"+ref);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = (ClientResponse) request.get(ClientResponse.class);

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
url_envio = servidor_homologacao + "v2/nfse/" + ref

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
 curl_setopt($ch, CURLOPT_URL, $server."/v2/nfse/" . $ref);
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_HTTPHEADER, array());
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
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfse/" + ref + "?completa=0";

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

> Exemplos de respostas da API por **status** para a requisição de consulta:

> **autorizado**

```json
{
  "cnpj_prestador": "07504505000132",
  "ref": "nfs-2",
  "numero_rps": "224",
  "serie_rps": "1",
  "status": "autorizado",
  "numero": "233",
  "codigo_verificacao": "DU1M-M2Y",
  "data_emissao": "2019-05-27T00:00:00-03:00",
  "url": "https://200.189.192.82/PilotoNota_Portal/Default.aspx?doc=07504505000132&num=233&cod=DUMMY",
  "caminho_xml_nota_fiscal": "/notas_fiscais_servico/NFSe075045050001324106902-004949940-433-DUMMY.xml"
}
```

> **cancelado**

```json
{
  "cnpj_prestador": "07504505000132",
  "ref": "nfs-2",
  "numero_rps": "224",
  "serie_rps": "1",
  "status": "cancelado",
  "numero": "233",
  "codigo_verificacao": "DU1M-M2Y",
  "data_emissao": "2019-05-27T00:00:00-03:00",
  "url": "https://200.189.192.82/PilotoNota_Portal/Default.aspx?doc=07504505000132&num=233&cod=DUMMY",
  "caminho_xml_nota_fiscal": "/notas_fiscais_servico/NFSe075045050001324106902-004949940-433-DUMMY.xml"
}
```

> **erro_autorizacao**

```json
{
  "cnpj_prestador": "07504505000132",
  "ref": "nfs-2",
  "numero_rps": "224",
  "serie_rps": "1",
  "status": "erro_autorizacao",
  "erros": [
    {
      "codigo": "E145",
      "mensagem": "Regime Especial de Tributação ausente/inválido.",
      "correcao": null
    }
  ]
}
```

> **processando_autorizacao**

```json
{
  "cnpj_prestador": "07504505000132",
  "ref": "nfs-2",
  "numero_rps": "224",
  "serie_rps": "1",
  "status": "processando_autorizacao",
}
```

Após emitir uma nota, você poderá usar a operação de consulta para verificar se a nota já foi aceita para processamento, se está
ainda em processamento ou se a nota já foi processada.

Para consultar uma NFSe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Recupera informações sobre a NFSe:

`https://api.focusnfe.com.br/v2/nfse/REFERENCIA`

Utilize o comando **HTTP GET** para consultar a sua nota para nossa API.


* **status:** Indica a etapa do processamento interno da nota fiscal (API Focus NFe e/ou Prefeitura), podendo ser:
   * **autorizado:** A NFSe foi autorizada com sucesso, neste caso, é fornecido os caminhos para acessar a DANFSe e XML.
   * **cancelado:** Indica que a operação de cancelamento do documento foi realizada com sucesso.
   * **erro_autorizacao:** Houve algum erro durante a emissão da NFSe. A mensagem de erro você encontrará dentro do campo "erros". É possível reenviar a nota com a mesma referência após realizar as correções indicadas.
   * **processando_autorizacao:** A NFSe está sendo processada internamente (API Focus NFe) e/ou pela prefeitura, consulte após alguns minutos.
   * **substituido:** Este documento foi substituído por outra NFSe. Consulte o campo numero_nfse_substituta.
* **cnpj_prestador:** O CNPJ emitente da nota fiscal (conhecido também como "prestador do serviço").
* **ref:** Essa é a referência usada na sua requisição.
* **numero_rps:** Número do RPS de controle da Prefeitura.
* **serie_rps:** A série do RPS de controle da Prefeitura.
* **tipo_rps:** O tipo do RPS de controle da Prefeitura.
* **erros:** Quando ocorrerem erros na emissão, será aqui que mostraremos a orientação da Prefeitura.
* **url:** URL para acesso do espelho da nota. Quando a prefeitura disponibiliza uma URL pública, utilizamos o link da própria prefeitura, caso contrário criamos o nosso próprio espelho através de um link interno.
* **url_danfse:** URL para acesso e download do DANFSe (versão PDF). A versão em PDF está disponível no momento apenas para alguns municípios. Entre em contato conosco caso precise da versão em PDF para o seu município.
* **data_emissao:** Data da emissão da nota fiscal.
* **caminho_xml_nota_fiscal:** Caminho para acesso e download do XML da nota fiscal.
* **codigo_verificacao:** Código de verificação para consulta da NFSe, pode ser usado no portal da cidade para consulta.
* **numero_nfse_substituida** Caso a nota seja autorizada e seja uma nota de substituição, este campo irá indicar o número da NFSe substituída.
* **numero_nfse_substituta** Caso a nota seja autorizada e alguma outra nota substituta tenha sido emitido pela nossa API este campo irá indicar o seu número. No momento só é possível fazer esta associação se a nota substituta for emitida pela nossa API.

### Download do XML e consulta do documento auxiliar da NFSe

Após a autorização da nota fiscal de serviço eletrônica será disponibilizado os campos:

*  **caminho_xml_nota_fiscal** - Representa o caminho para montar a URL para download do XML. Por exemplo, se você utilizou o servidor api.focusnfe.com.br e o caminho_xml_nota_fiscal contém o caminho "/notas_fiscais_servico/NFSe075045050001324106902-004940940-428-DUMMY.xml" você poderá acessar o XML pela URL completa https://api.focusnfe.com.br/notas_fiscais_servico/NFSe075045050001324106902-004940940-428-DUMMY.xml
* **url**. A URL para consultar a NFSe direto no portal da prefeitura.

Utilize o método **HTTP GET** para ambas as consultas.

Não há obrigatoriedade legal de salvar o XML da nota, salvo quando o município utiliza NFe (modelo 55) ou
NFCe (modelo 65) para emissão de notas de prestação de serviços. Nestes casos nossa API faz a guarda automática
dos arquivos.

## Cancelamento
```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfse/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
justificativa={}
justificativa["justificativa"] = "Sua justificativa aqui!"

r = requests.delete(url+ref, data=json.dumps(justificativa), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X DELETE -d '{"justificativa":"Teste de cancelamento de nota"}' \
  https://homologacao.focusnfe.com.br/v2/nfse/12345
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

public class NFSeCancelamento {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfse/"+ref);

    /* Aqui criamos um hashmap para receber a chave "justificativa" e o valor desejado. */
    HashMap<String, String> justificativa = new HashMap<String, String>();
    justificativa.put("justificativa", "Informe aqui a sua justificativa para realizar o cancelamento da NFSe.");

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
url_envio = servidor_homologacao + "v2/nfse/" + ref

# altere os campos conforme a nota que será enviada
justificativa_cancelamento = {
  justificativa: "Informe aqui a sua justificativa para realizar o cancelamento da NFSe."
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

```php
<?php
 // Você deve definir isso globalmente para sua aplicação
 $ch = curl_init();
 // Substituir pela sua identificação interna da nota
 $ref   = "12345";
 // Para ambiente de produção use a variável abaixo:
 // $server = "https://api.focusnfe.com.br";
 $server = "https://homologacao.focusnfe.com.br";
 $justificativa = array ("justificativa" => "Teste de cancelamento de nota");
 $login = "token obtido no cadastro da empresa";
 $password = "";
 curl_setopt($ch, CURLOPT_URL, $server . "/v2/nfse/" . $ref);
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
 curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($justificativa));
 curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
 curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
 $body = curl_exec($ch);
 $result = curl_getinfo($ch, CURLINFO_HTTP_CODE);
 //as três linhas abaixo imprimem as informações retornadas pela API, aqui o seu sistema deverá
 //interpretar e lidar com o retorno
 print($result."\n");
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
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfse/"+ ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('DELETE', url, false, token);

var cancelar = {

  "justificativa": "Sua justificativa aqui!"
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(cancelar));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

> Exemplos de respostas da API por **status** para a requisição de cancelamento:

> **cancelado** (requisição realizada com sucesso)

```json
{
  "status": "cancelado"
}
```

> **erro_cancelamento** (requisição com erro)

```json
{
  "status": "erro_cancelamento",
  "erros": [
    {
      "codigo": "E523",
      "mensagem": "nota que você está tentando cancelar está fora do prazo permitido para cancelamento",
      "correcao": null
    }
  ]
}
```

> **nfe_cancelada** (quando a nota já consta como cancelada)

```json
{
  "codigo": "nfe_cancelada",
  "mensagem": "Nota Fiscal já cancelada"
}
```


Para cancelar uma NFSe, basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

**Cancelar uma NFSe já autorizada:**

`https://api.focusnfe.com.br/v2/nfse/REFERENCIA`

Utilize o comando **HTTP DELETE** para cancelar a sua nota para nossa API.
Este método é síncrono, ou seja, a comunicação com a prefeitura será feita imediatamente e devolvida a resposta na mesma requisição.

O parâmetro de cancelamento deverá ser enviado da seguinte forma:

* **justificativa**: Justificativa do cancelamento. Deverá conter de 15 a 255 caracteres.

A API irá em seguida devolver os seguintes campos:

* **status**: cancelado, se a nota pode ser cancelada, ou erro_cancelamento, se houve algum erro ao cancelar a nota.
* **erros**: um array de mensagens de erro que impedem que a nota seja cancelada .

**Prazo de cancelamento**
A NFSe não possui um prazo padrão para cancelamento como vemos na NFCe, por exemplo. Outro detalhe importante é que como alguns municípios não possuem ambiente de homologação, é preciso emitir as notas de teste em produção. Sendo assim, recomendamos que sempre consulte o seu município antes de emitir uma NFSe.



## Reenvio de email
```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfse/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
emails = {}
email = "suporte@focusnfe.com.br"
emails["emails"] = [email]

r = requests.delete(url+ref+"/email", data=json.dumps(emails), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```



```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"emails":["alguem@example.org"]}' \
  https://homologacao.focusnfe.com.br/v2/nfse/12345/email
```

```java
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFSeEnviaEmail {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfse/"+ref+"/email");

    /* Criamos o um objeto JSON que receberá um JSON Array com a lista de e-mails. */
    JSONObject json = new JSONObject ();
    JSONArray listaEmails = new JSONArray();
    listaEmails.put("email_01@focusnfe.com.br");
    listaEmails.put("email_02@focusnfe.com.br");
    listaEmails.put("email_03@focusnfe.com.br");
    json.put("emails", listaEmails);

    /* Testar se o JSON gerado está dentro do formato esperado.
    System.out.print(json); */

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

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

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfse/" + ref + "/email"

# altere os campos conforme a nota que será enviada
emails_destinatarios = {
  emails: ["email_01@focusnfe.com.br", "email_02@focusnfe.com.br", "email_03@focusnfe.com.br"]
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
requisicao.body = emails_destinatarios.to_json

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
 // Você deve definir isso globalmente para sua aplicação
 // Para ambiente de produção use a variável abaixo:
 // $server = "https://api.focusnfe.com.br";
 $server = "https://homologacao.focusnfe.com.br";
 // Substituir pela sua identificação interna da nota
 $ref = "12345";
 $login = "token obtido no cadastro da empresa";
 $password = "";
 $email = array (
   "emails" => array(
     "email@email.com"
     )
   );
 // Inicia o processo de envio das informações usando o cURL
 $ch = curl_init();
 curl_setopt($ch, CURLOPT_URL, $server."/v2/nfse/" . $ref . "/email");
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 curl_setopt($ch, CURLOPT_POST, 1);
 curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($email));
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
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfse/" + ref + "/email";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var email = ["email1@focusnfe.com.br", "email2@focusnfe.com.br", "email3@focusnfe.com.br"];

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
var json = JSON.stringify({"emails": email});

request.send(json);

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```



Para cada nota autorizada, cancelada ou que tenha sido emitida uma carta de correção o destinatário da nota é notificado via email. Porém eventualmente pode ser necessário enviar a nota fiscal para outras pessoas ou mesmo reenviar o email para o mesmo destinatário.

Para enviar um ou mais emails:

`https://api.focusnfe.com.br/v2/nfse/REFERENCIA/email`

Utilize o comando **HTTP POST** para enviar os emails. Esta operação aceita apenas um parâmetro:

* **emails**: Array com uma lista de emails que deverão receber uma cópia da nota. Limitado a 10 emails por vez.

A API imediatamente devolve a requisição com a confirmação dos emails. Os emails serão enviados em segundo plano, por isso pode levar alguns minutos até que eles cheguem à caixa postal.
