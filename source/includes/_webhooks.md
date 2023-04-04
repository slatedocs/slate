# Gatilhos / Webhooks

## Informações gerais

Gatilhos ou "WebHooks" são eventos automáticos que são disparados a partir de mudanças especificas na nota fiscal. Quando isso ocorre, é enviado os dados da nota fiscal no formato JSON para uma URL da sua escolha através do método POST. Cada acionamento do gatilho contém os dados de apenas uma nota. Abaixo segue um exemplo de como a API enviará as seguintes informações para sua URL, caso a nota autorizada seja uma NFe:

> Dados enviados para sua URL:

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "teste_webhooks",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe77777075045050001329999930000002999999991249",
  "numero": "1",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/99999999999972/201313/XMLs/77777075045050001329999930000002999999991249-nfe.xml",
  "caminho_danfe": "/arquivos_development/99999999999972/201313/DANFEs/77777075045050001329999930000002999999991249.pdf"
}
```

Para NFe e MDe (Manifestação de Destinatário Eletrônica):

* **status**:
  - **processando_autorizacao**: A nota ainda está em processamento pela API. Você deverá aguardar o processamento pela SEFAZ.
  - **autorizado**: A nota foi autorizada, neste caso é fornecido os dados completos da nota como chave e arquivos para download
  - **cancelado**: O documento foi cancelado, neste caso é fornecido o caminho para download do XML de cancelamento (caminho_xml_cancelamento).
  - **erro_autorizacao**: Houve um erro de autorização por parte da SEFAZ. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. É possível fazer o reenvio da nota com a mesma referência se ela estiver neste estado.
  - **denegado**: O documento foi denegado. Uma SEFAZ pode denegar uma nota se houver algum erro cadastral nos dados do destinatário ou do emitente. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. Não é possível reenviar a nota caso este estado seja alcançado pois é gerado um número, série, chave de NFe e XML para esta nota. O XML deverá ser armazenado pelo mesmo período de uma nota autorizada ou cancelada.
* **status_sefaz**: O status da nota na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **serie**: A série da nota fiscal, caso ela tenha sido autorizada.
* **numero**: O número da nota fiscal, caso ela tenha sido autorizada.
* **cnpj_emitente**: O CNPJ emitente da nota fiscal (o CNPJ de sua empresa).
* **ref**:A referência da emissão.
* **chave_nfe**: A chave da NFe, caso ela tenha sido autorizada.
* **caminho_xml_nota_fiscal**: caso a nota tenha sido autorizada, retorna o caminho para download do XML.
* **caminho_danfe**: caso a nota tenha sido autorizada retorna o caminho para download do DANFe.
* **caminho_xml_carta_correcao**: caso tenha sido emitida alguma carta de correção, aqui aparecerá o caminho para fazer o download do XML.
* **caminho_pdf_carta_correcao**: caso tenha sido emitida alguma carta de correção, aqui aparecerá o caminho para fazer o download do PDF da carta.
* **numero_carta_correcao**: o número da carta de correção, caso tenha sido emitida.
* **caminho_xml_cancelamento**: Caso a nota esteja cancelada, é fornecido o caminho para fazer o download do XML de cancelamento.

Ressaltamos que os campos devolvidos são os mesmos da consulta da nota fiscal. Veja o tópico [**Consulta**](https://focusnfe.com.br/doc/#nfe_consulta) na categoria NFe.

Para NFSe:

* **cnpj_prestador**: CNPJ do prestador do serviço.
* **ref**: A referência da emissão.
* **numero_rps**: Número do RPS da nota.
* **serie_rps**: Série do RPS da nota.
* **status**:
  - **processando_autorizacao**: A nota ainda está em processamento pela API. Você deverá aguardar o processamento da Prefeitura.
  - **autorizado**: A nota foi autorizada, neste caso é fornecido os dados completos da nota como chave e arquivos para download
  - **cancelado**: O documento foi cancelado, neste caso é fornecido o caminho para download do XML de cancelamento (caminho_xml_cancelamento).
  - **erro_autorizacao**: Houve um erro de autorização por parte da Prefeitura. É possível fazer o reenvio da nota com a mesma referência se ela estiver neste estado.
* **numero**: Número da nota fiscal.
* **codigo_verificacao**: Código de verificação gerado pela Prefeitura.
* **data_emissao**: Data da emissão da nota fiscal.
* **url**: URL para visualização da nota fiscal a partir do portal da Prefeitura.
* **caminho_xml_nota_fsical**: Caminho para download do XML da nota fiscal.
* **erros**: Grupo contendo os detalhes do erro de emissão.
  - **codigo**: Código do erro na prefeitura.
  - **mensagem**: Mensagem de erro enviada pela prefeitura.
  - **correcao**: Orientação do que deve ser feito para corrigir o erro.

Ressaltamos que os campos devolvidos são os mesmos da consulta da nota fiscal. Veja o tópico [**Consulta**](https://focusnfe.com.br/doc/#nfse_consulta) na categoria NFSe.

Para CTe:

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

Ressaltamos que os campos devolvidos são os mesmos da consulta da CTe. Veja o tópico [**Consulta**](https://focusnfe.com.br/doc/#cte-e-cte-os_consulta) na categoria Cte e CTe OS.

A vantagem de utilizar gatilhos é que não haverá a necessidade de fazer "polling" (realizar constantes requisições a fim de verificar o status da nota).

Na ocorrência de falha na execução do POST para a URL definida (exemplo: servidor fora do ar ou alguma resposta HTTP diferente de 20X) a API tentará um reenvio nos seguintes intervalos: 1 minuto, 30 minutos, 1 hora, 3 horas, 24 horas até o momento em que a API irá desistir de acionar o gatilho.

## Status API

Aqui você encontra os status possíveis para os gatilhos (webhooks).

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
404 - not found | nao_encontrado | Seu gatilho não foi encontrado. | Verifique se o seu gatilho foi criado com sucesso. Consulte nossa documentação.
400 - bad request | requisicao_invalida | Parâmetro "event" deve ser um evento válido. |  Informe um dos valores esperados para o parâmetro "event" e tente novamente.
400 - bad request | requisicao_invalida | Já existe um gatilho para este evento. | Não é possível ter mais de um gatilho por evento.
400 - bad request | requisicao_invalida | URL inválida: X | Onde X é a URL inválida informado no retorno da API. Consulte nossa documentação.

## Eventos

Os seguintes eventos causam o acionamento do gatilho:

* **NFe**:
  * Erro na emissão de uma nota fiscal
  * Emissão de nota fiscal realizada com sucesso
  * Inutilização de faixa de numeração
* **NFCe**:
  * Erro na emissão de uma NFCe em contingência
  * Efetivação de uma NFCe
  * NFCe original cancelada ou com erro de cancelamento
* **NFSe**:
  * Erro na emissão de uma nota fiscal
  * Emissão de nota fiscal realizada com sucesso
  * Inutilização de faixa de numeração
* **Documentos fiscais recebidos (manifestação)**:
  * Recebimento de um novo documento fiscal (CTe, NFe ou NFSe)
* **CTe**:
  * Erro na emissão de uma CTe
  * Emissão de CTe realizada com sucesso
  * CTe Denegada
* **MDFe**:
  * Erro na emissão de uma MDFe
  * Emissão de MDFe realizada com sucesso
  * MDFe Denegada

## Criação
```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/hooks"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
dados = {}
# é possi utilizar CPF também
# dados["cpf"] = "80032839065"
dados["cnpj"] = "51916585000125"
dados["event"] = "nfe"
dados["url"] = "http://minha.url/nfe"

