# Submissão de Pagamentos

Para integrar sua Loja Virtual ou Site ao iPag, envie os seguintes parâmetros via POST ao sistema iPag para a URL http://sandbox.ipag.com.br/pagamento

> Exemplo de cURL

```php
<?php
//URL do iPag
$url = 'http://sandbox.ipag.com.br/pagamento';

//os dados abaixo são apenas de exemplo
//preencha com os dados necessários para relizar os testes
$fields = array(
    'identificacao' => urlencode('identificacao'),
    'pedido' => urlencode('111111'),
    'operacao' => urlencode('Pagamento'),//manter
    'url_retorno' => urlencode('http://minhaloja.com/retorno'),
    'retorno_tipo' => urlencode('xml'),
    'valor' => urlencode('1.00'),
    'nome' => urlencode('Jose da Silva'),
    'doc' => urlencode('12312312300'),
    'email' => urlencode('jose@teste.com.br'),
    'fone' => urlencode('11111111111'),
    'endereco' => urlencode('Rua 1'),
    'numero_endereco' => urlencode('1111'),
    'complemento' => urlencode('Complemento'),
    'bairro' => urlencode('Bairro 1'),
    'cidade' => urlencode('São paulo'),
    'estado' => urlencode('SP'),
    'pais' => urlencode('Brasil'),
    'cep'=> urlencode('07500000'),
    'metodo'=> urlencode('mastercard'),
    'parcelas'=> urlencode('1'),
    'nome_cartao'=> urlencode('jose da silva'),
    'num_cartao'=> urlencode('3333333333333333'),
    'cvv_cartao'=> urlencode('444'),
    'mes_cartao'=> urlencode('07'),
    'ano_cartao'=> urlencode('20'),
);
//url-ify the data for the POST
$fields_string ='';
foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
rtrim($fields_string, '&');

$ch = curl_init();        
curl_setopt( $ch, CURLOPT_URL, $url );
curl_setopt( $ch, CURLOPT_POST, true );
curl_setopt( $ch, CURLOPT_POSTFIELDS, $fields_string );        
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt($ch, CURLOPT_HEADER, true);
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

## Campos adicionais para 1-click buy

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
gera_token_cartao | 5 | boolean | Obrigatório na criação do pedido | Utilizado para realizar a transação em que os dados do Cartão ficam armazenado no iPag. Este parâmetro é utilizado para implementar o recurso de Pagamento com 1 Click
token_cartao | 37 | string | Obrigatório na utilização do token | Quando o cliente fizer uma compra utilizando a opção de Pagamento com 1 Click, este parâmetro deverá ser obrigatoriamente enviado. Neste caso, os parâmetros a seguir não devem ser enviados: nome_cartao, num_cartao, metodo, cvv_cartao, mes_cartao, ano_cartao

## Campos adicionais para recorrência

> Exemplo de recorrência com TRIAL

```php
<?php
$url = 'http://sandbox.ipag.com.br/pagamento';

$fields = array(
      'identificacao' => urlencode('identificacao'),
      'pedido' => urlencode('111111'),
      'operacao' => urlencode('Pagamento'),
      'url_retorno' => urlencode('http://minhaloja.com/profile_id/1234'),
      'retorno_tipo' => urlencode('xml'),
      'boleto_tipo' => urlencode('xml'),
      'valor' => urlencode('10.00'),
      'nome' => urlencode('José Teste'),
      'email' => urlencode('ipag@teste.com.br'),
      'doc' => urlencode('11111111100'),
      'fone' => urlencode('1839161627'),
      'endereco' => urlencode('Rua Teste'),
      'numero_endereco' => urlencode('1000'),
      'complemento' => urlencode(''),
      'bairro' => urlencode('Bairro Teste'),
      'cidade' => urlencode('São Paulo'),
      'estado' => urlencode('SP'),
      'pais' => urlencode('Brasil'),
      'cep'=> urlencode('01156060'),
      'metodo'=> urlencode('visa'),
      'parcelas'=> urlencode('1'),
      'nome_cartao'=> urlencode('José Teste'),
      'num_cartao'=> urlencode('4704556510746680'),
      'cvv_cartao'=> urlencode('123'),
      'mes_cartao'=> urlencode('12'),
      'ano_cartao'=> urlencode('21'),

      'frequencia'=> urlencode('1'),
      'intervalo'=> urlencode('month'),
      'inicio'=> urlencode('10/12/2016'),
      'ciclos'=> urlencode('12'),
      'trial'=> urlencode(true),
      'valor_rec'=> urlencode('30.00'),
);    
$fields_string ='';
foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
rtrim($fields_string, '&');

