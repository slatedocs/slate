# NFCe

Através da API NFCe é possível:

* Emitir uma Nota Fiscal de Consumidor Eletrônica (NFCe) para qualquer Estado que aceita o uso deste documento.
* Cancelar NFCe.
* Consultar NFCe emitidas.
* Reenviar uma NFCe por email.
* Inutilizar o número de alguma série de NFCe.

Todos os processos envolvendo NFCe são **síncronos**. Ou seja, a emissão não é feita em segundo plano, ao contrário da NFe
e NFSe.

## URLs

Método | URL (recurso) | Ação
-------|-------|-----
POST | /v2/nfce?ref=REFERENCIA |  Cria uma nota fiscal e a envia para processamento.
GET |  /v2/nfce/REFERENCIA | Consulta a nota fiscal com a referência informada e o seu status de processamento.
DELETE  | /v2/nfce/REFERENCIA |  Cancela uma nota fiscal com a referência informada
POST | /v2/nfce/REFERENCIA/email |  Envia um email com uma cópia da nota fiscal com a referência informada
POST | /v2/nfce/inutilizacao | Inutiliza uma numeração da nota fiscal


## Campos obrigatórios de uma NFCe

Atualmente, a NFCe possui centenas de campos para os mais variados tipos e formas de operações, por isso, criamos uma página exclusiva que mostra todos os campos da nossa API para o envio de NFCe. Nela, você pode buscar os campos pela TAG XML ou pela nossa tradução para API.

