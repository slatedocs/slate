# Submissão de Pagamentos

Para integrar sua Loja Virtual ou Site ao iPag, envie os seguintes parâmetros via POST ao sistema iPag

##Endpoint

**Sandbox**

`https://sandbox.ipag.com.br/`

**Producão**

`Faça a requisição para suporte@ipag.com.br`

##Realizar Pagamento (Criar Transação)

`POST /service/payment`

> Exemplo via [SDK PHP](https://github.com/jhernandes/ipag-sdk-php)

```php
<?php
// VIA IPAG-SDK-PHP
require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Classes\Authentication;
use Ipag\Classes\Endpoint;

try {
    $ipag = new Ipag(new Authentication('my_ipag_id', 'my_ipag_key'), Endpoint::SANDBOX);

    $customer = $ipag->customer()
        ->setName('Fulano da Silva')
        ->setTaxpayerId('799.993.388-01')
        ->setPhone('11', '98888-3333')
        ->setEmail('fulanodasilva@gmail.com')
        ->setAddress($ipag->address()
            ->setStreet('Rua Júlio Gonzalez')
            ->setNumber('1000')
            ->setNeighborhood('Barra Funda')
            ->setCity('São Paulo')
            ->setState('SP')
            ->setZipCode('01156-060')
    );

    $creditCard = $ipag->creditCard()
        ->setNumber('4066553613548107')
        ->setHolder('FULANO')
        ->setExpiryMonth('10')
        ->setExpiryYear('2025')
        ->setCvc('123');

    $ipag->transaction()->getOrder()
        ->setOrderId($orderId)
        ->setCallbackUrl('https://minha_loja.com.br/ipag/callback')
        ->setAmount(10.00)
        ->setInstallments(1)
        ->setPayment($ipag->payment()
            ->setMethod(Method::VISA)
            ->setCreditCard($creditCard)
        )
        ->setCustomer($customer);

    $response = $ipag->transaction()->execute();

    //Retornou algum erro?
    if (!empty($response->error)) {
        throw new \Exception($response->errorMessage);
    }

    //Pagamento Aprovado (5) ou Aprovado e Capturado(8) ?
    if ($response->payment->status == '5' || $response->payment->status == '8') {
        //Faz alguma coisa...
        return $response;
    }
} catch(\Exception $e) {
    print_r($e->__toString());
}
```

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
identificacao | 60 | string | sim | Código de identificação do estabelecimento no iPag (login de acesso ao painel)
identificacao2 | 60 | string | sim | Código de identificação do parceiro no iPag (Marketplace)
metodo | 15 | string | sim | Forma de Pagamento * veja os valores possíveis na seção Métodos deste documento
operacao | 10 | string | sim | Operação * veja os valores possíveis na seção Operações deste documento
pedido| 20 | string | sim | Número do pedido (única restrição é que não pode ser igual a outro já enviado ao iPag, aconselhamos numeral sequencial)
valor | 12 | decimal | sim | Valor total da compra. Deve-se usar pontos como separador de casas decimais, ex: 100.00
parcelas | 3 | number | não | Número de Parcelas
nome_cartao | 30 | string | não | Nome do titular do cartão de crédito (se aplicável).
num_cartao | 16 | number | não | Número do cartão de crédito (se aplicável).
cvv_cartao | 3 | number | não | Código de verificação do cartão de crédito (se aplicável)
mes_cartao | 2 | number | não | Mês de validade do cartão de crédito
ano_cartao | 2 | number | não | Ano de validade do cartão de crédito
nome | 30 | string | sim | Nome do cliente
tipo_pessoa | 1 | char | não | “j” para pessoas jurídicas e “f” para pessoas físicas
documento | 18 | string | não | CPF ou CNPJ do sacado
email | 30 | string | sim| E-mail do cliente
fone | 10 | string | sim | Telefone do cliente
endereco | 30 | string | sim | Endereço completo do cliente
numero_endereco | 5 | number | sim | Número do Endereço
complemento | 100 | string | não | Complemento do Endereço
bairro | 15 | string | sim | Bairro do cliente
cidade | 20 | string | sim | Cidade do cliente
estado | 2 | string | sim | Estado do cliente
pais | 15 | string | sim | País do cliente
cep | 8 | string | sim | Cep do cliente
vencto | 10 | date | não | Data de vencimento (DD/MM/YYYY). Usado apenas em boletos. Se não for informado, o vencimento será a data de hoje + o prazo informado nas configurações do iPag.
url_retorno | 50 | string | sim | URL de retorno à Loja Virtual ou Site.
retorno_tipo | 5 | string | não | Informar 'xml' para ter retorno em XML, caso não seja informado será retornado em HTML.

## Campos adicionais para Stelo

**TransferBlock**

```php
<!-- Iframe -->
<iframe src="https://carteirac1.hml.stelo.com.br/transaction/transfer?idUnico=stelo_fingerprint"
width="0"
marginwidth="0"
height="0"
marginheight="0"
frameborder="0">
</iframe>
<!-- /Iframe -->
```

```html
<!-- Iframe -->
<iframe src="https://carteirac1.hml.stelo.com.br/transaction/transfer?idUnico=stelo_fingerprint"
width="0"
marginwidth="0"
height="0"
marginheight="0"
frameborder="0">
</iframe>
<!-- /Iframe -->
```

O TransferBlock é um iFrame disponibilizado pela Stelo para que eles consigam ter uma melhor análise de risco, a inserção do iFrame é obrigatória e deve ser inserida dentro **BODY** da página de checkout.

O campo **IdUnico** deve ser substituído sempre por um valor único. Este **IdUnico** deve ser enviado no campo *stelo_fingerprint* do POST para aprovar a transação.

> Exemplo para gerar o stelo_fingerprint:

```php
<?php
// VIA IPAG-SDK-PHP
$stelo_fingerprint = md5(uniqid(rand(), true));

//...
 $ipag->transaction()->getOrder()->setFingerprint($stelo_fingerprint);
//...
```

Além do *stelo_fingerprint*, é necessário enviar os dados do produto no campo *descricao_pedido* em formato JSON.

### Campos do pedido que deve ser enviado no campo *descricao_pedido* em formato JSON

Campo | Tamanho | Tipo | Obrigatório | Descrição
------| ------- | ---- | ----------- | ---------
quant | 4       | alfanúmerico | sim | Quantidade do produto
descr | 100     | alfanúmerico | sim | Descrição do Produto/ Nome do produto
valor | 6       | númerico | sim | Valor do Produto, deve ser informado no formato 1.00
id | 20 | alfanúmrico | não | SKU/Código do produto

> Exemplo do campo descricao_pedido:

```json
{
  "1":{
    "quant":"1",
    "descr":"Produto Teste",
    "valor":"1.00",
    "id":"001"
  },
  "2":{
    "quant":"2",
    "descr":"Produto Teste 2",
    "valor":"1.50",
    "id":"002"
  },
  "3": {
    ...
  },
  ...
}
```

> Informando os dados dos Produtos

```php
<?php
// VIA IPAG-SDK-PHP
// ...
$cart = $ipag->cart(
    // Nome do Produto, Valor Unitário, Quantidade, SKU (Código do Produto)
    ['Produto 1', 5.00, 1, 'ABDC1'],
    ['Produto 2', 3.50, 2, 'ABDC2'],
    ['Produto 3', 5.50, 1, 'ABDC3'],
    ['Produto 4', 8.50, 5, 'ABDC4']
);

// ...
```

### Dados obrigátorios para trancionar via Stelo

Campo | Tamanho | Tipo | Obrigatório | Descrição
------| ------- | ---- | ----------- | ---------
nome | 50 | string | sim | Nome do cliente
documento | 18 | string | sim | CPF ou CNPJ do sacado
email | 50 | string | sim| E-mail do cliente
fone | 11 | string | sim | Telefone do cliente
endereco | 50 | string | sim | Endereço completo do cliente
numero_endereco | 5 | number | sim | Número do Endereço
bairro | 20 | string | sim | Bairro do cliente
cidade | 20 | string | sim | Cidade do cliente
estado | 2 | string | sim | Estado do cliente
pais | 15 | string | sim | País do cliente
cep | 8 | string | sim | Cep do cliente
stelo_fingerprint | 32 | string | sim | ID Unico gerado para o pedido
descricao_pedido | ... | json | sim | Descrição dos produtos do pedido

## Campos adicionais para 1-click buy

> Exemplo:

```php
<?php
// VIA IPAG-SDK-PHP
// ...
$creditCard = $ipag->creditCard()
    ->setNumber('4066553613548107')
    ->setHolder('FULANO')
    ->setExpiryMonth('10')
    ->setExpiryYear('2025')
    ->setCvc('123')
    ->setSave(true); //True para gerar o token do cartão (one-click-buy)
// ...
```

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
gera_token_cartao | 5 | boolean | Obrigatório na criação do pedido | Utilizado para realizar a transação em que os dados do Cartão ficam armazenado no iPag. Este parâmetro é utilizado para implementar o recurso de Pagamento com 1 Click
token_cartao | 37 | string | Obrigatório na utilização do token | Quando o cliente fizer uma compra utilizando a opção de Pagamento com 1 Click, este parâmetro deverá ser obrigatoriamente enviado. Neste caso, os parâmetros a seguir não devem ser enviados: nome_cartao, num_cartao, metodo, cvv_cartao, mes_cartao, ano_cartao

<aside class="info">
<b>Para compras via OneClick e Assinaturas é necessário entrar em contato com a Adquirente e solicitar a liberação de transações sem a necessidade do CVV (Código de Segurança do Cartão).</b>
</aside>

## Campos adicionais para Recorrência (Assinatura)

> Exemplo de Recorrência (Assinatura)

```php
<?php
// VIA IPAG-SDK-PHP
// ...

$ipag->transaction()->getOrder()
    ->setSubscription($ipag->subscription()
      ->setProfileId('1000000')
      ->setFrequency(1)
      ->setInterval('month')
      ->setStart('10/10/2018')
);

$response = $ipag->transaction()->execute();
```

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
frequencia | 2 | number | sim | Utilizado na criação de uma transação recorrente. Este campo deverá definir a frequência dos intervalos em que a cobrança será realizada.
intervalo | 5 | string | sim | Utilizado na criação de uma transação recorrente. Define a unidade de intervalo que será utilizada. ('day', 'week' ou 'month')
inicio | 10 | date | sim | Utilizado na criação de uma transação recorrente. A primeira cobrança ocorre no dia da criação da recorrência. As próximas cobranças ocorrerão no dia especificado no inicio + (frequencia*intervalo). FORMATO: "DD/MM/YYYY"
valor_rec | 12 | decimal | não | Valor que será cobrado no primeiro vencimento da recorrência. Não é obrigatório, caso não informado será utilizado o valor da transação (valor).
assinatura_parcela | 2 | integer | não | Parcelamento que será utilizado na cobrança da Assinatura.
ciclos | 2 | number | não | Define o número de ciclos de transações recorrentes que serão realizadas.
trial | 1 | boolean | não | Se trial = 1 ou true então a primeira cobrança (valor da transação) será de R$1,00 afim de realizar uma transação de validação para geração do token.
trial_ciclos | 2 | number | não | Define o número de ciclos de transações recorrentes em período trial.
trial_frequencia | 2 | number | não | Define a frequencia em que cada ciclo da recorrêcia será executado. (Ex: A cada 1 mês, ou, a cada 6 meses).
trial_valor | 12 | decimal | não | Define o valor que será cobrado durante o período trial.

### Observações
A primeira cobrança ocorre no ato da criação da recorrência.

Ex: Criação de uma recorrência mensal no dia 10/05/2016 e inicio = 01/06/2016.
A primeira cobrança será feita no dia 10/05/2016 e a próxima cobrança ocorrerá no dia 01/07/2016.  01/06/2016 + 1 * month

### Exemplos de transações recorrentes

**a)** frequencia = 1, intervalo = month, ciclos = 3, inicio = 01/01/2015
Será criada uma cobrança recorrente mensal, que terá início em 01/01/2015 e será cobrada três vezes, finalizando em 01/03/2015.