r = requests.post(url, data=json.dumps(dados), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"cnpj":"51916585000125","event":"nfe","url":"http://minha.url/nfe"}' \
  https://homologacao.focusnfe.com.br/v2/hooks
```
```php
<?php
$ch = curl_init();
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/hooks");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode(array("cnpj" => "51916585000125",
  "event" => "nfe", "url" => "http://minha.url/nfe")));
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
import java.util.HashMap;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class ExemploCriacaoHook {

    public static void main(String[] args) throws JSONException{

        String login = "Token_obtido_no_cadastro_da_empresa";

        /* Para ambiente de produção use a variável abaixo:
        String server = "https://api.focusnfe.com.br/"; */
        String server = "https://homologacao.focusnfe.com.br/";

        String url = server.concat("v2/hooks");

        /* Configuração para realizar o HTTP BasicAuth. */
        Object config = new DefaultClientConfig();
        Client client = Client.create((ClientConfig) config);
        client.addFilter(new HTTPBasicAuthFilter(login, ""));

        /* Aqui são criados as hash's que receberão os dados da nota. */
        HashMap<String, String> hook = new HashMap<String, String>();

        /*
         é possível utilizar o CPF também
         hook.put("cpf", "80032839065");
        */
        hook.put("cnpj", "51916585000125");
        hook.put("event", "nfe");
        hook.put("url", "http://minha.url/nfe");

        JSONObject json = new JSONObject (hook);

        WebResource request = client.resource(url);

        ClientResponse resposta = request.post(ClientResponse.class, json);

        int httpCode = resposta.getStatus();

        String body = resposta.getEntity(String.class);

        System.out.print("HTTP Code: ");
        System.out.print(HttpCode);
        System.out.printf(body);
    }
}
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