[Documentação completa dos campos (versão 4.00 da NFe/NFCe)] (https://campos.focusnfe.com.br/nfe/NotaFiscalXML.html)

Abaixo, iremos mostrar todos os campos de uso mais comum para emissão de uma NFCe.

> Abaixo um exemplo de dados de uma nota (usando a versão 4.00 da NFCe):

```json
{
   "cnpj_emitente":"05953016000132",
   "data_emissao":"2015-11-19T13:54:31-02:00",
   "indicador_inscricao_estadual_destinatario":"9",
   "modalidade_frete":"9",
   "local_destino":"1",
   "presenca_comprador":"1",
   "natureza_operacao":"VENDA AO CONSUMIDOR",
   "items":[
      {
         "numero_item":"1",
         "codigo_ncm":"62044200",
         "quantidade_comercial":"1.00",
         "quantidade_tributavel":"1.00",
         "cfop":"5102",
         "valor_unitario_tributavel":"79.00",
         "valor_unitario_comercial":"79.00",
         "valor_desconto":"0.00",
         "descricao":"NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
         "codigo_produto":"251887",
         "icms_origem":"0",
         "icms_situacao_tributaria":"102",
         "unidade_comercial":"un",
         "unidade_tributavel":"un",
         "valor_total_tributos":"24.29"
      }
   ],
   "formas_pagamento":[
      {
         "forma_pagamento":"03",
         "valor_pagamento":"79.00",
         "nome_credenciadora":"Cielo",
         "bandeira_operadora":"02",
         "numero_autorizacao":"R07242"
      }
   ]
}
```

### Geral

| Campo                                 | Tipo          | Obrigatório   | Descrição                                                                                 | Validação                                                                                                             |
|-------------------------------------  |-------------  |-------------  |------------------------------------------------------------------------------------------ |---------------------------------------------------------------------------------------------------------------------  |
| natureza_operacao                     | texto         | sim           | Descrição da natureza de operação.                                                        | Caso não informado, será utilizado o texto “VENDA AO CONSUMIDOR”.                                                     |
| data_emissao                          | data e hora   | sim           | Data e hora de emissão com timezone.                                                      | Utilize o formato ISO, exemplo 2015-11-19T13:54:31-02:00. Diferença máxima permitida de 5 minutos do horário atual.   |
| presenca_comprador                    | numérico      | sim           | Presença do comprador.Valores possíveis:1 – Operação presencial.4 – Entrega a domicílio.  |                                                                                                                       |
| informacoes_adicionais _contribuinte | texto        | não           | Informações adicionais.                                                                   |                                                                                                                       |
| cnpj_emitente                         | texto         | sim           | CNPJ da empresa que está emitindo a NFCe.                                                 | CNPJ válido.                                                                                                          |
| modalidade_frete                     | numérico        | sim          | Indica a modalidade do frete da operação. Valores possíveis: '0' – Por conta do emitente; '1' – Por conta do destinatário; '2' – Por conta de terceiros; '9' – Sem frete. |
| local_destino                        | numérico        | sim |         Local onde a operação irá acontecer. Valores possíveis: '1' – Operação interna; '2' – Operação interestadual; '3' – Operação com exterior. |


### Destinatário


| Campo                   | Tipo  | Obrigatório | Descrição                         | Validação                             |
|-------------------------|-------|-------------|-----------------------------------|---------------------------------------|
| nome_destinatario       | texto | não         | Nome do consumidor.               |                                       |
| cnpj_destinatario       | texto | não         | CNPJ do consumidor.               | Enviar em branco ou documento válido. |
| cpf_destinatario        | texto | não         | CPF do consumidor.                | Enviar em branco ou documento válido. |
| telefone_destinatario   | texto | não         | Telefone do consumidor.           |                                       |
| logradouro_destinatario | texto | não         | Logradouro do consumidor.         |                                       |
| numero_destinatario     | texto | não         | Número do endereço do consumidor. |                                       |
| bairro_destinatario     | texto | não         | Bairro do consumidor.             |                                       |
| municipio_destinatario  | texto | não         | Município do consumidor.          |                                       |
| uf_destinatario         | texto | não         | Sigla da UF do consumidor.        |                                       |
| cep_destinatario        | texto | não         | CEP do consumidor.                |                                       |
| indicador_inscricao_estadual_destinatario | numérico | não | Indicador da Inscrição Estadual do destinatário. Valores possíveis: '1' – Contribuinte ICMS (informar a IE do destinatário); '2' – Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS; '9' – Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS. |

### Itens

Os dados dos itens da NFCe devem ser enviados dentro de um Array JSON. O nome que este array deve ter é **“itens“**.

| Campo                        | Tipo           | Obrigatório                                  | Descrição                                                                                                                                                                                                                                                                                                                                                                                                                         |
|------------------------------|----------------|----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| numero_item                  | numérico       | sim                                          | Número do item. Comece com 1 e aumente sequencialmente para cada item da NFCe.                          |
| codigo_ncm                   | texto          | sim                                          | Código NCM do produto (8 dígitos).
| codigo_produto               | texto          | sim                                          | Código do produto.
| descricao                    | texto          | sim                                          | Descrição do produto.                                                                                         |
| quantidade_comercial         | numérico       | sim                                          | Quantidade do item.
| quantidade_tributavel        | numérico       | sim                                          | Quantidade tributável do item.  Caso não se aplique utilize o mesmo valor de quantidade_comercial.                      |
| cfop                         | texto          | sim                                          | Código Fiscal da operação. Utilize algum CFOP da operação válido para Nota ao Consumidor.                                        |
| valor_unitario_comercial     | numérico       | sim                                          | Valor unitário do item. |
| valor_unitario_tributavel    | numérico       | sim                                          | Valor unitário tributável do item. Caso não se aplique utilize o mesmo valor que valor_unitario_comercial.                 |
| valor_bruto                  | numérico       | sim                                          | Valor bruto do item. Calculado como valor_unitario_comercial * quantidade_comercial                          |
| unidade_comercial            | texto          | sim                                          | Unidade comercial do produto. Você pode utilizar valores como “KG”, “L”, “UN”, etc. Caso não se aplique utilize “UN”. |
| unidade_tributavel           | texto          | sim                                          | Unidade tributável do produto. Caso não se aplique utilize o mesmo valor do campo unidade_comercial.                   |
| icms_origem                  | valor da lista | sim                                          | Alguns valores possíveis: **0**: nacional. **1**: estrangeira (importação direta). **2**: estrangeira (adquirida no mercado interno). **3**: nacional com mais de 40% de conteúdo estrangeiro. **4**: nacional produzida através de processos produtivos básicos. **5**: nacional com menos de 40% de conteúdo estrangeiro. **6**: estrangeira (importação direta) sem produto nacional similar. **7**: estrangeira (adquirida no mercado interno) sem produto nacional similar. |
| icms_situacao_tributaria     | valor da lista | sim                                          | Valores possíveis: Para empresas optantes do SIMPLES: **102** – Tributada pelo Simples Nacional sem permissão de crédito, **300** - Imune, **500** - CMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação. Para empresas não optantes do SIMPLES: **00** – tributada integralmente, **40** – Isenta, **41** - Não tributada, **60** - ICMS cobrado anteriormente por substituição tributária|
| icms_aliquota                | numérico       | Obrigatório se icms_situacao_tributaria = 00 | Alíquota do ICMS.  Deve estar entre 0 e 100.                                                               |
| icms_base_calculo            | numérico       | Obrigatório se icms_situacao_tributaria = 00 | Base de cálculo do ICMS. Normalmente é igual ao valor_bruto.                                                     |
| icms_modalidade_base _calculo | valor da lista | Obrigatório se icms_situacao_tributaria = 00 | Modalidade da base de cálculo do ICMS.Valores possíveis:0 – margem de valor agregado (%).1 – pauta (valor).2 – preço tabelado máximo (valor).3 – valor da operação.|
| valor_desconto               | numérico       |                                              | Valor do desconto do item. |
| valor_frete                  | numérico       |                                              | Valor do frete do item.  Usado apenas se entrega a domicílio. O frete deve ser “rateado” entre todos os itens.   |

### Transportador

| Campo                            | Tipo   | Obrigatório                   | Descrição|
|----------------------------------|--------|-------------------------------|--------------------------------------------------------------------------|
| cnpj_transportador               | string | sim se presenca_comprador = 4 | CNPJ do transportador. Se este campo for informado não deverá ser informado cpf_transportador.  |
| cpf_transportador                | string | sim se presenca_comprador = 4 | CPF do transportador. Se este campo for informado não deverá ser informado cnpj_transportador. |
| nome_transportador               | string | sim se presenca_comprador = 4 | Nome ou razão social do transportador.|
| inscricao_estadual_transportador | string | sim se presenca_comprador = 4 | Inscrição Estadual do transportador.|
| endereco_transportador           | string | sim se presenca_comprador = 4 | Endereço (logradouro, número, complemento e bairro) do transportador. |
| municipio_transportador          | string | sim se presenca_comprador = 4 | Município do transportador. |
| uf_transportador                 | string | sim se presenca_comprador = 4 | UF do transportador.|


### Pagamento

Os dados abaixo devem ser enviados dentro de um Array JSON. O nome que este array deve ter é **“formas_pagamento“**.

| Campo              | Tipo           | Obrigatório                                                     | Descrição  |
|--------------------|----------------|-----------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| forma_pagamento    | valor da lista | sim                                                             | Forma do recebimento. Alguns valores possíveis:01: Dinheiro.02: Cheque.03: Cartão de Crédito.04: Cartão de Débito.05: Crédito Loja.10: Vale Alimentação.11: Vale Refeição.12: Vale Presente.13: Vale Combustível.99: Outros   |
| valor_pagamento    | numérico       | sim                                                             | Valor do recebimento.   |
| tipo_integracao    | valor da lista | não                                                             | Tipo de Integração para pagamento. Para NFCe no Ceará é obrigatório informar o campo **nome_credenciadora**, veja as condições em [CFe SAT](#enviador-de-arquivos-s-t-nfce_cfe-s-t). Valores possíveis:1: Pagamento integrado com o sistema de automação da empresa (Ex.: equipamento TEF, Comércio Eletrônico) – Obrigatório informar cnpj_credenciadora e numero_autorizacao.2: Pagamento não integrado com o sistema de automação da empresa (valor padrão).  Informar apenas se forma_pagamento for 03 ou 04. |
| cnpj_credenciadora | numérico       | Obrigatório se tipo_integracao for 1                            | CNPJ da credenciadora do cartão de crédito. Somente CNPJ válido.                             |
| numero_autorizacao | string         | Obrigatório se tipo_integracao for 1                            | |
| bandeira_operadora | string         | Obrigatório em algumas UFs se forma_pagamento = 03 ou 04 (pagamento em cartão) | Bandeira da operadora de cartão de crédito e/ou débito. Valores possíveis:01: Visa.02: Mastercard.03: American Express.04: Sorocred.99: Outros.|

### Totalizadores

| Campos            | Tipo     | Obrigatório                                          | Descrição  |
|-------------------|----------|------------------------------------------------------|------------------------------------------------------|
| valor_produtos    | numérico | não                                                  | Valor total dos produtos.  Calculado automaticamente se não informado.                                                                                            |
| valor_desconto    | numérico | não                                                  | Valor total dos descontos. Calculado automaticamente se não informado.                                                                                            |
| valor_total       | numérico | não                                                  | Valor líquido dos produtos. Deve ser igual a valor_produtos – valor_desconto. Calculado automaticamente se não informado.                                          |
| valor_frete       | numérico | não                                                  | Valor total do frete. Deve conter o somatório do valor do frete dos itens (usado apenas em entrega a domicílio). Calculado automaticamente se não informado. |
| icms_valor_total  | numérico | não                                                  | Valor total de ICMS dos produtos.  Deve ser o somatório dos valores contidos em icms_valor nos items. Calculado automaticamente se não informado.                         |
| icms_base_calculo | numérico | sim, se algum item tem icms_situacao_tributaria = 00 | Valor total da base de cálculo do ICMS dos produtos. Deve ser o somatório dos valores contidos em icms_base_calculo nos items. Calculado automaticamente se não informado.                  |

### Campos calculados automaticamente

Para simplificar o envio da nota fiscal, alguns campos são calculados automaticamente a partir da versão 4.00 da NFCe. Os campos calculados são somatórios de campos fornecidos nos itens da nota fiscal. Os campos serão calculados apenas se eles não forem informados na API.

A lista de campos calculados automaticamente segue abaixo:

| Campo                                     | Somatório de campo dos itens        | Observação                                                  |
|-------------------------------------------|-------------------------------------|-------------------------------------------------------------|
| icms_base_calculo                         | icms_base_calculo                   |                                                             |
| valor_ipi                                 | ipi_valor                           |                                                             |
| icms_valor_total_st                       | icms_valor_st                       |                                                             |
| issqn_base_calculo                        | issqn_base_calculo                  |                                                             |
| issqn_valor_total                         | issqn_valor                         |                                                             |
| issqn_valor_total_deducao                 | issqn_valor_deducao                 |                                                             |
| issqn_valor_total_outras_retencoes        | issqn_valor_outras_retencoes        |                                                             |
| issqn_valor_total_desconto_incondicionado | issqn_valor_desconto_incondicionado |                                                             |
| issqn_valor_total_desconto_condicionado   | issqn_valor_desconto_condicionado   |                                                             |
| issqn_valor_total_retencao                | issqn_valor_retencao                |                                                             |
| issqn_base_calculo                        | issqn_base_calculo                  |                                                             |
| valor_total_ii                            | ii_valor                            |                                                             |
| fcp_valor_total                           | fcp_valor                           |                                                             |
| fcp_valor_total_uf_destino                | fcp_valor_uf_destino                |                                                             |
| fcp_valor_total_st                        | fcp_valor_st                        |                                                             |
| fcp_valor_total_retido_st                 | fcp_valor_retido_st                 |                                                             |
| icms_valor_total_uf_destino               | icms_valor_uf_destino               |                                                             |
| icms_valor_total_uf_remetente             | icms_valor_uf_remetente             |                                                             |
| icms_base_calculo                         | icms_base_calculo                   |                                                             |
| icms_valor_total                          | icms_valor                          |                                                             |
| icms_valor_total_desonerado               | icms_valor_desonerado               |                                                             |
| icms_base_calculo_st                      | icms_base_calculo_st                |                                                             |
| icms_valor_total_st                       | icms_valor_st                       |                                                             |
| valor_frete                               | valor_frete                         |                                                             |
| valor_seguro                              | valor_seguro                        |                                                             |
| valor_outras_despesas                     | valor_outras_despesas               |                                                             |
| valor_desconto                            | valor_desconto                      |                                                             |
| valor_ipi_devolvido                       | valor_ipi_devolvido                 |                                                             |
| valor_total_tributos                      | valor_total_tributos                |                                                             |
| valor_produtos                            | valor_bruto                         | Apenas se inclui_no_total=1                                 |
| valor_total_servicos                      | valor_bruto                         | Apenas se inclui_no_total=1 e item de serviço               |
| icms_valor_total                          | icms_valor                          | Apenas se icms_situacao_tributaria diferente de40, 41 e 50. |
| valor_pis_servicos                        | pis_valor                           | Apenas se item de serviço                                   |
| valor_cofins_servicos                     | cofins_valor                        | Apenas se item de serviço                                   |
| valor_pis                                 | pis_valor                           | Apenas se não for item de serviço                           |
| valor_cofins                              | cofins_valor                        | Apenas se não for item de serviço

Além disso, caso não seja fornecido, será calculado também o valor total da NFCe (valor_total), calculado da seguinte forma:

valor_produtos – valor_desconto – icms_valor_total_desonerado + icms_valor_total_st + valor_frete + valor_seguro + valor_outras_despesas + valor_total_ii + valor_ipi + valor_total_servicos

Além dos campos acima, os campos abaixo são preenchidos automaticament para NFCe, pois tem apenas um conteúdo válido possível:

* **tipo_documento** = 1, significando “Nota de saída”
* **consumidor_final** = 1, significando “Nota para consumidor final”
* **finalidade_emissao** = 1, significando “Nota normal”

## Status API

Aqui você encontra os status possíveis para NFCe.

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
404 - not found | nfce_nao_encontrada | NFCe não encontrada | Verifique se a NFCe informada existe e está autorizada.
404 - not found | nfce_nao_autorizada | NFCe não autorizada | O cancelamento só é possível para NFCe's autorizadas.
400 - bad request | justificativa_nao_informada | Parâmetro "justificativa" não informado | É necessário usar o parâmetro 'justificativa'. Consulte a nossa documentação.
400 - bad request | forma_emissao_nao_informada | Parâmetro "forma_emissao" inválido ou não informado | Verifique o valor informado no campo "forma_emissao". Consulte a nossa documentação.
400 - bad request | ref_ausente | Parâmetro "ref" não informado | É necessário usar o parâmetro 'ref' nessa requisição com a API. Consulte a nossa documentação.
422 - unprocessable entity | ambiente_nao_configurado | Ambiente não configurado para emissão de NFCe | O ambiente de emissão de NFCe não foi configurado para o seu emitente. Entre em contato com a nossa equipe de suporte.
422 - unprocessable entity | empresa_nao_configurada | Empresa não configurada para emissão de NFCe | É necessário informar no cadastro do emitente(Painel API) o CSC e id_token(gerados na Sefaz do Estado do emitente), para emissão de NFCe.

## Envio


```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfce"

# Substituir pela sua identificação interna da nota
ref = {"ref":"1234"}

token="token obtido no cadastro da empresa"

'''
Usamos dicionarios para armazenar os campos e valores que em seguida,
serao convertidos em JSON e enviados para nossa API
'''
nfce = {}
items = {}
formas_pagamento={}

nfce["cnpj_emitente"] = "99999999999999"
nfce["nome_emitente"] = "Acme ink"
nfce["nome_fantasia_emitente"] = "Acme ink"
nfce["logradouro_emitente"] = "Rua Tupiniquim"
nfce["numero_emitente"] = "4000"
nfce["bairro_emitente"] = "Brás"
nfce["municipio_emitente"] = "São Paulo"
nfce["uf_emitente"] = "SP"
nfce["cep_emitente"] = "99997-000"
nfce["inscricao_estadual_emitente"] = "111111111"
nfce["data_emissao"] = "2018-03-06T17:11:00.939-03:00"
nfce["natureza_operacao"] = "Venda ao Consumidor"
nfce["tipo_documento"] = "1"
nfce["presenca_comprador"] = "1"
nfce["finalidade_emissao"] = "1"
nfce["modalidade_frete"] = "9"
nfce["forma_pagamento"] = "0"
nfce["nome_destinatario"] = "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL"
nfce["cpf_destinatario"] = "99999999999"
nfce["informacoes_adicionais_contribuinte"] = "Informacoes adicionais do contribuinte"
nfce["valor_produtos"] = "15.0"
nfce["valor_desconto"] = "0.00"
nfce["valor_total"] = "15.0"
formas_pagamento["forma_pagamento"] = "4"
formas_pagamento["valor_pagamento"] = "15.00"
formas_pagamento["bandeira_operadora"] = "7"
formas_pagamento["troco"] = "0"
itens["numero_item"] = "1"
itens["codigo_produto"] = "353"
itens["descricao"] = "NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL"
itens["codigo_ncm"] = "48024090"
itens["cfop"] = "5102"
itens["valor_desconto"] = "0.00"
itens["icms_origem"] = "0"
itens["icms_situacao_tributaria"] = "400"
itens["unidade_comercial"] = "UN"
itens["unidade_tributavel"] = "UN"
itens["quantidade_comercial"] = "10"
itens["quantidade_tributavel"] = "10"
itens["valor_unitario_comercial"] = "1.5"
itens["valor_unitario_tributavel"] = "1.5"
itens["valor_bruto"] = "15.00"

# Adicionamos os dados das variaveis itens e formas_pagamento como listas ao dicionario principal.
nfce["items"] = [itens]
nfce["formas_pagamento"] = [formas_pagamento]

r = requests.post(url, params=ref, data=json.dumps(nfce), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```

```shell
# arquivo.json deve conter os dados da NFCe
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T arquivo.json https://homologacao.focusnfe.com.br/v2/nfce
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

public class NFCeAutorizar {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfce?ref="+ ref+"&completa=1");

      /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    /* Aqui são criados as hash's que receberão os dados da nota. */
    HashMap<String, String> nfce = new HashMap<String, String>();
    HashMap<String, String> itens = new HashMap<String, String>();
    HashMap<String, String> formasPagamento = new HashMap<String, String>();

    nfce.put("data_emissao", "2018-01-15T16:25:00");
    nfce.put("consumidor_final", "1");
    nfce.put("modalidade_frete", "9");
    nfce.put("natureza_operacao", "Venda ao Consumidor");
    nfce.put("tipo_documento", "1");
    nfce.put("finalidade_emissao", "1");
    nfce.put("presenca_comprador", "1");
    nfce.put("indicador_inscricao_estadual_destinatario", "9");
    nfce.put("cnpj_emitente", "51916585000125");
    nfce.put("cpf_destinatario", "");
    nfce.put("id_estrangeiro_destinatario", "1234567");
    nfce.put("nome_destinatario", "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL");
    nfce.put("informacoes_adicionais_contribuinte", "Documento emitido por ME ou EPP optante pelo Simples Nacional nao gera direito a credito fiscal de ICMS lei 123/2006.");
    nfce.put("valor_produtos", "1.0000");
    nfce.put("valor_desconto", "0.0000");
    nfce.put("valor_total", "1.0000");
    nfce.put("forma_pagamento", "0");
    nfce.put("icms_base_calculo", "0.0000");
    nfce.put("icms_valor_total", "0.0000");
    nfce.put("icms_base_calculo_st", "0.0000");
    nfce.put("icms_valor_total_st", "0.0");
    nfce.put("icms_modalidade_base_calculo", "3");
    nfce.put("valor_frete", "0.0");
    itens.put("numero_item", "1");
    itens.put("unidade_comercial", "PC");
    itens.put("unidade_tributavel", "PC");
    itens.put("codigo_ncm", "94019090");
    itens.put("codigo_produto", "Div.13350000");
    itens.put("descricao", "NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL");
    itens.put("cfop", "5102");
    itens.put("valor_unitario_comercial", "1.0000000000");
    itens.put("valor_unitario_tributavel", "1.0000000000");
    itens.put("valor_bruto", "1.0000");
    itens.put("quantidade_comercial", "1.0000");
    itens.put("quantidade_tributavel", "1.0000");
    itens.put("quantidade", "1.0000");
    itens.put("icms_origem", "0");
    itens.put("icms_base_calculo", "1.00");
    itens.put("icms_modalidade_base_calculo", "3");
    itens.put("valor_frete", "0.0");
    itens.put("valor_outras_despesas", "0.0");
    itens.put("icms_situacao_tributaria", "102");
    formasPagamento.put("forma_pagamento", "99");
    formasPagamento.put("valor_pagamento", "1.0000");

    /* Depois de fazer o input dos dados, são criados os objetos JSON já com os valores das hash's. */
    JSONObject json = new JSONObject (nfce);
    JSONObject jsonItens = new JSONObject (itens);
    JSONObject jsonPagamento = new JSONObject (formasPagamento);

    /* Aqui adicionamos os objetos JSON nos campos da API como array no JSON principal. */
    json.append("items", jsonItens);
    json.append("formas_pagamento", jsonPagamento);

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
url_envio = servidor_homologacao + "v2/nfce?ref=" + ref

# altere os campos conforme a nota que será enviada
dados_da_nota = {
  cnpj_emitente: "05953016000132",
  data_emissao: "2017-12-06 14:45:10",
  indicador_inscricao_estadual_destinatario: "9",
  modalidade_frete: "9",
  local_destino: "1",
  presenca_comprador: "1",
  natureza_operacao: "VENDA AO CONSUMIDOR",
  items: [
    numero_item: "1",
    codigo_ncm: "62044200",
    quantidade_comercial: "1.00",
    quantidade_tributavel: "1.00",
    cfop: "5102",
    valor_unitario_tributavel: "79.00",
    valor_unitario_comercial: "79.00",
    valor_desconto: "0.00",
    descricao: "NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
    codigo_produto: "251887",
    icms_origem: "0",
    icms_situacao_tributaria: "102",
    unidade_comercial: "un",
    unidade_tributavel: "un",
    valor_total_tributos: "24.29"
  ],
  formas_pagamento: [
    forma_pagamento: "03",
    valor_pagamento: "79.00",
    nome_credenciadora: "Cielo",
    bandeira_operadora: "02",
    numero_autorizacao: "R07242"
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
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$nfe = array (
   "cnpj_emitente" => "51916585000125",
   "data_emissao" => "2017-12-07T12:40:10",
   "indicador_inscricao_estadual_destinatario" => "9",
   "modalidade_frete" => "9",
   "local_destino" => "1",
   "presenca_comprador" => "1",
   "natureza_operacao" => "VENDA AO CONSUMIDOR",
  "itens" => array(
    array(
      "numero_item" => "1",
         "codigo_ncm" => "62044200",
         "quantidade_comercial" => "1.00",
         "quantidade_tributavel" => "1.00",
         "cfop" => "5102",
         "valor_unitario_tributavel" => "1.00",
         "valor_unitario_comercial" => "1.00",
         "valor_desconto" => "0.00",
         "descricao" => "NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
         "codigo_produto" => "251887",
         "icms_origem" => "0",
         "icms_situacao_tributaria" => "102",
         "unidade_comercial" => "un",
         "unidade_tributavel" => "un",
         "valor_total_tributos" => "1.00"
    )
  ),
  "formas_pagamento" => array(
    array(
         "forma_pagamento" => "03",
         "valor_pagamento" => "1.00",
         "nome_credenciadora" => "Cielo",
         "bandeira_operadora" => "02",
         "numero_autorizacao" => "R07242"
     )
  ),
);
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfce?ref=" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($nfe));
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
var url = "https://homologacao.focusnfe.com.br/v2/nfce?ref=" + ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var nfce = {
"natureza_operacao":"VENDA AO CONSUMIDOR",
"data_emissao":"2018-03-21T11:52:00-03:00",
"tipo_documento":"1",
"presenca_comprador":"1",
"consumidor_final":"1",
"finalidade_emissao":"1",
"cnpj_emitente":"51916585000125",
"nome_destinatario":"",
"cpf_destinatario":"",
"informacoes_adicionais_contribuinte":"RETIRADA POR CONTA DO DESTINATÁRIO",
"valor_produtos":"1.00",
"valor_desconto":"0.00",
"valor_total":"1.00",
"forma_pagamento":"0",
"icms_valor_total":"0",
"modalidade_frete": "9",
"items":[
    {"numero_item":"1",
     "codigo_ncm":"84713012",
     "codigo_produto":"999",
     "descricao":"NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
     "quantidade_comercial":"1.00",
     "quantidade_tributavel":"1.00",
     "cfop":"5102",
     "valor_unitario_comercial":"1.00",
     "valor_unitario_tributavel":"1.00",
     "valor_bruto":"1.00",
     "unidade_comercial":"un",
     "unidade_tributavel":"un",
     "icms_origem":"2",
     "icms_situacao_tributaria":"102",
     "icms_aliquota":"0",
     "icms_base_calculo":"0",
     "icms_modalidade_base_calculo":"3"
    }
  ],
    "formas_pagamento":[
        {"forma_pagamento":"1",
         "valor_pagamento":"1.00"
        }
    ]
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(nfce));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

Para enviar uma NFCe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Envia uma NFCe para autorização:

`https://api.focusnfe.com.br/v2/nfce?ref=REFERENCIA&completa=(0|1)`

Utilize o comando HTTP POST para enviar a sua nota para nossa API. A URL recebe como parâmetro a referência no campo “ref” e pode ser informado opcionalmente o campo “completa” com o valor 1 (verdadeiro) ou 0 (falso). Este parâmetro indica se será exibida a nota completa caso ela seja autorizada. Esta operação é detalhada na próxima seção.

Envie como corpo do POST os dados em formato JSON da nota fiscal.

A numeração da nota (número e série) pode ser definido automaticamente pela API, nós recomendamos que deixe a sua numeração sob nossa responsabilidade, por questões de simplicidade. Entretanto, você pode controlar o envio destas informações pela sua aplicação, basta informar os campos **“numero”** e **“serie”** nos dados de envio.

O envio de uma NFCe é um processo **síncrono**, ou seja, diferente da NFe a nota é autorizada ou rejeitada na mesma requisição. A resposta da requisição irá conter o mesmo resultado que a operação da consulta, descrita a seguir.

> Exemplos de respostas da API por **status** para a requisição de envio:

> autorizado

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe41190607504505000132650010000000121743484310",
  "numero": "12",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132650010000000121743484310-nfe.xml",
  "caminho_danfe": "/notas_fiscais_consumidor/NFe41190607504505000132650010000000121743484310.html",
  "qrcode_url": "http://www.fazenda.pr.gov.br/nfce/qrcode/?p=41190607504505000132650010000000121743484310|2|2|1|5E264C0E28D801197219894CDFCF2FCCC5237F08",
  "url_consulta_nf": "http://www.fazenda.pr.gov.br/nfce/consulta"
}
```

> autorizado em contingência offline e ainda não efetivado

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe41190607504505000132650010000000121743484310",
  "numero": "12",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132650010000000121743484310-nfe.xml",
  "caminho_danfe": "/notas_fiscais_consumidor/NFe41190607504505000132650010000000121743484310.html",
  "qrcode_url": "http://www.fazenda.pr.gov.br/nfce/qrcode/?p=41190607504505000132650010000000121743484310|2|2|1|5E264C0E28D801197219894CDFCF2FCCC5237F08",
  "url_consulta_nf": "http://www.fazenda.pr.gov.br/nfce/consulta",
  "contingencia_offline": true,
  "contingencia_offline_efetivada": false
}
```

> erro_autorizacao

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899",
  "status": "erro_autorizacao",
  "status_sefaz": "591",
  "mensagem_sefaz": "Informado CSOSN para emissor que nao e do Simples Nacional (CRT diferente de 1). [nItem:1]"
}
```

### Emissão automática em contingência offline

Ao tentar emitir uma NFCe, iremos tentar comunicação com a SEFAZ. Caso a comunicação seja realizada com sucesso, a nota será emitida e a DANFCe gerada. Porém, caso a comunicação não seja possível, iremos imediatamente emitir uma *outra nota* (com numeração subsequente) em contingência offline, nos estados onde isso for possível. Isso significa gerar um XML e DANFCe temporários até que a comunicação com a SEFAZ seja reestabelecida. Ao final, os dados gerados serão devolvidos na requisição de autorização. Todo este processo é síncrono.

É necessário emitir uma outra nota pois não há garantias de que a SEFAZ não tenha recebido a requisição original. Desta forma, é mais prudente emitir a nota com outro número e posteriormente consultar a nota original para confirmar o seu status, assim evitamos erros de duplicidade de numeração ao fazer a efetivação da contingência quando os servidores da SEFAZ voltarem a responder.

Será de responsabilidade de nossa API, após devolver o XML e DANFCe temporários, tentar reestabelecer comunicação com a SEFAZ ao longo das próximas 24 horas após a emissão. Quando conseguirmos conectividade novamente serão efetuadas duas ações:

* A nota emitida em contingência será efetividade na SEFAZ e iremos substituir o XML e DANFCe por suas versões definitivas
* Iremos consultar o status da requisição original. Caso a nota tenha sido autorizada, é feito o cancelamento da nota. Caso ela realmente não tenha sido autorizada, o número é inutilizado.

É possível que uma nota emitida em contingência não possa ser efetivada devido a erros no XML (como por exemplo, NCM incorreto ou impostos inconsistentes). Neste caso tanto o número da nota original quanto o número da nota em contingência serão inutilizados automaticamente.

O sistema cliente da API pode acompanhar este processo de forma transparente, conforme descrito na seção “Consulta” deste manual.

### Emissão manual em contingência offline

A emissão automática em contingência contempla o caso em que o SEFAZ esteja fora do ar mas não contempla o caso em que *sua aplicação* esteja sem conexão com a Internet. Neste caso você pode optar por fazer uma emissão manual em contingência nos estados onde isto é autorizado.

De forma resumida, isto poderá ser feito da seguinte forma:

1. Sua aplicação emite uma DANFCe - sem se comunicar com o nosso sistema - em duas vias (uma para ficar no estabelecimento e outra entregue ao cliente)
1. Após identificar que sua conexão foi reestabelecida, você envia os dados da nota  para nossa API informando todos os dados utilizados na NFCe (incluindo número e
série da nota) e informando o parâmetro "forma_emissao" com o valor "offline".

Para conseguir realizar estas tarefas, sua aplicação deverá manter um controle
de numeração de notas emitidas em contingência. A série utilizada deverá ser diferente
daquela utilizada pelo nosso sistema. Por exemplo: se nosso sistema emite com a
série 1 o seu sistema poderá emitir notas em contingência com a série 600, por
exemplo.

Ao emitir a nota em nossa API, você deverá chamar nossa URL acrescentando o campo "forma_emissao" com o valor "offline". Por exemplo, se você está fazendo testes no ambiente de homologação, e enviando
a nota com a referência "123", você deverá chamar a seguinte URL:

`https://homologacao.focusnfe.com.br/v2/nfce?ref=123&forma_emissao=offline`

