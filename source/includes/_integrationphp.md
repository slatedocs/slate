# SDK Webservice 1.0 PHP


[Link para o SDK PHP](https://jhernandes.github.io/ipag-webservice-1.0-php/)

Integração em PHP com o Webservice iPag 1.0

## Dependências
* PHP >= 5.3.*

## Instalação

Se já possui um arquivo `composer.json`, basta adicionar a seguinte dependência ao seu projeto:

```json
"require": {
    "jhernandes/ipag-webservice-1.0-php":"dev-master"
}
```

Com a dependência adicionada ao `composer.json`, basta executar:

```
composer install
```

Alternativamente, você pode executar diretamente em seu terminal:

```
composer require "jhernandes/ipag-webservice-1.0-php:dev-master"
```

## EXEMPLO DE TRANSAÇÃO COM CARTÃO (Payment Request)

```php
<?php

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Order;
use Ipag\Payment;
use Ipag\Transaction;

$ipag = new Ipag('seu_id_ipag', Ipag::TEST);

$order =    $ipag->order(Order::OPERATION_PAYMENT, 'http://minhaurl.dev','20161109003', '1.00', '1');
$card =     $ipag->card('4556657802832607', 'SENHOR TESTE', '10', '21', '123');
$payment =  $ipag->payment(Payment::CREDIT_VISA, $card);
$customer = $ipag->customer('SENHOR TESTE', 'senhor@teste.com.br', '12312312333','1839161627');
$address =  $ipag->address('Rua Teste', '123', 'Bairro Teste', '', '20000-000', 'São Paulo', 'SP', 'BR');
$customer->setAddress($address);

$tx = $ipag->transaction($order, $payment, $customer);

$response = $ipag->paymentRequest($tx);

if (!$response->hasError()) {
    var_dump(print_r($response, true));
    exit;
}
echo $response->getErrorMessage();
exit;
```

## EXEMPLO DE TRANSAÇÃO COM BOLETO (Payment Request)

```php
<?php

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Order;
use Ipag\Payment;
use Ipag\Transaction;

$ipag = new Ipag('seu_id_ipag', Ipag::TEST);

$order =    $ipag->order(Order::OPERATION_PAYMENT, 'http://minhaurl.dev','20161109003', '1.00', '1');

$payment =  $ipag->payment(Payment::BANKSLIP_BB);
$customer = $ipag->customer('SENHOR TESTE', 'senhor@teste.com.br', '12312312333','1839161627');
$address =  $ipag->address('Rua Teste', '123', 'Bairro Teste', '', '20000-000', 'São Paulo', 'SP', 'BR');
$customer->setAddress($address);

$tx = $ipag->transaction($order, $payment, $customer);

$response = $ipag->paymentRequest($tx);

if (!$response->hasError()) {
    var_dump(print_r($response, true));
    exit;
}
echo $response->getErrorMessage();
exit;
```

*Caso tenha sucesso o link para o boleto estará em $response->getUrlAuthentication();*

## EXEMPLO DE CONSULTA DE TRANSAÇÃO (Consult Request)

```php
<?php

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Order;
use Ipag\Payment;
use Ipag\Transaction;

$ipag = new Ipag('seu_id_ipag', Ipag::TEST);

$order = $ipag->order(Order::OPERATION_CONSULT, 'http://minhaurl.dev');
//Caso não tenha o TID e tenha o OrderId (Número do pedido)
// $order = $ipag->order(Order::OPERATION_CONSULT, 'http://minhaurl.dev', '20161109003');

$tx = $ipag->transaction($order);
$tx->setTid('100699306900087B7BDA');

$response = $ipag->consultRequest($tx);

if (!$response->hasError()) {
    var_dump(print_r($response, true));
    exit;
}
echo $response->getErrorMessage();
exit;
```

## EXEMPLO DE CAPTURA DE TRANSAÇÃO (Capture Request)

```php
<?php

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Order;
use Ipag\Payment;
use Ipag\Transaction;

$ipag = new Ipag('seu_id_ipag', Ipag::TEST);

$order = $ipag->order(Order::OPERATION_CAPTURE, 'http://minhaurl.dev');

$tx = $ipag->transaction($order);
//Para capturar é necessário ter um TID
$tx->setTid('100699306900087B7BDA');

$response = $ipag->captureRequest($tx);

if (!$response->hasError()) {
    var_dump(print_r($response, true));
    exit;
}
echo $response->getErrorMessage();
exit;
```
## EXEMPLO DE CANCELAMENTO DE TRANSAÇÃO (Cancel Request)

```php
<?php

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Order;
use Ipag\Payment;
use Ipag\Transaction;

$ipag = new Ipag('seu_id_ipag', Ipag::TEST);

$order = $ipag->order(Order::OPERATION_CANCEL, 'http://minhaurl.dev');

$tx = $ipag->transaction($order);
//Para cancelar é necessário informar o TID
$tx->setTid('100699306900087B7BDA');

$response = $ipag->cancelRequest($tx);

if (!$response->hasError()) {
    var_dump(print_r($response, true));
    exit;
}
echo $response->getErrorMessage();
exit;
```
