# Exemplos

HTMLs de Exemplos

Endpoint Produção: //Requisitar para o iPag em atedimento@ipag.com.br

Endpoint Sandbox

`https://sandbox.ipag.com.br/`

## Submeter pagamento

**Endpoint:**
`POST /service/payment`

```php
> Exemplo de Submissão via PHP SDK

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
        ->setPayment($ipag->payment()
            ->setMethod(Method::VISA)
            ->setCreditCard($creditCard)
        )
        ->setCustomer($customer)
        ->setCart($cart);

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
<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de submissão de pagamento.
</aside>

## Consultar Pagamento

**Endpoint:**
`POST /service/consult`

```php
> Exemplo de Consulta PHP SDK

<?php
// VIA IPAG-SDK-PHP

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Classes\Authentication;
use Ipag\Classes\Endpoint;

try {
  $ipag = new Ipag(new Authentication('my_ipag_id', 'my_ipag_key'), Endpoint::SANDBOX);

  $response = $ipag->transaction()->setTid('123456789')->consult();
} catch (Exception $e) {
  print_r($e->__toString());
}
```

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
identificacao | 60 | string | sim | Código de identificação do estabelecimento no iPag (login de acesso ao painel)
transId | 255 | string | sim/não | Código identificação da transação.
numPedido | 20 | string | não/sim | Código identificação do pedido.
retorno_tipo | 20 | string | não | `xml`
url_retorno | 255 | string | não | Url da sua loja.

<aside class="notice">
    Deve ser enviado pelo menos um dos campos: `transId` ou `numPedido`
</aside>
<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de consulta de pagamento.
</aside>


## Capturar Pagamento

**Endpoint:**
`POST /service/capture`

```php
> Exemplo de Captura PHP SDK

<?php
// VIA IPAG-SDK-PHP

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Classes\Authentication;
use Ipag\Classes\Endpoint;

try {
  $ipag = new Ipag(new Authentication('my_ipag_id', 'my_ipag_key'), Endpoint::SANDBOX);

  $response = $ipag->transaction()->setTid('123456789')->capture();
} catch (Exception $e) {
  print_r($e->__toString());
}
```

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
identificacao | 60 | string | sim | Código de identificação do estabelecimento no iPag (login de acesso ao painel)
transId | 255 | string | sim | Código identificação da transação.
url_retorno | 255 | string | sim |`xml` ou  Url da sua loja.

<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de captura de pagamento.
</aside>

## Cancelar Pagamento

**Endpoint:**
`POST /service/cancel`

```php
> Exemplo de Cancelamento PHP SDK

<?php
// VIA IPAG-SDK-PHP

require 'vendor/autoload.php';

use Ipag\Ipag;
use Ipag\Classes\Authentication;
use Ipag\Classes\Endpoint;

try {
  $ipag = new Ipag(new Authentication('my_ipag_id', 'my_ipag_key'), Endpoint::SANDBOX);

  $response = $ipag->transaction()->setTid('123456789')->cancel();
} catch (Exception $e) {
  print_r($e->__toString());
}
```

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
identificacao | 60 | string | obrigatório | Código de identificação do estabelecimento no iPag (login de acesso ao painel)
transId | 255 | string | obrigatório | Código identificação da transação.
url_retorno | 255 | string | obrigatório | Pode ser `xml` ou uma Url da sua loja.

<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de cancelamento de pagamento.
</aside>