Nos dados JSON da nota, acrescente os seguintes campos:

* numero - O número da nota
* serie - A série de contingência
* codigo_unico - O código único (tag cNF) utilizado na geração da chave da NFe

Usando esta forma de emissão, a SEFAZ irá autorizar notas mesmo com a data de
emissão retroativa.

## Consulta

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfce/"

# Substituir pela sua identificação interna da nota
ref = "1234"

token="token obtido no cadastro da empresa"

# Use este parametro para obter mais informacoes em suas consultas
completa = "completa=1"

r = requests.get(url+ref, params=completa, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)l

```

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/nfce/12345
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFCeConsulta {

  public static void main(String[] args) {

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfce/"+ref+"?completa=1");

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
url_envio = servidor_homologacao + "v2/nfce/" + ref

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
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfce/" . $ref);
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
var url = "https://homologacao.focusnfe.com.br/v2/nfce/" + ref + "?completa=1";

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

Para consultar uma NFCe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Consultar as informações de uma NFCe:

`https://api.focusnfe.com.br/v2/nfce/REFERENCIA?completa=(0|1)`

Utilize o comando **HTTP GET** para consultar a sua nota para nossa API.

Parâmetro Opcional | Ação
-------|-------|-----
completa = 0 ou 1 | Habilita a API há mostrar campos adicionais na requisição de consulta.


