# Exemplos

HTMLs de Exemplos

Endpoint Produção: //Requisitar para o iPag em atedimento@ipag.com.br

Endpoint Sandbox

`https://sandbox.ipag.com.br/`

## Submeter pagamento

**Endpoint:** `/pagamento`

```html
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Teste Integração HTML - iPag</title>
</head>

  <body>
      <div class="text">Complete os campos com os valores desejados para testar:</div>
      <br/>
      <form method='post' action='https://sandbox.ipag.com.br/pagamento'>
          <table cellpadding="5" cellspacing="0" style="" class="comBorda">
              <thead>
                  <tr>
                      <th width="50%">campo</th>
                      <th width="50%">valor</th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                    <td>identificacao</td>
                    <td><input type='text' name='identificacao' value='SEU LOGIN NO IPAG'/></td>
                  </tr>
                  <tr>
                    <td>metodo</td>
                    <td><input type='text' name='metodo' value='FORMA DE PAGAMENTO'/></td>
                  </tr>
                  <tr>
                    <td>operacao</td>
                    <td><input type='text' name='operacao' value='TIPO DA OPERACAO'/></td>
                  </tr>
                  <tr>
                    <td>pedido</td>
                    <td><input type='text' name='pedido' value='IDENDTIFICADOR DO PEDIDO OU TRANSACAO NO SEU SISTEMA'/></td>
                  </tr>
                  <tr>
                    <td>valor</td>
                    <td><input type='text' name='valor' value='VALOR COM PONTOS COMO CASAS DECIMAIS'/> </td>
                  </tr>
                  <tr>
                    <td>parcelas</td>
                    <td><input type='text' name='parcelas' value='NUMERO DE PARCELAS'/></td>
                  </tr>
                  <tr>
                    <td>nome_cartao</td><td><input type='text' name='nome_cartao' value='NOME DO TITULAR DO CARTAO DE CREDITO'/></td>
                  </tr>
                  <tr>
                    <td>num_cartao</td>
                    <td><input type='text' name='num_cartao' value='NUMERO DO CARTAO DE CREDITO'/></td>
                  </tr>
                  <tr>
                    <td>cvv_cartao</td>
                    <td><input type='text' name='cvv_cartao' value='CVV DO CARTAO DE CREDITO'/></td>
                  </tr>
                  <tr>
                    <td>mes_cartao</td>
                    <td><input type='text' name='mes_cartao' value='MES DE VALIDADE DO CARTAO DE CREDITO'/></td>
                  </tr>
                  <tr>
                    <td>ano_cartao</td>
                    <td><input type='text' name='ano_cartao' value='MES DE VALIDADE DO CARTAO DE CREDITO'/></td>
                  </tr>
                  <tr>
                    <td>nome</td>
                    <td><input type='text' name='nome' value='NOME DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>email</td>
                    <td><input type='text' name='email' value='EMAIL DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>fone</td>
                    <td><input type='text' name='fone' value='FONE DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>endereco</td>
                    <td><input type='text' name='endereco' value='ENDERECO DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>bairro</td>
                    <td><input type='text' name='bairro' value='BAIRRO DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>cidade</td>
                    <td><input type='text' name='cidade' value='CIDADE DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>estado</td>
                    <td><input type='text' name='estado' value='ESTADO DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>pais</td>
                    <td><input type='text' name='pais' value='PAIS DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>cep</td>
                    <td><input type='text' name='cep' value='CEP DO CLIENTE'/></td>
                  </tr>
                  <tr>
                    <td>url_retorno</td>
                    <td><input type='text' name='url_retorno' value='WWW.SEUSITE.COM.BR/RETORNOIPAG'/> </td>
                  </tr>
              </tbody>
          </table>
          <input type='submit' name='submit' alt='Submeter' border="0" value="Submeter Pagamento" /> <br/>
      </form>
  </body>
</html>
```

> Exemplo de Submissão via cURL