$ch = curl_init();      
curl_setopt( $ch, CURLOPT_URL, $url );
curl_setopt( $ch, CURLOPT_POST, true );
curl_setopt( $ch, CURLOPT_POSTFIELDS, $fields_string );     
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch, CURLOPT_HEADER, false);
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)' );
curl_setopt( $ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1 );

$result = curl_exec( $ch );
if (curl_errno($ch)) {
      throw new Exception('Curl error: '.curl_error($ch));
}

echo $result;

curl_close( $ch );
?>
```

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
frequencia | 2 | number | sim | Utilizado na criação de uma transação recorrente. Este campo deverá definir a frequência dos intervalos em que a cobrança será realizada.
intervalo | 5 | string | sim | Utilizado na criação de uma transação recorrente. Define a unidade de intervalo que será utilizada. ('day', 'week' ou 'month')
inicio | 10 | date | sim | Utilizado na criação de uma transação recorrente. A primeira cobrança ocorre no dia da criação da recorrência. As próximas cobranças ocorrerão no dia especificado no inicio + (frequencia*intervalo). FORMATO: "DD/MM/YYYY"
valor_rec | 12 | decimal | não | Valor que será cobrado no primeiro vencimento da recorrência. Não é obrigatório, caso não informado será utilizado o valor da transação (valor).
trial | 1 | boolean | não | Se trial = 1 ou true então a primeira cobrança (valor da transação) será de R$1,00 afim de realizar uma transação de validação para geração do token.
ciclos | 1 | number | não | Define o número de ciclos de transações recorrentes que serão realizadas.

### Observações
A primeira cobrança ocorre no ato da criação da recorrência.

Ex: Criação de uma recorrência mensal no dia 10/05/2016 e inicio = 01/06/2016.  
A primeira cobrança será feita no dia 10/05/2016 e a próxima cobrança ocorrerá no dia 01/07/2016.  01/06/2016 + 1 * month

### Exemplos de transações recorrentes

**a)** frequencia = 1, intervalo = month, ciclos = 3, inicio = 01/01/2015
Será criada uma cobrança recorrente mensal, que terá início em 01/01/2015 e será cobrada três vezes, finalizando em 01/03/2015.

**b)** frequencia = 3, intervalo = month, inicio = 01/01/2015
Será criada uma cobrança recorrente trimestral, que terá início em 01/01/2015 e será cobrada por tempo indeterminado.

**c)** Caso queira criar uma recorrência com período TRIAL, envie também o parâmetro trial = (1 ou true), neste caso é necessário informar o valor_rec, que será cobrado na data início.

<aside class="warning">
<b>Se definido como verdadeiro o parâmetro TRIAL, será realizado uma transação de R$1,00, somente como aprovada (Não gerará cobrança para o cliente). Essa transação é realizada para validar o cartão do cliente e criar o token de recorrência. Essa transação não deve ser capturada, mas pode, se desejar, ser cancelada via API ou Painel.</b>
</aside>

### Importante

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

Caso o retorno tenha sido solicitado em XML, os mesmo parâmetros serão retornados, mas em formato XML.

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
Pagamento | http://sandbox.ipag.com.br/pagamento
Consulta | http://sandbox.ipag.com.br/consulta
Captura | http://sandbox.ipag.com.br/captura
Cancela | http://sandbox.ipag.com.br/cancela

## Métodos
Cartões | Boleto Bancário | Banco
----------- | --------- | ----------
visa | boleto_itau | bradescopf
mastercard | boleto_cef (SICOB) | itaushopline
diners | boleto_bb | bancobrasil
amex | boleto_banespasantander |
elo | boleto_bradesco |
discover | boleto_hsbc |
hipercard | |
jcb | |
visaelectron | |
maestro| |

## Status das Transações

Código | Descrição
------- | --------------
1 | Iniciado
2 | Boleto impresso
3 | Cancelado
4 | Em análise
5 | Aprovado
6 | Aprovado valor parcial
7 | Recusado
8 | Aprovado e Capturado