> Exemplo de resposta da consulta de NFCe (completa=0):

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "07504505000132_NFCE_000001",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe42210607504505000132650010000000541799075218",
  "numero": "524",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/202106/XMLs/42210607504505000132650010000000541799075218-nfe.xml",
  "caminho_danfe": "/notas_fiscais_consumidor/NFe42210607504505000132650010000000541799075218.html",
  "qrcode_url": "https://hom.sat.sef.sc.gov.br/nfce/consulta?p=42210607504505000132650010000000541799075218|2|2|1|EB75B2FF9C11198DF1093E9582AB7F1A9B08D518",
  "url_consulta_nf": "https://hom.sat.sef.sc.gov.br/nfce/consulta"
}
```

Campos de retorno:

* **status:** A situação da NFCe, podendo ser:
   * **autorizado:** A nota foi autorizada, neste caso é fornecido os dados completos da nota como chave e arquivos para download
   * **cancelado:** O documento foi cancelado, neste caso é fornecido o caminho para download do XML de cancelamento (caminho_xml_cancelamento) e o numero do protocolo de cancelamento (numero_protocolo).
   * **erro_autorizacao:** Houve um erro de autorização por parte da SEFAZ. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. É possível fazer o reenvio da nota com a mesma referência se ela estiver neste estado.
   * **denegado:** O documento foi denegado. Uma SEFAZ pode denegar uma nota se houver algum erro cadastral nos dados do destinatário ou do emitente. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. Não é possível reenviar a nota caso este estado seja alcançado pois é gerado um número, série, chave de NFe e XML para esta nota. O XML deverá ser armazenado pelo mesmo período de uma nota autorizada ou cancelada.
* **status_sefaz:** O status da nota na SEFAZ.
* **mensagem_sefaz:** Mensagem descritiva da SEFAZ detalhando o status.
* **serie:** A série da nota fiscal, caso ela tenha sido autorizada.
* **numero:** O número da nota fiscal, caso ela tenha sido autorizada.
* **cnpj_emitente:** O CNPJ emitente da nota fiscal (o CNPJ de sua empresa).
* **ref:** A referência da emissão.
* **chave_nfe:** A chave da NFe, caso ela tenha sido autorizada.
* **caminho_xml_nota_fiscal:** caso a nota tenha sido autorizada, retorna o caminho para download do XML.
* **caminho_danfe:** caso a nota tenha sido autorizada retorna o caminho para download do DANFCe. O formato devolvido será '.html'.
* **caminho_xml_cancelamento:** Caso a nota esteja cancelada, é fornecido o caminho para fazer o download do XML de cancelamento.
* **numero_protocolo:** Caso a nota tenha sido cancelada, será informado aqui o número do protocolo do cancelamento.
* **contingencia_offline** Este campo irá aparecer apenas quando a nota tiver sido emitida em contingência offline.
* **contingencia_offline_efetivada** Quando a nota tiver sido emitida em contingência offline, este campo irá mostrar se a nota já foi efetivada (transmitida para a SEFAZ) ou não.
* **tentativa_anterior**: Nos casos de contingência offline, esta chave irá conter outros campos quando conseguirmos determinar o que houve com a tentativa original. Esta seção poderá conter os seguintes campos:
 * status: autorizado, processando_autorizacao ou cancelado. A API irá automaticamente proceder com o cancelamento quando necessário
 * serie
 * numero
 * chave_nfe
 * caminho_xml_nota_fiscal
 * caminho_xml_cancelamento
 * numero_protocolo


Caso na requisição seja passado o parâmetro `completa=1` será adicionado mais 6 campos:

* **requisicao_nota_fiscal**: Inclui os dados completos da requisição da nota fiscal, da mesma forma que constam no XML da nota.
* **protocolo_nota_fiscal**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_cancelamento**: Inclui os dados completos da requisição de cancelamento da nota fiscal.
* **protocolo_cancelamento**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_carta_correcao**: Inclui os dados completos da requisição de Carta de Correção Eletrônica da NFe.
* **protocolo_carta_correcao**: Inclui os dados completos do protocolo devolvido pela SEFAZ.

> Exemplo de resposta usando o parâmetro opcional, completa, recebendo o valor "1":

```json
{
    "requisicao_cancelamento": {
    "versao": "1.00",
    "id_tag": "ID1101119118017764335300017255003000000025138154946401",
    "codigo_orgao": "41",
    "ambiente": "2",
    "cnpj": "CNPJ_DO_EMITENTE",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "data_evento": "2012-01-17T16:00:28-02:00",
    "tipo_evento": "110111",
    "numero_sequencial_evento": "1",
    "versao_evento": "1.00",
    "descricao_evento": "Cancelamento",
    "protocolo": "141180000026777",
    "justificativa": "Informe aqui a sua justificativa para realizar o cancelamento da NFe."
  },
  "protocolo_cancelamento": {
    "versao": "1.00",
    "ambiente": "2",
    "versao_aplicativo": "PR-v3_8_7",
    "codigo_orgao": "41",
    "status": "135",
    "motivo": "Evento registrado e vinculado a NF-e",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "tipo_evento": "110111",
    "descricao_evento": "Cancelamento",
    "data_evento": "2012-01-17T16:00:31-02:00",
    "numero_protocolo": "141180000026777"
  },
   "requisicao_carta_correcao": {
    "versao": "1.00",
    "id_tag": "ID1101109118017764335300017255003000000025138154946401",
    "codigo_orgao": "41",
    "ambiente": "2",
    "cnpj": "CNPJ_DO_EMITENTE",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "data_evento": "2012-01-17T15:59:34-02:00",
    "tipo_evento": "110110",
    "numero_sequencial_evento": "1",
    "versao_evento": "1.00",
    "descricao_evento": "Carta de Correcao",
    "correcao": "Informe aqui os campos que foram corrigidos na NFe.",
    "condicoes_uso": "A Carta de Correcao e disciplinada pelo paragrafo 1o-A do art. 7o do Convenio S/N, de 15 de dezembro de 1970 e pode ser utilizada para regularizacao de erro ocorrido na emissao de documento fiscal, desde que o erro nao esteja relacionado com: I - as variaveis que determinam o valor do imposto tais como: base de calculo, aliquota, diferenca de preco, quantidade, valor da operacao ou da prestacao; II - a correcao de dados cadastrais que implique mudanca do remetente ou do destinatario; III - a data de emissao ou de saida."
  },
  "protocolo_carta_correcao": {
    "versao": "1.00",
    "ambiente": "2",
    "versao_aplicativo": "PR-v3_8_7",
    "codigo_orgao": "41",
    "status": "135",
    "motivo": "Evento registrado e vinculado a NF-e",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "tipo_evento": "110110",
    "descricao_evento": "Carta de Correção",
    "data_evento": "2012-01-17T15:59:37-02:00",
    "numero_protocolo": "141180000026777"
  }
}
```

### Download do XML da NFCe

Após a autorização da nota fiscal de consumidor eletrônica será disponibilizado os campos:

caminho_xml_nota_fiscal - Representa o caminho para montar a URL para download do XML. Por exemplo, se você utilizou o ambiente de produção (https://api.focusnfe.com.br) e o caminho_xml_nota_fiscal contém o caminho "/arquivos/733530172/201704/XMLs/41170777627353999172550010000003871980884091-nfe.xml" você poderá acessar o XML pela URL completa https://api.focusnfe.com.br/arquivos/733530172/201704/XMLs/41170777627353999172550010000003871980884091-nfe.xml

Utilize o método **HTTP GET** para essa consulta.

Existe obrigatoriedade legal para armazenar o XML de todas as notas NFCe (modelo 65) por pelo menos 5 anos após a data de autorização da nota. Nossa API faz a guarda automática dos arquivos por esse período.

> Exemplos de respostas da API por **status** para a requisição de consulta:

> autorizado

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe41190607504505000132650010000000121743484310",
  "numero": "12",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132650010000000121743484310-nfe.xml",
  "caminho_danfe": "/notas_fiscais_consumidor/NFe41190607504505000132650010000000121743484310.html",
  "qrcode_url": "http://www.fazenda.pr.gov.br/nfce/qrcode/?p=41190607504505000132650010000000121743484310|2|2|1|5E264C0E28D801197219894CDFCF2FCCC5237F08",
  "url_consulta_nf": "http://www.fazenda.pr.gov.br/nfce/consulta"
}
```