```php
<?php
//URL do iPag
$url = 'https://sandbox.ipag.com.br/pagamento';

$fields = array(
  'identificacao'   => urlencode('SEU LOGIN'),
  'pedido'          => urlencode('10000000'),
  'operacao'        => urlencode('Pagamento'),
  'url_retorno'     => urlencode('http://minhaloja.com'),
  'retorno_tipo'    => urlencode('xml'),
  'valor'           => urlencode('1.00'),
  'nome'            => urlencode('teste ipag'),
  'email'           => urlencode('ipag@teste.com.br'),
  'doc'             => urlencode('11111111100'),
  'fone'            => urlencode('1839161627'),
  'endereco'        => urlencode('Rua Teste'),
  'numero_endereco' => urlencode('1000'),
  'complemento'     => urlencode(''),
  'bairro'          => urlencode('Bairro Teste'),
  'cidade'          => urlencode('São Paulo'),
  'estado'          => urlencode('SP'),
  'pais'            => urlencode('Brasil'),
  'cep'             => urlencode('01156060'),
  'metodo'          => urlencode('visa'),
  'parcelas'        => urlencode('1'),
  'nome_cartao'     => urlencode('JOSE TESTE'),
  'num_cartao'      => urlencode('4066553613548107'),
  'cvv_cartao'      => urlencode('123'),
  'mes_cartao'      => urlencode('10'),
  'ano_cartao'      => urlencode('17')
);
$fields_string ='';
foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
rtrim($fields_string, '&');

$ch = curl_init();
curl_setopt( $ch, CURLOPT_URL, $url );
curl_setopt( $ch, CURLOPT_POST, true );
curl_setopt( $ch, CURLOPT_POSTFIELDS, $fields_string );
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch, CURLOPT_HEADER, true);
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)' );
curl_setopt( $ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1 );

$result = curl_exec( $ch );

echo $result;

curl_close( $ch );
?>
```
<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de submissão de pagamento.
</aside>

## Consultar Pagamento

**Endpoint:** `/consulta`

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teste Integração XML consulta - iPag</title>
</head>
<body>
    <div class="text">Complete os campos com os valores desejados para testar a consulta:</div>
    <br/>
    <form method='post' action='https://sandbox.ipag.com.br/consulta'>
        <table cellpadding="5" cellspacing="0" style="" class="comBorda">
            <thead>
                <tr>
                    <th width="50%">campo</th>
                    <th width="50%">valor</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>identificacao</td>
                    <td><input type='text' name='identificacao' value='SEU LOGIN NO IPAG'/></td>
                </tr>
                <tr>
                    <td>transId</td>
                    <td><input type='text' name='transId' value='ID da Transação'/></td>
                </tr>
                <tr>
                    <td>numPedido</td>
                    <td><input type='text' name='numPedido' value='Número do Pedido'/></td>
                </tr>
                <tr>
                    <td>url_retorno</td>
                    <td><input type='text' name='url_retorno' value='XML'/></td>
                </tr>
            </tbody>
        </table>
        <input type='submit' name='submit' alt='Consultar' border="0" value="Consultar Pagamento" /> <br/>
    </form>
</body>
</html>
```

> Exemplo de Consulta via cURL

```php
<?php

//URL do iPag
$url = 'https://sandbox.ipag.com.br/consulta';

$fields = array(
      'identificacao'  => urlencode('SEU LOGIN'),
      'transId'        => urlencode('100000'),
      'numPedido'      => urlencode('10000000'),
      // 'url_retorno' => urlencode('http://minhaurl.com'),
      'retorno_tipo'   => urlencode('xml')
);
$fields_string ='';
foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
rtrim($fields_string, '&');

$ch = curl_init();
curl_setopt( $ch, CURLOPT_URL, $url );
curl_setopt( $ch, CURLOPT_POST, true );
curl_setopt( $ch, CURLOPT_POSTFIELDS, $fields_string );
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch, CURLOPT_HEADER, true);
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)' );
curl_setopt( $ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1 );

$result = curl_exec( $ch );

echo $result;

curl_close( $ch );
?>
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