**b)** frequencia = 3, intervalo = month, inicio = 01/01/2015
Será criada uma cobrança recorrente trimestral, que terá início em 01/01/2015 e será cobrada por tempo indeterminado.

**c)** Caso queira criar uma recorrência com período TRIAL sendo a primeira cobrança com um valor de R$1,00 apenas autorizado (não debita do cartão do cliente), envie também o parâmetro trial = (1 ou true), neste caso é necessário informar o *valor_rec* que será cobrado na data início.

**d)** Caso queira criar uma recorrência com período TRIAL com um valor especifico durante esse período, é obrigátorio o envio dos seguintes parâmetros: *trial_ciclos, trial_frequencia e trial_valor*.

**Exemplo:** Cobrar R$10,00 de adesão, com um período de 3 meses promocional de R$5,00, e no 4 mês cobrar o valor normal de R$10,00. Envie o seguinte:

intevalo = 'month'<br/>
frequencia = 1<br/>
valor = 10.00<br/>
valor_rec = 10.00<br/>
trial_ciclos = 4 (adesão + 3 meses trial)<br/>
trial_frequencia = 1<br/>
trial_valor = 5.00<br/>

**Exemplo:** Cobrar R$1,00 no ato (trial = true), com um período de 3 meses promocional de R$5,00, e no 4 mês cobrar o valor normal de R$10,00. Envie o seguinte:

intevalo = 'month'<br/>
frequencia = 1<br/>
trial = true<br/>
valor = 1.00<br/>
valor_rec = 10.00<br/>
trial_ciclos = 4 (adesão + 3 meses trial)<br/>
trial_frequencia = 1<br/>
trial_valor = 5.00<br/>

<aside class="warning">
<b>Se definido como verdadeiro o parâmetro TRIAL, será realizado uma transação de R$1,00, somente como aprovada (Não gerará cobrança para o cliente). Essa transação é realizada para validar o cartão do cliente e criar o token de recorrência. Essa transação não deve ser capturada, mas pode, se desejar, ser cancelada via API ou Painel.</b>
</aside>

<aside class="info">
O <b>trial_ciclos</b> é calculado da seguinte forma: <i>primeira cobrança + período desejado</i>, caso queira 3 ciclos de trial, informe trial_ciclos = 4.
</aside>

### Importante

<aside class="info">
<b>Para compras via OneClick e Assinaturas é necessário entrar em contato com a Adquirente e solicitar a liberação de transações sem a necessidade do CVV (Código de Segurança do Cartão). Esse tipo de transação não informa esse dado, por esse motivo é necessário a liberação.</b>
</aside>

Ao criar uma transação recorrente, **certifique-se** de informar o profile_id na URL de retorno. (profile_id é um número único que deve ser gerado pela loja e será a referência da recorrência para a loja e iPag). A URL de retorno para este caso deve ter a seguinte estrutura:

**HTTP://www.loja.com.br/controller/profile_id/<profile_id>**

**Exemplo: http://sualoja.com.br/retornoipag/profile_id/123456**

<aside class="info">
O <b>profile_id</b> é um id único que deve ser gerado e controlado pelo integrador, ele irá referênciar a transação recorrente.
Quando houver uma atualização de pagamento o iPag irá tentar enviar um POST com o status atualizado do Pagamento. Caso o iPag não consiga enviar a resposta (HTTP 200), ele irá tentar novamente após algum tempo.
</aside>

<aside class="warning">
<b>Se não houver um endpoint (url_retorno) com profile_id informado o iPag não será capaz de enviar o status atualizado dos pagamentos referentes a recorrência.</b>
</aside>

## Retorno

O iPag retorna os seguintes parâmetros via POST à URL informada pelo parâmetro “url_retorno”.

Caso o retorno tenha sido solicitado em XML, os mesmo parâmetros serão retornados, mas em formato XML.

```xml
<?xml version="1.0" encoding="utf-8" ?>
<retorno>
    <id_transacao>123456789</id_transacao>
    <valor>10.00</valor>
    <num_pedido>123456</num_pedido>
    <status_pagamento>8</status_pagamento>
    <mensagem_transacao>Transação Autorizada</mensagem_transacao>
    <metodo>visa</metodo>
    <operadora>cielo</operadora>
    <operadora_mensagem>Transação autorizada</operadora_mensagem>
    <id_librepag>12345</id_librepag>
    <autorizacao_id>123456</autorizacao_id>
    <redirect>false</redirect>
    <url_autenticacao>https://minhaloja.com.br/ipag/retorno</url_autenticacao>
</retorno>
```