> erro_autorizacao

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_0008992",
  "status": "erro_autorizacao",
  "status_sefaz": "591",
  "mensagem_sefaz": "Informado CSOSN para emissor que nao e do Simples Nacional (CRT diferente de 1). [nItem:1]"
}
```

> cancelado

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899",
  "status": "cancelado",
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a NF-e",
  "numero": "12",
  "serie": "1",
  "chave_nfe": "NFe41190607504505000132650010000000121743484310",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132650010000000121743484310-nfe.xml",
  "caminho_xml_cancelamento": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132650010000000121743484310-can.xml",
  "numero_protocolo": "141230000025397"
}
```

## Cancelamento


```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfce/"

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
  https://homologacao.focusnfe.com.br/v2/nfce/12345
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

public class NFCeCancelamento {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfce/"+ref);

    /* Aqui criamos um hashmap para receber a chave "justificativa" e o valor desejado. */
    HashMap<String, String> justificativa = new HashMap<String, String>();
    justificativa.put("justificativa", "Informe aqui a sua justificativa para realizar o cancelamento da NFCe.");

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
url_envio = servidor_homologacao + "v2/nfce/" + ref

# altere os campos conforme a nota que será enviada
justificativa_cancelamento = {
  justificativa: "Informe aqui a sua justificativa para realizar o cancelamento da NFCe."
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
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$justificativa = array ("justificativa" => "Teste de cancelamento de nota");
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server . "/v2/nfce/" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($justificativa));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$result = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
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
var url = "https://homologacao.focusnfe.com.br/v2/nfe/"+ ref;

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


Para cancelar uma NFCe, basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Cancelar uma NFCe já autorizada:

`https://api.focusnfe.com.br/v2/nfce/REFERENCIA`

