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

    $cart = $ipag->cart(
        // Nome do Produto, Valor Unitário, Quantidade, SKU (Código do Produto)
        ['Produto 1', 5.00, 1, 'ABDC1'],
        ['Produto 2', 3.50, 2, 'ABDC2'],
        ['Produto 3', 5.50, 1, 'ABDC3'],
        ['Produto 4', 8.50, 5, 'ABDC4']
    );

    $transaction = $ipag->transaction();
    $transaction->getOrder()
        ->setOrderId($orderId)
        ->setCallbackUrl('https://minha_loja.com.br/ipag/callback')
        ->setAmount(10.00)
        ->setInstallments(1)
        ->setIp('200.100.10.1')
        ->setPayment($ipag->payment()
            ->setMethod(Method::VISA)
            ->setCreditCard($creditCard)
        )
        ->setCart($cart)
        ->setCustomer($customer);

    $response = $transaction->execute();

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

```shell
curl -X POST \
  https://sandbox.ipag.com.br/service/payment \
  -H 'Authorization: Basic am9uYXRoYW46REM4QS00QzE2Yu75NS1EQTZBRUY2OC0wRkQ2RDMyOC0wRjAz' \
  -H 'content-type: multipart/form-data' \
  -F identificacao=teste \
  -F pedido=201803061703 \
  -F operacao=Pagamento \
  -F valor=2.00 \
  -F metodo=visa \
  -F url_retorno=https://empresa.com/retorno \
  -F email=jose@teste.com.br \
  -F fone=11111111111 \
  -F 'nome=Jean Orlando' \
  -F 'endereco=Rua 1' \
  -F numero_endereco=111 \
  -F bairro=Bairro1 \
  -F 'cidade=Cidade 1' \
  -F estado=SP \
  -F pais=Brasil \
  -F cep=14400330 \
  -F retorno_tipo=xml \
  -F num_cartao=4012001038166662 \
  -F mes_cartao=07 \
  -F ano_cartao=2018 \
  -F cvv_cartao=306 \
  -F documento=79999338801

  <?xml version="1.0" encoding="utf-8" ?>
  <retorno>
      <id_transacao>80f1e6f5d38947b3bf413369f5b75d3d</id_transacao>
      <valor>2.00</valor>
      <num_pedido>201803061703</num_pedido>
      <status_pagamento>8</status_pagamento>
      <mensagem_transacao>Transação aprovada e capturada</mensagem_transacao>
      <metodo>visa</metodo>
      <operadora>zoop</operadora>
      <operadora_mensagem>succeeded</operadora_mensagem>
      <id_librepag>1003838</id_librepag>
      <autorizacao_id>Z133937-000260004</autorizacao_id>
      <url_autenticacao></url_autenticacao>
  </retorno>
```

### Dados de identificação

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
identificacao | 60 | string | sim | Código de identificação do estabelecimento no iPag (login de acesso ao painel)
identificacao2 | 60 | string | não | Código de identificação do parceiro no iPag (Marketplace)