var url = "https://homologacao.focusnfe.com.br/v2/hooks";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var gatilho = {

  "cnpj":"51916585000125",
  "event":"nfe",
  "url":"http://minha.url/nfe"
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(gatilho));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```


> Dados de resposta de gatilho criado com sucesso

```json
{
  "id": "Vj5rmkBq",
  "url": "http://minha.url/nfe",
  "authorization": null,
  "authorization_header": null,
  "event": "nfe",
  "cnpj": "51916585000125"
}
```


Para criar um novo gatilho, utilize o endereço abaixo:

`https://api.focusnfe.com.br/v2/hooks`

Utilize o método HTTP POST para criar um novo gatilho. Esta requisição aceita os seguintes parâmetros que deverão ser enviados em formato JSON:

*  **cnpj** – CNPJ da empresa. Se o CNPJ for omitido, o gatilho será acionado para todas as emissões feitas pelo token em questão.
*  **cpf** – CPF da empresa/prestador do serviço. Se o CPF for omitido, o gatilho será acionado para todas as emissões feitas pelo token em questão.
*  **event** – Informe qual evento que gostará de escutar: nfe, nfse, nfce_contingencia, nfe_recebida, nfse_recebida, inutilizacao, cte, mdfe
*  **url** – URL que deverá ser chamada quando o gatilho for ativado
*  **authorization** – (opcional) O valor que for informado neste campo será devolvido no acionamento do gatilho no cabeçalho "Authorization".
Desta forma você poderá por exemplo informar um token secreto para garantir que apenas nossa API acione a sua URL.
*  **authorization_header** – (opcional) Nome do cabeçalho HTTP para enviar o conteúdo do campo "authorization" quando este foi informado. Caso não seja informado um valor para o campo authorization_header, será usado o nome de cabeçalho default: "Authorization".

A API irá devolver como resposta o gatilho criado. É possível ter mais de um gatilho por evento. Note que o gatilho pode ser por empresa ou um gatilho genérico para todas as emissões feitas usando o token informado.

**OBS**: Os campos **cpf** e **cnpj** são mutuamente excludentes. No caso de informar um deles não informar o outro.

**Dicas para uso do campo authorization**: O propósito deste campo é garantir que a sua URL não seja acessada por nenhum outro serviço que não o nosso. Sugerimos duas formas de usar este campo: você pode usar um token secreto, por exemplo: "lFNVw8q5WMeR3U9FOVOABTp36zrkvtaa". Desta forma, nossa API irá enviar sempre o seguinte cabeçalho ao acionar o gatilho:

`Authorization: lFNVw8q5WMeR3U9FOVOABTp36zrkvtaa`

Este cabeçalho poderá ser verificado do lado do seu sistema, rejeitando requisições que não incluam este cabeçalho. Outra forma de utilizar este campo é usando o método [Basic Auth](https://en.wikipedia.org/wiki/Basic_access_authentication). Este método consiste em usar uma string no formato "Basic YWxndW11c3VhcmlvOmFsZ3VtYXNlbmhh", onde a última string é o resultado da concatenação de "algumusuario:algumasenha", e depois aplicada a codificação em Base64. Usando este método, você poderá usar alguma biblioteca disponível na sua linguagem de proramação e simplesmente testar o recebimento do usuário "algumusuario" com a senha "algumasenha".

Se você utiliza um outro esquema de autenticação, você pode especificar tanto os campos authorization quanto
authorization_header. Por exemplo, se sua aplicação espera o campo "X-ApiKey" com o valor "IlzJYBLJBxQT1FUGNRxhFO1ASpNKfj8z" você deverá informar estes valores nos campos authorization_header e authorization, respectivamente. Desta forma, nossa API irá enviar o seguinte cabeçalho ao acionar o gatilho:

`X-ApiKey: IlzJYBLJBxQT1FUGNRxhFO1ASpNKfj8z`


## Consulta
```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/hooks/"

token="token obtido no cadastro da empresa"

hook_id = "Vj5rmkBq"

r = requests.get(url+hook_id, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)l


```

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/hooks/Vj5rmkBq
```

```php
<?php
$ch = curl_init();
$hook_id = "Vj5rmkBq"
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server."/v2/hooks/" . $hook_id);
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

        /* Substituir pela sua identificação interna da nota. */
        String hookId = "Vj5rmkBq";

        /* Para ambiente de produção use a variável abaixo:
        String server = "https://api.focusnfe.com.br/"; */
        String server = "https://homologacao.focusnfe.com.br/";

        String url = server.concat("v2/hooks/"+hookId);

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

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