Utilize o comando HTTP **DELETE** para cancelar a sua nota para nossa API. Este método é síncrono, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

O parâmetro de cancelamento deverá ser enviado da seguinte forma:

* **justificativa:** Justificativa do cancelamento. Deverá conter de 15 a 255 caracteres.

A API irá em seguida devolver os seguintes campos:

* **status:** cancelado, se a nota pode ser cancelada, ou erro_cancelamento, se houve algum erro ao cancelar a nota.
* **status_sefaz:** O status do cancelamento na SEFAZ.
* **mensagem_sefaz:** Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml_cancelamento:** Caso a nota tenha sido cancelada, será informado aqui o caminho para download do XML de cancelamento.
* **numero_protocolo:** Caso a nota tenha sido cancelada, será informado aqui o número do protocolo do cancelamento.

**Prazo de cancelamento**

A NFCe poderá ser cancelada em até 30 minutos após a emissão.

> Exemplos de respostas da API por **status** para a requisição de cancelamento:

> cancelado

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a NF-e",
  "status": "cancelado",
  "caminho_xml_cancelamento": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132650010000000121743484310-can.xml",
  "numero_protocolo": "141230000025397"
}
```

> requisicao_invalida

```json
{
  "codigo": "requisicao_invalida",
  "mensagem": "Parâmetro \"justificativa\" deve ter entre 15 e 255 caracteres"
}
```

> nfe_nao_autorizada

```json
{
  "codigo": "nfe_nao_autorizada",
  "mensagem": "Nota fiscal não autorizada"
}
```


## Inutilização


```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfce/inutilizacao"