**Endpoint:** `/captura`

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teste Integração XML Captura - iPag</title>
</head>
<body>
    <div class="text">Complete os campos com os valores desejados para testar a captura:</div>
    <br/>
    <form method='post' action='https://sandbox.ipag.com.br/captura'>
        <table cellpadding="5" cellspacing="0" style="" class="comBorda">
            <thead>
                <tr>
                    <th width="50%">campo</th>
                    <th width="50%">valor</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>identificacao</td>
                    <td><input type='text' name='identificacao' value='SEU LOGIN NO IPAG'/></td>
                </tr>
                <tr>
                    <td>transId</td>
                    <td><input type='text' name='transId' value='ID da Transação'/></td>
                </tr>
                <tr>
                    <td>url_retorno</td>
                    <td><input type='text' name='url_retorno' value='XML'/></td>
                </tr>
            </tbody>
        </table>
        <input type='submit' name='submit' alt='Capturar' border="0" value="Capturar Pagamento" /> <br/>
    </form>
</body>
</html>
```

> Exemplo de Captura via cURL

```php
<?php
//URL do iPag
$url = 'https://sandbox.ipag.com.br/captura';

$fields = array(
      'identificacao' => urlencode('SEU LOGIN'),
      'transId'       => urlencode('100000'),
      'url_retorno'   => urlencode('http://minhaurl.com'), // ou 'xml'
      'retorno_tipo'  => urlencode('xml')
);
$fields_string ='';
foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
rtrim($fields_string, '&');

$ch = curl_init();
curl_setopt( $ch, CURLOPT_URL, $url );
curl_setopt( $ch, CURLOPT_POST, true );
curl_setopt( $ch, CURLOPT_POSTFIELDS, $fields_string );
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch, CURLOPT_HEADER, true);
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)' );
curl_setopt( $ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1 );

$result = curl_exec( $ch );

echo $result;

curl_close( $ch );
?>
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

**Endpoint:** `/cancela`

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teste Integração XML Cancelar Pagamento - iPag</title>
</head>
<body>
    <div class="text">Complete os campos com os valores desejados para testar o cancelamento:</div>
    <br/>
    <form method='post' action='https://sandbox.ipag.com.br/cancela'>
        <table cellpadding="5" cellspacing="0" style="" class="comBorda">
            <thead>
                <tr>
                    <th width="50%">campo</th>
                    <th width="50%">valor</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>identificacao</td>
                    <td><input type='text' name='identificacao' value='SEU LOGIN NO IPAG'/></td>
                </tr>
                <tr>
                    <td>transId</td>
                    <td><input type='text' name='transId' value='ID da Transação'/></td>
                </tr>
                <tr>
                    <td>url_retorno</td>
                    <td><input type='text' name='url_retorno' value='XML'/></td>
                </tr>
            </tbody>
        </table>
        <input type='submit' name='submit' alt='Cancelar' border="0" value="Cancelar Pagamento" /> <br/>
    </form>
</body>
</html>
```

> Exemplo de Cancelamento via cURL

```php
<?php
//URL do iPag
$url = 'https://sandbox.ipag.com.br/cancela';

$fields = array(
      'identificacao' => urlencode('SEU LOGIN'),
      'transId'       => urlencode('100000'),
      'url_retorno'   => urlencode('http://minhaurl.com'), // ou 'xml
      'retorno_tipo'  => urlencode('xml')
);
$fields_string ='';
foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
rtrim($fields_string, '&');

$ch = curl_init();
curl_setopt( $ch, CURLOPT_URL, $url );
curl_setopt( $ch, CURLOPT_POST, true );
curl_setopt( $ch, CURLOPT_POSTFIELDS, $fields_string );
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch, CURLOPT_HEADER, true);
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)' );
curl_setopt( $ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1 );

$result = curl_exec( $ch );

echo $result;

curl_close( $ch );
?>
```

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
identificacao | 60 | string | obrigatório | Código de identificação do estabelecimento no iPag (login de acesso ao painel)
transId | 255 | string | obrigatório | Código identificação da transação.
url_retorno | 255 | string | obrigatório | Pode ser `xml` ou uma Url da sua loja.

<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de cancelamento de pagamento.
</aside>