Parâmetros | Descrição
--------- | ----------------
id_transacao | TID (Número emitido pela adquirente para identificar a transação)
valor | Valor total da transação
num_pedido | Número do pedido da loja
status_pagamento | Status da transação. Veja os valores possíveis na seção Status das Transações deste documento
mensagem_transacao | Mensagem da transação
metodo | Método de pagamento utilizado para a transação. Veja os valores possíveis na seção Métodos deste documento
operadora | Adquirente onde foi realizada a transação
operadora_mensagem | Mensagem enviada pela Adquirente
id_librepag | Id da Transação iPag
autorizacao_id | Auth Id emitido pela Adquirente
url_autenticacao | Url de validação para cartões de débito, ou link de impressão do boleto


**Parâmetros adicionais quando Recorrência (assinatura) ou OneClick**

Parâmetros | Descrição
-----------|----------
token |  Trata-se do token gerado quando o parâmetro gera_token_cartao é enviado.
last4 | Referente aos 4 últimos dígitos do cartão. Somente é retornado quando o parâmetro gera_token_cartao é enviado.
mes | Referente ao mês de vencimento do cartão. Somente é retornado quando o parâmetro gera_token_cartao é enviado.
ano | Referente ano de vencimento do cartão. Somente é retornado quando o parâmetro gera_token_cartao é enviado.
id_assinatura | Id da assinatura criado pelo iPag.

## Operações

*Observe que a primeira letra de cada operação deve ser maiúscula*

Operações | Descrição
--------- | ----------------
Pagamento | POST /service/payment
Consulta | POST /service/consult
Captura | POST /service/capture
Cancela | POST /service/cancel

## Métodos
###Cartões

**Método** | Tipo
-----------|--------
**visa** | crédito
**mastercard** | crédito
**diners** | crédito
**amex** | crédito
**elo** | crédito
**discover** | crédito
**hipercard** | crédito
**jcb** | crédito
**aura** | crédito
**visaelectron** | débito
**maestro** | débito

###Boleto

**Método** | Tipo
-----------|--------
**boleto_banespasantander** | boleto impresso
**boletobb** | boleto impresso
**boletostelo** | boleto impresso
**boletocielo** | boleto impresso
**boletostone** | boleto impresso
**boletozoop** | boleto impresso
**boletoitaushopline** | boleto impresso
**boletoshopfacil** | boleto impresso

###Transferência (Office Bank)

**Método** | Tipo
-----------|--------
**itaushopline** | Transferência e Boleto
**bancobrasil** | Transferência e Boleto


## Status das Transações

Código | Descrição
------- | --------------
1 | Iniciado
2 | Boleto impresso
3 | Cancelado
4 | Em análise
5 | Aprovado
6 | Aprovado valor parcial (Status Reservado pelo iPag)
7 | Recusado
8 | Aprovado e Capturado
