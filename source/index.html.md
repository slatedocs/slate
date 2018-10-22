---
title: Newpost API

language_tabs:

- json: JSON
- xml: XML

toc_footers:
- <a href='mailto:henrique@newpost.com'>Desenvolvimento Newpost</a>
- <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
- errors

search: true
---

# Introdução

Bem vindo à documetnação da API do sistema Newpost, este documento possui os métodos e parametros para a criação, consulta e alteração de envios no sistema da Newpost.

> Versão 0.0.2

# Autenticação

Para a autenticação é fornecida uma chave única por cliente/parceiro que deve ser informada de acordo com a linguagem e o endpoint, esta chave está em um formato MD5:

**098f6bcd4621d373cade4e832627b4f5** (exemplo)

#Gerenciamento de envios

```json
"https://www.newpost.com/sistema/api/order"
```

[https://www.newpost.com/sistema/api/order](https://www.newpost.com/sistema/api/order "Gerenciamento de envios")

>Método: GET/POST

##Parâmetros Principais

* **token**: 'chave da API'
* **params**: 'parâmetros informados'

##Parâmetros:

```json

{
  "token":"098f6bcd4621d373cade4e832627b4f5",
  "params":{
  "action":"create/track/stickers",
  "description":"order no:12092",
  "couriercode":"EMS",
  "size":"P",
  "trackno":"34234213252151",
  "target_machine":"5",
  "parcels":"121212121,31331313,223234523,5131341...",
  "format":"pdf",
  "receiver":{
  "phone":"5511912345678",
  "email":"contato@newpost.com",
  "customname":"Newpost api"
}
}
}

```

Os parametros a seguir são utilizados dentro de **params**

Parametro | Exemplo | Descrição
--------- | ------- | -----------
action|create/track/stickers|ação solicitada
description|ORDER NO: 121039|descrição do número da ordem do cliente separado por dois pontos (:)
couriercode|EMS|código da empresa de logística contratada
size|P/M/G|tamanho do pacote
tmp_id|123456789|id temporário do pacote
trackno|123456789|id do pacote para rastreio
target_machine|5|id do terminal que vai receber o pacote
parcels|123456,654987,46543215,6548913|lista de pacotes para gerar as etiquetas
format|TXT/PDF|formato da etiqueta (txt para impressora térmica, pdf para arquivo PDF)
receiver|JSON|dados do recebedor do pacote

**Parametros do receiver**

Parametro | Exemplo | Descrição
--------- | ------- | -----------
phone|5511987654321|número com código do país e DDD do recebedor
e-mail|developer@newpost.com|e-mail do recebedor
customname|Desevolvimento Newpost|nome do recebedor como vai aparecer na etiqueta

## Criar novo envio

```json
{
  "token":"md5",
  "params":{
  "action":"create",
  "description":"order no:12092",
  "couriercode":"EMS",
  "size":"P",
  "target_machine":5,
  "receiver":{
  "phone":"5511912345678",
  "email":"contato@newpost.com",
  "customname":"Newpost api"
}
}
}
```

> O comando acima deve retornar algo como:

```json

```

Este endpoint deve ser executado uma vez para cada novo envio.

### Parametros da requisição

Parametro | Exemplo | Descrição
--------- | ------- | -----------
action|create|ação solicitada
description|ORDER NO: 121039|descrição do número da ordem do cliente separado por dois pontos (:)
couriercode|EMS|código da empresa de logística contratada
size|P/M/G|tamanho do pacote
tmp_id|123456789|id temporário do pacote
target_machine|5|id do terminal que vai receber o pacote
receiver|JSON|dados do recebedor do pacote

**Parametros do receiver**

Parametro | Exemplo | Descrição
--------- | ------- | -----------
phone|5511987654321|número com código do país e DDD do recebedor
e-mail|developer@newpost.com|e-mail do recebedor
customname|Desevolvimento Newpost|nome do recebedor como vai aparecer na etiqueta

## Consultar status do envio

```json
{
  "action":"track",
  "trackno":"34234213252151"
}
```

> O comando acima deve retornar algo como:

```json

```

Parametro | Exemplo | Descrição
--------- | ------- | -----------
action|track|Ação Solicitada
trackno|321654|Numero do Waybill gerado pelo envio de pacote

## Gerar etiquetas


```json
{
  "action":"stickers",
  "parcels":"121212121,31331313...",
  "format":"pdf"
}

```

> O comando acima deve retornar algo como:

```json

```

Parametro | Exemplo | Descrição
--------- | ------- | -----------
action|stickers|Ação Solicitada
parcels|654564,123456...|Numero do Waybill gerado pelo envio de pacote, separados por virgula
format|PDF/TXT|Formato das etiquetas, um arquivo PDF para ser impresso ou TXT para impressoras de etiquetas.

# Gerenciamento de Contingência

## Introdução

Em caso de problemas no envio de requisições para a API, é possível criar um arquivo XML com os dados mínimos para importação no sistema em lote.

## Parametros:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<envios>
 <couriercode>EMS</couriercode>
 <description>order no:12092</description>
 <receiver>
   <customname>Newpost api</customname>
   <email>contato@newpost.com</email>
   <phone>5511912345678</phone>
 </receiver>
 <size>P</size>
 <target_machine>5</target_machine>
 <tmp_id>123456789</tmp_id>
</envios>
```

Parametro | Exemplo | Descrição
--------- | ------- | -----------
couriercode|EMS|código da empresa de logística contratada
description|ORDER NO: 121039|descrição do número da ordem do cliente separado por dois pontos (:)
receiver|JSON|dados do recebedor do pacote
size|P/M/G|tamanho do pacote
tmp_id|123456789|id temporário do pacote
target_machine|5|id do terminal que vai receber o pacote

**Parametros do receiver**

Parametro | Exemplo | Descrição
--------- | ------- | -----------
phone|5511987654321|número com código do país e DDD do recebedor
e-mail|developer@newpost.com|e-mail do recebedor
customname|Desevolvimento Newpost|nome do recebedor como vai aparecer na etiqueta

# Intelipost

## Envio de lista de ordens

`http://52.5.158.58/sistema/api/order/preorder`

```json
{
  "intelipost_pre_shipment_list": 2970,
  "origin_name": "CD_SP",
  "origin_federal_tax_payer_id": "08315890000132",
  "origin_state_tax_payer_id": "cc",
  "origin_customer_phone": "1144332211",
  "origin_customer_email": "cd@cd.com",
  "origin_street": "amancio de carvalho",
  "origin_number": 182,
  "origin_additional": "ssss",
  "origin_reference": "ABCD",
  "origin_zip_code": "04012090",
  "origin_city": "São Paulo",
  "origin_quarter": "Vila Mariana",
  "origin_state_code": "SP",
  "shipment_order_array": [
  {
  "order_number": "9613344",
  "sales_order_number": "9613344",
  "scheduled": false,
  "shipment_order_type": "NORMAL",
  "delivery_method_id": 18,
  "logistic_provider_id": 9,
  "end_customer": {
  "first_name": "PRIMEIRONOME",
  "last_name": "SOBRENOME",
  "phone": "1199999999",
  "is_company": false,
  "federal_tax_payer_id": "00587460482",
  "shipping_address": "RUA X",
  "shipping_number": "50",
  "shipping_quarter": "PETROPOLIS",
  "shipping_city": "NATAL",
  "shipping_zip_code": "59012-310",
  "shipping_state": "RN",
  "shipping_state_code": "RN",
  "shipping_country": "BRASIL"
},
"shipment_order_volume_array": [
{
  "shipment_order_volume_number": "467778",
  "weight": 1.646,
  "volume_type_code": "BOX",
  "width": 29,
  "height": 15,
  "length": 38,
  "products_nature": "30043290",
  "products_quantity": 41,
  "is_icms_exempt": false,
  "shipment_order_volume_invoice_array": [
  {
  "invoice_series": "1",
  "invoice_number": "12345",
  "invoice_key": "01234567890123456789012345678901234567891234",
  "invoice_date": 1498767939000,
  "invoice_date_iso": "2017-06-29T17:25:39.000-03:00",
  "invoice_total_value": 1874.33,
  "invoice_products_value": 1874.33,
  "already_insured": true
}
]
}
]
},
{
  "order_number": "9615346",
  "sales_order_number": "9615346",
  "scheduled": false,
  "shipment_order_type": "NORMAL",
  "delivery_method_id": 18,
  "logistic_provider_id": 9,
  "end_customer": {
  "first_name": "PRIMEIRONOME",
  "last_name": "SOBRENOME",
  "phone": "1188888888",
  "is_company": false,
  "federal_tax_payer_id": "00867316454",
  "shipping_address": "RUA Z",
  "shipping_number": "11",
  "shipping_quarter": "AFLITOS",
  "shipping_city": "RECIFE",
  "shipping_zip_code": "52050-020",
  "shipping_state": "PE",
  "shipping_state_code": "PE",
  "shipping_country": "BRASIL"
},
"shipment_order_volume_array": [
{
  "shipment_order_volume_number": "467977",
  "weight": 0.484,
  "volume_type_code": "BOX",
  "width": 18,
  "height": 9,
  "length": 27,
  "products_nature": "30049069",
  "products_quantity": 18,
  "is_icms_exempt": false,
  "shipment_order_volume_invoice_array": [
  {
  "invoice_series": "1",
  "invoice_number": "123455",
  "invoice_key": "01234567890123456789012345678901234567891234",
  "invoice_date": 1498829169000,
  "invoice_date_iso": "2017-06-30T10:26:09.000-03:00",
  "invoice_total_value": 473.04,
  "invoice_products_value": 473.04,
  "already_insured": true
}
]
}
]
}
]
}
```

Requisição para envio da pré lista de postagem. A requisição será efetuada de acordo com as preferencias do cliente.

### Cabeçalho da requisição

Parametro | Exemplo | Descrição | Requerido
--------- | ------- | ----------- | --------
api_key|string|1 validations | required
platform|string|1 validations | required
logistic-provider-api-key|string|1 validations | required

### Corpo

> Request Body application/json

Parametro | Tipo | Descriçao | Requerido
--------- | ------- | ---------- | --------
intelipost_pre_shipment_list | integer | Identificador da lista de postagem na Intelipost | optional
origin_name | string | Nome do deposito/embarcador de origem. | optional
origin_federal_tax_payer_id | string | CNPJ ou CPF do deposito/embarcador de origem. Este campo deve ser enviado em caso de existir mais de um deposito. | optional
origin_state_tax_payer_id | string | Inscrição Estadual | optional
origin_customer_phone | string | Telefone do embarcador para cenarios de multi remetentes. | optional
origin_customer_email | string | Email do embarcador para cenarios de multi remetentes. | optional
origin_street | string | Logradouro do deposito/embarcador de origem | optional
origin_number | integer | Número do deposito/embarcador de origem | optional
origin_additional | string | Informações adicionais do deposito/embarcador de origem | optional
origin_reference | string | Referencia do deposito/embarcador de origem | optional
origin_zip_code | string | CEP do deposito/embarcador de origem. Este campo deve ser enviado em caso de existir mais de um deposito. | optional
origin_city | string | Cidade do estado do deposito/embarcador de origem. | optional
origin_quarter | string | Bairro do deposito/embarcador de origem. | optional
origin_state_code | string | UF do estado do deposito/embarcador de origem. | optional
shipment_order_array | array[object] | Lista de pedidos de envio | optional
order_number | string | Identificação do pedido de envio | optional
sales_order_number | string | Número do pedido de venda | optional
scheduled | boolean | Entrega agendada | optional
shipment_order_type | string | Tipo de pedido de envio. | optional
delivery_method_id | integer | Método de entrega utilizado no pedido de envio | optional
logistic_provider_id | integer | Código identificador da transportadora | optional
end_customer | object | Dados do cliente final | optional
first_name | string | Primeiro nome do cliente | optional
last_name | string | Sobrenome do cliente | optional
phone | string | Telefone fixo do cliente | optional
is_company | boolean | Identifica se o cliente é uma empresa ou não | optional
federal_tax_payer_id | string | CPF para clientes pessoa física e CNPJ para clientes pessoa jurídica | optional
shipping_address | string | Endereço do cliente | optional
shipping_number | string | Número do endereço do cliente | optional
shipping_quarter | string | Bairro de entrega | optional
shipping_city | string | Cidade de entrega | optional
shipping_zip_code | string | CEP | optional
shipping_state | string | Estado de entrega | optional
shipping_state_code | string | UF do estado de destino | optional
shipping_country | string | País | optional
shipment_order_volume_array | array[object] | Lista dos volumes do pedido | optional
shipment_order_volume_number | string | Identificador único do volume por pedido que será utilizado depois para poder alterar informações de volume | optional
weight | number | Peso | optional
volume_type_code | string | Tipo do volume (ENVELOPE, BOX, BAG, TUBE, PALLET) | optional
width | integer or number | Largura | optional
height | integer or number | Altura | optional
length | integer or number | Comprimento | optional
products_nature | string | Natureza do produto | optional
products_quantity | integer | Quantidade do produto | optional
is_icms_exempt | boolean | Isenção fiscal | optional
shipment_order_volume_invoice_array | array[object] | Lista de notas do volume | optional
invoice_series | string | Série da nota fiscal | optional
invoice_number | string | Numero da nota fiscal | optional
invoice_key | string | Chave da nota fiscal | optional
invoice_date | integer | Data de emissão da nota fiscal | optional
invoice_date_iso | string | Data de emissão da nota fiscal | optional
invoice_total_value | number | Valor total da nota | optional
invoice_products_value | number | Valor dos produtos na nota | optional
already_insured | boolean | Pedido já segurado | optional