token="token obtido no cadastro da empresa"

'''
Usamos dicionarios e listas para armazenar os campos e valores que em seguida,
serao convertidos em JSON e enviados para nossa API
'''
inutilizacao={}
inutilizacao["cnpj"] = "CNPJ da empresa emitente"
inutilizacao["serie"] = "Serie da numeracao da NFCe que tera uma faixa de numeracao inutilizada"
inutilizacao["numero_inicial"] = "Numero inicial a ser inutilizado"
inutilizacao["numero_final"] = "Numero final a ser inutilizado"
inutilizacao["justificativa"] = "Justificativa da inutilizacao (minimo 15 caracteres)"

r = requests.post(url, data=json.dumps(inutilizacao), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)

```

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"cnpj":"51916585009999","serie":"9","numero_inicial":"7730","numero_final":"7732","justificativa":"Teste de inutilizacao de nota"}' \
  https://homologacao.focusnfe.com.br/v2/nfce/inutilizacao
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

public class NFCeInutilizacao {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfce/inutilizacao");

    /* Aqui criamos um hash que irá receber as chaves e valores esperados para gerar a inutilização. */
    HashMap<String, String> dadosInutilizacao = new HashMap<String, String>();
    dadosInutilizacao.put("cnpj", "51916585009999");
    dadosInutilizacao.put("serie", "9");
    dadosInutilizacao.put("numero_inicial", "7730");
    dadosInutilizacao.put("numero_final", "7732");
    dadosInutilizacao.put("justificativa", "Informe aqui a justificativa para realizar a inutilizacao da numeracao.");

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
url_envio = servidor_homologacao + "v2/nfce/inutilizacao"

# altere os campos conforme a nota que será enviada
dados_inutilizacao = {
  cnpj: "51916585009999",
  serie: "9",
  numero_inicial: "7730",
  numero_final: "7732",
  justificativa: "Informe aqui a justificativa para realizar a inutilizacao da numeracao."
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

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
$login = "token obtido no cadastro da empresa";
$password = "";
$inutiliza = array (
  "cnpj" => "51916585000125",
  "serie" => "1",
  "numero_inicial" => "107",
  "numero_final" => "109",
  "justificativa" => "Teste+de+inutilizacao+de+nota"
);
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfce/inutilizacao");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($inutiliza));
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
var url = "https://homologacao.focusnfe.com.br/v2/nfce/inutilizacao";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var inutiliza = {
"cnpj": "51916585000125",
"serie": "1",
"numero_inicial": "700",
"numero_final": "703",
"justificativa": "Teste de inutilizacao de nota"
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(inutiliza));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```