var hook_id = "n65g0RP1";

var url = "https://homologacao.focusnfe.com.br/v2/hooks/" + hook_id;

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


> Dados de resposta de consulta de um gatilho individual

```json
{
  "id": "Vj5rmkBq",
  "url": "http://minha.url/nfe",
  "authorization": null,
  "authorization_header": null,
  "event": "nfe",
  "cnpj": "51916585000125"
}
```

Existem duas formas de consultar os gatilhos disponíveis, utilize o endereço abaixo:

`https://api.focusnfe.com.br/v2/hooks`

Utilize o método HTTP **GET** para consultar **todos** os gatilhos criados. Serão exibidos os gatilhos de todas as empresas que seu token possui acesso.

Para consultar apenas um gatilho individualmente, utilize a URL:

`https://api.focusnfe.com.br/v2/hooks/HOOK_ID`

Substituindo HOOK_ID pelo identificador do gatilho.

## Exclusão
```python
 Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/hooks/"

token="token obtido no cadastro da empresa"

hook_id = "Vj5rmkBq"

r = requests.delete(url+hook_id, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)


```


```shell
curl -u "token obtido no cadastro da empresa:" -X DELETE \
 https://homologacao.focusnfe.com.br/v2/hooks/Vj5rmkBq
```

```php
<?php
$ch = curl_init();
$hook_id = "Vj5rmkBq"
$server = "https://homologacao.focusnfe.com.br";
curl_setopt($ch, CURLOPT_URL, $server . "/v2/hooks/" . $hook_id);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "token obtido no cadastro da empresa:");
$body = curl_exec($ch);
$result = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
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

public class ExemploExclusaoHook {

    public static void main(String[] args){

        String login = "Token_obtido_no_cadastro_da_empresa";

        /* Substituir pela sua identificação interna da nota. */
        String hookId = "Vj5rmkBq";

        /* Para ambiente de produção use a variável abaixo:
        String server = "https://api.focusnfe.com.br/"; */
        String server = "https://homologacao.focusnfe.com.br/";

        String url = server.concat("v2/hooks/"+hookId);

        /* Configuração para realizar o HTTP BasicAuth. */
        Object config = new DefaultClientConfig();
        Client client = Client.create((ClientConfig) config);
        client.addFilter(new HTTPBasicAuthFilter(login, ""));

        WebResource request = client.resource(url);

        ClientResponse resposta = request.delete(ClientResponse.class);

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

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

var hook_id = "n65g0RP1";

var url = "https://homologacao.focusnfe.com.br/v2/hooks/" + hook_id;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('DELETE', url, false, token);

request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```



> Dados de resposta da exclusão de um gatilho

```json
{
  "id": "Vj5rmkBq",
  "url": "http://minha.url/nfe",
  "authorization": null,
  "authorization_header": null,
  "event": "nfe",
  "cnpj": "51916585000125",
  "deleted": true
}
```

Para excluir um gatilho, utilize a URL

`https://api.focusnfe.com.br/v2/hooks/HOOK_ID`

Utilize o método HTTP **DELETE** para excluir o gatilho. Em caso de sucesso será exibido os dados do gatilho excluído acrescentado do atributo "deleted" com o valor "true".

## Teste e reenvio de notificações

Para efeitos de teste ou para recuperar notificações perdidas é possível solicitar à API o reenvio desta notificação para todos os gatilhos cadastrados.

Para isso é disponibilizado um endereço para cada tipo de documento que aceita gatilhos. Basta enviar uma requisição POST para os endereços abaixo:

> Dados de resposta da solicitação de reenvio de notificação de uma NFe

```json
[

  {
    "id": "Vj5rmkBq",
    "url": "http://minha.url/nfe",
    "authorization": null,
    "authorization_header": null,
    "event": "nfe",
    "cnpj": "51916585000125",
  }
]
```

* NFe: `https://api.focusnfe.com.br/v2/nfe/REFERENCIA/hook`
* NFSe: `https://api.focusnfe.com.br/v2/nfse/REFERENCIA/hook`
* CTe: `https://api.focusnfe.com.br/v2/cte/REFERENCIA/hook`
* NFe Recebida: `https://api.focusnfe.com.br/v2/nfes_recebidas/CHAVE_NFE/hook`

O corpo da requisição do método POST pode ser vazio.

Caso a nota seja encontrada, será devolvido um array contendo todos os gatilhos que foram acionados ou um array vazio se não houver gatilhos cadastrados.
