# Exemplos

HTMLs de Exemplos

## Submissão de pagamento

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Teste Integração HTML - Librepag</title>
</head>

	<body>
		<div class="text">Complete os campos com os valores desejados para testar:</div>
		<br/>

			<form method='post' action='https://www.librepag.com.br/pagamento'>
				<table cellpadding="5" cellspacing="0" style="" class="comBorda">
					<thead>
						<tr>
							<th width="50%">campo</th>
							<th width="50%">valor</th>
						</tr>
					</thead>
					<tbody>
						<tr><td>identificacao</td><td><input type='text' name='identificacao' value='SEU LOGIN NO LIBREPAG'/></td></tr>
						<tr><td>metodo</td><td><input type='text' name='metodo' value='FORMA DE PAGAMENTO'/> </td></tr>
						<tr><td>operacao</td><td><input type='text' name='operacao' value='TIPO DA OPERACAO'/> </td></tr>
						<tr><td>pedido</td><td><input type='text' name='pedido' value='IDENDTIFICADOR DO PEDIDO OU TRANSACAO NO SEU SISTEMA'/> </td></tr>
						<tr><td>valor</td><td><input type='text' name='valor' value='VALOR COM PONTOS COMO CASAS DECIMAIS'/> </td></tr>
						<tr><td>parcelas</td><td><input type='text' name='parcelas' value='NUMERO DE PARCELAS'/> </td></tr>
						<tr><td>nome_cartao</td><td><input type='text' name='nome_cartao' value='NOME DO TITULAR DO CARTAO DE CREDITO'/> </td></tr>
						<tr><td>num_cartao</td><td><input type='text' name='num_cartao' value='NUMERO DO CARTAO DE CREDITO'/> </td></tr>
						<tr><td>cvv_cartao</td><td><input type='text' name='cvv_cartao' value='CVV DO CARTAO DE CREDITO'/> </td></tr>
						<tr><td>mes_cartao</td><td><input type='text' name='mes_cartao' value='MES DE VALIDADE DO CARTAO DE CREDITO'/> </td></tr>
						<tr><td>ano_cartao</td><td><input type='text' name='ano_cartao' value='MES DE VALIDADE DO CARTAO DE CREDITO'/> </td></tr>
						<tr><td>nome</td><td><input type='text' name='nome' value='NOME DO CLIENTE'/> </td></tr>
						<tr><td>email</td><td><input type='text' name='email' value='EMAIL DO CLIENTE'/> </td></tr>
						<tr><td>fone</td><td><input type='text' name='fone' value='FONE DO CLIENTE'/> </td></tr>
						<tr><td>endereco</td><td><input type='text' name='endereco' value='ENDERECO DO CLIENTE'/> </td></tr>
						<tr><td>bairro</td><td><input type='text' name='bairro' value='BAIRRO DO CLIENTE'/> </td></tr>
						<tr><td>cidade</td><td><input type='text' name='cidade' value='CIDADE DO CLIENTE'/> </td></tr>
						<tr><td>estado</td><td><input type='text' name='estado' value='ESTADO DO CLIENTE'/> </td></tr>
						<tr><td>pais</td><td><input type='text' name='pais' value='PAIS DO CLIENTE'/> </td></tr>
						<tr><td>cep</td><td><input type='text' name='cep' value='CEP DO CLIENTE'/> </td></tr>
						<tr><td>url_retorno</td><td><input type='text' name='url_retorno' value='WWW.SEUSITE.COM.BR/RETORNOLIBREPAG'/> </td></tr>
					</tbody>
				</table>
				<input type='submit' name='submit' alt='Pagar' border="0" value="Submeter Pagamento" /> <br/>
			</form>
	</body>
</html>
```

<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de submissão de pagamento.
</aside>

## Captura de Pagamento

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Teste Integração XML Captura - Librepag</title>
</head>
<body>
	<div class="text">Complete os campos com os valores desejados para testar a captura:</div>
    	<br/>

			<form method='post' action='https://www.librepag.com.br/captura'>
				<table cellpadding="5" cellspacing="0" style="" class="comBorda">
					<thead>
						<tr>
							<th width="50%">campo</th>
							<th width="50%">valor</th>
						</tr>
					</thead>
					<tbody>
						<tr><td>identificacao</td><td><input type='text' name='identificacao' value='SEU LOGIN NO LIBREPAG'/></td></tr>
						<tr><td>transId</td><td><input type='text' name='transId' value='ID da Transação'/> </td></tr>
						<tr><td>url_retorno</td><td><input type='text' name='url_retorno' value='XML'/> </td></tr>
					</tbody>
				</table>
				<input type='submit' name='submit' alt='Pagar' border="0" value="Submeter Pagamento" /> <br/>
			</form>
</body>
</html>
```

<aside class="notice">
    Lembre, isto é apenas um exemplo para fazer testes de captura de pagamento.
</aside>
