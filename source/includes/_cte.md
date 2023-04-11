# CTe e CTe OS

Através da API CTe é possível:

* Emitir CTe (Conhecimento de Transporte Eletrônico) utilizando dados simplificados. Este processo é **assíncrono**. Ou seja, após a emissão a nota será enfileirada para processamento.
* Emitir CTe OS (outros serviços) utilizando dados simplificados. Este processo é **síncrono**. Ou seja, na mesma requisição é feito processamento da CTe.
* Cancelar uma CTe de qualquer modelo.
* Consultar o status de CTe emitidas.
* Emitir os eventos: carta de correção, prestação em desacordo, registro multimodal e informações GTV (apenas CTe OS)
* Inutilizar uma faixa de numeração de CTe de qualquer modelo

## URLs


Método | URL (recurso) | Ação
-------|-------|-----
POST |  /v2/cte?ref=REFERENCIA  | Cria uma CTe a envia para processamento.
POST |  /v2/cte_os?ref=REFERENCIA | Emite uma CTe OS.
GET  | /v2/cte/REFERENCIA | Consulta a CTe com a referência informada e o seu status de processamento
DELETE |  /v2/cte/REFERENCIA  | Cancela uma CTe com a referência informada
POST |  /v2/cte/REFERENCIA/carta_correcao | Cria uma carta de correção para a CTe com a referência informada.
POST |  /v2/cte/inutilizacao  | Inutiliza uma numeração da CTe

## Campos de um CTe

> Abaixo um exemplo de dados de uma CTe:

```json

{
  "modal_aereo": {
    "numero_minuta": "000001234",
    "numero_operacional": "12345678901",
    "data_prevista_entrega": "2018-01-01",
    "dimensao_carga": "1234X1234X1234",
    "informacoes_manuseio": "03",
    "classe_tarifa": "G",
    "codigo_tarifa": "123",
    "valor_tarifa": "123.00"
  },
  "cfop": "5353",
  "natureza_operacao": "PREST. DE SERV. TRANSPORTE A ESTAB. COMERCIAL",
  "data_emissao": "2018-05-17T11:13:04-03:00",
  "tipo_documento": 0,
  "codigo_municipio_envio": "2927408",
  "municipio_envio": "Salvador",
  "uf_envio": "BA",
  "codigo_municipio_inicio": 2927408,
  "tipo_servico": 0,
  "municipio_inicio": "Salvador",
  "uf_inicio": "BA",
  "codigo_municipio_fim": "2927408",
  "municipio_fim": "Salvador",
  "uf_fim": "BA",
  "retirar_mercadoria": "0",
  "detalhes_retirar": "Teste detalhes retirar",
  "indicador_inscricao_estadual_tomador": "9",
  "tomador": "3",
  "caracterisca_adicional_transporte": "c.adic.transp.",
  "caracterisca_adicional_servico": "Teste caract add servico",
  "funcionario_emissor": "func.emiss",
  "codigo_interno_origem": "Teste codigo interno origem",
  "codigo_interno_passagem": "codIntPass",
  "codigo_interno_destino": "Teste codigo interno destino",
  "codigo_rota": "cod rota",
  "tipo_programacao_entrega": "0",
  "sem_hora_tipo_hora_programada": "0",
  "cnpj_emitente": "11111451000111",
  "cpf_remetente": "08111727908",
  "nome_remetente": "CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  "telefone_remetente": "7734629600",
  "logradouro_remetente": "R. XYZ",
  "numero_remetente": "1205",
  "bairro_remetente": "Vila Perneta",
  "codigo_municipio_remetente": "4119152",
  "municipio_remetente": "Pinhais",
  "uf_remetente": "PR",
  "cep_remetente": "83124310",
  "codigo_pais_remetente": "1058",
  "pais_remetente": "Brasil",
  "cnpj_destinatario": "00112222000149",
  "inscricao_estadual_destinatario": "02220020926081",
  "nome_destinatario": "CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  "telefone_destinatario": "7333332600",
  "logradouro_destinatario": "R. Alto Parana",
  "numero_destinatario": "190",
  "bairro_destinatario": "Sao Cristovao",
  "codigo_municipio_destinatario": "2927408",
  "municipio_destinatario": "Salvador",
  "uf_destinatario": "BA",
  "cep_destinatario": "83222380",
  "codigo_pais_destinatario": "1058",
  "pais_destinatario": "Brasil",
  "email_destinatario": "fiscal@example.com",
  "valor_total": "1500.00",
  "valor_receber": "750.00",
  "icms_situacao_tributaria": "00",
  "icms_base_calculo": "50635.27",
  "icms_aliquota": "17.00",
  "icms_valor": "8608.00",
  "valor_total_carga": "200000.00",
  "produto_predominante": "teste produto carga",
  "outras_caracteristicas_carga": "teste caracteristicas carga",
  "quantidades": [
    {
      "codigo_unidade_medida": "01",
      "tipo_medida": "PESO BRUTO",
      "quantidade": "1.0000"
    },
    {
      "codigo_unidade_medida": "02",
      "tipo_medida": "PESO BRUTO",
      "quantidade": "2.0000"
    }
  ],
  "valor_carga_averbacao": "200000.00",
  "nfes": [
    {
      "chave_nfe": "35122225222278000855550010000002821510931504",
      "pin_suframa": "1234",
      "data_prevista": "2018-05-07"
    }
  ],
  "valor_original_fatura": "12000.00",
  "valor_desconto_fatura": "1000.00",
  "valor_liquido_fatura": "11000.00",
  "duplicatas": [
    {
      "data_vencimento": "2018-05-07",
      "valor": "13000.00"
    }
  ]
}
```


A CTe possui vários campos para os mais variados tipos e formas de operações, por isso, criamos uma página exclusiva que mostra todos os campos da nossa API para o envio de CTe. Nela, você pode buscar os campos pela TAG XML ou pela nossa tradução para API.