Em uma situação normal você não precisará informar ao SEFAZ a inutilização de um número da NFCe, pois a API controla automaticamente a numeração das notas. Porém, se por alguma situação específica for necessário a inutilização de alguma faixa de números você poderá chamar as seguintes operações:

Envio de inutilização de faixa de numeração:

`https://api.focusnfe.com.br/v2/nfce/inutilizacao`

Utilize o comando HTTP **POST** para enviar a sua inutilização para nossa API. Este método é **síncrono**, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

A inutilização precisa dos seguintes parâmetros obrigatórios:

* **cnpj:** CNPJ da empresa emitente
* **serie:** Série da numeração da NFCe que terá uma faixa de numeração inutilizada
* **numero_inicial:** Número inicial a ser inutilizado
* **numero_final:** Número final a ser inutilizado
* **justificativa:** Justificativa da inutilização (mínimo 15 caracteres)

A API irá enviar uma resposta com os seguintes campos:

* **status:** autorizado, se a inutilização foi aceita pela SEFAZ, ou erro_autorizacao, se houve algum erro ao inutilizar os números.
* **status_sefaz:** O status da carta de correção na SEFAZ.
* **mensagem_sefaz:** Mensagem descritiva da SEFAZ detalhando o status.
* **serie:** Série da numeração da NFCe que terá uma faixa de numeração inutilizada
* **numero_inicial:** Número inicial a ser inutilizado
* **numero_final:** Número final a ser inutilizado
* **cnpj:** CNPJ da empresa
* **modelo:** Modelo do documento (65 para NFCe)
* **caminho_xml:** Caminho do XML para download caso a inutilização tenha sido autorizada pela SEFAZ.

Em algumas situações em que sejam identificados erros de emissão de forma tardia, nossa API pode decidir pela inutilização de números ao invés de reutilizá-los para outras emissões. Desta forma você pode criar um gatilho (webhook) para ser notificado sempre que houver a inutilização de alguma faixa de numeração. Consulte a [seção de gatilhos](https://focusnfe.com.br/doc/#gatilhos-webhooks_gatilhos-webhooks) e utilize o evento chamado "inutilizacao".

> Exemplos de respostas da API por **status** para a requisição de inutilização:

> autorizado

```json
{
  "status_sefaz": "102",
  "mensagem_sefaz": "Inutilizacao de numero homologado",
  "serie": "1",
  "numero_inicial": "999",
  "numero_final": "1000",
  "modelo": "65",
  "cnpj": "1807504405000132",
  "status": "autorizado",
  "caminho_xml": "/arquivos_development/07504505000132/201906/XMLs/190750450500013265001000000999000001000-inu.xml"
}
```

> erro_autorizacao

```json
{
  "status_sefaz": "241",
  "mensagem_sefaz": "Um numero da faixa ja foi utilizado",
  "serie": "1",
  "numero_inicial": "1",
  "numero_final": "9",
  "status": "erro_autorizacao"
}
```

## Reenvio de e-mail
```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfce/"

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
print(r.status_code, r.text)l

```

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"emails":["alguem@example.org"]}' \
  https://homologacao.focusnfe.com.br/v2/nfce/12345/email
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

public class NFCeEnviaEmail {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfce/"+ref+"/email");

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
url_envio = servidor_homologacao + "v2/nfce/" + ref + "/email"

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
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$email = array (
  "emails" => array(
    "email@email.com"
    )
  );
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfce/" . $ref . "/email");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($email));
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
var url = "https://homologacao.focusnfe.com.br/v2/nfce/" + ref + "/email";

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

`https://api.focusnfe.com.br/v2/nfce/REFERENCIA/email`

Utilize o comando HTTP **POST** para enviar os emails. Esta operação aceita apenas um parâmetro:

* **emails:** Array com uma lista de emails que deverão receber uma cópia da nota. Limitado a 10 emails por vez.

A API imediatamente devolve a requisição com a confirmação dos emails. Os emails serão enviados em segundo plano, por isso pode levar alguns minutos até que eles cheguem à caixa postal.
