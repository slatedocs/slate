# Submissão de Pagamentos

Para integrar sua Loja Virtual ou Site ao iPag, envie os seguintes parâmetros via POST ao sistema iPag para a URL https://www.librepag.com.br/pagamento

> Exemplo de cURL

```php
<?php
//URL do librepag
$url = 'https://www.librepag.com.br/pagamento';

//os dados abaixo são apenas de exemplo
//preencha com os dados necessários para relizar os testes
$fields = array(
			'identificacao' => urlencode('identificacao'),
			'pedido' => urlencode('111111'),
			'operacao' => urlencode('Pagamento'),//manter
			'url_retorno' => urlencode('XML'), //informar URL de call back caso haja uma
			'valor' => urlencode('1.00'),
			'nome' => urlencode('Jose da Silva'),
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
identificacao | 60 | string | obrigatório | Código de identificação do estabelecimento no iPag (login de acesso ao painel)
metodo | 15 | string | obrigatório | Forma de Pagamento * veja os valores possíveis na seção Métodos deste documento
operacao | 10 | string | obrigatório | Operação * veja os valores possíveis na seção Operações deste documento
pedido| 20 | string | obrigatório | Número do pedido (única restrição é que não pode ser igual a outro já enviado ao iPag, aconselhamos numeral sequencial)
valor | 12 | decimal | obrigatório | Valor total da compra. Deve-se usar pontos como separador de casas decimais, ex: 100.00
parcelas | 3 | number | opcional | Número de Parcelas
nome_cartao | 30 | string | opcional | Nome do titular do cartão de crédito (se aplicável).
num_cartao | 16 | number | opcional | Número do cartão de crédito (se aplicável).
cvv_cartao | 3 | number | opcional | Código de verificação do cartão de crédito (se aplicável)
mes_cartao | 2 | number | opcional | Mês de validade do cartão de crédito
ano_cartao | 2 | number | opcional | Ano de validade do cartão de crédito
nome | 30 | string | obrigatório | Nome do cliente
tipo_pessoa | 1 | char | opcional | “j” para pessoas jurídicas e “f” para pessoas físicas
documento | 18 | string | opcional | CPF ou CNPJ do sacado
email | 30 | string | obrigatório| E-mail do cliente
fone | 10 | string | obrigatório | Telefone do cliente
endereco | 30 | string | obrigatório | Endereço completo do cliente
numero_endereco | 5 | number | obrigatório | Número do Endereço
complemento | 100 | string | opcional | Complemento do Endereço
bairro | 15 | string | obrigatório | Bairro do cliente
cidade | 20 | string | obrigatório | Cidade do cliente
estado | 2 | string | obrigatório | Estado do cliente
pais | 15 | string | obrigatório | País do cliente
cep | 8 | string | obrigatório | Cep do cliente
vencto | 10 | date | Opcional | Data de vencimento (DD/MM/YYYY). Usado apenas em boletos. Se não for informado, o vencimento será a data de hoje + o prazo informado nas configurações do iPag.
url_retorno | 50 | string | obrigatório | URL de retorno à Loja Virtual ou Site. Caso seja informado o valor XML, então o IPag retornará um XML, ao invés de enviar o retorno por POST à URL de retorno.

## Campos adicionais para 1-click buy

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
gera_token_cartao | 5 | boolean | Obrigatório na criação do pedido | Utilizado para realizar a transação em que os dados do Cartão ficam armazenado no iPag. Este parâmetro é utilizado para implementar o recurso de Pagamento com 1 Click
token_cartao | 37 | string | Obrigatório na utilização do token | Quando o cliente fizer uma compra utilizando a opção de Pagamento com 1 Click, este parâmetro deverá ser obrigatoriamente enviado. Neste caso, os parâmetros a seguir não devem ser enviados: nome_cartao, num_cartao, metodo, cvv_cartao, mes_cartao, ano_cartao

## Campos adicionais para recorrência

> "intervalo"

```php
'day' | 'week' | 'year'
```

> "inicio"

```php
"DD/MM/YYY"

$inicio = '01/03/2016';
```

Parâmetro | size | type | Obrigatório | Descrição
--------- | ----- | ----- | ----------- | ---------
frequencia | 2 | number | obrigatório | Utilizado na criação de uma transação recorrente. Este campo deverá definir a frequência dos intervalos em que a cobrança será realizada.
intervalo | 5 | string | obrigatório | Utilizado na criação de uma transação recorrente. Define a unidade de intervalo que será utilizada.
inicio | 10 | date | obrigatório | Utilizado na criação de uma transação recorrente. A primeira cobrança ocorre no dia da criação da recorrência. As próximas cobranças ocorrerão no dia especificado no inicio + (frequencia*intervalo).
ciclos | 1 | number | opcional | Define o número de ciclos de transações recorrentes que serão realizadas.

### Observações
A primeira cobrança ocorre no ato da criação da recorrência.

Ex: Criação de uma recorrência mensal no dia 10/05/2016 e inicio = 01/06/2016.  
A primeira cobrança será feita no dia 10/05/2016 e a próxima cobrança ocorrerá no dia 01/07/2016.  01/06/2016 + 1 * month

### Exemplos de transações recorrentes

**a)** frequencia = 1, intervalo = month, ciclos = 3, inicio = 01/01/2015
Será criada uma cobrança recorrente mensal, que terá início em 01/01/2015 e será cobrada três vezes, finalizando em 01/03/2015.

**b)** frequencia = 3, intervalo = month, inicio = 01/01/2015
Será criada uma cobrança recorrente trimestral, que terá início em 01/01/2015 e será cobrada por tempo indeterminado.

### Importante

Ao criar uma transação recorrente, certifique-se de informar o profile_id na URL de retorno. (profile_id é um número único que deve ser gerado pela loja e será a referência da recorrência para a loja e iPag). A URL de retorno para este caso deve ter a seguinte estrutura:

HTTP://www.loja.com.br/<controladorloja>/profile_id/<profile_id>

Exemplo: http://sualoja.com.br/retornoipag/profile_id/123456

## Retorno

O iPag retorna os seguintes parâmetros via POST à URL informada pelo parâmetro “url_retorno”.

Caso o retorno tenha sido solicitado em XML, os mesmo parâmetros serão retornados, mas em formato XML.

Parâmetros | Descrição
--------- | ----------------
id_transacao | Identificação da transação
valor | Valor total da transação
num_pedido | Número do pedido da loja
status_pagamento | Status da transação. Veja os valores possíveis na seção Status das Transações deste documento
mensagem_transacao | Mensagem da transação
metodo | Método de pagamento utilizado para a transação. Veja os valores possíveis na seção Métodos deste documento
token | Alfanumérico. Tamanho: 37. Trata-se do token gerado quando o parâmetro gera_token_cartao é enviado.
last4 | Numérico. Tamanho: 4. Referente aos 4 últimos dígitos do cartão. Somente é retornado quando o parâmetro gera_token_cartao é enviado.
mes | Numérico. Tamanho: 2. Referente ao mês de vencimento do cartão. Somente é retornado quando o parâmetro gera_token_cartao é enviado.
ano | Numérico. Tamanho: 2. Referente ano de vencimento do cartão. Somente é retornado quando o parâmetro gera_token_cartao é enviado.

## Operações

*Observe que a primeira letra de cada operação deve ser maiúscula*

Operações | Descrição
--------- | ----------------
Pagamento | https://www.librepag.com.br/pagamento
Consulta | https://www.librepag.com.br/consulta
Captura | https://www.librepag.com.br/captura
Cancela | https://www.librepag.com.br/cancela

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