[Documentação completa dos campos CTe](https://campos.focusnfe.com.br/cte_cteos/ConhecimentoTransporteXML.html)

[Documentação completa dos campos CTe OS](https://campos.focusnfe.com.br/cte_cteos/ConhecimentoTransporteOsXML.html)

Além dos campos descritos acima, cada CTe deverá obrigatoriamente informar um **modal**, que é a forma de transporte da carga. Você deverá informar uma das seguintes chaves nos dados, clique em cada link para visualizar os campos completos:

* modal_rodoviario para transporte rodoviário. [Consulte campos para CTe](https://campos.focusnfe.com.br/cte_cteos/TransporteRodoviarioXML.html) e [Consulte campos para CTe OS](https://campos.focusnfe.com.br/cte_cteos/TransporteRodoviarioOsXML.html)
* modal_aereo [para transporte aéreo.] (https://campos.focusnfe.com.br/cte_cteos/TransporteAereoXML.html)
* modal_aquaviario [para transporte aquaviário.] (https://campos.focusnfe.com.br/cte_cteos/TransporteAquaviarioXML.html)
* modal_ferroviario [para transporte ferroviário.] (https://campos.focusnfe.com.br/cte_cteos/TransporteFerroviarioXML.html)
* modal_dutoviario [para transporte dutoviário.] (https://campos.focusnfe.com.br/cte_cteos/TransporteDutoviarioXML.html)
* modal_multimodal [para transporte que utilize mais de um modal.] (https://campos.focusnfe.com.br/cte_cteos/TransporteMultimodalXML.html)

Para CTe-OS é necessário informar dados adicionais do modal **apenas quando este for rodoviário**. Nos outros casos não é necessário.

## Status API

Aqui você encontra os status possíveis para CTe e CTe OS.

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
422 - unprocessable entity | erro_validacao_schema | Erro na validação do Schema XML | Verifique o detalhamento do erro na resposta da API.
400 - bad request | forma_emissao_invalida | A forma de emissão utilizada é inválida | As formas de emissão disponíveis estão contidas na documentação da API.
400 - bad request | campos_invalidos | O parâmetro 'numero' não foi informado | É necessário informar o número do CTe, use o campo "numero" em seu JSON.
400 - bad request | campos_invalidos | O parâmetro 'serie' não foi informado | É necessário informar a série do CTe, use o campo "serie" em seu JSON.
400 - bad request | campos_invalidos | OCampo 'X não é válido | Onde X é o nome do campo inválido. Verifique a documentação dos campos da API para CTe ou CTe OS.
400 - bad request | modelo_invalido | Para esta URL só é permitida a emissão de CT-e modelo 57 | Será exibida essa mensagem quando for usado a URL de CTe para emissão de CTe OS ou vice-versa. Consulte as documentações sobre esses documentos.
400 - bad request | campos_invalidos_modal | Esse status indica erros nos campos do modal usado. Verifique os campos informados e compare com a nossa documentação de campos.
400 - bad request | empresa_nao_habilitada | Empresa ainda não habilitada para emissão de CT-e | Verifique o cadastro do emitente no Painel API, deve-se habilitar CTe e/ou CTe OS para começar a emitir este documento.
409 - conflict | cte_ja_autorizado | Já existe um CT-e autorizado utilizando esta referência | Altere a referência da requisição e tente novamente.
409 - conflict | cte_em_processamento | Já existe um CT-e utilizando essa referencia e ele está em processamento | Altere a referência da requisição e tente novamente.
404 - not found | nao_encontrado | CT-e não encontrado| CT-e informado na requisição não foi encontrado.
400 - bad request | nao_autorizado| CT-e não autorizado | CT-e informado na requisição não foi autorizado, informe o evento GTV apenas para CTe O.S(modelo 67).
400 - bad request | requisicao_invalida | Sua requisição é inválida porque alguns dos paramêtros básicos não foram cumpridos. Entre em contato com o nosso suporte.


## Envio

```shell
# arquivo.json deve conter os dados da CTe
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T cte.json https://homologacao.focusnfe.com.br/v2/cte?ref=12345
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T cte_os.json https://homologacao.focusnfe.com.br/v2/cte_os?ref=12345
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

public class Autorizar {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interno do CTe. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/cte_os?ref="+ref);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    /* Aqui são criados as hash's que receberão os dados do CTe. */
    HashMap<String, String> cte = new HashMap<String, String>();
    HashMap<String, String> seguroCarga = new HashMap<String, String>();
    HashMap<String, String> documentosReferenciados = new HashMap<String, String>();

    cte.put("bairro_emitente","Sao Cristova");
    cte.put("bairro_tomador","Bacacheri");
    cte.put("cep_emitente","99880077");
    cte.put("cep_tomador","88991188");
    cte.put("cfop","5353");
    cte.put("cnpj_emitente","51916585000125");
    cte.put("cnpj_tomador","51966818092777");
    cte.put("codigo_municipio_emitente","2927408");
    cte.put("codigo_municipio_envio","5200050");
    cte.put("codigo_municipio_fim","3100104");
    cte.put("codigo_municipio_inicio","5200050");
    cte.put("codigo_municipio_tomador","4106902");
    cte.put("codigo_pais_tomador","1058");
    cte.put("complemento_emitente","Andar 19 - sala 23");
    cte.put("data_emissao","2018-06-18T09:17:00");
    cte.put("descricao_servico","Descricao do seu servico aqui");
    cte.put("funcionario_emissor","Nome do funcionario que fez a emissao");
    cte.put("icms_aliquota","17.00");
    cte.put("icms_base_calculo","1.00");
    cte.put("icms_situacao_tributaria","00");
    cte.put("icms_valor","0.17");
    cte.put("indicador_inscricao_estadual_tomador","9");
    cte.put("inscricao_estadual_emitente","12345678");
    cte.put("logradouro_emitente","Aeroporto Internacional de Salvador");
    cte.put("logradouro_tomador","Rua Joao Dalegrave");
    cte.put("modal","02");
    cte.put("municipio_emitente","Salvador");
    cte.put("municipio_envio","Abadia de Goias");
    cte.put("municipio_fim","Abadia dos Dourados");
    cte.put("municipio_inicio","Abadia de Goias");
    cte.put("municipio_tomador","Curitiba");
    cte.put("natureza_operacao","PREST. DE SERV. TRANSPORTE A ESTAB. COMERCIAL");
    cte.put("nome_emitente","ACME LTDA");
    cte.put("nome_fantasia_emitente","ACME");
    cte.put("nome_fantasia_tomador","Nome do tomador do servico aqui");
    cte.put("nome_tomador","NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL");
    cte.put("numero_emitente","S/N");
    cte.put("numero_fatura","1");
    cte.put("numero_tomador","1");
    cte.put("pais_tomador","BRASIL");
    cte.put("quantidade","1.0000");
    cte.put("telefone_emitente","4133336666");
    cte.put("tipo_documento","0");
    cte.put("tipo_servico","6");
    cte.put("uf_emitente","BA");
    cte.put("uf_envio","GO");
    cte.put("uf_fim","MG");
    cte.put("uf_inicio","GO");
    cte.put("uf_tomador","PR");
    cte.put("valor_desconto_fatura","0.00");
    cte.put("valor_inss","0.10");
    cte.put("valor_liquido_fatura","1.00");
    cte.put("valor_original_fatura","1.00");
    cte.put("valor_receber","1.00");
    cte.put("valor_total","1.00");
    cte.put("valor_total_tributos","0.00");
    segurosCarga.put("nome_seguradora","Nome da seguradora aqui");
    segurosCarga.put("numero_apolice","12345");
    segurosCarga.put("responsavel_seguro","4");
    documentosReferenciados.put("data_emissao","2018-06-18");
    documentosReferenciados.put("numero","1");
    documentosReferenciados.put("serie","1");
    documentosReferenciados.put("subserie","1");
    documentosReferenciados.put("valor","1.00");

    /* Depois de fazer o input dos dados, são criados os objetos JSON já com os valores das hash's. */
    JSONObject json = new JSONObject (cte);
    JSONObject jsonSegurosCarga = new JSONObject (segurosCarga);
    JSONObject jsonDocumentosReferenciados = new JSONObject (documentosReferenciados);

    /* Aqui adicionamos os objetos JSON nos campos da API como array no JSON principal. */
    json.append("segurosCarga", jsonSegurosCarga);
    json.append("documentosReferenciados", jsonDocumentosReferenciados);

    /* É recomendado verificar como os dados foram gerados em JSON e se ele está seguindo a estrutura especificada em nossa documentação.*/
    //System.out.print(json);

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
url_envio = servidor_homologacao + "v2/cte?ref=" + ref

# altere os campos conforme a nota que será enviada
cte = {
  bairro_emitente: "Sao Cristovao",
  bairro_tomador: "Bacacheri",
  cep_emitente: "99880077",
  cep_tomador: "88991188",
  cfop: "5353",
  cnpj_emitente: "51916585000125",
  cnpj_tomador: "51966818092777",
  codigo_municipio_emitente: "2927408",
  codigo_municipio_envio: "5200050",
  codigo_municipio_fim: "3100104",
  codigo_municipio_inicio: "5200050",
  codigo_municipio_tomador: "4106902",
  codigo_pais_tomador: "1058",
  complemento_emitente: "Andar 19 - sala 23",
  data_emissao: "2018-06-18T09:17:00",
  descricao_servico: "Descricao do seu servico aqui",
  documentos_referenciados: [
    {
      data_emissao: "2018-06-10",
      numero: "1",
      serie: "1",
      subserie: "1",
      valor: "1.00"
    }
  ]
  funcionario_emissor: "Nome do funcionario que fez a emissao",
  icms_aliquota: "17.00",
  icms_base_calculo: "1.00",
  icms_situacao_tributaria: "00",
  icms_valor: "0.17",
  indicador_inscricao_estadual_tomador: "9",
  inscricao_estadual_emitente: "12345678",
  logradouro_emitente: "Aeroporto Internacional de Salvador",
  logradouro_tomador: "Rua Joao Dalegrave",
  modal: "02",
  municipio_emitente: "Salvador",
  municipio_envio: "Abadia de Goias",
  municipio_fim: "Abadia dos Dourados",
  municipio_inicio: "Abadia de Goias",
  municipio_tomador: "Curitiba",
  natureza_operacao: "PREST. DE SERV. TRANSPORTE A ESTAB. COMERCIAL",
  nome_emitente: "ACME LTDA",
  nome_fantasia_emitente: "ACME",
  nome_fantasia_tomador: "Nome do tomador do servico aqui",
  nome_tomador: "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  numero_emitente: "S/N",
  numero_fatura: "1",
  numero_tomador: "1",
  pais_tomador: "BRASIL",
  quantidade: "1.00",
  seguros_carga: [
    {
      nome_seguradora: "Nome da seguradora aqui",
      numero_apolice: "12345",
      responsavel_seguro: 4
    }
  ],
  telefone_emitente: "4133336666",
  tipo_documento: 0,
  tipo_servico: 6,
  uf_emitente: "BA",
  uf_envio: "GO",
  uf_fim: "MG",
  uf_inicio: "GO",
  uf_tomador: "PR",
  valor_desconto_fatura: "0.00",
  valor_inss: "0.10",
  valor_liquido_fatura: "1.00",
  valor_original_fatura: "1.00",
  valor_receber: "1.00",
  valor_total: "1.00",
  valor_total_tributos: "0.00"
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
requisicao.body = cte.to_json

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

// Substituir pela sua identificação interno do CTe.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/cte_os?ref=" + ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API.
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var cte = {
   "bairro_emitente":"S\u00e3o Cristov\u00e3o",
   "bairro_tomador":"Bacacheri",
   "cep_emitente":"99880077",
   "cep_tomador":"88991188",
   "cfop":"5353",
   "cnpj_emitente":"51916585000125",
   "cnpj_tomador":"51966818092777",
   "codigo_municipio_emitente":"2927408",
   "codigo_municipio_envio":"5200050",
   "codigo_municipio_fim":"3100104",
   "codigo_municipio_inicio":"5200050",
   "codigo_municipio_tomador":"4106902",
   "codigo_pais_tomador":"1058",
   "complemento_emitente":"Andar 19 - sala 23",
   "data_emissao":"2018-06-18T09:17:00",
   "descricao_servico":"Descricao do seu servico aqui",
   "documentos_referenciados":[
      {
         "data_emissao":"2018-06-10",
         "numero":"1",
         "serie":"1",
         "subserie":"1",
         "valor":"1.00"
      }
   ],
   "funcionario_emissor":"Nome do funcionario que fez a emissao",
   "icms_aliquota":"17.00",
   "icms_base_calculo":"1.00",
   "icms_situacao_tributaria":"00",
   "icms_valor":"0.17",
   "indicador_inscricao_estadual_tomador":"9",
   "inscricao_estadual_emitente":"12345678",
   "logradouro_emitente":"Aeroporto Internacional de Salvador",
   "logradouro_tomador":"Rua Jo\u00e3o Dalegrave",
   "modal":"02",
   "municipio_emitente":"Salvador",
   "municipio_envio":"Abadia de Goi\u00e1s",
   "municipio_fim":"Abadia dos Dourados",
   "municipio_inicio":"Abadia de Goi\u00e1s",
   "municipio_tomador":"Curitiba",
   "natureza_operacao":"PREST. DE SERV. TRANSPORTE A ESTAB. COMERCIAL",
   "nome_emitente":"ACME LTDA",
   "nome_fantasia_emitente":"ACME",
   "nome_fantasia_tomador":"Nome do tomador do servico aqui",
   "nome_tomador":"NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
   "numero_emitente":"S/N",
   "numero_fatura":"1",
   "numero_tomador":"1",
   "pais_tomador":"BRASIL",
   "quantidade":"1.00",
   "seguros_carga":[
      {
         "nome_seguradora":"Nome da seguradora aqui",
         "numero_apolice":"12345",
         "responsavel_seguro":4
      }
   ],
   "telefone_emitente":"4133336666",
   "tipo_documento":0,
   "tipo_servico":6,
   "uf_emitente":"BA",
   "uf_envio":"GO",
   "uf_fim":"MG",
   "uf_inicio":"GO",
   "uf_tomador":"PR",
   "valor_desconto_fatura":"0.00",
   "valor_inss":"0.10",
   "valor_liquido_fatura":"1.00",
   "valor_original_fatura":"1.00",
   "valor_receber":"1.00",
   "valor_total":"1.00",
   "valor_total_tributos":"0.00"
};

// Aqui fazermos a serializacao do JSON com os dados do CTe e enviamos para API.
request.send(JSON.stringify(cte));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```php
<?php

// Para ambiente de produção use a variável abaixo:
// $server = "https://api.focusnfe.com.br/";

$server = "https://homologacao.focusnfe.com.br";

// Substituir pela sua identificação interno do CTe.
$ref = "12345";

$login = "Token_obtido_no_cadastro_da_empresa";

$password = "";

$cte = array (
   "bairro_emitente" => "S\u00e3o Cristov\u00e3o",
   "bairro_tomador" => "Bacacheri",
   "cep_emitente" => "99880077",
   "cep_tomador" => "88991188",
   "cfop" => "5353",
   "cnpj_emitente" => "51916585000125",
   "cnpj_tomador" => "51966818092777",
   "codigo_municipio_emitente" => "2927408",
   "codigo_municipio_envio" => "5200050",
   "codigo_municipio_fim" => "3100104",
   "codigo_municipio_inicio" => "5200050",
   "codigo_municipio_tomador" => "4106902",
   "codigo_pais_tomador" => "1058",
   "complemento_emitente" => "Andar 19 - sala 23",
   "data_emissao" => "2018-06-18T09:17:00",
   "descricao_servico" => "Descricao do seu servico aqui",
   "documentos_referenciados" => array(
      array (
         "data_emissao" => "2018-06-10",
         "numero" => "1",
         "serie" => "1",
         "subserie" => "1",
         "valor" => "1.00"
      )
   ),
   "funcionario_emissor" => "Nome do funcionario que fez a emissao",
   "icms_aliquota" => "17.00",
   "icms_base_calculo" => "1.00",
   "icms_situacao_tributaria" => "00",
   "icms_valor" => "0.17",
   "indicador_inscricao_estadual_tomador" => "9",
   "inscricao_estadual_emitente" => "12345678",
   "logradouro_emitente" => "Aeroporto Internacional de Salvador",
   "logradouro_tomador" => "Rua Jo\u00e3o Dalegrave",
   "modal" => "02",
   "municipio_emitente" => "Salvador",
   "municipio_envio" => "Abadia de Goi\u00e1s",
   "municipio_fim" => "Abadia dos Dourados",
   "municipio_inicio" => "Abadia de Goi\u00e1s",
   "municipio_tomador" => "Curitiba",
   "natureza_operacao" => "PREST. DE SERV. TRANSPORTE A ESTAB. COMERCIAL",
   "nome_emitente" => "ACME LTDA",
   "nome_fantasia_emitente" => "ACME",
   "nome_fantasia_tomador" => "Nome do tomador do servico aqui",
   "nome_tomador" => "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
   "numero_emitente" => "S/N",
   "numero_fatura" => "1",
   "numero_tomador" => "1",
   "pais_tomador" => "BRASIL",
   "quantidade" => "1.00",
   "seguros_carga" => array(
      array (
         "nome_seguradora" => "Nome da seguradora aqui",
         "numero_apolice" => "12345",
         "responsavel_seguro" => 4
      )
   ),
   "telefone_emitente" => "4133336666",
   "tipo_documento" => 0,
   "tipo_servico" => 6,
   "uf_emitente" => "BA",
   "uf_envio" => "GO",
   "uf_fim" => "MG",
   "uf_inicio" => "GO",
   "uf_tomador" => "PR",
   "valor_desconto_fatura" => "0.00",
   "valor_inss" => "0.10",
   "valor_liquido_fatura" => "1.00",
   "valor_original_fatura" => "1.00",
   "valor_receber" => "1.00",
   "valor_total" => "1.00",
   "valor_total_tributos" => "0.00"
);

// Inicia o processo de envio das informações usando o cURL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/cte?ref=" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($cte));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

//As três linhas abaixo imprimem as informações retornadas pela API, aqui o seu sistema devera interpretar e lidar com o retorno.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>



```

```python
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/cte_os"

# Substituir pela sua identificação interno do CTe.
ref = {"ref":"12345"}

token="Token_obtido_no_cadastro_da_empresa"

'''
Usamos dicionarios para armazenar os campos e valores que em seguida,
serao convertidos em JSON e enviados para nossa API.
'''
cte_os = {}
seguros_carga = {}
documentos_referenciados ={}

cte_os["bairro_emitente"] = "S\u00e3o Cristov\u00e3o"
cte_os["bairro_tomador"] = "Bacacheri"
cte_os["cep_emitente"] = "99880077"
cte_os["cep_tomador"] = "88991188"
cte_os["cfop"] = "5353"
cte_os["cnpj_emitente"] = "51916585000125"
cte_os["cnpj_tomador"] = "51966818092777"
cte_os["codigo_municipio_emitente"] = "2927408"
cte_os["codigo_municipio_envio"] = "5200050"
cte_os["codigo_municipio_fim"] = "3100104"
cte_os["codigo_municipio_inicio"] = "5200050"
cte_os["codigo_municipio_tomador"] = "4106902"
cte_os["codigo_pais_tomador"] = "1058"
cte_os["complemento_emitente"] = "Andar 19 - sala 23"
cte_os["data_emissao"] = "2018-06-18T09:17:00"
cte_os["descricao_servico"] = "Descricao do seu servico aqui"
documentos_referenciados["data_emissao"] = "2018-06-10"
documentos_referenciados["numero"] = "1"
documentos_referenciados["serie"] = "1"
documentos_referenciados["subserie"] = "1"
documentos_referenciados["valor"] = "1.00"
cte_os["funcionario_emissor"] = "Nome do funcionario que fez a emissao"
cte_os["icms_aliquota"] = "17.00"
cte_os["icms_base_calculo"] = "1.00"
cte_os["icms_situacao_tributaria"] = "00"
cte_os["icms_valor"] = "0.17"
cte_os["indicador_inscricao_estadual_tomador"] = "9"
cte_os["inscricao_estadual_emitente"] = "12345678"
cte_os["logradouro_emitente"] = "Aeroporto Internacional de Salvador"
cte_os["logradouro_tomador"] = "Rua Jo\u00e3o"
cte_os["modal"] = "02"
cte_os["municipio_emitente"] = "Salvador"
cte_os["municipio_envio"] = "Abadia de Goi\u00e1s"
cte_os["municipio_fim"] = "Abadia dos Dourados"
cte_os["municipio_inicio"] = "Abadia de Goi\u00e1s"
cte_os["municipio_tomador"] = "Curitiba"
cte_os["natureza_operacao"] = "PREST. DE SERV. TRANSPORTE A ESTAB. COMERCIAL"
cte_os["nome_emitente"] = "ACME LTDA"
cte_os["nome_fantasia_emitente"] = "ACME"
cte_os["nome_fantasia_tomador"] = "Nome do tomador do servico aqui"
cte_os["nome_tomador"] = "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL"
cte_os["numero_emitente"] = "S/N"
cte_os["numero_fatura"] = "1"
cte_os["numero_tomador"] = "1"
cte_os["pais_tomador"] = "BRASIL"
cte_os["quantidade"] = "1.00"
seguros_carga["nome_seguradora"] = "Nome da seguradora aqui"
seguros_carga["numero_apolice"] = "12345"
seguros_carga["responsavel_seguro"] = "4"
cte_os["telefone_emitente"] = "4133336666"
cte_os["tipo_documento"] = "0"
cte_os["tipo_servico"] = "6"
cte_os["uf_emitente"] = "BA"
cte_os["uf_envio"] = "GO"
cte_os["uf_fim"] = "MG"
cte_os["uf_inicio"] = "GO"
cte_os["uf_tomador"] = "PR"
cte_os["valor_desconto_fatura"] = "0.00"
cte_os["valor_inss"] = "0.10"
cte_os["valor_liquido_fatura"] = "1.00"
cte_os["valor_original_fatura"] = "1.00"
cte_os["valor_receber"] = "1.00"
cte_os["valor_total"] = "1.00"
cte_os["valor_total_tributos"] = "0.00"

# Adicionamos os dados das variaveis seguros_carga e documentos_referenciados como listas ao dicionario principal.
cte_os["seguros_carga"] = [seguros_carga]
cte_os["documentos_referenciados"] = [documentos_referenciados]

r = requests.post(url, params=ref, data=json.dumps(cte_os), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API.
print(r.status_code, r.text)

```

Para enviar uma CTe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Envia uma **CTe** para autorização:

`https://api.focusnfe.com.br/v2/cte?ref=REFERENCIA`

Utilize o comando **HTTP POST** para enviar a sua nota para nossa API. Envie como corpo do POST os dados em formato JSON da CTe.

Nesta etapa, é feita uma primeira validação dos dados da nota. Caso ocorra algum problema, por exemplo, algum campo faltante, formato incorreto
ou algum problema com o emitente a nota **não será aceita para processamento** e será devolvida a mensagem de erro apropriada. Veja a seção [erros](#introducao_erros).

Caso a nota seja validada corretamente, a nota será **aceita para processamento**. Isto significa que a nota irá para uma fila de processamento
onde eventualmente será processada (processamento assíncrono). Com isto, a nota poderá ser autorizada ou ocorrer um erro na autorização, de acordo com a validação da SEFAZ.

Para verificar se a nota já foi autorizada, você terá que efetuar uma [consulta](#cte-e-cte-os_consulta).

Envia uma **CTe OS** para autorização:

`https://api.focusnfe.com.br/v2/cte_os?ref=REFERENCIA`

Utilize o comando **HTTP POST** para enviar a sua nota para nossa API.
Ao contrátio da CTe convencional, a CTe OS é processada de forma **síncrona**, na mesma requição em que os dados são enviadas.

## Consulta

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/cte/12345
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class Consulta {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interno do CTe. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/cte/"+ref+"?completa=1");

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
url_envio = servidor_homologacao + "v2/cte/" + ref + "?completa=1"

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

// Substituir pela sua identificação interno do CTe.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/cte/" + ref + "?completa=1";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API.
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

// Substituir pela sua identificação interno do CTe.
$ref = "12345";

$login = "Token_obtido_no_cadastro_da_empresa";
$password = "";

// Para ambiente de produção use a variável abaixo:
// $server = "https://api.focusnfe.com.br";

$server = "https://homologacao.focusnfe.com.br";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/cte/" . $ref."?completa=1");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array());
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

//As três linhas abaixo imprimem as informações retornadas pela API, aqui o seu sistema devera interpretar e lidar com o retorno.
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
url = "https://homologacao.focusnfe.com.br/v2/cte/"

# Substituir pela sua identificação interno do CTe.
ref = "12345"

token="Token_obtido_no_cadastro_da_empresa"

# Use este parametro para obter mais informacoes em suas consultas.
completa = "completa=1"

r = requests.get(url+ref, params=completa, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API.
print(r.status_code, r.text)

```

Para consultar uma CTe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Consultar as informações de uma CTe:

`https://api.focusnfe.com.br/v2/cte/REFERENCIA?completa=(0|1)`

Utilize o comando **HTTP GET** para consultar a sua nota para nossa API.

Parâmetro Opcional | Ação
-------|-------|-----
completa = 0 ou 1 | Habilita a API há mostrar campos adicionais na requisição de consulta.

Campos de retorno:

* **cnpj_emitente**: O CNPJ emitente da CTe (o CNPJ de sua empresa).
* **ref**:A referência da emissão.
* **status**: A situação da CTe, podendo ser:
  - **processando_autorizacao**: A nota ainda está em processamento pela API. Você deverá aguardar o processamento pela SEFAZ.
  - **autorizado**: A nota foi autorizada, neste caso é fornecido os dados completos da nota como chave e arquivos para download
  - **cancelado**: O documento foi cancelado, neste caso é fornecido o caminho para download do XML de cancelamento (caminho_xml_cancelamento).
  - **erro_autorizacao**: Houve um erro de autorização por parte da SEFAZ. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. É possível fazer o reenvio da nota com a mesma referência se ela estiver neste estado.
  - **denegado**: O documento foi denegado. Uma SEFAZ pode denegar uma nota se houver algum erro cadastral nos dados do destinatário ou do emitente. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. Não é possível reenviar a nota caso este estado seja alcançado pois é gerado um número, série, chave de CTe e XML para esta nota. O XML deverá ser armazenado pelo mesmo período de uma nota autorizada ou cancelada.
* **status_sefaz**: O status da nota na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **serie**: A série da CTe, caso ela tenha sido autorizada.
* **numero**: O número da CTe, caso ela tenha sido autorizada.
* **modelo**: O modelo da CTe, caso ela tenha sido autorizada.
* **chave_cte**: A chave da CTe, caso ela tenha sido autorizada.
* **caminho_xml_nota_fiscal**: caso a nota tenha sido autorizada, retorna o caminho para download do XML.
* **caminho_dacte**: caso a nota tenha sido autorizada retorna o caminho para download do DACTe.
* **caminho_xml**: caso tenha sido emitida alguma carta de correção, aqui aparecerá o caminho para fazer o download do XML.
* **caminho_xml_carta_correcao**: caso tenha sido emitida alguma carta de correção, aqui aparecerá o caminho para fazer o download do XML da carta.
* **caminho_xml_cancelamento**: Caso a nota esteja cancelada, é fornecido o caminho para fazer o download do XML de cancelamento.

Caso na requisição seja passado o parâmetro `completo=1` será adicionado mais 6 campos:

* **requisicao**: Inclui os dados completos da requisição da CTe, da mesma forma que constam no XML da nota.
* **protocolo**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_cancelamento**: Inclui os dados completos da requisição de cancelamento da CTe.
* **protocolo_cancelamento**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_carta_correcao**: Inclui os dados completos da requisição de Carta de Correção Eletrônica da CTe.
* **protocolo_carta_correcao**: Inclui os dados completos do protocolo devolvido pela SEFAZ.

> Exemplo de resposta da consulta de CTe:

```json
{
    "cnpj_emitente": "11111151000119",
    "ref": "ref123",
    "status": "autorizado",
    "status_sefaz": "100",
    "mensagem_sefaz": "Autorizado o uso do CT-e",
    "chave": "CTe21111114611151000119570010000000111973476363",
    "numero": "11",
    "serie": "1",
    "modelo": "57",
    "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/311110000007009_v03.00-protCTe.xml",
    "caminho_xml_carta_correcao": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/311110000007012_v03.00-eventoCTe.xml"
}
```

> Exemplo de resposta com o parâmetro, completa, recebendo o valor "1":

```json
{

  "cnpj_emitente": "11111151000119",
  "ref": "ref123",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso do CT-e",
  "chave": "CTe21111114611151000119570010000000111973476363",
  "numero": "11",
  "serie": "1",
  "modelo": "57",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/311110000007009_v03.00-protCTe.xml",
  "caminho_xml_carta_correcao": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/311110000007012_v03.00-eventoCTe.xml"
  "requisicao": {
    /* campos da CTe aqui omitida */
  }
  "protocolo": {
    "versao": "3.00",
    "id_tag": "CTe329180000007009",
    "ambiente": "2",
    "versao_aplicativo": "RS20180430143216",
    "chave": "21111114611151000119570010000000111973476363",
    "data_recimento": "2018-05-10T15:23:36-03:00",
    "protocolo": "329180000007009",
    "digest_value": "PsPzcf7bCOwvNW+v2F+ZAzJPXJE=",
    "status": "100",
    "motivo": "Autorizado o uso do CT-e"
  },
  "requisicao_carta_correcao": {
    "versao": "3.00",
    "id_tag": "ID21111114611151000119570010000000111973476363",
    "codigo_orgao": "29",
    "ambiente": "2",
    "cnpj": "14674451000119",
    "chave_cte": "21111114611151000119570010000000111973476363",
    "data_evento": "2018-05-10T16:25:42-03:00",
    "tipo_evento": "110110",
    "numero_sequencial_evento": "1",
    "versao_evento": "3.00"
  },
  "protocolo_carta_correcao": {
    "versao": "3.00",
    "id_tag": "ID329180000007012",
    "ambiente": "2",
    "versao_aplicativo": "RS20171205135830",
    "codigo_orgao": "29",
    "status": "135",
    "motivo": "Evento registrado e vinculado a CT-e",
    "chave_cte": "21111114611151000119570010000000111973476363",
    "tipo_evento": "110110",
    "descricao_evento": "Carta Correção Registrada",
    "numero_sequencial_evento": "1",
    "data_evento": "2018-05-10T16:25:43-03:00",
    "protocolo": "329180000007012"
  }
}
```


## Cancelamento

```java
import java.util.HashMap;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class Cancelar {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interno do CTe. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/cte/"+ref);
    /* Aqui criamos um hashmap para receber a chave "justificativa" e o valor desejado. */
    HashMap<String, String> justificativa = new HashMap<String, String>();
    justificativa.put("justificativa", "Informe aqui a sua justificativa para realizar o cancelamento da NFe.");

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
url_envio = servidor_homologacao + "v2/cte/" + ref

# altere os campos conforme a nota que será enviada
justificativa_cancelamento = {
  justificativa: "Informe aqui a sua justificativa para realizar o cancelamento da NFe."
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

// Substituir pela sua identificação interno do CTe.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/cte/"+ ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da AP
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('DELETE', url, false, token);

var cancelar = {

  "justificativa": "Sua justificativa aqui!"
};

// Aqui fazermos a serializacao do JSON com o campo de cancelamento e enviamos para API.
request.send(JSON.stringify(cancelar));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```php
<?php

$ch = curl_init();

// Substituir pela sua identificação interno do CTe.
$ref   = "12345";

// Para ambiente de produção use a variável abaixo:
// $server = "https://api.focusnfe.com.br";

$server = "https://homologacao.focusnfe.com.br";

$justificativa = array ("justificativa" => "A sua justificativa de cancelamento aqui.");

$login = "Token_obtido_no_cadastro_da_empresa";
$password = "";

curl_setopt($ch, CURLOPT_URL, $server . "/v2/cte/" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($justificativa));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$result = curl_getinfo($ch, CURLINFO_HTTP_CODE);

//As três linhas abaixo imprimem as informações retornadas pela API, aqui o seu sistema devera interpretar e lidar com o retorno.
print($result."\n");
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
url = "https://homologacao.focusnfe.com.br/v2/cte/"

# Substituir pela sua identificação interno do CTe.
ref = "12345"

token="Token_obtido_no_cadastro_da_empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API.
'''
justificativa={}
justificativa["justificativa"] = "Sua justificativa aqui!"

r = requests.delete(url+ref, data=json.dumps(justificativa), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API.
print(r.status_code, r.text)

```

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X DELETE -d '{"justificativa":"Teste de cancelamento de nota"}' \
  https://homologacao.focusnfe.com.br/v2/cte/12345
```

> Resposta da API para a requisição de cancelamento:

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a CT-e",
  "status": "cancelado",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/14674451000119/201805/XMLs/329180000006929_v03.00-eventoCTe.xml"
}
```

Para cancelar uma CTe, basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Cancelar uma CTe já autorizada:

`https://api.focusnfe.com.br/v2/cte/REFERENCIA`

Utilize o comando **HTTP DELETE** para cancelar a sua nota para nossa API. Este método é síncrono, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

O parâmetro de cancelamento deverá ser enviado da seguinte forma:

* **justificativa**: Justificativa do cancelamento. Deverá conter de 15 a 255 caracteres.

A API irá em seguida devolver os seguintes campos:

* **status**: cancelado, se a nota pode ser cancelada, ou erro_cancelamento, se houve algum erro ao cancelar a nota.
* **status_sefaz**: O status do cancelamento na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml**: Caso a nota tenha sido cancelada, será informado aqui o caminho para download do XML de cancelamento.

### Prazo de cancelamento
A CTe poderá ser cancelada em até 7 dias após a emissão, na maioria dos Estados.

## Carta de Correção Eletrônica

Uma Carta de Correção eletrônica (CCe) pode ser utilizada para corrigir eventuais erros na CTe. As seguintes informações **não podem ser corrigidas**:

* As variáveis que determinam o valor do imposto tais como: base de cálculo, alíquota, diferença de preço, quantidade, valor da operação ou da prestação;
* A correção de dados cadastrais que implique mudança do remetente ou do destinatário;
* A data de emissão ou de saída.

Não existe prazo especificado para emissão de cartas de correção. É possível enviar até 20 correções diferentes, sendo que será válido sempre a última correção enviada.

### Emissão de CCe

```java
import java.util.HashMap;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class EmitirCce {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interno do CTe. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/cte/"+ref+"/carta_correcao");

    /* Aqui criamos um hashmap para receber a chave "correcao" e o valor desejado. */
    HashMap<String, String> correcao = new HashMap<String, String>();
    correcao.put("campo_corrigido", "uf_inicio");
    correcao.put("valor_corrigido", "PR");

    /* Criamos um objeto JSON para receber a hash com os dados esperado pela API. */
    JSONObject json = new JSONObject(correcao);

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
url_envio = servidor_homologacao + "v2/cte/" + ref + "/carta_correcao"

# altere os campos conforme a nota que será enviada
correcao = {
  campo_correcao: "Informe aqui o titulo do campo que será corrigido na CTe.",
  valor_correcao: "Informe aqui o valor para o campo que será corrigido."
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos a hash de justificativa do cancelamento para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = correcao.to_json

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

// Substituir pela sua identificação interno do CTe.
var ref = "12345";

var cce = {"campo_corrigido": "uf_inicio", "valor_corrigido": "PR"};

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/cte/"+ ref + "/carta_correcao";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API.
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

// Aqui fazermos a serializacao do JSON com os campos de CCe e enviamos para API.
request.send(JSON.stringify(cce));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```php
<?php

// Para ambiente de produção use a variável abaixo:
// $server = "https://api.focusnfe.com.br";

$server = "https://homologacao.focusnfe.com.br";

// Substituir pela sua identificação interno do CTe.
$ref = "12345";

$login = "Token_obtido_no_cadastro_da_empresa";
$password = "";

$correcao = array (
  "campo_corrigido" => "uf_inicio",
  "valor_corrigido" => "PR"
);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server . "/v2/cte/" . $ref  . "/carta_correcao");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($correcao));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

//As três linhas abaixo imprimem as informações retornadas pela API, aqui o seu sistema devera interpretar e lidar com o retorno.
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
url = "https://homologacao.focusnfe.com.br/v2/cte/"

# Substituir pela sua identificação interno do CTe.
ref = "12345"

token="Token_obtido_no_cadastro_da_empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API.
'''
cce = {"campo_corrigido": "uf_inicio", "valor_corrigido": "PR"}

r = requests.post(url+ref+"/carta_correcao", data=json.dumps(cce), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API.
print(r.status_code, r.text)

```

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"campo_corrigido":"observacoes","valor_corrigido":"Nova observação"}' \
  https://homologacao.focusnfe.com.br/v2/cte/12345/carta_correcao
```

> Resposta da API para a requisição de CCe:

```json

{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a CT-e",
  "status": "autorizado",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111151000119/201805/XMLs/321110000006913_v03.00-eventoCTe.xml",
  "numero_carta_correcao": 2
}

```

`https://api.focusnfe.com.br/v2/cte/REFERENCIA/carta_correcao`

Utilize o comando **HTTP POST** para enviar a sua correção para nossa API. Este método é **síncrono**, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

Ao contrário da NFe, na CTe é obrigatório informar especificamente o campo que será alterado. Você poderá usar os próprios nomes
dos campos da API.

O parâmetros da carta de correção deverão ser enviados da seguinte forma:

* **grupo_corrigido**: Opcional. Indica o grupo onde se encontra o campo, por exemplo "cargas". Pode ser omitido se não houver grupo relacionado.
* **campo_corrigido**: Indica o campo a ser corrigido.
* **valor_corrigido**: Indica o novo valor do campo.
* **numero_item_grupo_corrigido**: Opcional. Caso o campo pertença a uma lista de itens, o número do item a ser corrigido é informado aqui. O primeiro número começa em 1.
* **campo_api**: Opcional. Se igual a 1 será usado o nome do campo da API nos campos 'grupo_corrigido' e 'campo_corrigido'. Se igual a 0 você deverá informar a tag XML. Valor default é 1.

A API irá em seguida devolver os seguintes campos:

* **status**: autorizado, se a carta de correção foi aceita pela SEFAZ, ou erro_autorizacao, se houve algum erro ao cancelar a nota.
* **status_sefaz**: O status da carta de correção na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml**: Informa o caminho do XML da carta de correção, caso ela tenha sido autorizada.
* **numero_carta_correcao**: Informa o número da carta de correção, caso ela tenha sido autorizada.

Para uma mesma CTe é possível enviar mais de uma carta de correção, sendo que a última sempre substitui a anterior.

## Inutilização

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

public class Inutilizar {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/cte/inutilizacao");

    /* Aqui criamos um hash que irá receber as chaves e valores esperados para gerar a inutilização. */
    HashMap<String, String> dadosInutilizacao = new HashMap<String, String>();
    dadosInutilizacao.put("cnpj", "51916585000125");
    dadosInutilizacao.put("serie", "1");
    dadosInutilizacao.put("numero_inicial", "1");
    dadosInutilizacao.put("numero_final", "3");
    dadosInutilizacao.put("justificativa", "Informe aqui a justificativa para realizar a inutilizacao da numeracao.");
    dadosInutilizacao.put("modelo", "67");

    /* Criamos um objeto JSON que irá receber o input dos dados, para então enviar a requisição. */
    JSONObject json = new JSONObject (dadosInutilizacao);

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

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/cte/inutilizacao"

# altere os campos conforme a nota que será enviada
dados_inutilizacao = {
  cnpj: "51916585000125",
  serie: "1",
  numero_inicial: "1",
  numero_final: "3",
  justificativa: "Informe aqui a justificativa para realizar a inutilizacao da numeracao.",
  modelo: "67"
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos a hash de justificativa do cancelamento para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = dados_inutilizacao.to_json

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

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/cte/inutilizacao";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var inutiliza = {
"cnpj": "14674451000119",
"serie": "1",
"numero_inicial": "700",
"numero_final": "703",
"justificativa": "Teste de inutilizacao de nota",
"modelo": 67
};

// Aqui fazermos a serializacao do JSON com os de inutilizacao e enviamos para API.
request.send(JSON.stringify(inutiliza));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```php
<?php

// Para ambiente de produção use a variável abaixo:
// $server = "https://api.focusnfe.com.br";

$server = "https://homologacao.focusnfe.com.br";

$login = "Token_obtido_no_cadastro_da_empresa";
$password = "";

$inutiliza = array (
  "cnpj" => "51916585000125",
  "serie" => "1",
  "numero_inicial" => "1",
  "numero_final" => "3",
  "justificativa" => "A sua justificativa de cancelamento aqui.",
  "modelo" => 67
);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/cte/inutilizacao");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($inutiliza));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

//As três linhas abaixo imprimem as informações retornadas pela API, aqui o seu sistema devera interpretar e lidar com o retorno.
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
url = "https://homologacao.focusnfe.com.br/v2/cte/inutilizacao"

token="Token_obtido_no_cadastro_da_empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API.
'''
inutilizacao={}
inutilizacao["cnpj"] = "51916585000125"
inutilizacao["serie"] = "1"
inutilizacao["numero_inicial"] = "1"
inutilizacao["numero_final"] = "3"
inutilizacao["justificativa"] = "Justificativa da inutilizacao minimo 15 caracteres"
inutilizacao["modelo"] = "67"

r = requests.post(url, data=json.dumps(inutilizacao), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API.
print(r.status_code, r.text)

```

> Resposta da API para a requisição de inutilização:

```json
 {
  "status_sefaz": "102",
  "mensagem_sefaz": "Inutilizacao de numero homologado",
  "serie": "3",
  "numero_inicial": "800",
  "numero_final": "801",
  "status": "autorizado",
  "caminho_xml": "https://focusnfe.s3-sa-east-1.amazonaws.com/arquivos_development/11111353000900/207701/XMLs/999992335309999955003000000800000000801-inu.xml"
}
```

Em uma situação normal você não precisará informar ao SEFAZ a inutilização de um número da CTe, pois a API controla automaticamente a numeração das notas. Porém, se por alguma situação específica for necessário a inutilização de alguma faixa de números você poderá chamar as seguintes operações:

Envio de inutilização de faixa de numeração:

`https://api.focusnfe.com.br/v2/cte/inutilizacao`

Utilize o comando **HTTP POST** para enviar a sua inutilização para nossa API. Este método é **síncrono**, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

A inutilização precisa dos seguintes parâmetros obrigatórios:

* **cnpj**: CNPJ da empresa emitente
* **serie**: Série da numeração da CTe que terá uma faixa de numeração inutilizada
* **numero_inicial**: Número inicial a ser inutilizado
* **numero_final**: Número final a ser inutilizado
* **justificativa**: Justificativa da inutilização (mínimo 15 caracteres)
* **modelo**: Informe o modelo da CTe. Se igual a 57 será a CTe normal, se igual a 67 será a CTe OS. Valor default é 57.


A API irá enviar uma resposta com os seguintes campos:

* **status**: autorizado, se a inutilização foi aceita pela SEFAZ, ou erro_autorizacao, se houve algum erro ao inutilizar os números.
* **status_sefaz**: O status da carta de correção na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **serie**: Série da numeração da CTe que terá uma faixa de numeração inutilizada
* **numero_inicial**: Número inicial a ser inutilizado
* **numero_final**: Número final a ser inutilizado
* **caminho_xml**: Caminho do XML para download caso a inutilização tenha sido autorizada pela SEFAZ.