### Dados da operação
Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
metodo | 15 | string | sim | Método de Pagamento * veja os valores possíveis na seção [Métodos](#m-todos)
operacao | 10 | string | sim | Operação * veja os valores possíveis na seção [Operações](#opera-es)
pedido| 20 | string | sim | Número do pedido (Restrição é que não pode ser igual a outro já enviado ao iPag, aconselhamos um número sequencial)
url_retorno | 50 | string | sim | URL de retorno à Loja Virtual ou Site.
retorno_tipo | 5 | string | sim | Informar 'xml'.
boleto_tipo | 5 | string | sim | Informar 'xml'.

### Dados da transação

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
valor | 12 | decimal | sim | Valor total da compra. Deve-se usar pontos como separador de casas decimais, ex: 100.00
captura | 1 | string | não | Define se irá autorizar ou capturar a transação. Se não informado irá utilizar a configuração padrão definida no Painel iPag. <br>Padrão = 'P'<br> Somente Autorizar = 'A' <br> Captura Automática = 'C'
parcelas | 3 | number | não (se cartão, sim) | Número de Parcelas, minimo: 1, máximo: 12
ip | 60 | string | não (porém recomendado) | IP do comprador, permitido IPV4 e IPV6
frete_valor | 12 | decimal | não | Valor do frete cobrado, apenas informativo, não será somado ao valor da transação
frete_tipo | 100 | string | não | Descrição do frete, exemplo: Pac (Aproximadamente 5 dias para entrega)
antifraude | 1 | boolean | não | Define se irá consultar no Antifraude ou não, se e somente se existir antifraude configurado na conta. Valor padrão: true (1).

### Dados do Cartão de Crédito/Débito

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
softdescriptor | 13 | string | não| Identificação na Fatura do Cartão (Cielo, Zoop). Ex.: MINHALOJA
nome_cartao | 30 | string | não (se cartão, sim) | Nome do titular do cartão de crédito.
num_cartao | 16 | number | não (se cartão, sim) | Número do cartão de crédito).
cvv_cartao | 3 | number | não (se cartão, sim) | Código de verificação do cartão de crédito
mes_cartao | 2 | number | não (se cartão, sim) | Mês de validade do cartão de crédito
ano_cartao | 2 | number | não (se cartão, sim) | Ano de validade do cartão de crédito

### Dados do Cliente

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
nome | 30 | string | sim | Nome do cliente
tipo_pessoa | 1 | char | não | “j” para pessoas jurídicas e “f” para pessoas físicas
documento | 18 | string | não | CPF ou CNPJ do sacado
email | 30 | string | não| E-mail do cliente
fone | 10 | string | não | Telefone do cliente
birthdate | 10 | string | não | Data de nascimento do cliente (Ex.: 1989-03-28)[AAAA-MM-DD]

### Dados do Endereço de Cobrança/Envio

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
endereco | 30 | string | não | Endereço completo do cliente
numero_endereco | 5 | number | não | Número do Endereço
complemento | 100 | string | não | Complemento do Endereço
bairro | 15 | string | não | Bairro do cliente
cidade | 20 | string | não | Cidade do cliente
estado | 2 | string | não | Estado do cliente
pais | 15 | string | não | País do cliente
cep | 8 | string | não | Cep do cliente

### Dados de Produto/Carrinho

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
produtos[#][nome] | 100 | string | não | Nome do produto
produtos[#][quantidade] | 100 | integer | não | Quantidade
produtos[#][valor] | 10 | float | não | Valor unitário do produto
produtos[#][sku] | 100 | string | não | código único do produto
produtos[#][descricao] | 255 | string | não | Descrição do produto

<aside class="info">
<b>Substitua o # por um número que identifique este produto.</b><br><br>

Exemplo:<br><br>
produtos[1][nome] = 'Camisa Azul'<br>
produtos[1][quantidade] = 2<br>
produtos[1][valor] = 17.89<br>
produtos[1][sku] = 'CAS8172AA'<br>
produtos[1][descricao] = 'CAMISA AZUL COLEÇÃO INVERNO 2018'<br>
<br><br>
produtos[2][nome] = 'Camisa Verde'<br>
produtos[2][quantidade] = 1<br>
produtos[2][valor] = 19.89<br>
produtos[2][sku] = 'CAS817255'<br>
produtos[2][descricao] = 'CAMISA VERDE COLEÇÃO INVERNO 2018'
</aside>


## Campos adicionais para Boleto (iPag/Zoop)

> Exemplo:

```php
<?php
// VIA IPAG-SDK-PHP
// ...
$creditCard = $ipag->payment()
    ->setInstructions('Instrução 1')
    ->setInstructions('Instrução 2')
    ->setInstructions('Instrução 3')
    ->setDemonstratives('Demonstrativo 1')
    ->setDemonstratives('Demonstrativo 2');
// ...
```

```shell
curl -X POST \
  https://sandbox.ipag.com.br/service/payment \
  -H 'Authorization: Basic am9uYXRoYW46REM4QS00QzE2OUM7DSsdDEQTZBRUY2OC0wRkQ2RDMyOC0wRjAz' \
  -F pedido=201803061703 \
  -F operacao=Pagamento \
  -F valor=2.00 \
  -F metodo=boletozoop \
  -F url_retorno=https://empresa.com/retorno \
  -F email=jose@teste.com.br \
  -F fone=11111111111 \
  -F 'nome=Jose Francisco da Silva' \
  -F 'endereco=Rua 1' \
  -F numero_endereco=111 \
  -F bairro=Bairro1 \
  -F 'cidade=Cidade 1' \
  -F estado=SP \
  -F pais=Brasil \
  -F cep=14400330 \
  -F retorno_tipo=xml \
  -F documento=79999338801 \
  -F 'instrucoes[1]=Instrução 1' \
  -F 'instrucoes[2]=Instrução 2' \
  -F 'instrucoes[3]=Instrução 3' \
  -F 'demonstrativos[1]=Demonstrativo 1'
  -F 'demonstrativos[2]=Demonstrativo 2'
```

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
vencto | 10 | date | sim | Data de vencimento (DD/MM/YYYY). Se não for informado, o vencimento será a data de hoje + o prazo informado nas configurações do iPag.
instrucoes[] | 80 | string | não | Para alterar as linhas de instruções dos Boletos emitidos pelo iPag/Zoop envie o campo instrucoes[1], instrucoes[2] e instrucoes[3] se necessário.
demonstrativos[] | 80 | string | não | Para alterar as linhas de demonstrativo dos Boletos emitidos pelo iPag/Zoop envie o campo demonstrativos[1], demonstrativos[2] se necessário.

## Campos adicionais para Split com Boletos (iPag/Zoop Marketplace Apenas)

Para que seja possível fazer split com boletos é necessário enviar a regra de split juntamente com os campos no request da transação.

> Exemplo:

```php
<?php
// VIA IPAG-SDK-PHP
$payment->addSplitRule(
  $ipag->splitRule()
  ->setSellerId('c66fabf44786459e81e3c65e339a4fc9')
  ->setPercentage(95)
  ->setLiable(1)
  // ->setAmount(9.90)
);
/*
  Você pode adicionar quantas regras forem necessárias e permitidas.
*/
```

```shell
curl -X POST \
  https://sandbox.ipag.com.br/service/payment \
  -H 'Authorization: Basic am9uYXRoYW46REM4QS00QzE2OUM7DSsdDEQTZBRUY2OC0wRkQ2RDMyOC0wRjAz' \
  -F pedido=201803061703 \
  -F operacao=Pagamento \
  -F valor=2.00 \
  -F metodo=boletozoop \
  -F url_retorno=https://empresa.com/retorno \
  -F email=jose@teste.com.br \
  -F fone=11111111111 \
  -F 'nome=Jose Francisco da Silva' \
  -F 'endereco=Rua 1' \
  -F numero_endereco=111 \
  -F bairro=Bairro1 \
  -F 'cidade=Cidade 1' \
  -F estado=SP \
  -F pais=Brasil \
  -F cep=14400330 \
  -F retorno_tipo=xml \
  -F documento=79999338801 \
  -F 'split[1][seller_id]=c66fabf44786459e81e3c65e339a4fc9' \
  -F 'split[1][percentage]=42' \
  -F 'split[1][liable]=1' \
  -F 'split[2][seller_id]=d56fabf44786459e81e3c65e339a4fc9' \
  -F 'split[2][percentage]=50' \
  -F 'split[2][liable]=1' \
```

Campo | Tamanho | Tipo | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
split[] | - | container | não | Container (Array)
split[1][seller_id] | 50 | string | sim | SellerId ou Login do vedendor. Esta informação é passada ao criar um vededor.
split[1][percentage] | 2 | integer | sim/não | Valor em Porcentagem que será repassado ao vendedor não pode ser maior que o valor total somado a taxa que será cobrada. Não obrigatório se enviado 'amount';
split[1][amount] | 5 | double | sim/não | Valor absoluto em reais que será repassado ao vendedor não pode ser maior que o valor total somado a taxa que será cobrada. Não obrigatório caso enviado 'percentage'
split[1][liable] | 1 | integer | não | Define se o recebedor arca com prejuízo em caso de chargeback ou não. 1 arca; 0 não arca.


Para adicionar mais de uma regra incremente o valor: split[1], split[2], etc...

<aside class="warning">
<b>Caso seja informado um valor maior que o da venda nos campos 'percentage' ou 'amount', será recusado o pagamento.</b>
</aside>

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

```shell
curl -X POST \
  https://sandbox.ipag.com.br/service/payment \
  -H 'Authorization: Basic am9uYXRoYW46REM4QS00QzE2OUM7DSsdDEQTZBRUY2OC0wRkQ2RDMyOC0wRjAz' \
  -H 'content-type: multipart/form-data' \
  -F identificacao=teste \
  -F pedido=201803061704 \
  -F operacao=Pagamento \
  -F valor=2.00 \
  -F metodo=visa \
  -F url_retorno=https://empresa.com/retorno \
  -F email=jose@teste.com.br \
  -F fone=11111111111 \
  -F 'nome=Jean Orlando' \
  -F 'endereco=Rua 1' \
  -F numero_endereco=111 \
  -F bairro=Bairro1 \
  -F 'cidade=Cidade 1' \
  -F estado=SP \
  -F pais=Brasil \
  -F cep=14400330 \
  -F retorno_tipo=xml \
  -F num_cartao=4012001038166662 \
  -F mes_cartao=07 \
  -F ano_cartao=2018 \
  -F cvv_cartao=306 \
  -F documento=79999338801 \
  -F gera_token_cartao=1

<?xml version="1.0" encoding="utf-8" ?>
<retorno>
    <id_transacao>c82263b4dd2c43e2a73d3f7950820e78</id_transacao>
    <valor>2.00</valor>
    <num_pedido>201803061704</num_pedido>
    <status_pagamento>8</status_pagamento>
    <mensagem_transacao>Transação aprovada e capturada</mensagem_transacao>
    <metodo>visa</metodo>
    <operadora>zoop</operadora>
    <operadora_mensagem>succeeded</operadora_mensagem>
    <id_librepag>1003839</id_librepag>
    <autorizacao_id>Z133937-000260004</autorizacao_id>
    <url_autenticacao></url_autenticacao>
    <token>c565-80ccecf3-27995e1e-a9c1ebc3-4b10</token>
    <last4>6662</last4>
    <mes>07</mes>
    <ano>2018</ano>
</retorno>
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

$transaction = $ipag->transaction();
$transaction->getOrder()
    ->setSubscription($ipag->subscription()
      ->setProfileId('1000000')
      ->setFrequency(1)
      ->setInterval('month')
      ->setStart('10/10/2018')
);

$response = $transaction->execute();
```

```shell
curl -X POST \
  https://sandbox.ipag.com.br/service/payment \
  -H 'Authorization: Basic am9uYXRoYW46REM4QS00QzE2OUM7DSsdDEQTZBRUY2OC0wRkQ2RDMyOC0wRjAz' \
  -H 'content-type: multipart/form-data' \
  -F identificacao=teste \
  -F pedido=201803061705 \
  -F operacao=Pagamento \
  -F valor=50.00 \
  -F metodo=visa \
  -F url_retorno=https://empresa.com/retorno/profile_id/123456 \
  -F email=jose@teste.com.br \
  -F fone=11111111111 \
  -F 'nome=Jean Orlando' \
  -F 'endereco=Rua 1' \
  -F numero_endereco=111 \
  -F bairro=Bairro1 \
  -F 'cidade=Cidade 1' \
  -F estado=SP \
  -F pais=Brasil \
  -F cep=14400330 \
  -F retorno_tipo=xml \
  -F num_cartao=4012001038166662 \
  -F mes_cartao=07 \
  -F ano_cartao=2018 \
  -F cvv_cartao=306 \
  -F documento=79999338801 \
  -F frequencia=1 \
  -F intervalo=month \
  -F inicio=10/09/2018 \
  -F valor_rec=99.00

<?xml version="1.0" encoding="utf-8" ?>
<retorno>
    <id_transacao>803b898fbf7b4d0bb6b19081360bebd9</id_transacao>
    <valor>50.00</valor>
    <num_pedido>201803061705</num_pedido>
    <status_pagamento>8</status_pagamento>
    <mensagem_transacao>Transação aprovada e capturada</mensagem_transacao>
    <metodo>visa</metodo>
    <operadora>zoop</operadora>
    <operadora_mensagem>succeeded</operadora_mensagem>
    <id_librepag>1003840</id_librepag>
    <autorizacao_id>Z133937-000260004</autorizacao_id>
    <url_autenticacao></url_autenticacao>
    <token>6bab-460635e7-1c2ee1a2-d4e554a9-1a59</token>
    <last4>6662</last4>
    <mes>07</mes>
    <ano>2018</ano>
    <id_assinatura>1006</id_assinatura>
    <profile_id>123456</profile_id>
</retorno>
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

Operações | Método | Descrição
--------- | ------ | --------
Pagamento | POST | /service/payment
Consulta | POST | /service/consult
Captura | POST | /service/capture
Cancela | POST | /service/cancel

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
**hiper** | crédito
**jcb** | crédito
**aura** | crédito
**visaelectron** | débito
**maestro** | débito

###Boleto

Empresa | **Método** | Tipo
--------| -----------|--------
Santander | **boleto_banespasantander** | boleto impresso
Banco do Brasil | **boletobb** | boleto impresso
Zoop | **boletozoop** | boleto impresso
Itaú | **boletoitaushopline** | boleto impresso
Bradesco | **boletoshopfacil** | boleto impresso
Sicredi | **boletosicredi** | boleto impresso

###Transferência (Office Bank)

**Método** | Tipo
-----------|--------
**itaushopline** | Transferência e Boleto
**bancobrasil** | Transferência


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
9 | Chargeback
10 | Em Disputa
