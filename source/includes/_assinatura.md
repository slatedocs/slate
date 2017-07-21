#Integração Assinaturas

## IPAG API KEY

**Acesse:**

[Painel iPag - Minha Conta](http://sandbox.ipag.com.br/ipag-painel/?r=admin/alterardados&navegation=addplus ).


<aside class="notice">
<b>Caso não possua uma API KEY em sua conta, faça a requisição para suporte@ipag.com.br.</b>
</aside>


##Endpoint

**Teste**

`http://sandbox.ipag.com.br/`

**Produção**

`Requisitar para suporte@ipag.com.br`

##Autenticação

A autenticação para a API ocorre através de [HTTP basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication). Você encontrará mais detalhes sobre Autenticação básica no [IETF RFC 2617](https://www.ietf.org/rfc/rfc2617.txt).

Forneça seu login e sua chave secreta de API como o nome e senha de usuário de autenticação básico.

Toda a comunicação deve ser criptografada via SSL. O token de autenticação básica é reversível, no entanto, quando toda a comunicação é sobre HTTPS o contexto de segurança está completamente protegido. Um aplicativo deve enviar um HEADER HTTP Authorization contendo o nome de usuário e senha com cada solicitação.

Todas as chamadas de API devem ser feitas em HTTPS para garantir a segurança.

Basic Auth é trivial para usar de bibliotecas cliente HTTP. Ferramentas como cURL fornecem opções de linha de comando correspondentes.

<aside class="notice">
<b>Você deve manter sua chave API segura não importa o quê! NÃO COMPARTILHE sua chave de API com ninguém, nem mesmo nos canais de suporte do iPag. Ninguém que represente de forma legítima o iPag nunca lhe pedirá sua chave da API!</b>
</aside>
....

##Consultar Assinatura

**`GET`** `/service/v1?ctrl=assinatura&action=consultar&id_assinatura=<id_assinatura>`

> Exemplo para Consultar Assinatura

```shell
curl -X GET \
  'https://sandbox.ipag.com.br/service/v1?ctrl=assinatura&action=consultar&id_assinatura=105' \
  -H 'authorization: Basic am9uYXRoYW24NzFGMC00QzMyODdEMy0xQzE1N0VFMy1BQ0FFTEY2MD0yRkU0'
```

```php
<?php

$url = 'https://sandbox.ipag.com.br/service/v1?ctrl=assinatura&action=consultar&id_assinatura=105';
$username = <LOGIN_IPAG>;
$password = <API_KEY>;

$options  = array(
    'http' => array(
        'method'  => 'GET',
        'user_agent' => 'My Own Application',
        'header'  => "Authorization: Basic " . base64_encode("$username:$password")
    )
);
$context = stream_context_create($options);

$result = file_get_contents($url, null, $context);

print_r($result);
```

Parâmetro | valor  | type  | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
ctrl      | assinatura | string| sim | controlador selecionado
action    | consultar | string| sim | ação selecionado
id_assinatura | Ex.: 1000 | string| sim/não | ID de referência da assinatura (obrigatório caso não tenha profile_id)
profile_id      | Ex.: 99282 | string| não | ID de referência da assinatura, criado pelo usuário (obrigatório caso não o tenha id_assinatura)

##Resposta - Consultar Assinatura (XML)

```xml
<?xml version="1.0" encoding="utf-8"?>
<retorno>
    <code>000</code>
    <message>success</message>
    <id>105</id>
    <profile_id>20170327084547</profile_id>
    <is_active>1</is_active>
    <description>Assinatura #20170327084547</description>
    <value>3.00</value>
    <billing_date>04</billing_date>
    <frequency>1</frequency>
    <interval>month</interval>
    <token>e738-d7d28e1b-c08be6c7-80823d54-5a5d</token>
    <credit_card>
        <bin>000000</bin>
        <last4>0004</last4>
        <expiry>10-2017</expiry>
        <brand>visa</brand>
    </credit_card>
    <billing>
        <payment_1>
            <number>1</number>
            <expiry_date>2017-03-27</expiry_date>
            <value>4.00</value>
            <is_payed>1</is_payed>
            <payed_value>4.00</payed_value>
            <payed_date>2017-03-27</payed_date>
            <description>Assinatura #20170327084547</description>
            <transaction>
                <installment_number>1</installment_number>
                <transaction_id>993921</transaction_id>
                <payed_value>4.00</payed_value>
                <payed_date>2017-03-27</payed_date>
            </transaction>
        </payment_1>
    </billing>
</retorno>
```

Parâmetro | Descrição
--------- | ---------
retorno | *Container*
code | Código de retorno (000 = sucesso)
message | Mensagem de retorno
id | ID da assinatura criado pelo iPag
profile_id | ID da assinatura criado pelo usuário
is_active | Status atual da assinatura (1 = ativo, 0 = inativo)
description | Descrição da assinatura
value | Valor recorrente cobrado no período
billing_date | Dia de vencimento
frequency | Frequência que ocorrem as cobranças
interval | Intevalo de tempo que ocorrem as cobranças (day, week, month)
token | Token de cartão vinculado a assinatura
credit_card | *Container*
bin | Bin do cartão de crédito
last4 | Last4 do cartão de crédito
expiry | Data de validade do cartão de crédito
brand | Operadora do cartão
billing | *Container*
payment_1* | *Container* (Poderá repetir)
number | Número do pagamento
expiry_date | Vencimento do pagamento
value | Valor do pagamento
is_payed | 1 = Pago, 0 = Não pago
payed_value | Valor Pago
payed_date | Data que foi realizado o pagamento
description | Descrição do pagamento
transaction | *Container*
installment_number | Número de parcelas escolhido no pagamento
transaction_id | ID da transação vinculada no iPag
payed_value | Valor pago na transação
payed_date | Data que foi realizada a transação

<aside class="notice">
    * Para cada pagamento realizado na assinatura terá um container <b>payment_</b>
</aside>

##Ativar Assinatura

`PUT /service/v1`

> Exemplo para Ativar Assinatura

```shell
curl --include --header "accept: application/xml" \
-u <login_ipag>:<API_KEY> \
--url http://sandbox.ipag.com.br/service/v1 \
--request PUT \
--data 'ctrl=assinatura&action=ativar&id_assinatura=1000'
```

```php
<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://sandbox.ipag.com.br/service/v1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_USERPWD => "<login_ipag>:<API_KEY>"
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "ctrl=assinatura&action=ativar&id_assinatura=1000",
  CURLOPT_HTTPHEADER => array(
    "accept: application/xml",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

Parâmetro | valor  | type  | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
ctrl      | assinatura | string| sim | controlador selecionado
action      | ativar | string| sim | ação selecionado
id_assinatura | Ex.: 1000 | string| sim/não | ID de referência da assinatura (obrigatório caso não tenha profile_id)
profile_id      | Ex.: 99282 | string| não | ID de referência da assinatura, criado pelo usuário (obrigatório caso não tenha id_assinatura)

##Resposta - Ativar Assinatura (XML)

```xml
<?xml version="1.0" encoding="utf-8"?>
<retorno>
    <code>000</code>
    <message>Assinatura ativada com sucesso.</message>
    <id>1000</id>
    <profile_id>10002000</profile_id>
    <is_active>1</is_active>
    <description>Assinatura #10002000</description>
    <value>1.00</value>
    <billing_date>04</billing_date>
    <frequency>1</frequency>
    <interval>month</interval>
    <token>4f25-15af1c4d-dfdc9d02-82da0a8e-9a76</token>
    <credit_card>
        <bin>412345</bin>
        <last4>6459</last4>
        <expiry>08-2021</expiry>
        <brand>visa</brand>
    </credit_card>
</retorno>
```

Parâmetro | Descrição
--------- | ---------
retorno | *Container*
code | Código de retorno (000 = sucesso)
message | Mensagem de retorno
id | ID da assinatura criado pelo iPag
profile_id | ID da assinatura criado pelo usuário
is_active | Status atual da assinatura (1 = ativo, 0 = inativo)
description | Descrição da assinatura
value | Valor recorrente cobrado no período
billing_date | Dia de vencimento
frequency | Frequência que ocorrem as cobranças
interval | Intevalo de tempo que ocorrem as cobranças (day, week, month)
token | Token de cartão vinculado a assinatura
credit_card | *Container*
bin | Bin do cartão de crédito
last4 | Last4 do cartão de crédito
expiry | Data de validade do cartão de crédito
brand | Operadora do cartão

##Inativar Assinatura

`PUT /service/v1`

> Exemplo para Inativar Assinatura

```shell
curl --include --header "accept: application/xml" \
-u <login_ipag>:<API_KEY> \
--url http://sandbox.ipag.com.br/service/v1 \
--request PUT \
--data 'ctrl=assinatura&action=inativar&id_assinatura=1000'
```

```php
<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://sandbox.ipag.com.br/service/v1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_USERPWD => "<login_ipag>:<API_KEY>"
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "ctrl=assinatura&action=inativar&id_assinatura=1000",
  CURLOPT_HTTPHEADER => array(
    "accept: application/xml",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

Parâmetro | valor  | type  | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
ctrl      | assinatura | string| sim | controlador selecionado
action      | inativar | string| sim | ação selecionado
id_assinatura | Ex.: 1000 | string| sim/não | ID de referência da assinatura (obrigatório caso não tenha profile_id)
profile_id      | Ex.: 99282 | string| não | ID de referência da assinatura, criado pelo usuário (obrigatório caso não tenha id_assinatura)

##Resposta - Inativar Assinatura (XML)

```xml
<?xml version="1.0" encoding="utf-8"?>
<retorno>
    <code>000</code>
    <message>Assinatura desativada com sucesso.</message>
    <id>1000</id>
    <profile_id>10002000</profile_id>
    <is_active>0</is_active>
    <description>Assinatura #10002000</description>
    <value>1.00</value>
    <billing_date>04</billing_date>
    <frequency>1</frequency>
    <interval>month</interval>
    <token>4f25-15af1c4d-dfdc9d02-82da0a8e-9a76</token>
    <credit_card>
        <bin>412345</bin>
        <last4>6459</last4>
        <expiry>08-2021</expiry>
        <brand>visa</brand>
    </credit_card>
</retorno>
```

Parâmetro | Descrição
--------- | ---------
retorno | *Container*
code | Código de retorno (000 = sucesso)
message | Mensagem de retorno
id | ID da assinatura criado pelo iPag
profile_id | ID da assinatura criado pelo usuário
is_active | Status atual da assinatura (1 = ativo, 0 = inativo)
description | Descrição da assinatura
value | Valor recorrente cobrado no período
billing_date | Dia de vencimento
frequency | Frequência que ocorrem as cobranças
interval | Intevalo de tempo que ocorrem as cobranças (day, week, month)
token | Token de cartão vinculado a assinatura
credit_card | *Container*
bin | Bin do cartão de crédito
last4 | Last4 do cartão de crédito
expiry | Data de validade do cartão de crédito
brand | Operadora do cartão

##Alterar Data de Vencimento da Assinatura

`PUT /service/v1`

> Exemplo para Alterar Data de Vencimento da Assinatura

```shell
curl --include --header "accept: application/xml" \
-u <login_ipag>:<API_KEY> \
--url http://sandbox.ipag.com.br/service/v1 \
--request PUT \
--data 'ctrl=assinatura&action=vencto&id_assinatura=1000&data=2017-02-10'
```

```php
<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://sandbox.ipag.com.br/service/v1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_USERPWD => "<login_ipag>:<API_KEY>"
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "ctrl=assinatura&action=vencto&id_assinatura=1000&data=2017-02-10",
  CURLOPT_HTTPHEADER => array(
    "accept: application/xml",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

Parâmetro | valor  | type  | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
ctrl      | assinatura | string| sim | controlador selecionado
action      | vencto | string| sim | ação selecionada
vencto      | Ex.: 2017-02-10 | string| sim | Nova data de vencimento da assinatura (formato = yyyy-mm-dd)
id_assinatura | Ex.: 1000 | string| sim/não | ID de referência da assinatura (obrigatório caso não tenha profile_id)
profile_id      | Ex.: 99282 | string| não | ID de referência da assinatura, criado pelo usuário (obrigatório caso não tenha id_assinatura)

##Resposta - Alterar Data de Vencimento da Assinatura (XML)

```xml
<?xml version="1.0" encoding="utf-8"?>
<retorno>
    <code>000</code>
    <message>Nova data de vencimento da Assinatura alterado com sucesso.</message>
    <id>1000</id>
    <profile_id>10002000</profile_id>
    <is_active>1</is_active>
    <description>Assinatura #10002000</description>
    <value>1.00</value>
    <billing_date>10</billing_date>
    <frequency>1</frequency>
    <interval>month</interval>
    <token>4f25-15af1c4d-dfdc9d02-82da0a8e-9a76</token>
    <credit_card>
        <bin>412345</bin>
        <last4>6459</last4>
        <expiry>08-2021</expiry>
        <brand>visa</brand>
    </credit_card>
</retorno>

```

Parâmetro | Descrição
--------- | ---------
retorno | *Container*
code | Código de retorno (000 = sucesso)
message | Mensagem de retorno
id | ID da assinatura criado pelo iPag
profile_id | ID da assinatura criado pelo usuário
is_active | Status atual da assinatura (1 = ativo, 0 = inativo)
description | Descrição da assinatura
value | Valor recorrente cobrado no período
billing_date | Dia de vencimento
frequency | Frequência que ocorrem as cobranças
interval | Intevalo de tempo que ocorrem as cobranças (day, week, month)
token | Token de cartão vinculado a assinatura
credit_card | *Container*
bin | Bin do cartão de crédito
last4 | Last4 do cartão de crédito
expiry | Data de validade do cartão de crédito
brand | Operadora do cartão

##Alterar Valor da Assinatura

`PUT /service/v1`

> Exemplo para Alterar Valor da Assinatura

```shell
curl --include --header "accept: application/xml" \
-u <login_ipag>:<API_KEY> \
--url http://sandbox.ipag.com.br/service/v1 \
--request PUT \
--data 'ctrl=assinatura&action=valor&id_assinatura=1000&valor=99.00'
```

```php
<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://sandbox.ipag.com.br/service/v1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_USERPWD => "<login_ipag>:<API_KEY>"
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "ctrl=assinatura&action=valor&id_assinatura=1000&valor=99.00",
  CURLOPT_HTTPHEADER => array(
    "accept: application/xml",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

Parâmetro | valor  | type  | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
ctrl      | assinatura | string| sim | controlador selecionado
action      | valor | string| sim | ação selecionado
valor      | Ex.: 1.99 | string| sim | Valor a ser alterado ( formato 1.00 )
id_assinatura | Ex.: 1000 | string| sim/não | ID de referência da assinatura (obrigatório caso não tenha profile_id)
profile_id      | Ex.: 99282 | string| não | ID de referência da assinatura, criado pelo usuário (obrigatório caso não tenha id_assinatura)

##Resposta - Alterar Valor da Assinatura (XML)

```xml
<?xml version="1.0" encoding="utf-8"?>
<retorno>
    <code>000</code>
    <message>Novo valor da assinatura alterado com sucesso.</message>
    <id>1000</id>
    <profile_id>10002000</profile_id>
    <is_active>1</is_active>
    <description>Assinatura #10002000</description>
    <value>99.00</value>
    <billing_date>04</billing_date>
    <frequency>1</frequency>
    <interval>month</interval>
    <token>4f25-15af1c4d-dfdc9d02-82da0a8e-9a76</token>
    <credit_card>
        <bin>412345</bin>
        <last4>6459</last4>
        <expiry>08-2021</expiry>
        <brand>visa</brand>
    </credit_card>
</retorno>
```

Parâmetro | Descrição
--------- | ---------
retorno | *Container*
code | Código de retorno (000 = sucesso)
message | Mensagem de retorno
id | ID da assinatura criado pelo iPag
profile_id | ID da assinatura criado pelo usuário
is_active | Status atual da assinatura (1 = ativo, 0 = inativo)
description | Descrição da assinatura
value | Valor recorrente cobrado no período
billing_date | Dia de vencimento
frequency | Frequência que ocorrem as cobranças
interval | Intevalo de tempo que ocorrem as cobranças (day, week, month)
token | Token de cartão vinculado a assinatura
credit_card | *Container*
bin | Bin do cartão de crédito
last4 | Last4 do cartão de crédito
expiry | Data de validade do cartão de crédito
brand | Operadora do cartão

##Gerar Token Único para Assinatura

`POST /service/v1`

> Exemplo para Gerar Token Único para Assinatura

```shell
curl --include --header "accept: application/xml" \
-u <login_ipag>:<API_KEY> \
--url http://sandbox.ipag.com.br/service/v1 \
--request PUT \
--data 'ctrl=token&action=novo&numero_cartao=4024007109760958&nome_cartao=fulano
&mes_cartao=10&ano_cartao=2021'
```

```php
<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://sandbox.ipag.com.br/service/v1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_USERPWD => "<login_ipag>:<API_KEY>"
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "ctrl=token&action=novo&numero_cartao=4024007109760958&nome_cartao=fulano&mes_cartao=10&ano_cartao=2021",
  CURLOPT_HTTPHEADER => array(
    "accept: application/xml",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

Parâmetro | valor  | type  | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
ctrl      | token | string| sim | controlador selecionado
action    | novo | string| sim | ação selecionado
numero_cartao | Ex.:4024007109760958| string| sim | Número do cartão
nome_cartao   | Ex.: fulano | string| sim | Nome do portador do cartão
mes_cartao    | Ex.: 10 | string| sim | Mês de vencimento do cartão
ano_cartao    | Ex.: 2021 | string| sim | Ano de vencimento do cartão

##Resposta - Gerar Token Único para Assinatura (XML)

```xml
<?xml version="1.0" encoding="utf-8"?>
<retorno>
    <code>000</code>
    <message>Token criado com sucesso.</message>
    <token>fa59-7b796cff-ed8b9bca-f8600ac9-1328</token>
</retorno>
```

Parâmetro | Descrição
--------- | ---------
retorno | *Container*
code | Código de retorno (000 = sucesso)
message | Mensagem de retorno
token | Token único do cartão


##Alterar Token da Assinatura

`PUT /service/v1`

> Exemplo para Alterar Token da Assinatura

```shell
curl --include --header "accept: application/xml" \
-u <login_ipag>:<API_KEY> \
--url http://sandbox.ipag.com.br/service/v1 \
--request PUT \
--data 'ctrl=assinatura&action=token&id_assinatura=1000&token=fa59-7b796cff-ed8b9bca-f8600ac9-1328'
```

```php
<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://sandbox.ipag.com.br/service/v1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_USERPWD => "<login_ipag>:<API_KEY>"
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "ctrl=assinatura&action=token&id_assinatura=1000&token=fa59-7b796cff-ed8b9bca-f8600ac9-1328",
  CURLOPT_HTTPHEADER => array(
    "accept: application/xml",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

Parâmetro | valor  | type  | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
ctrl      | assinatura | string| sim | controlador selecionado
action      | token | string| sim | ação selecionado
token      | Ex.: fa59-7b796cff-ed8b9bca-f8600ac9-1328 | string| sim | Token de um cartão gerado previamente
id_assinatura | Ex.: 1000 | string| sim/não | ID de referência da assinatura (obrigatório caso não tenha profile_id)
profile_id      | Ex.: 99282 | string| não | ID de referência da assinatura, criado pelo usuário (obrigatório caso não tenha id_assinatura)

##Resposta - Alterar Token da Assinatura (XML)

```xml
<?xml version="1.0" encoding="utf-8"?>
<retorno>
    <code>000</code>
    <message>Token alterado com sucesso.</message>
    <id>1000</id>
    <profile_id>10002000</profile_id>
    <is_active>1</is_active>
    <description>Assinatura #10002000</description>
    <value>99.00</value>
    <billing_date>04</billing_date>
    <frequency>1</frequency>
    <interval>month</interval>
    <token>fa59-7b796cff-ed8b9bca-f8600ac9-1328</token>
    <credit_card>
        <bin>412345</bin>
        <last4>6459</last4>
        <expiry>08-2021</expiry>
        <brand>visa</brand>
    </credit_card>
</retorno>
```

Parâmetro | Descrição
--------- | ---------
retorno | *Container*
code | Código de retorno (000 = sucesso)
message | Mensagem de retorno
id | ID da assinatura criado pelo iPag
profile_id | ID da assinatura criado pelo usuário
is_active | Status atual da assinatura (1 = ativo, 0 = inativo)
description | Descrição da assinatura
value | Valor recorrente cobrado no período
billing_date | Dia de vencimento
frequency | Frequência que ocorrem as cobranças
interval | Intevalo de tempo que ocorrem as cobranças (day, week, month)
token | Token de cartão vinculado a assinatura
credit_card | *Container*
bin | Bin do cartão de crédito
last4 | Last4 do cartão de crédito
expiry | Data de validade do cartão de crédito
brand | Operadora do cartão

##Tabela de Erros (Integração Assinatura)

HTTP Code | Code | Mensagem
----| ----| ---------
404 | 001 | Assinatura não encontrada.
406 | 002 | Valor não informado na requisição.
406 | 003 | Data não informada ou não está no formato yyyy-mm-dd.
404 | 004 | Ação não é válida.
406 | 005 | Token não é válido.
406 | 006 | id_assinatura ou profile_id não informado na requisição.
406 | 096 | Número de cartão inválido.
406 | 095 | Cartão vencido ou data informada inválida.
500 | 098 | Internal Server Error